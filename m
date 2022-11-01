Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B6615039
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:12:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opt4v-0002la-TT; Tue, 01 Nov 2022 11:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8304fcac20=guohuai.shi@windriver.com>)
 id 1opt4s-0002lP-Od
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:21:22 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8304fcac20=guohuai.shi@windriver.com>)
 id 1opt4n-0005c5-57
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:21:22 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1EQPfD013952; Tue, 1 Nov 2022 15:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=WokyjQzxGUmNOTud5qlLTCxvxfGJ5IS/ZKt7TvXxjgY=;
 b=TtGg7+bAQzp5LelX5+uHQoZ6ZxdYddjDUMSP6Z/VfQ2LZPgupEZjglUVjZujFTfqm9TZ
 wd9biIbMU4CH0ZKbGkeeujuRYy28BJa3ChFlZSBoTD841ZBtQUpikvtiXAHSXEwugTNa
 CCu+NlH1rZhA2sjSVzAf28OXUrHidg8XGNT5sZCbdBLEzhgShzxyTFAF4Uky9J3xjWNC
 5z0GMXVSoP4sr35zTIka5+oLklXVHzfip6SutR8sGZA3hLH4HO7h8xGBbDU/S+pLaXY9
 vn8nFMp2RyynnujF1cRT3GkHIp0qnSmPH8JUVvxzxs0rzKwFNsBWtDoAtAygEL0Vsb5E mA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c2exa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 15:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1kDI4kGVOm4sh+grKrpbPncVvULxabYfh3QlqQ8M+CB8DL1Z5U3UZszYm4P/+tdDv+DTHfPYXh87hCfJEwOkSr6MoevjurlNazRT1v//otxJU4pLgqb5yAX/FQqAZwnlGkiTyYC6b8TgbhcUoPAwKmgxS+8gBhrs6/Uvf49czGFFb+SQBhs60/fsu5v4gmlk6GrJZq/zPdKVhm4yllr9LsUmQYOgjbDlSCzSHZ5bnQIzz4zIa/wtNyTQXhoj4yNGFsjR3skvbZEj68MEIb8GSYOQcg5BfgOZr5y1q9ITSUg8G6oY/ExcUOW+4VfDivnI3gWzsL7vXALO6nvF8eXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WokyjQzxGUmNOTud5qlLTCxvxfGJ5IS/ZKt7TvXxjgY=;
 b=OPgm4ur56g49jXIhCTaX2A0gNU6hRBAP86sMjQaTfih1TnS7v+U6L+6fFSFEaScZ2rpT/1fX5Ld6hFXw489/OBmCSiTKUrbg2AxAo+SDgnG6UeZ1+IeRfeCM0b0rnF4rl4fIO4Isu9WAy0hXLsEbPKJycpXx7yKV+AZUP+NDVpdIqSneHJ73nKh/lGn7+BORoaCxoV04pGBdcV5gXp9UW+Fl3ytoPd3Snjcpr//eZ9sSO02/GH1ChjxHg/krxkk6YoqARqp2s8C2KMCV0vtDwkLwV9X7r1KVydxs+octqIEEsWCboeDtFORn/fHYHiGKbhCFfZuUOjfJZD6UEeZ0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 15:20:53 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a%4]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 15:20:53 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Topic: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Index: AQHY52VDD1diQUGNL0SdrAxpW0VmJ64qLXcAgAAMX0CAAAIMYA==
Date: Tue, 1 Nov 2022 15:20:53 +0000
Message-ID: <MN2PR11MB41739F85097B0DDA663F3436EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <20221024045759.448014-8-bin.meng@windriver.com> <4607333.QMxLKKDKed@silver>
 <MN2PR11MB4173701AB6DB44A06CEDC2F2EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB4173701AB6DB44A06CEDC2F2EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|PH0PR11MB7523:EE_
x-ms-office365-filtering-correlation-id: 29ea3f7e-8c27-44bc-18d8-08dabc1caaa6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oOfRu608kJIxEKOomFgZDzFZt7eHzQdalsognUCcqXsiW94fNBiJ/n/zcLk7DdnDT3ZJk9bdEfraR4GCSrwzuqZToG2HhcDp1WnAsLbdLd4Ku7eZ1BlaYnslMwKVBo4cFBjidPCFNNFig/CzB6wQyOWl8Pa4ukJLJNA4r5Niee0OSi/lly6Nj9GxkVvnb4BVZHUyBKL7tTbP0hcflZ5BigigXg3AfQpHYSQng+h5rsMH72iVPZJq33HKKPN2Xume/vWbOn02B6OqadLzcfjyztppYUhmGdlD6TJzgJP8NNY6f4N611t2Ds4D+DmZQcvy3y9WbBJA3z5AP71Wl52daDHwlEjLMIEkgg/c5bVb0KfzZOEQwZ+AmSmFGHeV27T21Rb8rIzugIFsNt4179onqA7Nq4hJQIjZhd4L8mWP2pU7iujIybzD08ClRktzEbSOzcITNeXNEVISbSjU67LtNOVtJkv1sOx6aocZxi8WWzzE5TVQU/rt+/hbfL72fdew3rjWGOFjGoEKLoOL86JsEbEWL2SamGAVDp6ZFGNBesSD7Ec9CtDsEzfJi1OhX/qptQ9ra8AN+2JW+x30MFr5VaRtpP82RHBy50aXI6jYNIRqD0kNrWv5jAgRmfCo4lseF/GXsLh163Af7jsNS6ygYbrkxCLGAJ7Dz6LPW2OFbSG3qXLEYIxYvDrggI+iJsHiHCddtPRpWLsUqYlC7YGcNiK9WZjf2aMyvGWUOungeGeWM+VOFLkaY9f2mQ5kbkGJe69Xp+ginDzKYlSS4cyLcBsUfoii1zGWUtidrfrzZg8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(346002)(39850400004)(451199015)(33656002)(64756008)(8936002)(186003)(6506007)(30864003)(52536014)(5660300002)(66946007)(8676002)(76116006)(4326008)(83380400001)(66446008)(66476007)(66556008)(107886003)(9686003)(41300700001)(55016003)(7696005)(2940100002)(2906002)(53546011)(26005)(316002)(478600001)(38070700005)(71200400001)(122000001)(54906003)(86362001)(110136005)(38100700002)(21314003)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BEqsvSkAHaytXAuKQaoFjRCtkqHfI0NOnJYdQGMfcXM+mgRNC6bgaufHzNch?=
 =?us-ascii?Q?6B+tUOQDDHqg3Mhm0OtfLNz9UYlAIlpgH7Nu5rPsZX6w4izD8ISWtxmtiEbu?=
 =?us-ascii?Q?zai5iLZ1hYE/s/zM5MDJA5MFwRClKjg0YUal96v0IfJGMP2Oi7JKjUqu6y78?=
 =?us-ascii?Q?CBBuRoC2hAebmZ6ZtdUftggwjPvqrQ8AM6CH5LeFDmt+EFat6Lac12bPQ5iF?=
 =?us-ascii?Q?920EzdAWb3luUUgpzMO/iZD+uV57e/aynIxE1A1/lwZDFsQFR4D0/qv20NCp?=
 =?us-ascii?Q?ZftbPGnbaA4O8cgEBhiKHiEqa9jW22jNY1W52JCnpHG+OOX7DaxKYtM/vV4J?=
 =?us-ascii?Q?VKErQy+Jg4ClUN/LmX3ssz1JHqtsoXYLupBy13EeGiTrSGyn8z8WecxKsVqS?=
 =?us-ascii?Q?vdQ47oKM8k6xZhWPKa/N4uV6cRQTVqGseMFWuIwMm6k3ym8elBIV620FUPYw?=
 =?us-ascii?Q?HWLGwfHOnxqqoBB8bovD9TmhC3wzu/FGWBIS+FakehPYMf3PsV8P42JoWGLh?=
 =?us-ascii?Q?sdVL+XPnopScQ2pD6uv5Xrj1oOTGmG+lkQWhNwnIZVRUMzBpybomfpnS9o6w?=
 =?us-ascii?Q?/8mrL+ML4ij2eH8D6Sa3vZQJ+ddbKqUlZ4FmNvem4zV+yCyb33ZBU6cP4PGi?=
 =?us-ascii?Q?m/gp2Lfxqf2dPU3CSn/xSce3mi7JbkPZ+5SXvaeNFYU14/E/+sALoGa7HYQP?=
 =?us-ascii?Q?bVcV2FJgajXpm1GDHuTNE+t5jpA8SLZe6BDEdK2TnHw+GC6oR+liHSfcf7zB?=
 =?us-ascii?Q?9gqX0G0MRHMrKE3rAP0NDBzyUfZRtYeFheFaDyvqGGIMgadVgi+/5ysbhnnB?=
 =?us-ascii?Q?oxO5GcGFhAjCGjCeR78pcaWaV/AD2iXfE1rHSXTiUIK3UqI8ffydQKFVAQov?=
 =?us-ascii?Q?95LoixLfyQ7n0kmTF98331bUXVePMhyj1wbiXmwjeFoGaC/BNDQedZaFqtIJ?=
 =?us-ascii?Q?1GcCfq6LdGE3ZvapnvL8oLNDqISPBNLDa3tOVWzLifzwj/W8u4y1A8y/SZ2d?=
 =?us-ascii?Q?V3QuuHvCZL9+9tN4dBCO0G56wk0BkqhTDffUNCDFmvZJbeC9AsuhuIc1dSEb?=
 =?us-ascii?Q?SZi0isS3mTEUopwFuedmCG1XCkAlJ3gaNMbLMz1feprxWXux++j0dYUUYz7b?=
 =?us-ascii?Q?fzQWSteuCP/G3y9VDC50UWr2IjeZm4sMNWrJIriOS6uF7fqk3aFRUJGcpRnZ?=
 =?us-ascii?Q?Zfexz+fUj8a8CH8fWrrOGQ60nKd+RNuB2HWEWPoW6NsPARfgr6HCgKWgLkYV?=
 =?us-ascii?Q?YtSpvQV1jl4UcloyjT4gqSVghL07cq2P9jatxh3uHfjfImYRWHQxjkrXaQPY?=
 =?us-ascii?Q?d9D6PynFBfDtGWqHkdMMCeSLI86KcnJo6qRZOHySm0f/6cy1ceZT+UGKogYs?=
 =?us-ascii?Q?xcfqdomfFiWEm6lExgGJFjqNQNUoxlyM5xS9LFCGH+dIt+TfEhc42AcIYh7l?=
 =?us-ascii?Q?8HJPd2y6aUvNtXXWVbEp66dbZBoyPZNDJw0SwAwuj1bR2HSkb36/VSmTHzSw?=
 =?us-ascii?Q?Yp2xsKJo9M4zm1fwqNdblbrjzEaJxMZ/pQbL/ySRFPLOxiiJJB+1Ioo0nDj0?=
 =?us-ascii?Q?1hc7OQgKVgmKKRrcTdMU8bjrYZDd50OydWb1FAfCYPmRhH/AH99nxB692Sv+?=
 =?us-ascii?Q?tA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ea3f7e-8c27-44bc-18d8-08dabc1caaa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 15:20:53.3996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aq+WyDl8lyKMzP9yvgb0Vv/JRuR93MRHbAoJcbbzOtY04QoWXu09zXKGht+q7tHBF4pcxisFx7ueAfO0z/IxNb3Ie1qZ0z3nvLrvtW0aKsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
X-Proofpoint-ORIG-GUID: _bFNUIQjjX4WqhdUsDSNQ4cQFK5ZxxFu
X-Proofpoint-GUID: _bFNUIQjjX4WqhdUsDSNQ4cQFK5ZxxFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010116
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=8304fcac20=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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
> From: Shi, Guohuai
> Sent: Tuesday, November 1, 2022 23:13
> To: Christian Schoenebeck <qemu_oss@crudebyte.com>; qemu-devel@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>
> Subject: RE: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
> functions for 9pfs
>=20
>=20
>=20
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Tuesday, November 1, 2022 22:28
> > To: qemu-devel@nongnu.org
> > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Greg Kurz
> > <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>
> > Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific
> > utilities functions for 9pfs
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Monday, October 24, 2022 6:57:50 AM CET Bin Meng wrote:
> > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > >
> > > Windows POSIX API and MinGW library do not provide the NO_FOLLOW
> > > flag, and do not allow opening a directory by POSIX open(). This
> > > causes all
> > > xxx_at() functions cannot work directly. However, we can provide
> > > Windows handle based functions to emulate xxx_at() functions (e.g.:
> > > openat_win32, utimensat_win32, etc.).
> > >
> > > Windows does not support extended attributes. 9pfs for Windows uses
> > > NTFS ADS (Alternate Data Streams) to emulate extended attributes.
> > >
> > > Windows does not provide POSIX compatible readlink(), and symbolic
> > > link feature in 9pfs will be disabled on Windows.
> >
> > Wouldn't it be more user friendly if the relevant error locations
> > would use something like error_report_once() and suggesting to enable
> > mapped(-xattr) to make 9p symlinks on guest working if desired by the u=
ser?
> >
> > Probably this error case would need to wrapped into a dedicated
> > function, otherwise I guess error_report_once() would fire several
> > times by different callers.
> >
>=20
> Windows (MinGW) does not only support symlink, but also does not have sym=
link
> definitions.
> Windows does not support symlink flags S_IFLNK.
>=20
> So even I add symlink support by mapped-xattr, the MinGW library does not
> have symlink flags and get a build error.
> And this flags is defined by Windows header files.
> The impact of adding a new flags to an pre-defined structure (struct stat=
) is
> unknown.
>=20
> So I think it is not a good idea to do that.

Because Windows does not support symlink, so error_report_once() and report=
 it to user will be OK.
But mapped-xattr could not work.

>=20
> > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > >  hw/9pfs/9p-local.h      |   7 +
> > >  hw/9pfs/9p-util.h       |  40 +-
> > >  hw/9pfs/9p-local.c      |   4 -
> > >  hw/9pfs/9p-util-win32.c | 885
> > > ++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 931 insertions(+), 5 deletions(-)  create mode
> > > 100644 hw/9pfs/9p-util-win32.c
> > >
> > > diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h index
> > > c8404063e5..02fd894ba3 100644
> > > --- a/hw/9pfs/9p-local.h
> > > +++ b/hw/9pfs/9p-local.h
> > > @@ -15,6 +15,13 @@
> > >
> > >  #include "9p-file-id.h"
> > >
> > > +typedef struct {
> > > +    P9_FILE_ID mountfd;
> > > +#ifdef CONFIG_WIN32
> > > +    char *root_path;
> > > +#endif
> > > +} LocalData;
> > > +
> > >  P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path,
> > > int
> > flags,
> > >                                 mode_t mode);  P9_FILE_ID
> > > local_opendir_nofollow(FsContext *fs_ctx, const char *path); diff
> > > --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > 1e7dc76345..82b2d0c3e4 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -90,26 +90,61 @@ static inline int errno_to_dotl(int err) {
> > >      return err;
> > >  }
> > >
> > > -#ifdef CONFIG_DARWIN
> > > +#if defined(CONFIG_DARWIN)
> > >  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
> > > +#elif defined(CONFIG_WIN32)
> > > +#define qemu_fgetxattr fgetxattr_win32
> > >  #else
> > >  #define qemu_fgetxattr fgetxattr
> > >  #endif
> > >
> > > +#ifdef CONFIG_WIN32
> > > +#define qemu_openat     openat_win32
> > > +#define qemu_fstatat    fstatat_win32
> > > +#define qemu_mkdirat    mkdirat_win32
> > > +#define qemu_renameat   renameat_win32
> > > +#define qemu_utimensat  utimensat_win32
> > > +#define qemu_unlinkat   unlinkat_win32
> > > +#else
> > >  #define qemu_openat     openat
> > >  #define qemu_fstatat    fstatat
> > >  #define qemu_mkdirat    mkdirat
> > >  #define qemu_renameat   renameat
> > >  #define qemu_utimensat  utimensat
> > >  #define qemu_unlinkat   unlinkat
> > > +#endif
> > > +
> > > +#ifdef CONFIG_WIN32
> > > +char *get_full_path_win32(P9_FILE_ID fd, const char *name); ssize_t
> > > +fgetxattr_win32(int fd, const char *name, void *value, size_t
> > > +size); P9_FILE_ID openat_win32(P9_FILE_ID dirfd, const char *pathnam=
e,
> int flags,
> > > +                        mode_t mode); int fstatat_win32(P9_FILE_ID
> > > +dirfd, const char *pathname,
> > > +                  struct stat *statbuf, int flags); int
> > > +mkdirat_win32(P9_FILE_ID dirfd, const char *pathname, mode_t mode);
> > > +int renameat_win32(P9_FILE_ID olddirfd, const char *oldpath,
> > > +                   P9_FILE_ID newdirfd, const char *newpath); int
> > > +utimensat_win32(P9_FILE_ID dirfd, const char *pathname,
> > > +                    const struct timespec times[2], int flags); int
> > > +unlinkat_win32(P9_FILE_ID dirfd, const char *pathname, int flags);
> > > +int statfs_win32(const char *root_path, struct statfs *stbuf);
> > > +P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char *name);
> > > +P9_FILE_ID openat_file(P9_FILE_ID dirfd, const char *name, int flags=
,
> > > +                       mode_t mode); #endif
> > >
> > >  static inline void close_preserve_errno(P9_FILE_ID fd)  {
> > >      int serrno =3D errno;
> > > +#ifndef CONFIG_WIN32
> > >      close(fd);
> > > +#else
> > > +    CloseHandle(fd);
> > > +#endif
> > >      errno =3D serrno;
> > >  }
> > >
> > > +#ifndef CONFIG_WIN32
> > >  static inline P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char
> > > *name)  {
> > >      return qemu_openat(dirfd, name, @@ -157,6 +192,7 @@ again:
> > >      errno =3D serrno;
> > >      return fd;
> > >  }
> > > +#endif
> > >
> > >  ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *path,
> > >                               const char *name, void *value, size_t
> > > size); @@ -167,6 +203,7 @@ ssize_t flistxattrat_nofollow(P9_FILE_ID
> > > dirfd, const char *filename,  ssize_t fremovexattrat_nofollow(P9_FILE=
_ID
> > dirfd, const char *filename,
> > >                                  const char *name);
> > >
> > > +#ifndef CONFIG_WIN32
> > >  /*
> > >   * Darwin has d_seekoff, which appears to function similarly to d_of=
f.
> > >   * However, it does not appear to be supported on all file systems,
> > > @@ -181,6 +218,7 @@ static inline off_t qemu_dirent_off(struct dirent
> > *dent)
> > >      return dent->d_off;
> > >  #endif
> > >  }
> > > +#endif /* !CONFIG_WIN32 */
> > >
> > >  /**
> > >   * qemu_dirent_dup() - Duplicate directory entry @dent.
> > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c index
> > > 7e8d8492ea..d0d6d93549 100644
> > > --- a/hw/9pfs/9p-local.c
> > > +++ b/hw/9pfs/9p-local.c
> > > @@ -53,10 +53,6 @@
> > >  #define BTRFS_SUPER_MAGIC 0x9123683E
> > >  #endif
> > >
> > > -typedef struct {
> > > -    P9_FILE_ID mountfd;
> > > -} LocalData;
> > > -
> > >  P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, =
int
> > flags,
> > >                                 mode_t mode)  { diff --git
> > > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c new file mode
> > > 100644 index 0000000000..953e7da6fa
> > > --- /dev/null
> > > +++ b/hw/9pfs/9p-util-win32.c
> > > @@ -0,0 +1,885 @@
> > > +/*
> > > + * 9p utilities (Windows Implementation)
> > > + *
> > > + * Copyright (c) 2022 Wind River Systems, Inc.
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r
> > later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +/*
> > > + * This file contains Windows only functions for 9pfs.
> > > + *
> > > + * For 9pfs Windows host, the following features are different from
> Linux
> > host:
> > > + *
> > > + * 1. Windows POSIX API does not provide the NO_FOLLOW flag, that me=
ans
> > MinGW
> > > + *    cannot detect if a path is a symbolic link or not. Also Window=
s do
> > not
> > > + *    provide POSIX compatible readlink(). Supporting symbolic link =
in
> > 9pfs on
> > > + *    Windows may cause security issues, so symbolic link support is
> > disabled
> > > + *    completely.
> > > + *
> > > + * 2. Windows file system does not support extended attributes direc=
tly.
> > 9pfs
> > > + *    for Windows uses NTFS ADS (Alternate Data Streams) to emulate
> > extended
> > > + *    attributes.
> > > + *
> > > + * 3. statfs() is not available on Windows. qemu_statfs() is used to
> > emulate it.
> > > + *
> > > + * 4. On Windows trying to open a directory with the open() API will
> fail.
> > > + *    This is because Windows does not allow opening directory in no=
rmal
> > usage.
> > > + *
> > > + *    As a result of this, all xxx_at() functions won't work directl=
y on
> > > + *    Windows, e.g.: openat(), unlinkat(), etc.
> > > + *
> > > + *    As xxx_at() can prevent parent directory to be modified on Lin=
ux
> > host,
> > > + *    to support this and prevent security issue, all xxx_at() APIs =
are
> > replaced
> > > + *    by xxx_at_win32() and Windows handle is used to replace the
> > directory fd.
> > > + *
> > > + *    Windows file system does not allow replacing a file or directo=
ry
> if
> > it is
> > > + *    referenced by a handle. Keep the handle open will lock and pro=
tect
> > the
> > > + *    parent directory and make the access to files atomically.
> > > + *
> > > + *    If we don't protect (lock) the parent directory, the parent
> > directory may
> > > + *    be replaced by others (e.g.: a symbolic link) and cause securi=
ty
> > issues.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qapi/error.h"
> > > +#include "qemu/error-report.h"
> > > +#include "9p.h"
> > > +#include "9p-util.h"
> > > +#include "9p-local.h"
> > > +
> > > +#include <windows.h>
> > > +#include <dirent.h>
> > > +
> > > +#define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > > +
> > > +/*
> > > + * build_ads_name - construct Windows ADS name
> > > + *
> > > + * This function constructs Windows NTFS ADS (Alternate Data Streams=
)
> > > +name
> > > + * to <namebuf>.
> > > + */
> > > +static int build_ads_name(char *namebuf, size_t namebuf_len,
> > > +                          const char *filename, const char *ads_name=
)
> > > +{
> > > +    size_t total_size;
> > > +
> > > +    total_size =3D strlen(filename) + strlen(ads_name) + 2;
> > > +    if (total_size  > namebuf_len) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    /*
> > > +     * NTFS ADS (Alternate Data Streams) name format: filename:ads_n=
ame
> > > +     * e.g.: D:\1.txt:my_ads_name
> > > +     */
> > > +
> > > +    strcpy(namebuf, filename);
> > > +    strcat(namebuf, ":");
> > > +    strcat(namebuf, ads_name);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/*
> > > + * copy_ads_name - copy ADS name from buffer returned by
> > > +FindNextStreamW()
> > > + *
> > > + * This function removes string "$DATA" in ADS name string returned
> > > +by
> > > + * FindNextStreamW(), and copies the real ADS name to <namebuf>.
> > > + */
> > > +static ssize_t copy_ads_name(char *namebuf, size_t namebuf_len,
> > > +                             char *full_ads_name) {
> > > +    char *p1, *p2;
> > > +
> > > +    /*
> > > +     * NTFS ADS (Alternate Data Streams) name from enumerate data
> format:
> > > +     * :ads_name:$DATA, e.g.: :my_ads_name:$DATA
> > > +     *
> > > +     * ADS name from FindNextStreamW() always has ":$DATA" string at=
 the
> > end.
> > > +     *
> > > +     * This function copies ADS name to namebuf.
> > > +     */
> > > +
> > > +    p1 =3D strchr(full_ads_name, ':');
> > > +    if (p1 =3D=3D NULL) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    p2 =3D strchr(p1 + 1, ':');
> > > +    if (p2 =3D=3D NULL) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* skip empty ads name */
> > > +    if (p2 - p1 =3D=3D 1) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (p2 - p1 + 1 > namebuf_len) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    memcpy(namebuf, p1 + 1, p2 - p1 - 1);
> > > +    namebuf[p2 - p1 - 1] =3D '\0';
> > > +
> > > +    return p2 - p1;
> > > +}
> > > +
> > > +/*
> > > + * get_full_path_win32 - get full file name base on a handle
> > > + *
> > > + * This function gets full file name based on a handle specified by
> > > +<fd> to
> > > + * a file or directory.
> > > + *
> > > + * Caller function needs to free the file name string after use.
> > > + */
> > > +char *get_full_path_win32(P9_FILE_ID fd, const char *name) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    DWORD total_size;
> > > +    DWORD name_size;
> > > +
> > > +    full_file_name =3D g_malloc0(NAME_MAX);
> > > +
> > > +    /* get parent directory full file name */
> > > +    name_size =3D GetFinalPathNameByHandle(fd, full_file_name,
> > > +                                         NAME_MAX - 1,
> > FILE_NAME_NORMALIZED);
> > > +    if (name_size =3D=3D 0 || name_size > NAME_MAX - 1) {
> > > +        return NULL;
> > > +    }
> > > +
> > > +    /* full path returned is the "\\?\" syntax, remove the lead stri=
ng
> */
> > > +    memmove(full_file_name, full_file_name + 4, NAME_MAX - 4);
> > > +
> > > +    if (name !=3D NULL) {
> > > +        total_size =3D strlen(full_file_name) + strlen(name) + 2;
> > > +
> > > +        if (total_size > NAME_MAX) {
> > > +            return NULL;
> > > +        }
> > > +
> > > +        /* build sub-directory file name */
> > > +        strcat(full_file_name, "\\");
> > > +        strcat(full_file_name, name);
> > > +    }
> > > +
> > > +    return g_steal_pointer(&full_file_name); }
> > > +
> > > +/*
> > > + * fgetxattr_win32 - get extended attribute by fd
> > > + *
> > > + * This function gets extened attribute by <fd>. <fd> will be
> > > +translated to
> > > + * Windows handle.
> > > + *
> > > + * This function emulates extended attribute by NTFS ADS.
> > > + */
> > > +ssize_t fgetxattr_win32(int fd, const char *name, void *value, size_=
t
> > > +size) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    char ads_file_name[NAME_MAX + 1] =3D {0};
> > > +    DWORD dwBytesRead;
> > > +    HANDLE hStream;
> > > +    HANDLE hFile;
> > > +
> > > +    hFile =3D (HANDLE)_get_osfhandle(fd);
> > > +
> > > +    full_file_name =3D get_full_path_win32(hFile, NULL);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name=
) <
> 0)
> > {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    hStream =3D CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_R=
EAD,
> > NULL,
> > > +                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL)=
;
> > > +    if (hStream =3D=3D INVALID_HANDLE_VALUE &&
> > > +        GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > > +        errno =3D ENODATA;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) =3D=3D FA=
LSE) {
> > > +        errno =3D EIO;
> > > +        CloseHandle(hStream);
> > > +        return -1;
> > > +    }
> > > +
> > > +    CloseHandle(hStream);
> > > +
> > > +    return dwBytesRead;
> > > +}
> > > +
> > > +/*
> > > + * openat_win32 - emulate openat()
> > > + *
> > > + * This function emulates openat().
> > > + *
> > > + * Windows POSIX API does not support opening a directory by open().
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * So openat_win32() has to use a directory handle instead of a
> directory
> > fd.
> > > + *
> > > + * For symbolic access:
> > > + * 1. Parent directory handle <dirfd> should not be a symbolic link
> > because
> > > + *    it is opened by openat_dir() which can prevent from opening a =
link
> > to
> > > + *    a dirctory.
> > > + * 2. Link flag in <mode> is not set because Windows does not have t=
his
> > flag.
> > > + *    Create a new symbolic link will be denied.
> > > + * 3. This function checks file symbolic link attribute after open.
> > > + *
> > > + * So symbolic link will not be accessed by 9p client.
> > > + */
> > > +P9_FILE_ID openat_win32(P9_FILE_ID dirfd, const char *pathname, int
> flags,
> > > +                        mode_t mode)
> > > +{
> > > +    g_autofree char *full_file_name1 =3D NULL;
> > > +    g_autofree char *full_file_name2 =3D NULL;
> > > +    HANDLE hFile =3D INVALID_HANDLE_VALUE;
> > > +    int fd;
> > > +
> > > +    full_file_name1 =3D get_full_path_win32(dirfd, pathname);
> > > +    if (full_file_name1 =3D=3D NULL) {
> > > +        return hFile;
> > > +    }
> > > +
> > > +    fd =3D open(full_file_name1, flags, mode);
> > > +    if (fd > 0) {
> > > +        DWORD attribute;
> > > +        hFile =3D (HANDLE)_get_osfhandle(fd);
> > > +
> > > +        full_file_name2 =3D get_full_path_win32(hFile, NULL);
> > > +        attribute =3D GetFileAttributes(full_file_name2);
> > > +
> > > +        /* check if it is a symbolic link */
> > > +        if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > > +            || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > +            errno =3D EACCES;
> > > +            hFile =3D INVALID_HANDLE_VALUE;
> > > +            close(fd);
> > > +        }
> > > +    }
> > > +
> > > +    return hFile;
> > > +}
> > > +
> > > +/*
> > > + * fstatat_win32 - emulate fstatat()
> > > + *
> > > + * This function emulates fstatat().
> > > + *
> > > + * Windows POSIX API does not support opening a directory by open().
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * So fstatat_win32() has to use a directory handle instead of a
> directory
> > fd.
> > > + *
> > > + * Access to a symbolic link will be denied to prevent security issu=
es.
> > > + */
> > > +int fstatat_win32(P9_FILE_ID dirfd, const char *pathname,
> > > +                  struct stat *statbuf, int flags) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    HANDLE hFile =3D INVALID_HANDLE_VALUE;
> > > +    DWORD attribute;
> > > +    int err =3D 0;
> > > +    int ret =3D -1;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        return ret;
> > > +    }
> > > +
> > > +    /* open file to lock it */
> > > +    hFile =3D CreateFile(full_file_name, GENERIC_READ,
> > > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> > FILE_SHARE_DELETE,
> > > +                       NULL,
> > > +                       OPEN_EXISTING,
> > > +                       FILE_FLAG_BACKUP_SEMANTICS
> > > +                       | FILE_FLAG_OPEN_REPARSE_POINT,
> > > +                       NULL);
> > > +
> > > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > > +        err =3D EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    attribute =3D GetFileAttributes(full_file_name);
> > > +
> > > +    /* check if it is a symbolic link */
> > > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > +        errno =3D EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    ret =3D stat(full_file_name, statbuf);
> > > +
> > > +out:
> > > +    if (hFile !=3D INVALID_HANDLE_VALUE) {
> > > +        CloseHandle(hFile);
> > > +    }
> > > +
> > > +    if (err !=3D 0) {
> > > +        errno =3D err;
> > > +    }
> > > +    return ret;
> > > +}
> > > +
> > > +/*
> > > + * mkdirat_win32 - emulate mkdirat()
> > > + *
> > > + * This function emulates mkdirat().
> > > + *
> > > + * Windows POSIX API does not support opening a directory by open().
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * So mkdirat_win32() has to use a directory handle instead of a
> directory
> > fd.
> > > + */
> > > +int mkdirat_win32(P9_FILE_ID dirfd, const char *pathname, mode_t
> > > +mode) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    int ret =3D -1;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        return ret;
> > > +    }
> > > +
> > > +    ret =3D mkdir(full_file_name);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +/*
> > > + * renameat_win32 - emulate renameat()
> > > + *
> > > + * This function emulates renameat().
> > > + *
> > > + * Windows POSIX API does not support openning a directory by open()=
.
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * So renameat_win32() has to use a directory handle instead of a
> > directory fd.
> > > + *
> > > + * Access to a symbolic link will be denied to prevent security issu=
es.
> > > + */
> > > +int renameat_win32(HANDLE olddirfd, const char *oldpath,
> > > +                   HANDLE newdirfd, const char *newpath) {
> > > +    g_autofree char *full_old_name =3D NULL;
> > > +    g_autofree char *full_new_name =3D NULL;
> > > +    HANDLE hFile;
> > > +    DWORD attribute;
> > > +    int err =3D 0;
> > > +    int ret =3D -1;
> > > +
> > > +    full_old_name =3D get_full_path_win32(olddirfd, oldpath);
> > > +    full_new_name =3D get_full_path_win32(newdirfd, newpath);
> > > +    if (full_old_name =3D=3D NULL || full_new_name =3D=3D NULL) {
> > > +        return ret;
> > > +    }
> > > +
> > > +    /* open file to lock it */
> > > +    hFile =3D CreateFile(full_old_name, GENERIC_READ,
> > > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> > FILE_SHARE_DELETE,
> > > +                       NULL,
> > > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > > + NULL);
> > > +
> > > +    attribute =3D GetFileAttributes(full_old_name);
> > > +
> > > +    /* check if it is a symbolic link */
> > > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > +        err =3D EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    CloseHandle(hFile);
> > > +
> > > +    ret =3D rename(full_old_name, full_new_name);
> > > +out:
> > > +    if (err !=3D 0) {
> > > +        errno =3D err;
> > > +    }
> > > +    return ret;
> > > +}
> > > +
> > > +/*
> > > + * utimensat_win32 - emulate utimensat()
> > > + *
> > > + * This function emulates utimensat().
> > > + *
> > > + * Windows POSIX API does not support opening a directory by open().
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * So utimensat_win32() has to use a directory handle instead of a
> > directory fd.
> > > + *
> > > + * Access to a symbolic link will be denied to prevent security issu=
es.
> > > + */
> > > +int utimensat_win32(P9_FILE_ID dirfd, const char *pathname,
> > > +                    const struct timespec times[2], int flags) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    HANDLE hFile =3D INVALID_HANDLE_VALUE;
> > > +    DWORD attribute;
> > > +    struct utimbuf tm;
> > > +    int err =3D 0;
> > > +    int ret =3D -1;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        return ret;
> > > +    }
> > > +
> > > +    /* open file to lock it */
> > > +    hFile =3D CreateFile(full_file_name, GENERIC_READ,
> > > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> > FILE_SHARE_DELETE,
> > > +                       NULL,
> > > +                       OPEN_EXISTING,
> > > +                       FILE_FLAG_BACKUP_SEMANTICS
> > > +                       | FILE_FLAG_OPEN_REPARSE_POINT,
> > > +                       NULL);
> > > +
> > > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > > +        err =3D EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    attribute =3D GetFileAttributes(full_file_name);
> > > +
> > > +    /* check if it is a symbolic link */
> > > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > +        errno =3D EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    tm.actime =3D times[0].tv_sec;
> > > +    tm.modtime =3D times[1].tv_sec;
> > > +
> > > +    ret =3D utime(full_file_name, &tm);
> > > +
> > > +out:
> > > +    if (hFile !=3D INVALID_HANDLE_VALUE) {
> > > +        CloseHandle(hFile);
> > > +    }
> > > +
> > > +    if (err !=3D 0) {
> > > +        errno =3D err;
> > > +    }
> > > +    return ret;
> > > +}
> > > +
> > > +/*
> > > + * unlinkat_win32 - emulate unlinkat()
> > > + *
> > > + * This function emulates unlinkat().
> > > + *
> > > + * Windows POSIX API does not support opening a directory by open().
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * So unlinkat_win32() has to use a directory handle instead of a
> > directory fd.
> > > + *
> > > + * Access to a symbolic link will be denied to prevent security issu=
es.
> > > + */
> > > +
> > > +int unlinkat_win32(P9_FILE_ID dirfd, const char *pathname, int flags=
)
> > > +{
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    HANDLE hFile;
> > > +    DWORD attribute;
> > > +    int err =3D 0;
> > > +    int ret =3D -1;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        return ret;
> > > +    }
> > > +
> > > +    /* open file to prevent other one modify it */
> > > +    hFile =3D CreateFile(full_file_name, GENERIC_READ,
> > > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> > FILE_SHARE_DELETE,
> > > +                       NULL,
> > > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > > + NULL);
> > > +
> > > +    attribute =3D GetFileAttributes(full_file_name);
> > > +
> > > +    /* check if it is a symbolic link */
> > > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > +        err =3D EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    if (flags =3D=3D AT_REMOVEDIR) { /* remove directory */
> > > +        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > > +            err =3D ENOTDIR;
> > > +            goto out;
> > > +        }
> > > +        ret =3D rmdir(full_file_name);
> > > +    } else { /* remove regular file */
> > > +        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) !=3D 0) {
> > > +            err =3D EISDIR;
> > > +            goto out;
> > > +        }
> > > +        ret =3D remove(full_file_name);
> > > +    }
> > > +
> > > +    /* after last handle closed, file will be removed */
> > > +    CloseHandle(hFile);
> > > +
> > > +out:
> > > +    if (err !=3D 0) {
> > > +        errno =3D err;
> > > +    }
> > > +    return ret;
> > > +}
> > > +
> > > +/*
> > > + * statfs_win32 - statfs() on Windows
> > > + *
> > > + * This function emulates statfs() on Windows host.
> > > + */
> > > +int statfs_win32(const char *path, struct statfs *stbuf) {
> > > +    char RealPath[4] =3D { 0 };
> > > +    unsigned long SectorsPerCluster;
> > > +    unsigned long BytesPerSector;
> > > +    unsigned long NumberOfFreeClusters;
> > > +    unsigned long TotalNumberOfClusters;
> > > +
> > > +    /* only need first 3 bytes, e.g. "C:\ABC", only need "C:\" */
> > > +    memcpy(RealPath, path, 3);
> > > +
> > > +    if (GetDiskFreeSpace(RealPath, &SectorsPerCluster, &BytesPerSect=
or,
> > > +                         &NumberOfFreeClusters, &TotalNumberOfCluste=
rs)
> =3D=3D
> > 0) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    stbuf->f_type =3D V9FS_MAGIC;
> > > +    stbuf->f_bsize =3D
> > > +        (__fsword_t)SectorsPerCluster * (__fsword_t)BytesPerSector;
> > > +    stbuf->f_blocks =3D (fsblkcnt_t)TotalNumberOfClusters;
> > > +    stbuf->f_bfree =3D (fsblkcnt_t)NumberOfFreeClusters;
> > > +    stbuf->f_bavail =3D (fsblkcnt_t)NumberOfFreeClusters;
> > > +    stbuf->f_files =3D -1;
> > > +    stbuf->f_ffree =3D -1;
> > > +    stbuf->f_namelen =3D NAME_MAX;
> > > +    stbuf->f_frsize =3D 0;
> > > +    stbuf->f_flags =3D 0;
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/*
> > > + * openat_dir - emulate openat_dir()
> > > + *
> > > + * This function emulates openat_dir().
> > > + *
> > > + * Windows POSIX API does not support opening a directory by open().
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * So openat_dir() has to use a directory handle instead of a direct=
ory
> > fd.
> > > + *
> > > + * Access to a symbolic link will be denied to prevent security issu=
es.
> > > + */
> > > +P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char *name) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    HANDLE hSubDir;
> > > +    DWORD attribute;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, name);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        return INVALID_HANDLE_VALUE;
> > > +    }
> > > +
> > > +    attribute =3D GetFileAttributes(full_file_name);
> > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES) {
> > > +        return INVALID_HANDLE_VALUE;
> > > +    }
> > > +
> > > +    /* check if it is a directory */
> > > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > > +        return INVALID_HANDLE_VALUE;
> > > +    }
> > > +
> > > +    /* do not allow opening a symbolic link */
> > > +    if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > +        return INVALID_HANDLE_VALUE;
> > > +    }
> > > +
> > > +    /* open it */
> > > +    hSubDir =3D CreateFile(full_file_name, GENERIC_READ,
> > > +                         FILE_SHARE_READ | FILE_SHARE_WRITE |
> > FILE_SHARE_DELETE,
> > > +                         NULL,
> > > +                         OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> NULL);
> > > +    return hSubDir;
> > > +}
> > > +
> > > +P9_FILE_ID openat_file(P9_FILE_ID dirfd, const char *name, int flags=
,
> > > +                       mode_t mode)
> > > +{
> > > +    return openat_win32(dirfd, name, flags | _O_BINARY, mode); }
> > > +
> > > +/*
> > > + * fgetxattrat_nofollow - get extended attribute
> > > + *
> > > + * This function gets extended attribute from file <path> in the
> > > +directory
> > > + * specified by <dirfd>. The extended atrribute name is specified by
> > > +<name>
> > > + * and return value will be put in <value>.
> > > + *
> > > + * This function emulates extended attribute by NTFS ADS.
> > > + */
> > > +ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *path,
> > > +                             const char *name, void *value, size_t
> > > +size) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    char ads_file_name[NAME_MAX + 1] =3D { 0 };
> > > +    DWORD dwBytesRead;
> > > +    HANDLE hStream;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, path);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name=
) <
> 0)
> > {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    hStream =3D CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_R=
EAD,
> > NULL,
> > > +                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL)=
;
> > > +    if (hStream =3D=3D INVALID_HANDLE_VALUE &&
> > > +        GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > > +        errno =3D ENODATA;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) =3D=3D FA=
LSE) {
> > > +        errno =3D EIO;
> > > +        CloseHandle(hStream);
> > > +        return -1;
> > > +    }
> > > +
> > > +    CloseHandle(hStream);
> > > +
> > > +    return dwBytesRead;
> > > +}
> > > +
> > > +/*
> > > + * fsetxattrat_nofollow - set extended attribute
> > > + *
> > > + * This function set extended attribute to file <path> in the
> > > +directory
> > > + * specified by <dirfd>.
> > > + *
> > > + * This function emulates extended attribute by NTFS ADS.
> > > + */
> > > +
> > > +int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *path, const c=
har
> > *name,
> > > +                         void *value, size_t size, int flags) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    char ads_file_name[NAME_MAX + 1] =3D { 0 };
> > > +    DWORD dwBytesWrite;
> > > +    HANDLE hStream;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, path);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name=
) <
> 0)
> > {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    hStream =3D CreateFile(ads_file_name, GENERIC_WRITE, FILE_SHARE_=
READ,
> > NULL,
> > > +                         CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL)=
;
> > > +    if (hStream =3D=3D INVALID_HANDLE_VALUE) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (WriteFile(hStream, value, size, &dwBytesWrite, NULL) =3D=3D =
FALSE) {
> > > +        errno =3D EIO;
> > > +        CloseHandle(hStream);
> > > +        return -1;
> > > +    }
> > > +
> > > +    CloseHandle(hStream);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/*
> > > + * flistxattrat_nofollow - list extended attribute
> > > + *
> > > + * This function gets extended attribute lists from file <filename>
> > > +in the
> > > + * directory specified by <dirfd>. Lists returned will be put in <li=
st>.
> > > + *
> > > + * This function emulates extended attribute by NTFS ADS.
> > > + */
> > > +ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename=
,
> > > +                              char *list, size_t size) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    WCHAR WideCharStr[NAME_MAX + 1] =3D { 0 };
> > > +    char full_ads_name[NAME_MAX + 1];
> > > +    WIN32_FIND_STREAM_DATA fsd;
> > > +    BOOL bFindNext;
> > > +    char *list_ptr =3D list;
> > > +    size_t list_left_size =3D size;
> > > +    HANDLE hFind;
> > > +    int ret;
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, filename);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    /*
> > > +     * ADS enumerate function only has WCHAR version, so we need to
> > > +     * covert filename to utf-8 string.
> > > +     */
> > > +    ret =3D MultiByteToWideChar(CP_UTF8, 0, full_file_name,
> > > +                              strlen(full_file_name), WideCharStr,
> > NAME_MAX);
> > > +    if (ret =3D=3D 0) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    hFind =3D FindFirstStreamW(WideCharStr, FindStreamInfoStandard, =
&fsd,
> > 0);
> > > +    if (hFind =3D=3D INVALID_HANDLE_VALUE) {
> > > +        errno =3D ENODATA;
> > > +        return -1;
> > > +    }
> > > +
> > > +    do {
> > > +        memset(full_ads_name, 0, sizeof(full_ads_name));
> > > +
> > > +        /*
> > > +         * ADS enumerate function only has WCHAR version, so we need=
 to
> > > +         * covert cStreamName to utf-8 string.
> > > +         */
> > > +        ret =3D WideCharToMultiByte(CP_UTF8, 0,
> > > +                                  fsd.cStreamName,
> wcslen(fsd.cStreamName)
> > + 1,
> > > +                                  full_ads_name, sizeof(full_ads_nam=
e) -
> > 1,
> > > +                                  NULL, NULL);
> > > +        if (ret =3D=3D 0) {
> > > +            if (GetLastError() =3D=3D ERROR_INSUFFICIENT_BUFFER) {
> > > +                errno =3D ERANGE;
> > > +            }
> > > +            CloseHandle(hFind);
> > > +            return -1;
> > > +        }
> > > +
> > > +        ret =3D copy_ads_name(list_ptr, list_left_size, full_ads_nam=
e);
> > > +        if (ret < 0) {
> > > +            errno =3D ERANGE;
> > > +            CloseHandle(hFind);
> > > +            return -1;
> > > +        }
> > > +
> > > +        list_ptr =3D list_ptr + ret;
> > > +        list_left_size =3D list_left_size - ret;
> > > +
> > > +        bFindNext =3D FindNextStreamW(hFind, &fsd);
> > > +    } while (bFindNext);
> > > +
> > > +    CloseHandle(hFind);
> > > +
> > > +    return size - list_left_size;
> > > +}
> > > +
> > > +/*
> > > + * fremovexattrat_nofollow - remove extended attribute
> > > + *
> > > + * This function removes an extended attribute from file <filename>
> > > +in the
> > > + * directory specified by <dirfd>.
> > > + *
> > > + * This function emulates extended attribute by NTFS ADS.
> > > + */
> > > +ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filena=
me,
> > > +                                const char *name) {
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    char ads_file_name[NAME_MAX + 1] =3D { 0 };
> > > +
> > > +    full_file_name =3D get_full_path_win32(dirfd, filename);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (build_ads_name(ads_file_name, NAME_MAX, filename, name) < 0)=
 {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (DeleteFile(ads_file_name) !=3D 0) {
> > > +        if (GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > > +            errno =3D ENODATA;
> > > +            return -1;
> > > +        }
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/*
> > > + * local_opendir_nofollow - open a Windows directory
> > > + *
> > > + * This function returns a Windows file handle of the directory
> > > +specified by
> > > + * <dirpath> based on 9pfs mount point.
> > > + *
> > > + * Windows POSIX API does not support opening a directory by open().
> > > +Only
> > > + * handle of directory can be opened by CreateFile().
> > > + *
> > > + * This function checks the resolved path of <dirpath>. If the
> > > +resolved
> > > + * path is not in the scope of root directory (e.g. by symbolic
> > > +link), then
> > > + * this function will fail to prevent any security issues.
> > > + */
> > > +HANDLE local_opendir_nofollow(FsContext *fs_ctx, const char *dirpath=
)
> > > +{
> > > +    g_autofree char *full_file_name =3D NULL;
> > > +    LocalData *data =3D fs_ctx->private;
> > > +    HANDLE hDir;
> > > +
> > > +    hDir =3D openat_dir(data->mountfd, dirpath);
> > > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > > +        return INVALID_HANDLE_VALUE;
> > > +    }
> > > +
> > > +    full_file_name =3D get_full_path_win32(hDir, NULL);
> > > +    if (full_file_name =3D=3D NULL) {
> > > +        CloseHandle(hDir);
> > > +        return INVALID_HANDLE_VALUE;
> > > +    }
> > > +
> > > +    /*
> > > +     * Check if the resolved path is in the root directory scope:
> > > +     * data->root_path and full_file_name are full path with symboli=
c
> > > +     * link resolved, so fs_ctx->root_path must be in the head of
> > > +     * full_file_name. If not, that means guest OS tries to open a f=
ile
> > not
> > > +     * in the scope of mount point. This operation should be denied.
> > > +     */
> > > +    if (memcmp(full_file_name, data->root_path,
> > > +               strlen(data->root_path)) !=3D 0) {
> > > +        CloseHandle(hDir);
> > > +        hDir =3D INVALID_HANDLE_VALUE;
> > > +    }
> > > +
> > > +    return hDir;
> > > +}
> > >
> >
> >


