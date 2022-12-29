Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E1658AF9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApCe-000809-0k; Thu, 29 Dec 2022 04:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pApCU-0007v6-Ci
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:27:51 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pApCS-0003ce-KE
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:27:46 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BT6wS3h023433; Thu, 29 Dec 2022 09:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=chflB4hFhkCEHPPKpjyWdMe7iytylUPlYSaRL6kGJCs=;
 b=Kjk07/elxJ7voeZ75QE+9QIMjQI9NoFmNLS7YuzvLzr6LmuMdbf1ax5dFy4Bssa2Zy7t
 0I+/9FVu1YVgcY06+W3a/xoWOKSyePwTN1ybERGof2eENW6+rOXsVWBvLcHd6AO7sd0C
 +ZbEZObdVz3NISlgVitkbtWyukBYjP0vDCK2CI6b5Me02s/fYMjsmdlcLqo+qkOTsYKy
 4WIdDH08+0mrV7JIGtzQnnsp+L+CcJjZkjObbzq+2FAyxd2L39gV77JhIh1mHsAW7XeZ
 weZdqXkHoswo4OlsSMGOfvk/oKGPokA1bnacwhVVvkTRJleUMWe82SCWZ5gCVMmHo33m eQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrau42wkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 09:27:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz13Ajq5M/S9cRNDCD4qxbvnrOLSU9fuSSJkKPwZVhswh+07WBNxunoIv98RlnTLdNUWoq1M6GbQzhw2vKmuc3MvdqjvaIyrAu/Dm5lTTkaZ04RLMS4kyNS6BKK1BXLjGDrNeiTHeGxvcSj1d5AzbkUdQaFDVv3CMnOCNCOip5iLteRUe8S5ac9nmiortFcxFSdfTxgAHc7ceCpbOTTpZy8tsz6tG2zUf3zMprgtshxYHv63G2ZEDpUuZ+DDrUAPEYFp6uMchXPV/zbRmmuszi53fnoVUnvAcnCngIxDgtElrrEhSF5KUUFuMpESf316O2E4ZwHcTvnvjbjTrbyqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chflB4hFhkCEHPPKpjyWdMe7iytylUPlYSaRL6kGJCs=;
 b=i6Wqkobrb6wvcf5JvMj/VyAR0RNhHdTeQmLefz11KA9jBCUTWYC2gjc+nsGEgTKTChOe7uiJUR+vyl/nESUOem/oXxfTML7KKj2ORJtEkRRWPdrAkeS9N5XU3P+Ifuh38J8VaiEE8u851WacODo5ezqKQui/zonOs6HGsL8xgrdu53lCM9AYN6D8X8sjY3UxccsVZL9MFmyutTPCuT5e3F8PX2i1jDiTrUmOXpeY9xxTvRXW1pQHDYH/nqax1t0mblCKvZOm3bC5XUiXOOfBfVyojO3uKuyxzISP8jhUWIKj65jjnSeqRd+ojuuxqbACS/SzlBDgCjPmJVHCVhBaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 (2603:10b6:301:7e::24) by PH0PR02MB7287.namprd02.prod.outlook.com
 (2603:10b6:510:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17; Thu, 29 Dec
 2022 09:27:39 +0000
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e]) by MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e%7]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 09:27:39 +0000
From: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "Mukilan Thiyagarajan (QUIC)"
 <quic_mthiyaga@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: RE: [PATCH 1/2] linux-user/hexagon: fix signal context save & restore
Thread-Topic: [PATCH 1/2] linux-user/hexagon: fix signal context save & restore
Thread-Index: AQHZGgjUZ6dg6RADGUqBO88B+JPgu66DmdEAgAEBsEA=
Date: Thu, 29 Dec 2022 09:27:39 +0000
Message-ID: <MWHPR0201MB3497E4CA18DBC12E1A990BE6F4F39@MWHPR0201MB3497.namprd02.prod.outlook.com>
References: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
 <20221227153447.2729-2-quic_mthiyaga@quicinc.com>
 <SN4PR0201MB88089A3D541389E5DE6D2511DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB88089A3D541389E5DE6D2511DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3497:EE_|PH0PR02MB7287:EE_
x-ms-office365-filtering-correlation-id: c294816f-8408-430a-7c07-08dae97eee08
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: szZJ8HGQKctLxlnXm36DWE7n3C8om4qJIuuPIE8FrfeLh49ss1iwMCg0v3s6AvCupCaGADxYLD7GBq12Rbon+rdBewr2Z64zwL1DeX+UoBjVeu79+YGNGWvZe2YUiSe6qAi0sbxxu/mWfecdVb+c6G22fS15A5U89lGgQxVF3yY0TqlhA8QRwGohdcaqShK6gen8cTCphJYeq94gXYu6MUjvwG6aqlNYvy4MmfNAAqMhgc9VCuNaOSmR2bmwPLEgG5UF0FRQV9xdHOe/rbGgGjRJM97Ib6TGElcgQqblXvtSI8BhB1jSbUrszQXqPzuu4VmBdCvE/+CcvUtZxYabtiT7sBpQXpkDjhR7EAxh5CLngKyGNcD0pj/5q3NqjnwPz8FbGynb1x4y5HWfymi+4JDOVj7ILwZPoFRb+lpku1QnThvcYXI/2y2HqgqbX5BjgVix6JoNl6LWmawGhT6jf878Kcmywuv5+v66GlV7aBrjtYHrckJdNjtnuFh31Svcw5WAk3wJ481JntbKaZohGz6uhyqucjBcKnlEt7Bp7MZ3dl0L18Ky+XfacmyTihH/aAo6zd6DfoVaQ9fnfWG8KUKXwvlmjkbDiFpsPAdapZuOf7TbOfVWwoLcGjeGw+FBX5yCEesqSSk/Tvz159aIH5DNYEEuETzlwpqP0sr/8mddKgHm2QHwmaTavm2ix+kpuvrUTNGhcqMUfGmUajqb7h3vwhg9BaxVV3TlIX3YXIo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3497.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(478600001)(122000001)(6506007)(53546011)(966005)(7696005)(38100700002)(71200400001)(52536014)(186003)(26005)(41300700001)(9686003)(86362001)(8936002)(54906003)(110136005)(38070700005)(66476007)(66946007)(33656002)(64756008)(55016003)(2906002)(66556008)(316002)(66446008)(5660300002)(83380400001)(76116006)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rmnIu7glFh+N09tivmo84gvzdqL1459+9cnv/SrCzkgzRbOQCmpV0bwbnnI9?=
 =?us-ascii?Q?gxc+WRyeo0fexo3hNP5NhBD3K+P0x6CjFd7B41ZhxdUvSKHc6SIwiw3XF0dA?=
 =?us-ascii?Q?x3B/4xg8G3rYyVKl+2OX1eWFfOnE/To0t0WedyOFE/fKXJT0zRhZNZP/nKMA?=
 =?us-ascii?Q?m4ICXCQjqPobbykJh081u5Rs9jRdH+XJ5pyCD8lswPSc9CkpRoMM2o1Yd/ka?=
 =?us-ascii?Q?5vGN/KGeethjScv3qUKrMBfFngXr2QWLRE4ANXWgPZKwoXC73Z6DuTY93Jtt?=
 =?us-ascii?Q?dumueIIJSqPBPxOLRGlmwJ6SxF+hPZ9wf0etDUuj3Szeg1IEsYAo9/gBwV4G?=
 =?us-ascii?Q?vebfimdByw7Lm+NPjcLw/cKBwRJsoETU9XqocS7MOucWbJ6TufQheeGFmIb6?=
 =?us-ascii?Q?Pa0wVmUlEHlyqr2ohiWQSO7y7FT/eslY0TDuIT+jyqHlJXep6i9BUy6RAD6g?=
 =?us-ascii?Q?BYLpcvbZeEPQE9u76JrZ3g2cAjwWpfvLUOjRy3VclBOaG+HTldUWtPe1u28C?=
 =?us-ascii?Q?4o8hu6r4P8zySYghNGF8o0nWpnvsI0ckqOfLO/4rhU5YH6GuiOnP8t/Nz95R?=
 =?us-ascii?Q?diW35IxE7ydUA9VwZDBw2r7HOlQ486N1EHx+k09bGOJCnDdiFdpLtgDeA1UQ?=
 =?us-ascii?Q?m0XJC11ujDdHu9JFkyUzXhnToKzjs9OJ5mjMZvgJ3zmGBrEzL+iCJTQ+iOZ/?=
 =?us-ascii?Q?YojOb08CDUDhT3QIg8bJnNE8UHGy7+Amb2BWLpDXGrsXhWch2o6+j2AMsJ2S?=
 =?us-ascii?Q?XxiYhkmjFVwnJ4hqvxjUhypzRLTaGqRKPh5YC4i403w0ztabqXS2mqCrHOsy?=
 =?us-ascii?Q?fDGzqhUEW3w5IbziRoDfTluPYDD5uuIZGLiyJBxQrj6oqey//zXo16mb5/Tn?=
 =?us-ascii?Q?ckviYXuAq2IsrgaLAmdel5Wgc73oKNpFKeHUkluW6i+oKl3UBf+sel4NzDPZ?=
 =?us-ascii?Q?DkmDlvmVGKzJpGZ46NMKX2dEEHs6y1KVA3GaTXYt76fPm20nOVFCjVbZvYxu?=
 =?us-ascii?Q?yP7bpHaiq9xBU7ayrzh5uPbRQU98b3vozaFGafHT0qcSHeSqFXspNAmujCeh?=
 =?us-ascii?Q?WSDYPNBiyq/QWCeMc+c+HNO+uRRKDswn4IOrVafveG5eYQ8P7u5wgAumwyWV?=
 =?us-ascii?Q?h/xbIkzJz7GS5ualCeEbE23RTlSwPAlNLaIn0mwGYC2nyv0gnq8fJEDmIs6O?=
 =?us-ascii?Q?FLbj3Wj35UE4N6ZWDm8Gx+CS8reMPPMkLoq6RhKffLikoVsBwcSy6+XcdvAD?=
 =?us-ascii?Q?27ecZAg3EMH/boHf0BiM74ugZ2O9jt6InO6LP4/vYEKupDTtbaZY/wjayGtc?=
 =?us-ascii?Q?Rc1aUaJr7DW7s+yd5pxh+uGZGmBSU78IUiqEgtdDWjYI/rNlpvgMqqhwaaCZ?=
 =?us-ascii?Q?VThLXW9cL332reXeJ1MsYaEzgZnIUzgkpdA8kOSAwFLH21udOfwMgA53KOhC?=
 =?us-ascii?Q?2pe3XZqkiyYLyWByo/ZWn/IvsCrS/oxf/xcMIaPEAxraNwHEqa//CE4SzzVi?=
 =?us-ascii?Q?kDXI6L69vZKc+6ziHs1Sa6cLPJemZhpou0WLNM7+mnyInVDwE21Ti1LjIWEL?=
 =?us-ascii?Q?UxGDqSgoHZ5O82GGfStiyZIXKPwagfBtsda/g9b2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3497.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c294816f-8408-430a-7c07-08dae97eee08
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 09:27:39.4718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvwQ6iTKQcSg2tuSUvU1+XbITqPqf+MEAlsd2Cr/Gv+WLA6KcRNv8dfxFDeE5k9xMujfINahAYI1Npo0aUY7nlCMP3KOndvokhczJNwLl/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7287
X-Proofpoint-GUID: XtM7WLoyWVnVtlusA_2_k9CuJiCSQWCC
X-Proofpoint-ORIG-GUID: XtM7WLoyWVnVtlusA_2_k9CuJiCSQWCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_04,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=634 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290078
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

>> +        : : : "r7", "p0", "p1", "p2", "p3"); }
> Put the curly on the next line.

Not sure if this issue is on my end or your mail client, but the=20
formatting appears to be correct in the patchew:
https://patchew.org/QEMU/20221227153447.2729-1-quic._5Fmthiyaga@quicinc.com=
/20221227153447.2729-2-quic._5Fmthiyaga@quicinc.com/

I've addressed the other review comments in v2:
https://patchew.org/QEMU/20221229092006.10709-1-quic._5Fmthiyaga@quicinc.co=
m/20221229092006.10709-2-quic._5Fmthiyaga@quicinc.com/

Please let me know if the formatting is still off.

Thanks,
Mukilan

-----Original Message-----
From: Taylor Simpson <tsimpson@quicinc.com>=20
Sent: Wednesday, December 28, 2022 11:35 PM
To: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>; qemu-devel@non=
gnu.org; laurent@vivier.eu
Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org; alex.benn=
ee@linaro.org
Subject: RE: [PATCH 1/2] linux-user/hexagon: fix signal context save & rest=
ore



> -----Original Message-----
> From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> Sent: Tuesday, December 27, 2022 9:35 AM
> To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>;=20
> laurent@vivier.eu
> Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org;=20
> alex.bennee@linaro.org; Mukilan Thiyagarajan (QUIC)=20
> <quic_mthiyaga@quicinc.com>
> Subject: [PATCH 1/2] linux-user/hexagon: fix signal context save &=20
> restore
>=20
> diff --git a/tests/tcg/hexagon/signal_context.c
> b/tests/tcg/hexagon/signal_context.c
> new file mode 100644
> index 0000000000..297e6915a4
> --- /dev/null
> +++ b/tests/tcg/hexagon/signal_context.c
> @@ -0,0 +1,84 @@
> +/*
> + *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All=20
> +Rights

Since this is a new file, only list 2022 (not 2019-2022).

> +void sig_user(int sig, siginfo_t *info, void *puc) {
> +    asm("r7 =3D #0\n\t"
> +        "p0 =3D r7\n\t"
> +        "p1 =3D r7\n\t"
> +        "p2 =3D r7\n\t"
> +        "p3 =3D r7\n\t"
> +        : : : "r7", "p0", "p1", "p2", "p3"); }

Put the curly on the next line.

> +
> +int main()
> +{
> +
> +    struct sigaction act;
> +    struct itimerspec it;
> +    timer_t tid;
> +    struct sigevent sev;
> +    act.sa_sigaction =3D sig_user;
> +    sigemptyset(&act.sa_mask);
> +    act.sa_flags =3D SA_SIGINFO;
> +    sigaction(SIGUSR1, &act, NULL);
> +    sev.sigev_notify =3D SIGEV_SIGNAL;
> +    sev.sigev_signo =3D SIGUSR1;
> +    sev.sigev_value.sival_ptr =3D &tid;
> +    timer_create(CLOCK_REALTIME, &sev, &tid);
> +    it.it_interval.tv_sec =3D 0;
> +    it.it_interval.tv_nsec =3D 100000;
> +    it.it_value.tv_sec =3D 0;
> +    it.it_value.tv_nsec =3D 100000;
> +    timer_settime(tid, 0, &it, NULL);
> +
> +    int err =3D 0;
> +    unsigned int i =3D 100000;

Put these declarations at the beginning of the function before any code

> +    return err;

Before return err, do puts(err ? "FAIL" : "PASS");

Otherwise
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>



