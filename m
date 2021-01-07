Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302212ED13B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:59:13 +0100 (CET)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVom-0003Cn-9D
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kxVnt-0002lB-Oq
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:58:17 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:45073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kxVnp-0005X0-OV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610027890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/8LLZ6SgM+Th7XKhSDzUGRBow0wwGj950CwuDxwXHc=;
 b=EeE8pfxkiNkMr15k41t7U9qqLZla6T5ZTJ3dxYxYJ719bQ2zwxHMCbSQFESsIC8GARGGDt
 XhAbu0dSngdEDvSIiRrHvUPpA5aibMA25PpqRlCzIOvKdfLYJ9c1d37gg5GZpfRE+kYwJx
 c+SNmV9iUIoagLFWvb3lRV5pU8tmExE=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-R-UhV3XyNZygAcyszH6BXg-1; Thu, 07 Jan 2021 14:58:09 +0100
X-MC-Unique: R-UhV3XyNZygAcyszH6BXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2cfDCi1lrnVj81LwAeoyEFgVum9KGgNMpq7OdxEHuMPNc+cFcUehVS2s4xd1CzLRZqHaVDE+eBEb1RbvBNwRDUNJeBNduGUwLr1RMVNkCQ+oG0MCtlwocD8X7JHkhT6mu1FdFW7fcb/y/bHj9oXRpt+bsxMSs9xXFEFG8JSKSMw4I1wAh5zuFNlbp3nCbllkugpdXeCZ60mfxpdLU2OUwvJUH8kyoCfuI6ZKVVCy8/VA67zHtPFyh0xqGy47AS/6HnvIVT89iwJLsiAMRv6r8vGQxPwnxNAvyx87Kj+MhFLZ9A6NEi2JD3kIzEVItZEXInHNpb+jFWzpVxjKS5cWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq4lve0KjHkYyQXoWuKTn4R8H1AWYfqEtHr7cVT1lxk=;
 b=e1Q2nijDLdcYQ3Tq/01HoNQmM3pHTLfdJv6JDKVmEf3QzuTo4XaE8kvA0rBplDNcDspG3S+ijJT0ukVRvUxDhrydItiZ0uDOjTHZIb81DvbwDww19jbdtYFEqigZc1ZlqIyRDmqr1Zk6G33TbanG1Xbkos8yKP+mSRpaBBEizTKLwcxVmpWNjaqDHdGiiJyxrAEti843vTrs/yIBLhFPGBbVtZsfHCa0K8zg8SHZRy1GKNcZwKA41TFccTb98WMtN128J7dvncwCH0AOn3gExg6iogcLg0tykM7AZpaMfrp0DjQRH7gLjw0Yr9q2mykXVOeZaj1tY7xeqF+yD6M/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21) by AM0PR04MB6609.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 13:58:07 +0000
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::2580:e7d:9f89:8edf]) by AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::2580:e7d:9f89:8edf%10]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 13:58:07 +0000
Message-ID: <36869fd5f001f4eab10539839395504fd9fb5f7d.camel@suse.com>
Subject: Re: [PULL 50/55] virtfs: convert to meson
From: Bruce Rogers <brogers@suse.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 07 Jan 2021 06:58:02 -0700
In-Reply-To: <20201221144447.26161-51-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
 <20201221144447.26161-51-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [63.248.145.198]
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.22] (63.248.145.198) by
 FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Thu, 7 Jan 2021 13:58:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b314a1-ac59-4bfc-73cc-08d8b31442e2
X-MS-TrafficTypeDiagnostic: AM0PR04MB6609:
X-Microsoft-Antispam-PRVS: <AM0PR04MB6609006FF6A1A469CEBC1FE2D9AF0@AM0PR04MB6609.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOHO+60XKlTSf5TX4rOsj83q9L1N8OH9jrWSUV2LStKrblnkmWlmgm9JYuxPRXEXuE1C95wjMhmkKVLarqymBBM0OVqlgvWKC3wgI5Tc9E8JTFq9A0fNIebUA8Hb0PxKMVenXpuPECRTWpu8CVFHETvMOmGnOFYfXJ5FfrwJrTRfb2r1PmJ4i0fAl2EsKGZFviiyWEN8bzE2KjoWMa/uGa6xwimXX54YEjl5rz43Bu2aK+ALXCZQOYBx5K84L2xWYAH56d0PQDN/rJSscBjAWH6Pl2mCFUUxgDx3yAO9s+bRYCBB24AMCKBjf9ZPSJGOFYal+4J5eDIl26xTa4l8bOq8qYTOzCh9v0gNyuAUJRUcUMt7PkzDYXryuILLzwWLyvWhdg9SNWSV7avQ3VNx/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR0401MB2354.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(956004)(2906002)(8936002)(16526019)(2616005)(186003)(5660300002)(66556008)(6666004)(26005)(8676002)(66946007)(316002)(66476007)(16576012)(478600001)(52116002)(4001150100001)(6486002)(83380400001)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Z0Z0ixY7gUYgLCLqI5bjuVeBO/psNF72F8pFWbfIIYpezEBl0fvyWih8LAsB?=
 =?us-ascii?Q?Cc8pFlucyFGrdl0ASZSa8uVEf24kqKe9zQBY7qlknmDb+MngIP+F0ks1RpfM?=
 =?us-ascii?Q?OQ0q2++IYnSiOiH77LDTORscbAVvM8SaozumOIOf1bJNFeUsUKpKkNpnN1GJ?=
 =?us-ascii?Q?has0mvjK2RJgh+hd2h/xcb2+/bH2AAYtrS1A2Zar/b1+ZsSn91dmhNvJUYHy?=
 =?us-ascii?Q?aLqQ7b3EIV8tco++udGhH6Xi0niP6n2C4ve6oVD5as9IvVLGuHBgFdlFHWy1?=
 =?us-ascii?Q?B0tu7zOg+h5uBkSyCJEHduPJ+lu+RvxuA5nCvMup0JTU2IoGy16ymmsn47vi?=
 =?us-ascii?Q?Lq/ePqAvVKq1UUVjgImbxkZXyccky0yyHjmlhQTuE5W662s86UGn+iFnVobj?=
 =?us-ascii?Q?PTxTfSzLD9rcm54qsZGIGiY0ye0aquy461HRjVKvn8VFPhsCdVoTSRCyS84C?=
 =?us-ascii?Q?ajgsr+1R4PYRtLWwn8aOED2QM5m0bm4RAvearv1zSKJ6DD8AwtqecuXfpT1R?=
 =?us-ascii?Q?r6FiCDZSRfIjB/bLvocj1pwU37sLLPj6pcIPFLxYc8pRVP5k+2oDfnxGg5tE?=
 =?us-ascii?Q?F2J5WE8Ls79PKiQfk34oXdz1tNbchdvbyIqN/i6BHxgEcYHfC/gzQ7XSDYNT?=
 =?us-ascii?Q?1FBoaiYN3apet2GHWVGkMT2JicSV3Q6CJYyzAsaVjATWuK8kflb970J3JbdA?=
 =?us-ascii?Q?rpjK8JtNQ9XpPJGbIryb4fw0XpwRg6x1PhlAhl20pN+4T1N2RnXRAuBvD8mb?=
 =?us-ascii?Q?I3jtUn5KX/17l6k/bH5EMS955dOKTXCyP0AyV3p3Yj9xrD2nVjEZrHUaxqqG?=
 =?us-ascii?Q?/QCsMAu0l5Rz6Oo7wULiT7BLOVlZuhkg95XnRDRTp1eQtQ4snQXJUGFyv5jr?=
 =?us-ascii?Q?5+yFKLaU/HCLcUaqeIXdzf4PUd7pnf6+B4d91J0NVSQ97Qb42eyvS6zDV3dS?=
 =?us-ascii?Q?2dPUfq8gyBxvyJbh7KpKRs+HHzonISuCks2CHdzjzxtmq+7qhQodR+13m9aP?=
 =?us-ascii?Q?Xf67?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0401MB2354.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 13:58:07.4885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b314a1-ac59-4bfc-73cc-08d8b31442e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gupFeVACzc7DIBA1NijxBZa0ZiPaw7Sq2fHUaRminQjQ7Fe+mVfwQYJxtMrBpf3/p3AOL6yXZ+Fm38vp6dHIDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6609
Received-SPF: pass client-ip=194.104.109.102; envelope-from=brogers@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-12-21 at 15:44 +0100, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> =C2=A0configure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 ++++=
-------------------------
> =C2=A0meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++++++++++=
++++++++--
> =C2=A0meson_options.txt | 11 +++++++----
> =C2=A03 files changed, 33 insertions(+), 31 deletions(-)
>=20
> diff --git a/configure b/configure
> index ba8c6e74be..46ee3da40e 100755
> --- a/configure
> +++ b/configure
> @@ -315,7 +315,7 @@ netmap=3D"no"
> =C2=A0sdl=3D"auto"
> =C2=A0sdl_image=3D"auto"
> =C2=A0virtiofsd=3D"auto"
> -virtfs=3D"$default_feature"
> +virtfs=3D"auto"
> =C2=A0libudev=3D"auto"
> =C2=A0mpath=3D"auto"
> =C2=A0vnc=3D"enabled"
> @@ -1004,9 +1004,9 @@ for opt do
> =C2=A0=C2=A0 ;;
> =C2=A0=C2=A0 --enable-qom-cast-debug) qom_cast_debug=3D"yes"
> =C2=A0=C2=A0 ;;
> -=C2=A0 --disable-virtfs) virtfs=3D"no"
> +=C2=A0 --disable-virtfs) virtfs=3D"disabled"
> =C2=A0=C2=A0 ;;
> -=C2=A0 --enable-virtfs) virtfs=3D"yes"
> +=C2=A0 --enable-virtfs) virtfs=3D"enabled"
> =C2=A0=C2=A0 ;;
> =C2=A0=C2=A0 --disable-libudev) libudev=3D"disabled"
> =C2=A0=C2=A0 ;;
> @@ -5443,24 +5443,6 @@ if [ "$eventfd" =3D "yes" ]; then
> =C2=A0=C2=A0 ivshmem=3Dyes
> =C2=A0fi
> =C2=A0
> -if test "$softmmu" =3D yes ; then
> -=C2=A0 if test "$linux" =3D yes; then
> -=C2=A0=C2=A0=C2=A0 if test "$virtfs" !=3D no && test "$cap_ng" =3D yes &=
& test "$attr"
> =3D yes ; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtfs=3Dyes
> -=C2=A0=C2=A0=C2=A0 else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test "$virtfs" =3D yes; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_exit "VirtFS requires l=
ibcap-ng devel and libattr
> devel"
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtfs=3Dno
> -=C2=A0=C2=A0=C2=A0 fi
> -=C2=A0 else
> -=C2=A0=C2=A0=C2=A0 if test "$virtfs" =3D yes; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_exit "VirtFS is supported only on L=
inux"
> -=C2=A0=C2=A0=C2=A0 fi
> -=C2=A0=C2=A0=C2=A0 virtfs=3Dno
> -=C2=A0 fi
> -fi
> -
> =C2=A0# Probe for guest agent support/options
> =C2=A0
> =C2=A0if [ "$guest_agent" !=3D "no" ]; then
> @@ -5917,9 +5899,6 @@ fi
> =C2=A0if test "$libattr" =3D "yes" ; then
> =C2=A0=C2=A0 echo "CONFIG_LIBATTR=3Dy" >> $config_host_mak
> =C2=A0fi
> -if test "$virtfs" =3D "yes" ; then
> -=C2=A0 echo "CONFIG_VIRTFS=3Dy" >> $config_host_mak
> -fi
> =C2=A0if test "$vhost_scsi" =3D "yes" ; then
> =C2=A0=C2=A0 echo "CONFIG_VHOST_SCSI=3Dy" >> $config_host_mak
> =C2=A0fi
> @@ -6580,7 +6559,7 @@ NINJA=3D$ninja $meson setup \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dcurl=3D$curl -Dgluster=
fs=3D$glusterfs -Dbzip2=3D$bzip2 -
> Dlibiscsi=3D$libiscsi \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dlibnfs=3D$libnfs -Dico=
nv=3D$iconv -Dcurses=3D$curses -
> Dlibudev=3D$libudev\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dlibssh=3D$libssh -Drbd=
=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy -
> Dlzfse=3D$lzfse \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$s=
eccomp \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$s=
eccomp -Dvirtfs=3D$virtfs \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Ddocs=3D$docs -Dsphinx_=
build=3D$sphinx_build -
> Dinstall_blobs=3D$blobs \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dvhost_user_blk_server=
=3D$vhost_user_blk_server \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dfuse=3D$fuse -Dfuse_ls=
eek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 99c4d0dd1a..22413b4f16 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -963,6 +963,25 @@ endif
> =C2=A0# config-host.h #
> =C2=A0#################
> =C2=A0
> +have_virtfs =3D (targetos =3D=3D 'linux' and
> +=C2=A0=C2=A0=C2=A0 have_system and
> +=C2=A0=C2=A0=C2=A0 libattr.found() and
> +=C2=A0=C2=A0=C2=A0 libcap_ng.found())
> +
> +if get_option('virtfs').enabled()
> +=C2=A0 if not have_virtfs
> +=C2=A0=C2=A0=C2=A0 if targetos !=3D 'linux'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error('virtio-9p (virtfs) requires Linux'=
)
> +=C2=A0=C2=A0=C2=A0 elif not libcap_ng.found() or not libattr.found()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error('virtio-9p (virtfs) requires libcap=
-ng-devel and
> libattr-devel')
> +=C2=A0=C2=A0=C2=A0 elif not have_system
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error('virtio-9p (virtfs) needs system em=
ulation support')
> +=C2=A0=C2=A0=C2=A0 endif
> +=C2=A0 endif
> +elif get_option('virtfs').disabled()
> +=C2=A0 have_virtfs =3D false
> +endif
> +
> =C2=A0config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') /
> get_option('bindir'))
> =C2=A0config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
> =C2=A0config_host_data.set_quoted('CONFIG_QEMU_CONFDIR',
> get_option('prefix') / qemu_confdir)
> @@ -1007,6 +1026,7 @@ config_host_data.set('CONFIG_VNC', vnc.found())
> =C2=A0config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> =C2=A0config_host_data.set('CONFIG_VNC_PNG', png.found())
> =C2=A0config_host_data.set('CONFIG_VNC_SASL', sasl.found())
> +config_host_data.set('CONFIG_VIRTFS', have_virtfs)
> =C2=A0config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
> =C2=A0config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
> =C2=A0config_host_data.set('CONFIG_GETTID', has_gettid)
> @@ -1105,7 +1125,7 @@ host_kconfig =3D \
> =C2=A0=C2=A0 ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=3D=
y'] :
> []) + \
> =C2=A0=C2=A0 ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=3D=
y'] :
> []) + \
> =C2=A0=C2=A0 ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNE=
L=3Dy']
> : []) + \
> -=C2=A0 ('CONFIG_VIRTFS' in config_host ? ['CONFIG_VIRTFS=3Dy'] : []) + \
> +=C2=A0 (have_virtfs ? ['CONFIG_VIRTFS=3Dy'] : []) + \
> =C2=A0=C2=A0 ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=3Dy'] : []) =
+ \
> =C2=A0=C2=A0 ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=3Dy'] : []=
)
> =C2=A0
> @@ -2294,7 +2314,7 @@ summary_info +=3D {'mingw32 support':=C2=A0=C2=A0 t=
argetos
> =3D=3D 'windows'}
> =C2=A0summary_info +=3D {'Audio drivers':=C2=A0=C2=A0=C2=A0=C2=A0
> config_host['CONFIG_AUDIO_DRIVERS']}
> =C2=A0summary_info +=3D {'Block whitelist (rw)':
> config_host['CONFIG_BDRV_RW_WHITELIST']}
> =C2=A0summary_info +=3D {'Block whitelist (ro)':
> config_host['CONFIG_BDRV_RO_WHITELIST']}
> -summary_info +=3D {'VirtFS support':=C2=A0=C2=A0=C2=A0
> config_host.has_key('CONFIG_VIRTFS')}
> +summary_info +=3D {'VirtFS support':=C2=A0=C2=A0=C2=A0 have_virtfs}
> =C2=A0summary_info +=3D {'build virtiofs daemon': have_virtiofsd}
> =C2=A0summary_info +=3D {'Multipath support': mpathpersist.found()}
> =C2=A0summary_info +=3D {'VNC support':=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vnc.found()}
> diff --git a/meson_options.txt b/meson_options.txt
> index 1854a9639f..59a8a50e5b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -90,10 +90,6 @@ option('vnc_sasl', type : 'feature', value :
> 'auto',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'SASL authenticat=
ion for VNC server')
> =C2=A0option('xkbcommon', type : 'feature', value : 'auto',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'xkbcommon suppor=
t')
> -option('virtiofsd', type: 'feature', value: 'auto',
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'build virtiofs daemon=
 (virtiofsd)')
> -option('vhost_user_blk_server', type: 'feature', value: 'auto',
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'build vhost-user-blk =
server')
> =C2=A0option('zstd', type : 'feature', value : 'auto',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'zstd compression=
 support')
> =C2=A0option('fuse', type: 'feature', value: 'auto',
> @@ -101,6 +97,13 @@ option('fuse', type: 'feature', value: 'auto',
> =C2=A0option('fuse_lseek', type : 'feature', value : 'auto',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'SEEK_HOLE/SEEK_D=
ATA support for FUSE exports')
> =C2=A0
> +option('vhost_user_blk_server', type: 'feature', value: 'auto',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'build vhost-user-blk =
server')
> +option('virtfs', type: 'feature', value: 'auto',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'virtio-9p support')
> +option('virtiofsd', type: 'feature', value: 'auto',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'build virtiofs daemon=
 (virtiofsd)')
> +
> =C2=A0option('capstone', type: 'combo', value: 'auto',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 choices: ['disabled', 'enabled=
', 'auto', 'system',
> 'internal'],
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'Whether and how =
to find the capstone library')

I noticed that for me, this broke the building of virtfs-proxy-helper.
I've not yet figured out what the fix should be, but thought you'd want
to know.

-Bruce


