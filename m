Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A52ED38D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:32:30 +0100 (CET)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXH2-0007de-TJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kxXFz-0006rF-QQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:31:23 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:28379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kxXFv-000467-Qz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610033476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Nqvsp2f84aGRChDSqmazJFJdasZs6dcOo3lRYpCdv4=;
 b=WqSF5QeAzV80eKYSI6H1PjsX8e0csZQBPbntxuYie0ZJd81qcHjftmvG7a2jsu37ktgXyI
 G9dAzeUhsGsZuPFB+/AIDpCYdSvJy9w3wJY0LLGKVRq+GVa2xGrY1/jJYP5atlO/OaU/B+
 ivfx3Omt9oQZ3mH/H94IF2iED2b7gq8=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-9u29EBsyOmy1mgoCVBA3hQ-1; Thu, 07 Jan 2021 16:31:15 +0100
X-MC-Unique: 9u29EBsyOmy1mgoCVBA3hQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgAhqR1D6qygakMPi8DqQNwTU290gbhLRlPuW3T5Xls0dubabsK42wyqhU39z1+oZJ2NKiTThzVDqZTKKdNsxYdb1vmKgn39eVnSxMQ+By449+IWjrfwnsXDiqAaGYIQ8R6yyYrCzvu+xQ6x9fGFgZaFrHE840nRQrFnpwVF1ebGDGTZZ6CZL7U2QOo4DFv2NV+SuyV8YwEXm5VNDxc+fEGd88zwAAlIOLBmHlfZEpigI6RfmCeoJbbw/zRV+TF71xodEYDjAkFIiuXEnyYfgWgvazeU0R4sNVCn56HJ8LKCBhIkKolAntVUn5qHmciOrXmG3fbGLQYc9RzR9MlVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTf8lry6+hlZVsk6bVjC22oR7sxyQqG+nopuWvbm8iQ=;
 b=XZS2krC59H2KnuYzXbVLcpf0D/xk/JMDDFq3A0EUNQQaILhrpH4PKZ1MzjexQqomRv6HXorMWyThG3WVXf3dj5G0FUh8p4g2ha/NxtoRY9VEVVqowk7118PbDGMCTtRI3zNStuJUhWcx4kMI+/ematJ182nULs5K2ibhj1xvIVb93xBFnsoE7SfbydVFmMJg/KoUVePNlQbnbXiYKK1O2dAFxzDmxNWLGVXD5v5LKkjypEUZMRvOWXpDjgqa4MhQgqDEMXrtktHefRtLaZpmYnwl4Wz6e8Umgg8SEOf4MzL3fODXh7hq/ObqxftpLGRlJZeWQjfeHA9/G4zxwLylLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21) by AM8PR04MB7233.eurprd04.prod.outlook.com
 (2603:10a6:20b:1df::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 15:31:15 +0000
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::2580:e7d:9f89:8edf]) by AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::2580:e7d:9f89:8edf%10]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 15:31:15 +0000
Message-ID: <a561020367c37d9c10d0e573abc2072249cbefb1.camel@suse.com>
Subject: Re: [PULL 50/55] virtfs: convert to meson
From: Bruce Rogers <brogers@suse.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 07 Jan 2021 08:31:08 -0700
In-Reply-To: <24d591d5-fb37-f77a-d8ab-3112dfe35439@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
 <20201221144447.26161-51-pbonzini@redhat.com>
 <36869fd5f001f4eab10539839395504fd9fb5f7d.camel@suse.com>
 <24d591d5-fb37-f77a-d8ab-3112dfe35439@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [63.248.145.198]
X-ClientProxiedBy: AM0PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:208:55::37) To AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.22] (63.248.145.198) by
 AM0PR04CA0132.eurprd04.prod.outlook.com (2603:10a6:208:55::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 15:31:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1e286ab-ede5-40d6-3c5c-08d8b321454c
X-MS-TrafficTypeDiagnostic: AM8PR04MB7233:
X-Microsoft-Antispam-PRVS: <AM8PR04MB72330CAF59549CB2B2FFD2A2D9AF0@AM8PR04MB7233.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CfTI2A6wuYnJQqPKX3K1KvUuM6pzpjxSkYD91QmXllYl+BF5ju3iZak+JsGiJug+rOITrYjT/dVrNLPsP0ySNzgF19HwlOXHYg9docTzSHRwWbHfwQhWcMY/VdsVN9gOI49myqf1sXo0wdgt+z/YNjkk4IQdrQ6JRva6xCjkqNvFkSfTm+6/HKndiz+Da7N7qIKvVc7UqpxVKoE/aXG+1IE+DkwjyYDATgg/lfi2fGDYg4/b7VLiRWqTjyoTwp1EshsyPchObKXzhMj1Z631FYFVuNBi1xrdGYbu2K410qoY0MWcB3HzYDPLMHVO7RDlSgFtmZ+XE1NnqWTzYTkifEwY5DEVtBt02ISne286VykfaBTEiIWbhqBtopGT+1ldral3dnzHxfEN5nIZQyzOtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR0401MB2354.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(136003)(376002)(346002)(8676002)(83380400001)(86362001)(66476007)(6486002)(478600001)(66946007)(5660300002)(66556008)(52116002)(36756003)(16576012)(316002)(6666004)(2616005)(2906002)(956004)(53546011)(8936002)(16526019)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WmeK6yETINO8X9ZfujkxoixxPU1DlnlPM9LhbrVGy1hV/qYmZHQ9+NMYcvyQ?=
 =?us-ascii?Q?DAnHCvyeQLnFiL9nylNDHDSyaCsWgQ3bsQBr6Pq89CZujG58XFFoT8CkVFzr?=
 =?us-ascii?Q?7olf43pvmXN5rK3f6gtpyPy0Kexou81OPMeO+FcpIqBPzYAShAF4IfC1GP2w?=
 =?us-ascii?Q?Olzz8ptnnvVS0gbgPiFK6voYZOiBbl1Nzg1kJQ08B4eU+CThNuyDtRCxhOgA?=
 =?us-ascii?Q?4bVaTLm+3lUHmJd18LSKiSc0nNewKWkuoXHEpmfgjwKflFA/jF/UTg1Ua5/F?=
 =?us-ascii?Q?OzQjGPypXBVL+d7PN24gNH3bkHOkJJWyKjn8/BFn9pOFFdHfgQ/OZ7rTeogn?=
 =?us-ascii?Q?JwHhpH5TH6p2AZO1W1PDR/YpuG95N37cHz0a0Ol6uAn83XZ4EZCJiDugxAxk?=
 =?us-ascii?Q?WlkIap6rz6mAtmCuqNWQIesAoVSz94VpbRtbm2tC/fnb78h0F53XQi4mm2hD?=
 =?us-ascii?Q?fsKARJJB3tOSEsNfpKWiSwlVtPZCHNPbP7OkhwAntMFFmGyFrqgr/fDXJPXX?=
 =?us-ascii?Q?69lKC8/MrDoXfQxF/x3E0Gwmsz9R1HPXykPvYrgNQeZt5Qn2tC+YVCAdY5CW?=
 =?us-ascii?Q?BRcKhBRJlLABF+J+hLFW5Ie0UjnScB3sBBWiOc/pEHsteabLJTuSO5zu9Hyb?=
 =?us-ascii?Q?5fdvrXhsnDvv/abw5Ig7Pv/soWTlqoLLUs0zjtKQTiEEvQRT0gGHM8vqqR7S?=
 =?us-ascii?Q?qHptsbepPGTrKD50ggJS738VKwEE9Q3355fTrOu/aDDztcKScZlHfOY5qNR3?=
 =?us-ascii?Q?CMbUi1yqhkcEgIK2uz2JjoJK8TegxB8/iCbr7Dl5cY1foPFwc+AKydH73U1s?=
 =?us-ascii?Q?/sDBvMaz870iFCzUdiavf6TnNSDlxlaPeLMXzm3F1SdN1AFETA5GPmG+mI6c?=
 =?us-ascii?Q?pC0ZGM3xoBVvuycDWvVaPemDNO/tPfL7rrCQ4Er4CeFI1/xAiEhu4FFIVPEV?=
 =?us-ascii?Q?DhucG0ac4EjHOsOGfKJXzANeyU6mGAgKg/X1OEVh4mm0WhBYOWvzGEphfX31?=
 =?us-ascii?Q?CU/m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0401MB2354.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 15:31:14.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e286ab-ede5-40d6-3c5c-08d8b321454c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmL1lDnkF3t5bd0vbbzmYtZrpRXKG2KaCuyDGqYq6CBKtIMYfsO42h38857u4JenibYi8xjZZf3liYWQN9CDAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7233
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

On Thu, 2021-01-07 at 15:49 +0100, Paolo Bonzini wrote:
> On 07/01/21 14:58, Bruce Rogers wrote:
> > I noticed that for me, this broke the building of virtfs-proxy-
> > helper.
> > I've not yet figured out what the fix should be, but thought you'd
> > want
> > to know.
>=20
> Possibly:
>=20
> diff --git a/fsdev/meson.build b/fsdev/meson.build
> index 7dd1cc9bfb..65455a179e 100644
> --- a/fsdev/meson.build
> +++ b/fsdev/meson.build
> @@ -8,7 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true:
> files(
> =C2=A0 ), if_false: files('qemu-fsdev-dummy.c'))
> =C2=A0 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
>=20
> -have_virtfs_proxy_helper =3D have_tools and libattr.found() and=20
> libcap_ng.found() and 'CONFIG_VIRTFS' in config_host
> +have_virtfs_proxy_helper =3D have_tools and libattr.found() and=20
> libcap_ng.found() and have_virtfs
> =C2=A0 if have_virtfs_proxy_helper
> =C2=A0=C2=A0=C2=A0 executable('virtfs-proxy-helper',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 files('virtfs-proxy-helper.c', '9p-marshal.c',=20
> '9p-iov-marshal.c'),
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 450af3e51c..b8e19bbc81 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -199,7 +199,9 @@ qos_test_ss.add(
> =C2=A0=C2=A0=C2=A0 'virtio-serial-test.c',
> =C2=A0=C2=A0=C2=A0 'vmxnet3-test.c',
> =C2=A0 )
> -qos_test_ss.add(when: 'CONFIG_VIRTFS', if_true: files('virtio-9p-
> test.c'))
> +if have_virtfs
> +=C2=A0 qos_test_ss.add(files('virtio-9p-test.c'))
> +endif
> =C2=A0 qos_test_ss.add(when: 'CONFIG_VHOST_USER', if_true:=20
> files('vhost-user-test.c'))
>=20
> =C2=A0 tpmemu_files =3D ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
>=20
> Since CONFIG_VIRTFS does not exist anymore.=C2=A0 Sorry.
>=20
> Paolo
>=20

Looks like that solves the issue. Thanks.
- Bruce


