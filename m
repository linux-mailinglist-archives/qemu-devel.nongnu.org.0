Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD46615959
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 04:09:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq46t-0001kg-N3; Tue, 01 Nov 2022 23:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oq46p-0001kA-Tx
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 23:08:07 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oq46m-0000Qz-Aj
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 23:08:07 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A20HQMd003602; Tue, 1 Nov 2022 20:07:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jPmJ+LNP1rsZrPsWTtZ5S3FzD8HzLLXJxwOMGE+yPKo=;
 b=VZ/SrS9XBeBUV4w0edK7z237v8WjrmwwlrkPntO8/aLr5LcJyRoVCUdXJ6aHdgKyYl5e
 qkbdq6qZmR3gWKNIXhzD7LmUABbI1FzrwQ8gVicpIURlnD10nzfVlDAdFU6dzAue4vIy
 3BJUjCQMkBTQESQojs/5LLjr6enwFJ0jg7zYdCIKZ+wGuj3mvUryGLJroEQ4PYGBggn4
 kT1VcjNbYjnqthB51nUhme0Ee7nufuwpQZv47/GIVtBn20hpi6a6wczepltXKRPHf06B
 0pDQgngTYXXq5m1pHW88QnthdMnRWoECTugsyh1Rw51Q9VlgiqucoQojayVxpYjTZVjo wA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gs9yxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 20:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP4er0EMrzYiVjSt91LMeld8GviociLv2AANWfY2vKzKx+/NzoejSJPDSqVhA6zxkFibzXjX5r1fCZ1djuhigi8bG1Uz2sR/dPwhDfr3f5Z3OIV6+UwOZE8bBHZshOpr8d4Zrr+lB5POExAVFC3gThhbwQ6fu7WQUArBiaINPH4XQXh0Ho7C2RP8AiVU9OIpuOVHbcVEClt0ZLgnDDkB6oxWMppEIkrhvmkZYhHLxwruujf8QkXsnXcYckEYJntrrBPn59EoUQ0Y0cxEYoDCMXiOPJuijAKNacyP+aYoIim2c5Nfy3QgVwzhMFbWokIuPc0gK5JO1wwZ9TjE8Sqcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPmJ+LNP1rsZrPsWTtZ5S3FzD8HzLLXJxwOMGE+yPKo=;
 b=fKOapHjdMBUXDK0iv0wTqMvaWe4k+bu+y5Udb3xeSxXN+8La3xUWAJacu7Y4aJYJKu/NbTjhoC8EXmwhzChUXEqWNVbq15Y4u785efRUHriMbcRZAOYAFlUPaUel+gKeKc/OEmB38nkVRA95Kiej0hbbMoY8hSna0Hj5n3rsZkytfMh6YUQIuWMrH0aiB+MH5Gm6eW9qGEb8TUC0/0SGD1Hh8tHkLOL9rOmmPimEQEcZnqcRdVGqTAeAcmrU7rpOvdaR3hVtvbabpqwKQvNIZsr9vCIs+R21dRYmBRGwNDEajjtUh9H/pcT0vXl6dz2XaAEFmP2MXUhr0mfQuka8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by SJ0PR11MB4941.namprd11.prod.outlook.com (2603:10b6:a03:2d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 03:07:36 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a%4]) with mapi id 15.20.5769.019; Wed, 2 Nov 2022
 03:07:35 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Topic: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Index: AQHY52VDD1diQUGNL0SdrAxpW0VmJ64qLXcAgAAMX0CAAAIMYIAAMxAAgACQ/iA=
Date: Wed, 2 Nov 2022 03:07:35 +0000
Message-ID: <MN2PR11MB417324B0200E8841884C5C2AEF399@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <MN2PR11MB4173701AB6DB44A06CEDC2F2EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
 <MN2PR11MB41739F85097B0DDA663F3436EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
 <3897101.9jAPQrlFHr@silver>
In-Reply-To: <3897101.9jAPQrlFHr@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|SJ0PR11MB4941:EE_
x-ms-office365-filtering-correlation-id: c421cf04-96bd-4081-edba-08dabc7f646a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fMSt4KgNZmggbu1D0S1hbFDRg6z//YRNIqt4MAWzKnGmXWS/a+c2gmHVjTeS68pKVg+d1moBhX3os8uyHVypvkTqZjk78bZGxs+WrftjMQiiOJcyK1SOYnjNLhvorjFeJWBcIyTTJGp984GYkNnlSQzgg2kNpAl86tpiyG8tXAL5LCIgK6nP/ahQAxE+RBoA97vj8I5iGo3gEuNwXBV9nl5eDkIGVEY08kFbAQ1ydHdUkv5DS8I3AMw4N5GE/9yw442qwamzpoj0qkJau1YDVcgT/dAXAWkD5Naw6VhcyCDRZCI+JF51GhCdBRha8d7g7MmUutUXVbB/azSCLC+6UWdFtujI6+qiTece5AAaZFy58UcrTGVsZSWIXWYHCw8XiRd50Eml834bsPvK5nNjfUeMAo8hb0YfKu3cRv2uyIgc2+u+v8uwBhCA/0i4/oa4OWURSB8ynF4vEHVNIC0KhmiN/r2cUpZKJuZlKAOLdCLtGgFwm+GJcKGBRq+k38K93snSvijrDoSXeIEH5yo1rHdTyeVKNngKNW34Wb5oSWnGO2m7hweYlS/BBcSfrI6pZYX4ybwsTMB9F3JmUdDUZrYiGE1OZsgwdeMRNzdcPp30mT5H6gu9ZiBrXnO/VqtbHW+OrCYCKRT44NBbG8cvQ/x+JwpVRFlppGGvPvppvxGXiNzHioOwhDcDzbboW5/AISA1Ao/74asHjRISuplXNqL7e/WLday7VApLrF7MeCc2chGE+siFRavPU0lgKErOSscBCgpI0LRTTQKl0eTktYYMXv5s5OsP69Ed+oIujQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(39850400004)(376002)(136003)(451199015)(76116006)(66946007)(64756008)(8676002)(66556008)(66476007)(66446008)(4326008)(41300700001)(54906003)(110136005)(316002)(5660300002)(478600001)(71200400001)(26005)(53546011)(9686003)(2906002)(6506007)(55016003)(7696005)(52536014)(8936002)(107886003)(33656002)(86362001)(83380400001)(122000001)(38070700005)(38100700002)(186003)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gGSLpoR89vXiRXcMH+1Yfjp/y+213xYD15Jmpdqg3kyHnGD/yVHIxi3PKZDn?=
 =?us-ascii?Q?WarJ/HvnA5iuHs/WFev+B68ZCPqb6jYaDQx/nqjGkND4VglrpEhaK/1UeQqa?=
 =?us-ascii?Q?pOURAb+oBMENbqP7Qu3nvxqybB5q1E5KWxyOruvtFVw1ciyQSM1c9F7tMWUt?=
 =?us-ascii?Q?dwdFtOiSIZtVGRHiq+DY7X3ZQfTyug1cGTVr3EMqlnnLKOjfw+AonRn6awdv?=
 =?us-ascii?Q?+w3hzLk/4DJ0G4F+xEoi1B7KzHa+lf77yXwBpj565HsOkZrSwVtORbVmXGdP?=
 =?us-ascii?Q?0BQMnd9N3474WhVmzqNrY7s//rMLndAAvX5h/ffxATToPLIAbN7IJMbUUAPJ?=
 =?us-ascii?Q?rSRGt0yiyw4lqgvyA98WwDlNmfz4Clm68ZnUUaT33DpisDop7ty8l1XJvTkZ?=
 =?us-ascii?Q?VL5uRiDHBFS7CvV1AErhm8j5whNFJ0NeM3p0LY8NZQzkVPozHICpfkESWZYs?=
 =?us-ascii?Q?KR1UbjG8Afp4To1r6TnBxVSg+ZyetWGADgEAM3Xq2oVEm2QEWKvS+1tQ+oM+?=
 =?us-ascii?Q?T5hqDfZK5qEJXg+uGKLH/krODAFLwqHobnegktGbjDzmdvlR3VWHY0/cNXlb?=
 =?us-ascii?Q?Z5wY356lPKdSsKIg6KbOKMRe0DNkFLSlXiAP8EpPfdc0OIrxbUUMj1EmljxC?=
 =?us-ascii?Q?Crr40WUeU5YUXQZhynonrgzrhpK3X2AvNrAAlqmq0zmGNYhgYJdMsR8IiDiU?=
 =?us-ascii?Q?aDbsyNE90ju1dJQ95ZqW6MK0uqtbwlmzO6w/fdQTBipGBfmJ93ftcL8f2KUj?=
 =?us-ascii?Q?UB9c8ODyIwF2SoHGtTOktFAmpIuZ9BNmfObLEaYaHr4fBBSpl4oJ8hoWjCgp?=
 =?us-ascii?Q?EyNRjLt6aPlUJYPwT6Ew4UDahbA/7U7GxUNpTjC2u3OjiucMdBah/1h5A6Ej?=
 =?us-ascii?Q?tcy8kn3DeC6mVd7T2DNONSQY+YLIPw/5LaPN669JDILdXtpiSsKDAyPKWxl1?=
 =?us-ascii?Q?X4OBeKkNl6x/z0e5ULyf1naDWYPJ5KmUBO5krO7rPLXXdZzXi1+95JhGXTmg?=
 =?us-ascii?Q?ieMtVgfxvrOTM1ji7NPeFFZ4nkCziK65vH42gzx2a+wDZ1FSyXliSUkqPFcm?=
 =?us-ascii?Q?NpkZVTPFTaVCXOc06DEliGnlKE7d/SX3xnCimSTOwPm8m4Ea1TAjNB0ss2OE?=
 =?us-ascii?Q?r0jRQgLOiBTnm49quUFfxMlbNa+h/P7gd745msuHfZiFHg7EcItGf2rzpl0s?=
 =?us-ascii?Q?w2PvjdEKHciRH1hVWUe551CGwUV4Ce9UIwuyBye8m0XhMSKCDgcm0c16yRvB?=
 =?us-ascii?Q?0NYumIC+IaHk+/zDL172pphTzbilaBx9zommI03E4aL9ah78BfvBMU11VbGD?=
 =?us-ascii?Q?fCc+vDpoS333hMGpzNXqNAay79rH1F3q09u18ZalYMNXFXuyIFOJ13OPsX66?=
 =?us-ascii?Q?K3ZWfx9fVvh+w4a95VOL2W+lOYWnc5fzov1W2C62lE9DrBxRIWBVOIIlzzc/?=
 =?us-ascii?Q?MBZyepsDsO8iZFMhG10MQAUO3B/mqx1bUk9h1fHVBDXL1vlc7C+bYcSlGYEY?=
 =?us-ascii?Q?IV9WKjrLlm+oShSQW1xpYavnxUlfjNXFbyaw0fLPhewaF0inJUYZxOuobb3L?=
 =?us-ascii?Q?KubJeGiJgcNzxc/H2H4EB9IoNxdw2bpkab7+W5P20KPZ3KRIuGjGGBl2OtBt?=
 =?us-ascii?Q?VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c421cf04-96bd-4081-edba-08dabc7f646a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 03:07:35.7319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxnLJk4gBEaNDorvsNiSJeXz4Z+og0UAkz41aTzQzIK8Rsx9KnOcdtEaqMRdmOUtAYOvatw+rQpCvkuo3MpAAbYmdmCm/nQFBfi9rg4W7QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4941
X-Proofpoint-GUID: _Gf4GEleGW6cLvNsNik887d6KY76P8jP
X-Proofpoint-ORIG-GUID: _Gf4GEleGW6cLvNsNik887d6KY76P8jP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_12,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=327 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020017
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
> Sent: Wednesday, November 2, 2022 02:22
> To: qemu-devel@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>; Shi,
> Guohuai <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
> functions for 9pfs
>=20
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Tuesday, November 1, 2022 4:20:53 PM CET Shi, Guohuai wrote:
> >
> [...]
> > > > > Windows POSIX API and MinGW library do not provide the NO_FOLLOW
> > > > > flag, and do not allow opening a directory by POSIX open(). This
> > > > > causes all
> > > > > xxx_at() functions cannot work directly. However, we can provide
> > > > > Windows handle based functions to emulate xxx_at() functions (e.g=
.:
> > > > > openat_win32, utimensat_win32, etc.).
> > > > >
> > > > > Windows does not support extended attributes. 9pfs for Windows
> > > > > uses NTFS ADS (Alternate Data Streams) to emulate extended
> attributes.
> > > > >
> > > > > Windows does not provide POSIX compatible readlink(), and
> > > > > symbolic link feature in 9pfs will be disabled on Windows.
> > > >
> > > > Wouldn't it be more user friendly if the relevant error locations
> > > > would use something like error_report_once() and suggesting to
> > > > enable
> > > > mapped(-xattr) to make 9p symlinks on guest working if desired by t=
he
> user?
> > > >
> > > > Probably this error case would need to wrapped into a dedicated
> > > > function, otherwise I guess error_report_once() would fire several
> > > > times by different callers.
> > > >
> > >
> > > Windows (MinGW) does not only support symlink, but also does not
> > > have symlink definitions.
> > > Windows does not support symlink flags S_IFLNK.
> > >
> > > So even I add symlink support by mapped-xattr, the MinGW library
> > > does not have symlink flags and get a build error.
> > > And this flags is defined by Windows header files.
> > > The impact of adding a new flags to an pre-defined structure (struct
> > > stat) is unknown.
> > >
> > > So I think it is not a good idea to do that.
> >
> > Because Windows does not support symlink, so error_report_once() and re=
port
> it to user will be OK.
> > But mapped-xattr could not work.
>=20
> Showing an error makes sense for "passthrough" security model, but not fo=
r
> the "mapped" one.
>=20
> Just to avoid misapprehensions: are you aware that there is already a sys=
tem-
> agnostic implementation for symlinks if "mapped" is used?
>=20
> When mapped security model is enabled, then creating symlinks on guest wi=
ll
> simply create a corresponding *regular* file on host and the content of t=
hat
> regular file on host is the pointing path as raw string. Additionally the
> symlink flag is added to "virtfs.mode" xattr to mark that regular file as=
 a
> symlink, a virtual one that is. So this does not require any support for
> symlinks by either the underlying host file system, nor by host OS.
>=20
> Likewise interpreting and walking those virtual symlinks in "mapped" mode=
 is
> also implemented in the local fs driver already.

Yes, symlink can be supported by "mapped" mode.
I mean that MinGW does not provide symlink mode flags "S_IFLNK" and some ot=
her related functions and defines.
You can check with "9p.c": S_ISLNK, S_ISSOCK and S_ISFIFO are not valid on =
Windows (MinGW) host.
So even I enabled symlink supported by "mapped" mode on local-agent code, "=
9p.c" can not be built.

So I disabled symlink totally, because MinGW interface does not support it.

To resolve this issue, MinGW should add the missing defines at first.

>=20
> Best regards,
> Christian Schoenebeck
>=20


Thanks
Guohuai

