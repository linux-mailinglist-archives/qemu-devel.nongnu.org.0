Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066696AA59F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 00:30:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYEqX-0007kE-OR; Fri, 03 Mar 2023 18:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pYEqO-0007jy-TR
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:29:45 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pYEqN-0007HT-An
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:29:44 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323NBCKk025363; Fri, 3 Mar 2023 23:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=bHB7j43oWOBbisXanyMobI+Y/LFfVGbxerxbGhYavsM=;
 b=bo1HVwROHByjadXyoChDsBh4xiBdwWd+wz+fwEwCaFZ7Mud1/lx2qqOaV2FVWUQDiQ8c
 2l/9WLH5l7ntqv9jy0V5Rc1a8Yh/QVz/BvKHv4/JhoX46b6GfxfkxyyCj2nV0Z8o6PFU
 WpH2Q6rp9Lv9i6Rc2QurEuUPHFacrcDNM00FYGeIhx3qrcZEFOrNWlaN9d3zYxIPKdfT
 a3a3UVYUUjI1mpN9L19UfwvuPH9RjMw/MZACYXgnT7QfroBRGTijVDTAQ9Gp6oeJTiLX
 CEQL1zEk3vFwWo8NLGewZ7sDoLTQEDVlWSReYxrx1QMwXmArr8sE4nIkbZqdmieOQ16a Pw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p32ty3w4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 23:29:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMNpmYbogLaOz00dp9na4bweZNR9myk+86nJwFhDpe2ZMBsNMVAGPb0lijHgaWTd4JkvKb8uriRx7JggIUgzFFVUlVCMmq/COKTJm90jRuhvssGNaqLqW5avoG7RG0BnqQBBGbuRldRCs35oWeSE93/l7lrrmssN4zpiiIDtOUWHkxK4tuglgdNIRJcLPAap59Va5nm4fVxbvzIJzMg9kolbibSAOEXky70xLajz6RkZRbJfAR2TKJFSnokTJpOcZAyQZM8Q6XXqguI2pzRxvbTeCuB+sau5rC9P0GIJUVDly6r7wzS1J/PmOXdyqLQLS3j2KuPp3KuQClw6KU6cqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHB7j43oWOBbisXanyMobI+Y/LFfVGbxerxbGhYavsM=;
 b=T2M2GAXlrI00DmIkDez9NVcLO+bx4eflPds/8sCnrGHzro0FEs888ib/x0W0CXu7OF3Y2HMA2atBlkIbTlffDTj8/jc+NnAZu2j0p9vB8uxztuJAjWsv+vizdNHzGb6n/z5r7n96sEUdjs6dZhsjzmwnmmv2c3dTM4jh4ZS4hCWFqF9tL446TSnAvPps9yXVsufegDcozDYIVzORgXtjxth6yXZsId77uvUn8upSVAKPdfTIYZMvVaICDuq97BTuiEtf9pk31XF0642qL6uk4dnpIPGDAkn9Zd1JMSBK4HIxjlzUT/OuPkLFb8mc+Uz14qhJX+xThN7bRdAuhkBh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB6987.namprd02.prod.outlook.com
 (2603:10b6:5:256::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Fri, 3 Mar
 2023 23:29:39 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 23:29:39 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "anjo@rev.ng" <anjo@rev.ng>
Subject: RE: [PATCH 2/2] tcg: Merge two sequential labels
Thread-Topic: [PATCH 2/2] tcg: Merge two sequential labels
Thread-Index: AQHZTh/XUl425xZErkmS01tBzXjf1q7ps2EQ
Date: Fri, 3 Mar 2023 23:29:38 +0000
Message-ID: <SN4PR0201MB880891115E7D66689FBF7887DEB39@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230303223056.966286-1-richard.henderson@linaro.org>
 <20230303223056.966286-3-richard.henderson@linaro.org>
In-Reply-To: <20230303223056.966286-3-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM6PR02MB6987:EE_
x-ms-office365-filtering-correlation-id: 00508f20-ca1e-45a7-7bd7-08db1c3f286c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oadYfn0FtiT8XTI8dDAdzAdGNga7ZVAFovhH64ATI9pSU90mHLLbP7Ccm8YRrvcF/TR7pOEaOklwDkvE7covgBSn98zhlqIaK4Qfjn6kabnKOsjX1ePUp9ZU/fMup+cnd6Lv9Ql2l/pFkhUHh44H67MNTHhf4Rsr2NVSXxvF+iVueKI8uFPgMOR5I/bRXlKH4T/dh3sYuiE2cDT/nq3kRpcWPvzw7Ly4EsxVVMyUukoQ0aU6y6nGNKuMBUxwjrhnlH0JDCyzWJfbMbRiZrbVTFiLuOKczlpKOQj7+Mgwbs+kfM3ZVYKwat9Nm69LIqsXIeU/uLDZEUDDZqU+GVZKSgomRRA35XREHdD66YhMDX1cPx2Sne/CR2BKpuZQqsohshXL47o9vngmbHZNxUBF+n64aopF2eOMpf30YZW1a40yJGGFLBfVDTfUBKm4JbJ1W2p808G5WyU9QlyHQL9mhmuwmMJcm9RuPr3DSGMGKeZzzMkjnMfFomkb+HRWp7VI2X9nDwVhi15kTWyWE1u0Di8kpuTlkujc21Le/iQ+kXNDeykpWX+05WwmQWOgXplWQqDOWpHA7X+1PewspeIed7UWnV+s3nsXwOfS8scNSPqJ++KZx/0O3dd8eSFQJ7ssp29LMQulHHNuK2iVldecOgySY6f6HMpFwwYrct4x0mYeTfCf1Azc6/SoncUGMZe0dWp29sr+QQ1COokLQBSzjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199018)(122000001)(66476007)(66446008)(52536014)(110136005)(8936002)(41300700001)(478600001)(8676002)(66556008)(86362001)(55016003)(66946007)(33656002)(7696005)(71200400001)(38070700005)(53546011)(64756008)(38100700002)(76116006)(186003)(6506007)(9686003)(2906002)(316002)(4326008)(4744005)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VKc3yAmyYl+HpK3/4IFNyc8Ks/lrg6Gxt+Z8xXhzqUm1xSTvHG7VS/abYp1G?=
 =?us-ascii?Q?13mWvN3O/uUOJE34omHIFUsMFbuIpR0eSzBtw6mBRKOFVS4KLAYailYAKB01?=
 =?us-ascii?Q?jA42PeR51gKc2s1Ihnb/MejKAu7ulUHtOwNWVO5cIrc/70bvTgvEViVOA2HA?=
 =?us-ascii?Q?uLX3ZdSJbH1MK2egZP9vvC8sdwZPjFHe0jvemIkUkKb6AZ6pvsMxF2wvSUXz?=
 =?us-ascii?Q?Y274CTHQNu/LfV9H00Lh/kZsi6UhqN8nflGaDqAq9uyOUr6iBCydGncVOG9s?=
 =?us-ascii?Q?gEwWKXWUeSVutbT7UlC7LxmUhtJ5LwlxkrGobOtEktg19qobxh+LxbfEqrDW?=
 =?us-ascii?Q?uGz4yj9fvh+JfN6+8oTdovRDX+oSamTb+F+hZNUnVINXkJcAvuodZie+8jkQ?=
 =?us-ascii?Q?6b9xKoE5DJ5CTpkkh1cqK+gZVbK1c0Pq8Ubpjf2YtoQRcqAAAkeSSiF2HC9R?=
 =?us-ascii?Q?OZLNbwTHN0D1oagda/i+DehXVbFJC43q5xwwLETBlRrWvFL5jJUmFUMXGkZX?=
 =?us-ascii?Q?4UA67Q+iU3JKTZib2Y9W+f++SrOk3eqtSxkFu7enU/FGEOsrNwu5xxp41+la?=
 =?us-ascii?Q?+6A7Ay6pAJ+UkMCTEzO10moVW6YASDY6VaiZlFQQpQcodayk/y7Mc8Qyo3bG?=
 =?us-ascii?Q?hqLQLEZ2+YNu1o/VP28CTKAzePtEcHQxRFE950OSW81w07xNQ9yqsWFuNsw1?=
 =?us-ascii?Q?KtoHxjK4kApY7jdixez1TeQSnc657BCnDOLAGNDvKvmjGNZIV0JxA7a7+I14?=
 =?us-ascii?Q?b+W47p+7jEYzcmBHGOBY6tRUsExslxqsOFGS3qlitQFUbZg0bUhmdzFhukoU?=
 =?us-ascii?Q?1/Bd92/NYb6dd1GvLbWc2SUG5odSR4248/DMbVsuKa71f2gF6sDoClli+9lY?=
 =?us-ascii?Q?CZDoN5+ZmATB++ufzo7RlKA5kPSts+F9iRppGpzYVDFZNk+vbsaETNSt4xHN?=
 =?us-ascii?Q?90HLDLzlZozssi1Y5jsThxeH55OzPMvyZum6rFS1YEc6tXb3Bcd4IJyTMRgJ?=
 =?us-ascii?Q?pQ4C5Jext8Eb/ch4IQpbgGTSSnyLPWLPfEQFc2Ar+piRQAAEKhoauAHymxCe?=
 =?us-ascii?Q?jQOpSxj7K9+qeeCs9axNxgGNV2gtDa05/8q1y2246dXMqBSIteqpXcz8mnG4?=
 =?us-ascii?Q?QvoGdFN+zzhPoxE66aD0E31bVStq/NGdNIsDZPqkNcNrwnzJiRiLNBWsDpBT?=
 =?us-ascii?Q?2FFxr8Pcnc3B4z5aznrV4/c5wJ4BJaHlzMq9/AHCq2OFQI+qMCLN5Ov/ljvt?=
 =?us-ascii?Q?P6ryxbRkrzz/q/w7PxEYrwqPSGO0I435GLeWsygZ0SLaYy+ZLuMHT+wjTCe+?=
 =?us-ascii?Q?wJ+C8sphL+mnS4IaWTAMlo9LmwgOIHNdg4tPKgSysqn/TKxAF8Xcf4KmKewj?=
 =?us-ascii?Q?PovuiBG8kRW33QGkQe/CMr3DCOiz6rbegaA3Yy34s06LxS5n4A1t4iV4xDLg?=
 =?us-ascii?Q?HTCRzQ2Q9zULwM1PxvT5rQGLZTYHNrb3iQU5Zbl6Nl2mGVlqsgU+S6XQDMOX?=
 =?us-ascii?Q?EMoLhG/Y0OTgqO7Yzn27fPjjmfX8AD7S8ZIXiEcpnNzUkmtR1kvZAwIekBHx?=
 =?us-ascii?Q?YpuRjhpfukhAGqzesnuCQuXb7hSwCMHbseb7cExV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Co1bavk+ZzPaj0CPKe0D6miBdOazWTIxR5ENRNBZFnGemR0ioq7UMph5iiAqSMX4He90GQ9ocManzUivLuewH6vhC1FDVe8XLRdZlXhc9aTBYTyRNEmT5FeGlabXbxPn8a7N9vIPTvFB6MrGBOLuhbtmqgkdYf8kMI373wmGjaHRcLnkyXvRBkeoXKJpxRwvzkF+r70npmmHaDDdm8VmjSjZmlAxtdfNUxKfphCiojCvUNL7zxnhuQ9M9pqnbznG22u2qmg60Olq5bYw95AqffLnVk1oksKGO6X4gG3W5QFQUHHkoqIDqwzj37QvtxKjZpxNQ1BDQtZL2nDQeHsowXQQEaNhWoDFAXpPnl7LdsV2xXxrG8RmUlQE1tGHEwOTaTZJnNUwDjQT+FbbpTHqiJ2Iqxm1Or25BvR+0GviF8mbu+y/F9rlnIV5ZUSUWSBUAlFhTBUatoI41SZDHv9k/fiXKINbSC3dtjF1Bw6CP7G1yBiYJ4KQ/uddZpnMbCKazAUw1wGYJmEdZtsfNrf2bWvR8z0iLBCpl2VyAgzGmFLgqzFp1Ya5OyENJek4/rPRw5Ye5Ea6pNK5A7oVtsDZLghyE8KOTN/n7FR9B0Z4WI1aufqaObU+Lk+duj/mV0kZe+pndrgbWjpSiFPvn736c3exNTaTm9L9cK5hVqS95LWbxGEVLundymVBI/LrTMRYjb5kBVcal6OrxQw+A3qQ9nJp/OhammEqCWSRcGHqZEImETQIBUf+8ejGWNibBlem2En0TXT5a4Qvyut6EVSLLVJg04sAlUzB71U5xi/6TsOp56yYnFzvDMOcTD/pArZM
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00508f20-ca1e-45a7-7bd7-08db1c3f286c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 23:29:38.9460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S8BWAsu6gV8cJkwOsqDtke6Ia5RkkhU5bMK68ZER4o5jGq3Jr9ixLuTeiu+nbrC7waRrXg/kzX6vEAPOnuOFkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6987
X-Proofpoint-GUID: eXtWvj85z3hi6KC462LxP8TxtFu3x62o
X-Proofpoint-ORIG-GUID: eXtWvj85z3hi6KC462LxP8TxtFu3x62o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=517
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030198
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
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Friday, March 3, 2023 3:31 PM
> To: qemu-devel@nongnu.org
> Cc: anjo@rev.ng; Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH 2/2] tcg: Merge two sequential labels
>=20
> Remove the first label and redirect all uses to the second.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

