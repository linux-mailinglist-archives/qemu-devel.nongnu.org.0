Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023403CEDDF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:44:42 +0200 (CEST)
Received: from localhost ([::1]:50118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5a81-00012b-2B
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1m5ZoH-0002Qo-A2
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:24:17 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:41152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1m5ZoF-0003ov-8v
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:24:16 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JKChkX009824; Mon, 19 Jul 2021 13:24:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=np+86js3+A3IgH1Qtn4mz0HMLTuZ0qg7OMcJ69m+2Os=;
 b=DzWQP1zcUVb/aUI+G8BsC5cK+StT5FLbzkHfq4snaBWRkBPv/5gexwiynzA4GDJCZUtp
 yK6sFkie0Cmsz60hdKgA6IC9BEeShnnfnq5VfmH8yZeXeGlgSSJjt17ECWrMK4cW2RgD
 I/eB5aTZMGMR22EEQDamhb+nIO4cTUU0FehyddRklCQSMICHxpMtinnCthITx/F47fwQ
 DAuBVv2fmIcmfeaZULV5X0IUIXcT+edyLdOMf4z0S2WZQDElg19FMn+xAKxEf7tsYa/w
 AriYNRFC8yc4yTwqj1C4WM+MCN2bdKWCIfNxUb6km8ubCHNlB2C9EkTJXouuof+7kffg eA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0b-002c1b01.pphosted.com with ESMTP id 39w6ues6aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 13:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G19MNJeIcxpP0OkwVjtteXsPTm3wbCvLa1M2Bd7h/kSkG6PmvOxC0uJYbgeb04bqpMg3P6Smgv5cBlIG4aIV4lQLoIR5NzJ3NFO5cDdQbEPLqMbyTtPuhmquiLlncQReB1nkEL6Ki22DymTNdFZXXCBEg6w57sxKeigDGkR8PvnuMxneIY0oD+Li10s9dXoXyGu+f565mnYCB0N7qJwsnY7r1Uj8LjEY4DZawzy6HpAP3Its9y49l1OusVggvxgIQqmJU9bY12DWxeqWag43Bwf7KRUYG1cR0eLYSbzpqi/bInz125luvwdELn5oGC8N9mWclXGFffPHwl2ER4q6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np+86js3+A3IgH1Qtn4mz0HMLTuZ0qg7OMcJ69m+2Os=;
 b=MepjCqtbwNqwvgXYKsCer1f6ySvFMK+umwSqIbZ5Je8548xo2QFfCEzX96JL1ZcR7pHsN4X/Dla9dMzNuC6IFc64xVAyngwIvYKB2eOIx9sX8Usl5SrEGfZNjzbXSYkeb88sc2GDsyjvF0L0d7Ovi/HFNDAlNVH4scS1TjqSz2EJZGiMGrGcz3e7koZspJQsTMKzjE2U738RvTrpySNk2Nzod7dmH+5HbaUO78/LwLifNyhvdW/4S15UT2+GRxadKeJL0dxN3O35ZpBzlsqL0j4hhos0MzoJ+/XrCrWqoPd99GSSalPU0sKx71SZqAyH57B3f/WIqnWFO1zF3e9cRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB5380.namprd02.prod.outlook.com (2603:10b6:208:36::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 20:24:10 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::6903:7fea:be33:66cc]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::6903:7fea:be33:66cc%3]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:24:10 +0000
From: John Levon <john.levon@nutanix.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server 01/11] vfio-user: build library
Thread-Topic: [PATCH RFC server 01/11] vfio-user: build library
Thread-Index: AQHXfNjN3zFKUMpA3kSJq81CK0nbJ6tKvl2A
Date: Mon, 19 Jul 2021 20:24:10 +0000
Message-ID: <20210719202409.GB1443636@movementarian.org>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <5002d6a67cb6c429b2e3d21e106b468176e82a1f.1626722742.git.jag.raman@oracle.com>
In-Reply-To: <5002d6a67cb6c429b2e3d21e106b468176e82a1f.1626722742.git.jag.raman@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 931d61c3-1489-4d08-566e-08d94af32aa3
x-ms-traffictypediagnostic: BL0PR02MB5380:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB53804D697904A89A79F1062297E19@BL0PR02MB5380.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6rloH3jKagHDhk48PvkSxdBHc8FU3UaBTOjgstzMklPLv8Y02pmYKBVi7NSPdyB5N0n3KqBO+reViMW9DwxzmW74hvQ7hp07lKkcACF80JfWkRmcss+oXpvIFYM6Q6SvNh53d/yiZt+5oSFizYKJiYkZGuNx1K2ECBOvA9zcuTDo1iBrU7VwrTuv/CeTquxZRoXTfcpYAneJWmhZ9NrFrLjYt4vW2YWcooRJo/2VLkZWT1SPpOKaPpoughUpxJ9Indm4KTDdWl5GQbybU7LpWQafCb/ALQyoJ3xJ6mSJSCB1fWtMzApNy7u+oDms67/TLw6FbVvhtjFqx3S8NOTjdF4zBotpUI/d0mKYBDkU/1ry7ZuX8zQeJCUBOztZXuP0HGewZiEAv77UIU54PUZskXGh+CnMXqyeTKPVwZVbRor8cQNgDA0nn7Kb2LG3Oyn/W1aJVvx8ksTUO8kG64Ho+bxkTaAcb9moTLK8Am5ndAFnV5X6rxYYQjwrRk5v+dLFKTndn9BUuPYnelm/vZCheFP8JGDDN+lPNygP5JIK3RYe8c9B7KtFsGMBfwARPjLz7R5Z0pm+E3wfn4Su1vs5wbtabI/KGWmuy08T2mAFTMxXrN8tJLXpQOwa/nSEi1+DJMf01fFcygWSCQn7ckJ3CmR2KlJQlHioWJxBJ5F7SdCscSUee6v00QgjcguRx7Kjo/kfIBzCot+HQ9/uysFhBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(346002)(136003)(396003)(6512007)(1076003)(186003)(4326008)(107886003)(33656002)(9686003)(6486002)(478600001)(8936002)(316002)(54906003)(26005)(36756003)(8676002)(6506007)(91956017)(2906002)(5660300002)(38100700002)(122000001)(76116006)(71200400001)(66946007)(64756008)(66446008)(66476007)(66556008)(6916009)(86362001)(44832011)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fjK6G5gsHrgycz7sQ1DBW+9kdflL5jm8A7UF9Tf0y7mZmP74/Ge6xAMOK4Hd?=
 =?us-ascii?Q?iTVIADM/6n1PnyfZwKt2x/NXPbIQC6huvXLTiRT7KQNSoB+KWNgZaXm77jx1?=
 =?us-ascii?Q?e9/Y+L52qCh2PGXEaydYOzJydG4Gtgvgf5P7mjWT2ubpa6GvW5q3rZo3CKV1?=
 =?us-ascii?Q?o/fXX/nT0nc4R8IMdsHp1NTiFK9ZK1/x/pEr+YanhLxphvzDeULu8o2v2bos?=
 =?us-ascii?Q?gVHzT8n0/iPlzwvHcew3QdEZlSw12khd0Jmqlf9KaKmPTj8979xy3HnjSMlp?=
 =?us-ascii?Q?4/2p477I3Ui+ohi8aqhl2bokfTCs4zIE7nITicpT4HuNnQfie+WpDSAXMiHT?=
 =?us-ascii?Q?MjYe3tSElds33/iZtVyQEd82fEkunf3LgbKx9t2EgWmhAPcb9HEAg3PC9iRB?=
 =?us-ascii?Q?Vv86JC/RSKqYbajDvD/JkK+r62hERCMxO4ibaJ/kTOuqAxBwLc7De7QgdMhM?=
 =?us-ascii?Q?ykrC6e2xDlGZRM3MEJydYAGhNIY33A8fOWRdhPmc5x7cAklg1zf5qU1lHUmk?=
 =?us-ascii?Q?fqMOFCEqkK2KhNAs4goch4EDQRuqjsemOh95pQaE3ETUohLA1wfOWjCLR6Zc?=
 =?us-ascii?Q?2LI6YQWQUNK5jY7ZYcVG3NSTxwQ5o0Is/CEQW9kTlMyC/IQ8TSq4mynnEarS?=
 =?us-ascii?Q?PMj9AFWowHeRQ4LABQYCJW4frruD1EPeHlenLjbYO1i1z+JpckXuPpdimE27?=
 =?us-ascii?Q?fCi+OzsN66Io+KuzwEAFsAhU85e0BnLJjTBWWG0a0PA80jeKplRb5E6Iq+WK?=
 =?us-ascii?Q?lSkF3VUQ4T+VcQmoshyR7ey7B0byHnTkCb70jafslH6BUzC4Ww4i84hR9j1G?=
 =?us-ascii?Q?mAsXgp8F4TEm7K7781Mu3+LeHCFA+WcdnyZG+Vl9XforJf7PE/RqNPk9HcfD?=
 =?us-ascii?Q?FKhpR9siqPjC+xw+LC5/HK5/+gl20m/qDXIVgzzYqwAhca4EpM/td3tDsX6b?=
 =?us-ascii?Q?TAMLxVVKXzNuzJocV+wyncq9513DtMzhWYkXB357UDIHeolYwKYg3ZVPrvqf?=
 =?us-ascii?Q?v5G2BGY+pGNtcm06KVFunRdtAWVcHTiBNKwO2Ohg0GAxm/1sIKL5wSOAdN4P?=
 =?us-ascii?Q?Spx7kC71yh+GmkyfxNKQhgSUFg1oBBGBpQH1cTm76ugo8aZw2N5Y9ojXY23K?=
 =?us-ascii?Q?ggF78J5HHJWx8xtNIAmX+qCoqjcsBLhejvZZObTNK2363co/92qITKVUioeb?=
 =?us-ascii?Q?JkczR7MqsZvmJqX+WeG8S2xSBGeH90XKOoAnKZkhshBgStDsfy+xZqnhV6bs?=
 =?us-ascii?Q?kHgM8zfYwzugg1XWNuId4bWVOczlgO+ubiWIuvFIBlgiHGGDXIZBt+akCU02?=
 =?us-ascii?Q?ZphPB8IJt63N6SYCdLJCoRRR?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A72583EEB685134AA2F73F7919DD14E4@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931d61c3-1489-4d08-566e-08d94af32aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 20:24:10.0912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdTv2j+vD0q/idX3nUCt2xhOC5XJ9UwDaPBmfSyQrcstYlETfrh2uhmsaozoevhzWIoPl2/UYSn/S+RWTOzV5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5380
X-Proofpoint-ORIG-GUID: LRQeS3WrNKdkfi5QyOKfT3RCNtLfS9oW
X-Proofpoint-GUID: LRQeS3WrNKdkfi5QyOKfT3RCNtLfS9oW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_10:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 04:00:03PM -0400, Jagannathan Raman wrote:

> add the libvfio-user library as a submodule. build it as part of QEMU
>=20
> diff --git a/meson.build b/meson.build
> index 6e4d2d8..f2f9f86 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1894,6 +1894,41 @@ if get_option('cfi') and slirp_opt =3D=3D 'system'
>           + ' Please configure with --enable-slirp=3Dgit')
>  endif
> =20
> +vfiouser =3D not_found
> +if have_system and multiprocess_allowed
> +  have_internal =3D fs.exists(meson.current_source_dir() / 'libvfio-user=
/Makefile')
> +
> +  if not have_internal
> +    error('libvfio-user source not found - please pull git submodule')
> +  endif
> +
> +  vfiouser_files =3D [
> +    'libvfio-user/lib/dma.c',
> +    'libvfio-user/lib/irq.c',
> +    'libvfio-user/lib/libvfio-user.c',
> +    'libvfio-user/lib/migration.c',
> +    'libvfio-user/lib/pci.c',
> +    'libvfio-user/lib/pci_caps.c',
> +    'libvfio-user/lib/tran_sock.c',
> +  ]
> +
> +  vfiouser_inc =3D include_directories('libvfio-user/include', 'libvfio-=
user/lib')
> +
> +  json_c =3D dependency('json-c', required: false)
> +  if not json_c.found()
> +    json_c =3D dependency('libjson-c')
> +  endif
> +
> +  libvfiouser =3D static_library('vfiouser',
> +                               build_by_default: false,
> +                               sources: vfiouser_files,
> +                               dependencies: json_c,
> +                               include_directories: vfiouser_inc)
> +
> +  vfiouser =3D declare_dependency(link_with: libvfiouser,
> +                                include_directories: vfiouser_inc)
> +endif

Why this way, rather than recursing into the submodule? Seems a bit fragile=
 to
encode details of the library here.

regards
john=

