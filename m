Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37780658575
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 19:07:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAanx-0005UI-4P; Wed, 28 Dec 2022 13:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAanv-0005Tp-33
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:05:27 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAant-0005QH-5c
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:05:26 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSI18Fx018151; Wed, 28 Dec 2022 18:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=5FY+VUKQtM9R6iTpe0Zcnlu0HnwcHVV+jKylleTC/Oc=;
 b=KTVvQ/PDGZ8OKH1vV9JLoYcuo5cZdW01ENj3GD5LozmD5wnkkv6iPq/LS0UaJ01ILC0A
 LitWoKF2+L5ctpmvbNXL2zK4BKjiY7lkd/NnuukGQ7pWoC58i6aVqRx92JsovyCMUt/n
 qoBAMCFoDQnEeDTmC/gDEmgc/Acrz1Y2SDYq5tjizRcluuu94Sip3vqWRJ9Stk7X34RZ
 WL+CAxrhfUYwk/hNRsO1yC30aBA5ebSjRbAi+sf9Pq39h+VlcDhl+nf5ralyOWvYSWEn
 0kUAeGzeWXxp1tBDf3U07m/YUDhOMOOmTZwHckRKuEdd89KCRlVCXbKyuHFTPk6SRGtT xg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrar2sq22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 18:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxzBYoU5UAper+6sdkXNIP2HbMvnWkDNCgMFkrvgr8IX5ZkKypKdKHS/gwcKFMZiN+lUW6hTlRwlSCdV4aYbr+tvzOEMXEHkMvqShKLsTXTPHCl6nJxNWRjr+PlT4ZULsf1JfQx/BO+ZzS/kpyeozutgrwU1NQ2hnRLjGHe3JhAShEjv/PiuBfTFQUz6jIUA3jgmVdMXH6VgonBGHm0uO0b43hwEAdMRhUEw+71RdV1zeBfkP1VMFhJWj8M8qHxUo84aLcGc/7sEtkHfywuBNtytMQlPWx6ziMd7V8bLQ9Dml1W9oCBe9bZqREnicEA2IxFqulHxsrWei/xTAalspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FY+VUKQtM9R6iTpe0Zcnlu0HnwcHVV+jKylleTC/Oc=;
 b=e8SY+GticQ0JoL/GLQ/8LeHW5i1ujVtp1/ALZuDc1U2ZL1JDdeLhtQJWDXvLYQRCiSasynYN4tHiKXmN3zsKwJGx9u0DuEEFmOv+mefNAT6duTcPBW+qz/r82Ln/r8YQG+4yOKYlU5kPmlru0ePBnWj9TNEa/+6CD7H3q9uTnaqqQfHbVrJVW0ti6fh1/Wzs2rCTiDGqmsIysLWmsDrCGfeFUzEPHsjnxRwFFaOmhBw3udsRXDdaC/bW1mel10cNR6Dt5WOxeFEvxmXeT/kBG6pTf4b1AKGZJZleeAk4mkg+VmhllRpwaVFHK/Vah7Mp/DSgnJDRSM6lg33NTlzXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6640.namprd02.prod.outlook.com
 (2603:10b6:208:1d0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 18:05:19 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 18:05:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "laurent@vivier.eu"
 <laurent@vivier.eu>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: RE: [PATCH 1/2] linux-user/hexagon: fix signal context save & restore
Thread-Topic: [PATCH 1/2] linux-user/hexagon: fix signal context save & restore
Thread-Index: AQHZGgjTOOtBEyACFUyjqeVHPtIgrq6DlNpA
Date: Wed, 28 Dec 2022 18:05:18 +0000
Message-ID: <SN4PR0201MB88089A3D541389E5DE6D2511DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
 <20221227153447.2729-2-quic_mthiyaga@quicinc.com>
In-Reply-To: <20221227153447.2729-2-quic_mthiyaga@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6640:EE_
x-ms-office365-filtering-correlation-id: 711b07df-7248-4b7b-a5d3-08dae8fe1482
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: poTy9krIj0PouR24m7GDLKaV8REl4T5jvPiou39YEBG83973jPDD0WwGyfHeJ8Sin6YyqmVjiQM9u5F57jdS2PpcSNaukSHvv59b09xJJ+FUdmjlva0/DPtOrYRbPNv4j7w7dg4SRl+Lke33K9dMAu7NTzRJETUHRoXtbQLSVAQw7SNwZavQDseuEh7ZOYY3lRnclVTyOKUIPu809izgq+GQZGr2g/LcwYnyKraOdMZT8sbT+pOtZBjWOOrqaaR5dM672Uf8v+FAYQIyrjHKVNlauPzZvwdnfsuecDszXoXc0dtbDXMfsRpqxV0WSkVvTZ4Br5fVKlpKT0UtJrEtMeDcBdIAJ0NcKbgIF/Aw95LV9B/PD+/eQgFwxzlL8AI8m08ZIJ4J26Le1G9QTZVuJOvRCuK8ghaG5CkQ3hEwQr/4hjosCrP/uTCMVgfYuHrVvlNadbB/tDGtKttQ87ePIdy2RCl2Y0SAJTiBRRMEySZ29gPn5XJow9pAh00noMjsFSYtzi9aYYvwZq+eXVE3rKjQQrPuo9FcLUN+OAVqUYd0YH5jgdeYnK9TZsELGvWEDCzqeXOpEH/ANuDpYPTjoVEMVQsIor/DbrFYbFGltb5uiMoYEUGSbwRmkPwBU9BXDYl+Yxg84W0isUrMPtLuqPsUhqEIwdTo6biPqw2VQGNsUNX35U4X5vaK8BRNAZQ921760uHBZqSfI/uryKox7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(33656002)(71200400001)(478600001)(316002)(186003)(110136005)(54906003)(2906002)(6506007)(38070700005)(122000001)(38100700002)(83380400001)(55016003)(53546011)(86362001)(7696005)(26005)(5660300002)(52536014)(8676002)(76116006)(66946007)(8936002)(66446008)(4326008)(66556008)(9686003)(64756008)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4iAvwOrVb8bQrIP6HuJ4WNNc+8lH6iLfC/ZBd4X4Y12C0J7VjyikuLTjjTf/?=
 =?us-ascii?Q?1cflNUTHu0CbuVeHTGG3zgiwB6CGgZaN5dA50sE8glulByuP2t7ovrLKHeli?=
 =?us-ascii?Q?FiPv01fSPCGzi3qJkEXskMlKx+uL9u7MTIhe1NhBimqxJxKohdEZANWCFikp?=
 =?us-ascii?Q?Y5czMQcTZuNpXI9bw3Mhllx+6gQPb3qXDA0ct/vLAcWIiWxleuTwekueXCu2?=
 =?us-ascii?Q?D0Q8vZ2wUVE0sMMnFWg/5HjNe+ZPk9M2NGDDnPYJOapXYw80BaSbXG8ubOKL?=
 =?us-ascii?Q?rS0rUTU7H19f7eI8NRWXdwTaxtCxqxuX1j7VYmUqhRqVH5lm1Er1j/qmgpaV?=
 =?us-ascii?Q?hA6c0PkPbHJCUTxTCtmihEY8T9MoKNt19hdS/j0UzUAnjzNdfqdWcKStdOYV?=
 =?us-ascii?Q?Hc/pBx4smsy/1K+Wm1yofGWe7gbBmnsA/bHr7RWlq+kzr8ijZEXAwDgRhMwq?=
 =?us-ascii?Q?9Q/Ucj8RTCW3ikCVi4bUJLZUv9bgfMLWMBBYdzKS9rrQcTVgloKJAiVJnBmu?=
 =?us-ascii?Q?L7JwfIdX+uxseHOPtE8oEJ7HFMqDAaEWLpEpsUXmfU7XPv4WggXIQD3BIW3t?=
 =?us-ascii?Q?D1943L5jVvQign+juqGpd9+zMdK4+gmN7TtGgt4zZ4WoNCrkQ599oryvIIbq?=
 =?us-ascii?Q?abchOOYPujSwuqxAZCGqftFhJBvdxIhuZF22HcG3/7bfC7ZpvLU6tqXR5/Zt?=
 =?us-ascii?Q?a2q9AgmWyfotw7sG3TxwyG4AZCIC3lO8SWrUTtb22Gq87FdoQt/iuyUuovkc?=
 =?us-ascii?Q?9Ew6Jkb53LAHnUejCE6bEIq7pOi+CFFpU6Z2pIDN085ebh+vD+CaKB6XBf47?=
 =?us-ascii?Q?sWRw03GtsX+r2FTZXt/AG5D0Qa4AGB6ckSoBohwz4mCIRq7JA0txifmiP/lP?=
 =?us-ascii?Q?BKyIICHvOTbN505dvf7nN6kWtNbilhnphaWdT3kj2QycmSO0gD/E9inFRHPB?=
 =?us-ascii?Q?HtA38Fp1qlsWD7CJS66Rjyz1ZaAG/ZytKEvA9q1o8hSYd9suQbOKIWMgdXRt?=
 =?us-ascii?Q?ww0MPBrwJ2I+OMgKdzviA9KQncxnGi2BgDrp47Vl5LwP09JwawBIxWWhAwa2?=
 =?us-ascii?Q?LYcKbPlgbK5QlfG6dGWGtP2XtekoSR04n1i0y8mv3E78K0NKZaJcszx1I/Sa?=
 =?us-ascii?Q?GxtHnsoKVRBuHp3M7CD8sazxHmhRKecQHVemmh6tEpOlN9aNiTM3IEs4BWzx?=
 =?us-ascii?Q?LExWtn1b6IOSfk2u5nH4vCYQdIjfYKuEC/yAIpk/vO4EjUMTziiKuU3bxCYK?=
 =?us-ascii?Q?oV6g2eQgWeFJ8/5K8V3XNnQaT3rzeCl5b3SFxOLM/4LDW+neC5qvr1uiLDbE?=
 =?us-ascii?Q?IdnfXhY4YKoXbyDrF1yZWGHiyi9ADsUQOsVk+hJeivu3Vk2v6eumiypBMYo1?=
 =?us-ascii?Q?s2ZXSTIZjG0sxkNu/Rp0TLey/Ri/aXeLJFhdWuc4i8HaYjadWjQ0mLD18gwz?=
 =?us-ascii?Q?Kr6iGGXBD5qQQLaH0Rabejv75/Hy1lePMz6dG6zFZiY1iEHVd0rxn6tNZro8?=
 =?us-ascii?Q?4IFUYmrTrHmGuJC0GzLTXTTdEobol+wvzvEtfvBkBRhE4wE9hfvsP0IamphH?=
 =?us-ascii?Q?QGnMIAoWZTgSHxBpl1FVjPYtCc1HNx+pgYg5hmiP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711b07df-7248-4b7b-a5d3-08dae8fe1482
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 18:05:18.9321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8S/rb3DmbEr04NNJhthdVdC2Wd8xC2HYjcHzy6hY9l3QEqUeUIVKywHomsZ6q7TMdLjJfgh1HT5liKSI4rAVsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6640
X-Proofpoint-ORIG-GUID: SPTRlSpB2nJ1tHLAMZzNfhMv0RvP-mxu
X-Proofpoint-GUID: SPTRlSpB2nJ1tHLAMZzNfhMv0RvP-mxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_13,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 impostorscore=0 mlxlogscore=496 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280155
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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



> -----Original Message-----
> From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> Sent: Tuesday, December 27, 2022 9:35 AM
> To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>;
> laurent@vivier.eu
> Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org;
> alex.bennee@linaro.org; Mukilan Thiyagarajan (QUIC)
> <quic_mthiyaga@quicinc.com>
> Subject: [PATCH 1/2] linux-user/hexagon: fix signal context save & restor=
e
>=20
> diff --git a/tests/tcg/hexagon/signal_context.c
> b/tests/tcg/hexagon/signal_context.c
> new file mode 100644
> index 0000000000..297e6915a4
> --- /dev/null
> +++ b/tests/tcg/hexagon/signal_context.c
> @@ -0,0 +1,84 @@
> +/*
> + *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights

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


