Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB7E6161CA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqBvC-0008NL-FA; Wed, 02 Nov 2022 07:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oqBvA-0008N4-5N
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:28:36 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oqBv6-0007FB-GK
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:28:35 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A2BCLoS026781; Wed, 2 Nov 2022 04:28:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jgqajTAyjCboB6gxFoH/IaZXfaUK1ZL2K+jm0ecZ4YM=;
 b=HL0PJ8YUq6IYYTT0ArbB9ZMu8XrPYAqSKmqP161teO+1XJsrcWmG2i9/iVeU5eaQdY2H
 WdYrSxF41R2PNwyOuX7GDg3Il1oS2epI8lRb2HJ73dwL6gB4C9HSKWZzTul0TbL6NEyQ
 fgzCTqrTe0PilgfKtqFHNDBOmqKe+rEVhfg0p0iPls435zVIXiFdgxzAlv0GroSzSVJP
 XXG3VHwzI2UMKErsYERX1iehUiDZVuO6hBxJprW4P6y0e2ptSc0TzMWyNwQsH+f2tNcB
 GUGTPKdWVLGDEugmpYx9RJfcmGhLrjYBhvw7XPE0C50ZHEFVbXGfHYlBHqVnG5NAJpiE qA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kh3pkk4dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 04:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byf5vGpfjv00Y3ml/KZB4YPmcNs1X2bWpRpwYS+crcpxQcLXJR+3lqhCVyuqJD2fjkBh1p6KLktAXNcYbwO5y3D1f/EA2/YC9jhvV3llzS5+MacIvzDQIKa46mpqjviMyccx2o5TParRWd9vs9EfDyeYqZyjw3rh6YTIcSuenhRcPCfBUZG84SFH9Z97FIoqr0dLTE5S53FBeK5r+I4jqA1SZWcjlej0wcN03sNAklB/Z6jwY2FZFkCD5JnuOiUpZaXCfGgmbS1C+ZE5cFqGwPWc2Xe9M2eixyhZBeV/X+KVfk9BPr66xInXLa5rvRm147IQbWd69yuZEGuDacDYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgqajTAyjCboB6gxFoH/IaZXfaUK1ZL2K+jm0ecZ4YM=;
 b=feSsFTHebjdmIHej9qAY1w3G/fEaBLJaRIg6ZY+KOJ0haY/m8NidjMEVhGKrEYWbfnkw+WsEKgGDuPX5mnMx3WsfVJg7n0Qy3V9JmNibFzJt8t0blIvoJDvhEdYwPUJDl54F8ds8yLIpQ9RMQtXUeuMS66F5KcaubrYJxV5TCT8G/qV8YmpLJXfpFb38TDWyQM6jCd6NWP/GvqqoP2n+YjMM771pJin7Kixfxh5MQqLLLi8hiiKITiqotqP9H28wMH6pvABOfKxKIhaHd7PDIfirgyDMVSWH/ubADN2xkiDQ24E02lYG/cjvncUNmRBhpRlXKGiV7JEeghjLAM+ODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4171.namprd11.prod.outlook.com (2603:10b6:5:191::28)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 11:28:08 +0000
Received: from DM6PR11MB4171.namprd11.prod.outlook.com
 ([fe80::c266:5a05:5a00:c0c0]) by DM6PR11MB4171.namprd11.prod.outlook.com
 ([fe80::c266:5a05:5a00:c0c0%7]) with mapi id 15.20.5791.022; Wed, 2 Nov 2022
 11:28:08 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Topic: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Index: AQHY52VDD1diQUGNL0SdrAxpW0VmJ64qLXcAgAAMX0CAAAIMYIAAMxAAgACQ/iCAAIdpAIAAAF6A
Date: Wed, 2 Nov 2022 11:28:08 +0000
Message-ID: <DM6PR11MB4171DB9E7C848BD9A0465EACEF399@DM6PR11MB4171.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <3897101.9jAPQrlFHr@silver>
 <MN2PR11MB417324B0200E8841884C5C2AEF399@MN2PR11MB4173.namprd11.prod.outlook.com>
 <4078234.fJnRZ6glpc@silver>
In-Reply-To: <4078234.fJnRZ6glpc@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4171:EE_|PH7PR11MB6794:EE_
x-ms-office365-filtering-correlation-id: f9b1b3cf-54c8-4a19-d9da-08dabcc55126
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w0atGkYLudBTdILV9PvqVV5rBx3GhcMk5Tdru7pxTzZ5K1CWYF77fSqElZ5MTpTIB47CXBP/gycL8U7M9kHgvZwcZ/aK4YBMJD/bgr0xnnpP7f1m2m2PkwA4cdO1T9dSTHnyclgRM24EQlyAtqpYuAIxYSGsnnFAH5WgLfjtHtuu9z04svxkngNLYWcfrT8mXcSa5nB0i+RIA6L4ubbPwe5wo1pBQsrWC3yGwmMCqznmCg12P2s1SDjgxQliNjGJWFUPzAssCZm3CwE5BsRY3d+kIEgK0Ig5YYSzo1SkEdrjwMz8tjMloS+fZjjwjDjvgEDYzcbUK7wGXkBt+yOqPdXvzrOdWT/lQwQiJkc54seKQ+3H+8FMD/04+cLcAz+anQwqzmkZqeCXBwPObfRobfHxP89BSAZfdyDszWmfTAEjhKKICUi7xC+wztvPRG2+DfQBgLMVEnfYixrbI1WlVyXk/xrTCQEwxZrRCK4Y1PgR/No7QX7zi+cRCEwnuYKpRH1u1eLIXDbZioDOFazPSga4b6XTQC7eSW7/iujNkldfDddDq+y57E491IS0LnKJRc/a1WQfI2/o/REF7D7womKpq6+u9xOcDnwpI5D8au5W4kN1Zp2oHqaszIzuXb4ghejDB7ftVE5IgvcxLp9YMDA8C/qawJNfWgq9a4f2W79k+zlhbvMPyBtVQUlGSPUflaBAZKmoDq7ZitmJeNX77k3XatYtw8Xo0JxZinNAtIeoCT+C1ZMdDgwb8ADfQY459S+0vjmsgp3vuW17bkQcKJsQKV9utWvIvAw5k9XAtqk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4171.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39850400004)(366004)(396003)(376002)(136003)(451199015)(26005)(66476007)(38070700005)(55016003)(38100700002)(33656002)(9686003)(4326008)(41300700001)(53546011)(8676002)(6506007)(7696005)(71200400001)(8936002)(64756008)(5660300002)(66446008)(186003)(66556008)(478600001)(66946007)(122000001)(110136005)(54906003)(316002)(52536014)(76116006)(107886003)(2906002)(86362001)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X5bwTaCUZzut3at2Cf6wdY5bbYkT/fVOYyx8CIPWz1CWgUGenEpY/h+Xs6B6?=
 =?us-ascii?Q?R3UXHb3KwOI+BuPcoD2L8l03nuUDoA8B8yNdcJ0nNhuc7lelvC4TdALL/6ya?=
 =?us-ascii?Q?XNm64XKks+nUXxt2qzyv61RPwZd+W4CdNuvktCI9Ms173uOpf7ISpCRjySzv?=
 =?us-ascii?Q?IakZ3vD+jJLHKfq60LZbNTef2ESHy18Gm8nhZ3iFox23IhHXLMKQwL4X5zsm?=
 =?us-ascii?Q?fR4pD9cucJ3N+NfZQSN0g1z4kQgrP15RnZ/IJQp/A82HHBRJAvhe07AQQSVG?=
 =?us-ascii?Q?YkXwQ639um/bq60Y59X5OOxTnCtVEel/zXs/yQQH/vnrX6q5GdpBmNon8ma2?=
 =?us-ascii?Q?ng3BL+x/eKC6Q688hRqyS7lJO0rHwINk4EO3jGnDMqfuma0p7eunIrTok8WP?=
 =?us-ascii?Q?f615GJQhRNt+eiuqdXU3Q0tNL1h8lulawhsdl3NpLkWex4jb5wZGuaHsjh7P?=
 =?us-ascii?Q?vbdtNnDrXrdKX3GmUSKvqdFjq1X9Kx83VHyR2izBpzVhnvzIEvib8ZRw/zHn?=
 =?us-ascii?Q?dLoxTAF8ImbSNYgEL9HgEVmh81ioKm5xIpHplIGwaWnl5oW4tx3aUNA75cUG?=
 =?us-ascii?Q?Q93ml/xsnBPnR7ejUFTsXhXpY+IuAWBljy9GIXgNpS92O15PgRjSaUNJh//R?=
 =?us-ascii?Q?FNqtr4dnAfyVRuNwwm0cPf8v/yoQB9DecLRmjEAn4u45daNbrZFZyajd8JXS?=
 =?us-ascii?Q?0G6XfyFieKlP7KVNfOdrP5ohOBYqmnk93Ez8mhVK0OpVMmaQGYHVkyHcRwzx?=
 =?us-ascii?Q?uWCpcLtGR2IH6flEH2NkKF58r4PKnFIU7xMEwpg+8P2beBjVQlTBxddTM4T5?=
 =?us-ascii?Q?HidO6W8/fzzIgei7vZtOJgBzQZ3sffLDCuUfJ3Uo/Ys7ZqItZ9B1Io23ULN1?=
 =?us-ascii?Q?Alaw80LdLMjiGKYeMBf0F7oJKsAd7KfzHWU4GbwhzJ/5yZa3lhGhjy8WExTK?=
 =?us-ascii?Q?UErNp56CMdE6/3i9kIe0JRBe4cuvobTltYh1365gFosrZqc2i3DWv77Sq20i?=
 =?us-ascii?Q?j78u7rChgkSJkDip0d7SizzqmVEHsMFfv5VaHv93EnpOZNOx+UsxYFuYKkyL?=
 =?us-ascii?Q?Aunvj/AX1hCkEb3jS+DrDnBqWl9c7lxQudLapCPha8Rnm3QPctEX10O3JX6w?=
 =?us-ascii?Q?T/2Sub9xVAldJOdu8o5VBkuPVkAp1cIS3T9YOw1UHfi+9zUiB53Tmll6F9L4?=
 =?us-ascii?Q?v7A3gogVDt5OlF3/sAlBZcXNup4EyX9JTJpTBrFkW68xqNoj59SwE/ZqR8he?=
 =?us-ascii?Q?IR51vg/gGVVvmvCOlr/Z0yiFf1e3S2JMwti7D/5cOXvUcs9K/VkjYZ5Qx1PM?=
 =?us-ascii?Q?hlvsocqnZ7b4EvZLnsrnD63y6pQN0ZqCBZVdvTIte1Icii/wz3v6Oe8heN24?=
 =?us-ascii?Q?O6/DN+hCViZoIbCbh63Z/DaE1grA75ieG3L4utudKmgmHa7bH3j5I+7fDNem?=
 =?us-ascii?Q?6Ri7e47qqtnHUEvpfIdziLnn+0NOYxgM6RstCydoAM93X3ibtgPh9zr0jka9?=
 =?us-ascii?Q?/pUavS7lfuFLOiGBqsJQ45G/vSmSWjTQIO2WEeazd8RyziFTpUOOK6npZDGg?=
 =?us-ascii?Q?ZioahAqvx2rxnipOB4fSFc5luBGlOp6fogFZQ7/C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4171.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b1b3cf-54c8-4a19-d9da-08dabcc55126
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 11:28:08.2113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/YSTI1XTr+Mwzkf5rFs8eOHvnMw/mDiH5uUq3sH6qNX0kUOH+FstAyafju2NyjE15226Pkxt4OkEeeqs+Rs/1dDFj2u6U0+FERWhXJgG2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-Proofpoint-ORIG-GUID: RIwr59TUuD7N-RFPi6X1c4nt9UowFOsA
X-Proofpoint-GUID: RIwr59TUuD7N-RFPi6X1c4nt9UowFOsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_08,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=567 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020069
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83056df09e=guohuai.shi@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Wednesday, November 2, 2022 19:06
> To: qemu-devel@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>; Shi,
> Guohuai <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
> functions for 9pfs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Wednesday, November 2, 2022 4:07:35 AM CET Shi, Guohuai wrote:
> >
> > > -----Original Message-----
> > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Sent: Wednesday, November 2, 2022 02:22
> > > To: qemu-devel@nongnu.org
> > > Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>;
> > > Shi, Guohuai <Guohuai.Shi@windriver.com>
> > > Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific
> > > utilities functions for 9pfs
> > >
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > >
> > > On Tuesday, November 1, 2022 4:20:53 PM CET Shi, Guohuai wrote:
> > > >
> > > [...]
> > > > > > > Windows POSIX API and MinGW library do not provide the
> > > > > > > NO_FOLLOW flag, and do not allow opening a directory by
> > > > > > > POSIX open(). This causes all
> > > > > > > xxx_at() functions cannot work directly. However, we can
> > > > > > > provide Windows handle based functions to emulate xxx_at()
> functions (e.g.:
> > > > > > > openat_win32, utimensat_win32, etc.).
> > > > > > >
> > > > > > > Windows does not support extended attributes. 9pfs for
> > > > > > > Windows uses NTFS ADS (Alternate Data Streams) to emulate
> > > > > > > extended
> > > attributes.
> > > > > > >
> > > > > > > Windows does not provide POSIX compatible readlink(), and
> > > > > > > symbolic link feature in 9pfs will be disabled on Windows.
> > > > > >
> > > > > > Wouldn't it be more user friendly if the relevant error
> > > > > > locations would use something like error_report_once() and
> > > > > > suggesting to enable
> > > > > > mapped(-xattr) to make 9p symlinks on guest working if desired
> > > > > > by the
> > > user?
> > > > > >
> > > > > > Probably this error case would need to wrapped into a
> > > > > > dedicated function, otherwise I guess error_report_once()
> > > > > > would fire several times by different callers.
> > > > > >
> > > > >
> > > > > Windows (MinGW) does not only support symlink, but also does not
> > > > > have symlink definitions.
> > > > > Windows does not support symlink flags S_IFLNK.
> > > > >
> > > > > So even I add symlink support by mapped-xattr, the MinGW library
> > > > > does not have symlink flags and get a build error.
> > > > > And this flags is defined by Windows header files.
> > > > > The impact of adding a new flags to an pre-defined structure
> > > > > (struct
> > > > > stat) is unknown.
> > > > >
> > > > > So I think it is not a good idea to do that.
> > > >
> > > > Because Windows does not support symlink, so error_report_once()
> > > > and report
> > > it to user will be OK.
> > > > But mapped-xattr could not work.
> > >
> > > Showing an error makes sense for "passthrough" security model, but
> > > not for the "mapped" one.
> > >
> > > Just to avoid misapprehensions: are you aware that there is already
> > > a system- agnostic implementation for symlinks if "mapped" is used?
> > >
> > > When mapped security model is enabled, then creating symlinks on
> > > guest will simply create a corresponding *regular* file on host and
> > > the content of that regular file on host is the pointing path as raw
> > > string. Additionally the symlink flag is added to "virtfs.mode"
> > > xattr to mark that regular file as a symlink, a virtual one that is.
> > > So this does not require any support for symlinks by either the
> underlying host file system, nor by host OS.
> > >
> > > Likewise interpreting and walking those virtual symlinks in "mapped"
> > > mode is also implemented in the local fs driver already.
> >
> > Yes, symlink can be supported by "mapped" mode.
> > I mean that MinGW does not provide symlink mode flags "S_IFLNK" and som=
e
> other related functions and defines.
> > You can check with "9p.c": S_ISLNK, S_ISSOCK and S_ISFIFO are not valid=
 on
> Windows (MinGW) host.
> > So even I enabled symlink supported by "mapped" mode on local-agent cod=
e,
> "9p.c" can not be built.
> >
> > So I disabled symlink totally, because MinGW interface does not support=
 it.
> >
> > To resolve this issue, MinGW should add the missing defines at first.
>=20
> And what's wrong with something like the following?
>=20
> #ifdef CONFIG_WIN32
> ...
> #ifndef S_ISLNK
> #define S_ISLNK(x) ...
> #endif
> ...
> #endif
>=20

It is OK to add this just for current solution.
My concern is:
mode_t is a 16-bit value which store permission value in lower 12-bit and f=
ile type in higher 4-bit.
Windows does not document the other value for file type defines:

// from MS SDK header file:

#define _S_IFMT   0xF000 // File type mask
#define _S_IFDIR  0x4000 // Directory
#define _S_IFCHR  0x2000 // Character special
#define _S_IFIFO  0x1000 // Pipe
#define _S_IFREG  0x8000 // Regular

If we add a new type, is it a risk that the un-document value may be used b=
y Windows internally and cause some compatible issue?
Or if Windows use this some values in the future cause conflict?

Thanks
Guohuai

> Best regards,
> Christian Schoenebeck
>=20


