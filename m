Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE55884A9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 01:07:30 +0200 (CEST)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ0z3-0006PN-Ii
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 19:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9213ef72d3=irischenlj@fb.com>)
 id 1oJ0wg-0004Uh-JD; Tue, 02 Aug 2022 19:05:02 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:36956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9213ef72d3=irischenlj@fb.com>)
 id 1oJ0we-00071a-Gc; Tue, 02 Aug 2022 19:05:02 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 272I2Qp7028893;
 Tue, 2 Aug 2022 16:04:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ZgeacT8P7E8OePXnkmTcfYh+HaBb9j7hhp20BhRiaQ0=;
 b=Lemrwhxo+Mk3yqP8+dk11MT6t1b3HK3wHTxVu0wVPWMh+6zy6BwlAu8hXDB3JPpTX46R
 QhFrRqDwt1S6yYLOx0yLRjJ6UD1D4WxHAgipp60SzqcZytRj8+v+OoNznRQ9uTbOYqgH
 DpMAWD+J9QIqHCpaNiW0C/XEckWA/TZ3aDg= 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hpy32e1xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 16:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqIWzNtB85Kbe0y7guVCuMNFeetHeOsxnoYK2ooLKAiyO3PczzRoZKE9Fu6bw1orxK/wiKSDlkdSMkw0ZRktI0Js/Z314byXQzVVFY0UydsWuacRJe3JBt1ys83xIbLfRO7qxzkfZoM+0D5qIz6o9hLOSakbcghNDBxr+FeC8ovwS9vpA9PPqAeVP6iB/xQVp6K+FjGwdAfiD2zcuw1NrSX6VQCkYw6OINztboVd8b2/z8Sw1Huv0rOm28jo5J44dB7czeHjkPqDr0nzii5VTbvRzFbTycLqqLNWFWnqEh/PlfEj1gXdbSjZnXDYJNLL3KNYjTedIaT7SC4gfvCGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgeacT8P7E8OePXnkmTcfYh+HaBb9j7hhp20BhRiaQ0=;
 b=PQjoXnm/Z1tG6daVJqZC6SaMsXw2Hj02lKCI/zbTGgk8dVOD/C/oBjV7rkKL2R1ZL4H3fQDqSeWPm/uiz6+wIVyfM7MWV0yHG5b+Bm0Um/HAShf4VrxeR0DHEryBNUARP1ffAKt5nEVBOIOT1ThQLNnb2clrcxAYzzaLfORUq7DWqhzxvF0Qw+QSlOBtrLQRE9FQw53udx1ETU5OA8sCwSVOwkQ/62mF74mXmRzrRFU6a8VtHL5151Buqij7SFIdNBPa9NHryUYvwdsHybbG3XdDLaNYHOhtAfjbHic5F557NSv4fGAE2ytyXU57Njy5tOD8ud1TEag/lrWUWwIduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from DM6PR15MB3547.namprd15.prod.outlook.com (2603:10b6:5:1ff::32)
 by BN7PR15MB2290.namprd15.prod.outlook.com (2603:10b6:406:82::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 23:04:45 +0000
Received: from DM6PR15MB3547.namprd15.prod.outlook.com
 ([fe80::d819:c439:c4e0:9f7b]) by DM6PR15MB3547.namprd15.prod.outlook.com
 ([fe80::d819:c439:c4e0:9f7b%5]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 23:04:44 +0000
From: Iris Chen <irischenlj@fb.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, Peter Delevoryas
 <peter@pjd.dev>
CC: Peter Delevoryas <pdel@fb.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "alistair@alistair23.me"
 <alistair@alistair23.me>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "dz4list@gmail.com" <dz4list@gmail.com>
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Thread-Topic: [RFC 0/3] Add Generic SPI GPIO model
Thread-Index: AQHYotkNGdgEJUtF6k2sE4dbYssc9q2VV8SAgAIWdd+AAA1aAIAENgeAgACQ5dY=
Date: Tue, 2 Aug 2022 23:04:44 +0000
Message-ID: <DM6PR15MB3547511E94901A7B53F46A02B69D9@DM6PR15MB3547.namprd15.prod.outlook.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
 <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
 <YuWrbJglNYdGOmUh@pdel-mbp.dhcp.thefacebook.com>
 <2f7f05aa-6aa2-970e-b4ab-bfbed80b381b@kaod.org>
In-Reply-To: <2f7f05aa-6aa2-970e-b4ab-bfbed80b381b@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eef657b0-e395-4d3b-6163-08da74db63dc
x-ms-traffictypediagnostic: BN7PR15MB2290:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LyxEoHI3j73zuB1sZlJ3PT82M/DT2IhjotGKMdsTVsEA1yobgInK3cbSLslkNUZaaOmC5Dp24MmuUeKnTRCoNegn9RK/QRUOXGveE9e//zscSNlgXkZjh2JLAsanSBw0uro5k4ImwlBOKyL/gcqFofWhtR24yzigdHH+bTV9ACP+9W7ZM4xxQsl2ADe64oXmS7JZPM1RDShhXCWlNktwzIErPsvsFaYM+bO+GF9+HT5glKv7FC0BZVTn9JGtzzsmXDsFkCa7vlLlgxB5UbsD5YPj/UsjSwvez5eI1nrYb7rCbC7N9GbU1bvHFyrWtMSm/CyUgM1UlXWm5F7O/kfi/HhpSzg6Cao9NJDPuW6W2bqFNeXQpEJX+3rI9LEaNLTX6PtRTPBHgYEPJYoV7fUuS9qSzOQBiLO7Ax4I41JHhwD+C2/vPRn82RHNOzqia8c5kJseqLNFsEnlbeAFgmXYYjVRmgPcu50hL5a/VzbFpwXz/RmlOWpxg2EBQbkAlNhJIY+UQ1j0IefaLWRWxtiM22J1rdJ9AXJyU8bmeyuzJs1QegV8qatAr5d7lnsJBX8lsfk9c9FA/vUeqiLqbjZMnfopSzSj7tJfWdO5UVNCuRGNsXFzsTnVLxVOm0+UmRBvuFBgSwSs4vH4YbighRCBymTEtvJKhZfUX/HXMO3ugHOfLILLJl7zED2lEhV17CkntXicd1ag44KW6jD90SY4WblzwjJyUK9kl3Clcx4rPAFTdjmObsXThIokiXP7wwirS125LPdSJeIAl2VXcInaXgEp3AVQvyhuxL6K4f0QWsbm/kvQ272+gAiAbHmqYeSE+YicVYGXhOxeykSRmC3SJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR15MB3547.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(6506007)(7696005)(41300700001)(9686003)(558084003)(316002)(55016003)(478600001)(54906003)(110136005)(86362001)(71200400001)(122000001)(38070700005)(38100700002)(186003)(91956017)(2906002)(8936002)(7416002)(66446008)(66556008)(76116006)(66476007)(64756008)(33656002)(66946007)(52536014)(8676002)(5660300002)(4326008)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ofr3Zt+P02sh97lup8Ikviei+nn6XUgJr02SboiA60HCAKARkSCGQNJhFQ?=
 =?iso-8859-1?Q?2K55JmS/wSap5EQbfJ5Zqw9KV6M+r2FhJbwQSNiNeA6oTp5lolXdL4TGaC?=
 =?iso-8859-1?Q?rIfA/0+Qy+4RQSgp7jbbehCWirgOKN4GyTFizFyztaJXUDpFtFiRwwMrdB?=
 =?iso-8859-1?Q?8GSiBKnnLM1vB+QoW9ykYI1ij23D94TXKCYT0YcvlsZ/Xuj9iuepd9oPlA?=
 =?iso-8859-1?Q?3Bij94SILTt47mYYNFylQs2CTgA0Z0+ul5dogVIIpJzjvpFe8lypDnGRHy?=
 =?iso-8859-1?Q?ZhBKp71SzqOAuev5gBmsGpA5vW2m3fJCnCGTY0Ye/XmyJ4yBqPTQKMirBy?=
 =?iso-8859-1?Q?ai2rpLvtv2wFbYE0H1h3r5LBqN5BFXyZyXVH6AOe6DnXCX3N9AiJdYZobq?=
 =?iso-8859-1?Q?rDk5vXivRxwQHwIfxa7ljw38I8d0jD0izcXFhpxf56Xbqy+cn5VxZ8Nbzq?=
 =?iso-8859-1?Q?P6TOQ9WS/5li+lFR3vKuNfTeYEKns+2+PZDcw6Bz6796FVK7gOmLFnuk6V?=
 =?iso-8859-1?Q?VSZvjTkJC+/cUZ5adazalqriFvCP/cxoZITKVeVhgTbnI/FI1WOKSGwq5O?=
 =?iso-8859-1?Q?AbAhBVc0nq1H7nniMgo3lUrAgGEByw+RroP4oI2SyPOBZtM+ox9Yy2u+1c?=
 =?iso-8859-1?Q?eUpbQXlOUTPIcn3kiAiaF/p1PwSmT1ZEsnwRiGvEmDfqTZEWpZ+fhrm1J6?=
 =?iso-8859-1?Q?s8Hd7NFLrgDK3dxdGZ+QqiQb2oijnk6zovzifEX1u2LPFqPmLm2NYgP0LC?=
 =?iso-8859-1?Q?nz6uwsnk98GovC+fDtvCFu/6/NZ0EXvV1yhukx/dN/meCILTdMBLRgcPwe?=
 =?iso-8859-1?Q?cShn3XYXqI8H0kl4gv2HobHHOrcR4rvZVbA39u4jEAkortAdky7xDbb6mS?=
 =?iso-8859-1?Q?Rd7TD+bExYcHkvTny/FWJy6tTPxpAL2ENsArSgCHjRyM6TIQ9RxnWXK2Dl?=
 =?iso-8859-1?Q?YagpPrnLxrmxBB8VGBsfywGzkNpJlI/JcZOb722dlNVFWEGQ3yQSO4SwO7?=
 =?iso-8859-1?Q?/AD0M4wfpF9vuok6LdEJP+ctGZQaeOyL57TJaVTggb815wr42URPKobmXH?=
 =?iso-8859-1?Q?ru4V3DA5JfO5tIywbZPZ2UWIBXKzCMdP/TPquOJXt9VpM278q1b2pt1KtM?=
 =?iso-8859-1?Q?Fc/OWgSRHIVbmcn5MHEtp1hvkDKleKlZ7PP/kIY57rJ7oA81lwoh0+2mTS?=
 =?iso-8859-1?Q?mWPik/F/krMo7nk4Fboz2jp1yWCrZnmo/NZe1eENNmxzC43PbveiSLo+QD?=
 =?iso-8859-1?Q?8wl744QiUS8DRyv5u/vV/BvTbGo/OzJ2j4oYyJj0m0rHRH2z1ihsBdD7MT?=
 =?iso-8859-1?Q?3l7TenE4cbwBBsLUFHD8gwWnmNsA9h71d63+6tU0KypxpVHAeIpO9U2eLM?=
 =?iso-8859-1?Q?vXQ5vJ+FZUEFpK3dlFYKgMz7MeBfAV7PDsDQJ9xewX4fmtCuqx+nZdJRPN?=
 =?iso-8859-1?Q?VEZ9nNPDv/4NciFDir0/fW/h6+XKc+tolGiBzzazVy0E5phiSMrttLZbxA?=
 =?iso-8859-1?Q?TnATfutSGAdUkj+5WRAemqQ/N5SMmFLib5ua4TRj4iPgDzKPk0S0uXE78I?=
 =?iso-8859-1?Q?zmk5uJLr1tDvMIAVh96wKIC1VBEVgDawZdzpmObNZ5tck0u3hzzy1zAPUA?=
 =?iso-8859-1?Q?gLXdgkrIXSoVOyeicjVaRUFAMHctAzxbOS3AHy5UfxupvUnQw0pJoC0Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB3547.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef657b0-e395-4d3b-6163-08da74db63dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 23:04:44.8081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 12XCxQ0Z9+fB7P9O4qn+PV1yraPr6NdwtmFZm6hBR4Cwe64RCLWgEr6dAk+xZ7PMXaZVylrj2FN1xasaOVEXWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR15MB2290
X-Proofpoint-ORIG-GUID: AwToj4TiIblxk_IxZ3c-KM39X3fcf099
X-Proofpoint-GUID: AwToj4TiIblxk_IxZ3c-KM39X3fcf099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_14,2022-08-02_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9213ef72d3=irischenlj@fb.com;
 helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Thanks everyone for the insightful feedback! This is really helpful for me.=
 =0A=
=0A=
I am taking a look at all the comments now and will investigate into it. =
=0A=
=0A=
Best, =0A=
Iris =

