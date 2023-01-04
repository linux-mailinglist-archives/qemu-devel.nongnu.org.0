Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECA565DACE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD73M-0002Ua-6t; Wed, 04 Jan 2023 11:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pD73J-0002UH-V3
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:55:45 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pD73H-0005uF-Q3
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:55:45 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 304GadIn009801; Wed, 4 Jan 2023 16:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=6Zg6YCfE3xPb08l+gygtJP/jN3t4lNQxqwopxET6H5g=;
 b=WTvr5o6zbhIJjOunVvigFDO0BQgsYv9vwNSEafPyE2/djKk+NzVyPjB77oOWDKY7nLIJ
 6GkIxZbG+7kNx2FWxtcI1YM09pEOud4yVz7xEzEosZt7nAGg0udBu+9LleUdSeu/9QE0
 Nx/3ZYHfYupCCovE8SPjkorniOt3e2H1DnBK/gt1AX9tc6WqbCmHyrFV/QPGkd0UKY0X
 lZ7PRJ6Ov5hzN1Nvuzcuj8bkTCQGPJJV70PDRRTjBykd8e/RpFu+sq191WMm7AnvefCb
 17mCr8WDwGFVdmNQqH3/sBS0K0IBXw1IC9ffSKENDwl5j6SFhxiTehE4CumYtfi07/k8 pg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvgt8f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 16:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZDbkIL8/21R5WS/mSBUSKG/uajSx06XV9kxoDwrZzKt+eD1y0wTqA2iLjYG1g2OJz0NIyrikE5PsanRy2zwUE7Sim/vDPrc6JEkQMBNwXJr1i/Wi5iF3q3kGAzl7A3+RlX7nJGd//TKwHJMldiWzCAWcg9xPmG2PMN3DHSdWgoxvkLbK/BFi0X09IRIgDK+QC7hhK8U+q/w2jxy6Py50JoaDZCu8SyZoEp5NTo0b4WsCdkzs6GPGk4Eeory+YmSpXcZoM57JVmhJq8L1I4V12xtIHqwoqNXxQ6OlmuuNdNx/OCj8fB/fzn/bm/9fD6m3PXWlfUc7SEh/+RKGjdaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Zg6YCfE3xPb08l+gygtJP/jN3t4lNQxqwopxET6H5g=;
 b=M+9Xra0z6zoz8wA1bgkbziqpAmREkk1QYzYPfk4Klx6tx1lTwooR4JjawLa0WWlgVTv1+FbCKK8PBJvfYHctcajEnG6elmODaTeE6cHTaycKLbvDSD8uBs3817MsjkaIQZD0pVfDpRd6HttKL1mjTBGGO7AQjZrSbFw6Az9HyvKRvfO3cNfP5o0uLN0G7tbx8kfCbXRwAtpXEOXdlJXQczjXJGbUWmF+8VtDrBpNYffhHX+Tq32chTdkure2KR1RAXbKdjGZER5FKrdztBvjMiwd5dB2+xUoRCvma48vL37GyfyZgrRBFayD5vk/XsQNhBnpdhuDS4HkqO8dMLJDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by PH7PR02MB9412.namprd02.prod.outlook.com (2603:10b6:510:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:55:36 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::8951:a14e:4e55:e959]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::8951:a14e:4e55:e959%5]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 16:55:36 +0000
From: Sid Manning <sidneym@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, Mark Burton
 <mburton@qti.qualcomm.com>
Subject: ARM: ptw.c:S1_ptw_translate 
Thread-Topic: ARM: ptw.c:S1_ptw_translate 
Thread-Index: AdkgXLziuM3BStbISnGE/4d6gqc13A==
Date: Wed, 4 Jan 2023 16:55:36 +0000
Message-ID: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5509:EE_|PH7PR02MB9412:EE_
x-ms-office365-filtering-correlation-id: 559ae2bd-c66c-4421-81ec-08daee748063
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+pJJjLGHlkoEKFJ7hI1awo4kFz+ujhCbiqKNVq+okG6G5dDEmNbv5PozgKLxzwi0ReL4xs4g/bWx76m5ai68GzXIOT2tVNg8lsMfySW1KuTLcAI4TCjPdURLXNQJhxvOWkqpmZxZ/DdNpvKyPODh6TNZY0O51q5wsCayyLcb5vJeZOnvryg230/0zLnZ+fQm28RlSl+X1dvTSqGDYOkU5C4DKyaiIw5ikDvwRjRY1LW/1AujGOCmLcrWFAoClTlk8eAInmn29ltuIcbJQQ9U4qsmsS1MDnmivw5uIwIYoZHXelG9od5EfHwrs4lrOYE1vCNCh5fkC1jOs2FpIPib/js7Rj7Q0Ap+Z+/E1/QrRNiaFK65n83KvVlnBYvoKxIDlnB03A98QKTAm3Gs3QiKlpYrrnCBsgwMHEa7kIZpuhVDl9hiiIZr2BGOfZ4/m+PZIMpaDxlf7ilXX9SJm1EmBsn82VmVQSVtQuE0zXsspWFENfmdQAQk+uYKbP4g4m44pGrqEAruI5DS/iMqJha7+aFPA1E4b+5uErlfOdw72cAwVmnr/Bj2uuZlFIik5Xu1TVRU+WDFaVuxH+jIFH4C8Mnw0ufYdR13aR9ZTcR9Li8sBL8E0wcEwmSllzPKmlevH2IrJ5c05RIRgQujbjIvmW4bZWVzq4xmCf0QtFbiCKACgdNKu6VPUAvnurm+csUu/eTn1huG3eUNhQT5UmVog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(186003)(26005)(4743002)(9686003)(55016003)(86362001)(33656002)(38070700005)(38100700002)(122000001)(66476007)(2906002)(54906003)(6916009)(316002)(52536014)(8676002)(8936002)(41300700001)(76116006)(5660300002)(66946007)(64756008)(66446008)(4326008)(66556008)(478600001)(107886003)(6506007)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rQCVaDrTOfVq3YMQkM9TOZj0ZmBizFuSGqVwyV6JAB7Txy3yKQGnyizTp4X4?=
 =?us-ascii?Q?MHeDchzo5VJXF4wFaPKzZvcN+zzx5N/sciSdkk/E/lM+2vownJQx9nL4qJtB?=
 =?us-ascii?Q?tEimLntIxbLfceRidVSI1n9mRYVz6uTgbDX2UovwN3yAnMFfmEZqSCv4dONo?=
 =?us-ascii?Q?XE1YZHsoPAj3Adi3BdwxYmJvRftTvcSn2LLxDoEWdX86HwKQXqzx3udTEWxP?=
 =?us-ascii?Q?pgZVGVe+cbL4rYFxe6Rf5u5DDiEMPbOcK2Ua/vrx+RpFz8/6cfzAYXX8YczJ?=
 =?us-ascii?Q?a6fdSZE4+oWsyqeJMwD5+lcAsMfRgxzeI/uk0ICHli3lxiRciayJ9+vYL41W?=
 =?us-ascii?Q?Kbv58cqMspElOA1lMCZhPLd2W1/tx+f8aw4O248mJlymj+rndN2v81v9Lyet?=
 =?us-ascii?Q?idk0SkEUU3AyAN2CAEDFBZeWelkJfzYU6NEYuzqla2G5jhFQ46VEXY0K4pkJ?=
 =?us-ascii?Q?UNub7zjA/8CailRPIQPEzLtBozESN/p4N06g2JODFQUx9jdxsSI2mA6et3od?=
 =?us-ascii?Q?vkVh/wjSxMUKT3bHv96Frw0Pb6Nqz+G9gn7bvPsqrghaXtSbicLXQ+J1TPJP?=
 =?us-ascii?Q?XtKcOBxEcBV4EjUjEfRDkTOP4dcelqYTjoDpIQXgcaa1mumOCPS9o/9y2fQ8?=
 =?us-ascii?Q?GWNDSB8wXcBeYCsItcc5x3XUr5EvLMCn4Tpg9eb1hjcKPPdkBCw/e4ocoK47?=
 =?us-ascii?Q?LMEEERIAyZmCLwTG4QflPX97e/BPNiQpQMFCkEqxEo21O59WjZUnxHvDWZj1?=
 =?us-ascii?Q?D7qsG7+PDXdCX/RqEzquW+ld6T7WYheRsMlYUlcb+wjjCgog6B1gAm5WkFdd?=
 =?us-ascii?Q?SYip4uzO6ZYUb1n8bD+IC5N32T5b9KfKwwTt4G2kQoLronpw9thp/Y5zJJN3?=
 =?us-ascii?Q?GbziJScOlvtLxZlnd4cWuegm5cENqHrWrPLrwsKrSxDqvG0M8ibeqgft+tOF?=
 =?us-ascii?Q?YAL9r3GP0DGnxgYspgl/4ldu8kr0YyZLttbbxAUwl8WFkSj16acanB4N1Yxs?=
 =?us-ascii?Q?Wx6m9M580vTR0nLrGQ4jUFhRir+weEDNRsaaxZ3eZgXvU1vk21rhaWE63aIn?=
 =?us-ascii?Q?mROWOeBaVkqr7zu4Tg9JuEfdd0pMklHMjNo+7T0MVMAbNgsnnSpq0kuE6PcN?=
 =?us-ascii?Q?Nth/Oj1esaXBcG+5keJLbLwouRhA8EkZS83vrrIlF/MfbyctAh9ZAZsY7Yj0?=
 =?us-ascii?Q?w78v2segANX7aEk4VYwFPUMgx6lybmZgOvxdp4TKRoqCSAjfaYIlYeDQ/bwV?=
 =?us-ascii?Q?tMbpxOgFtYH+MXPXVCNU2zJHVFXXtjZ4kpkuwyoXNaJA4wwq6IEiKfCIoERh?=
 =?us-ascii?Q?9F4O//IvUP7wR76HA0Lui5eLBki4WtAoTjRED4DWWPPV5p37x+yCXDOfGid6?=
 =?us-ascii?Q?a4APnzhTqEYyDHLj69tWMOCh55SE676SiB2tWhyeTKN7JdLOAvobsqzOHSMa?=
 =?us-ascii?Q?lxrX8ABT3H0X7d/nTiMn+CN3Wu2vWytvlRr3T84ILgKe+wr+htjbUeabRpcp?=
 =?us-ascii?Q?PZt2WBl9mTxvYb4tXbc9kFHju0kenaRyneTmju5aTIDkHVT2fBIXtKRUfcKa?=
 =?us-ascii?Q?umzR07JAKWnNzw+mizC70UXp3z1J96wGV+U0Cqi3?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR02MB550905E891B95879D05846B9BEF59BYAPR02MB5509namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dZ+YpwGox1B+fdPPWH46vPCabPKoZMJRUUzHyUzUgPmWdLqi0WYM67lt1b6ykmiIg0S1R5Uu4rUqAdjtgtOmEo9lLvM2b4M13urlj8JbWQ3I8b9aQt9RRT2GElIZBxJSY/iTg2S2QzQkCi0xJRZ/RtIOhgaJGWMiqFtktUuosZnd9H4XdM/87W5As3PFa7fq0nqN2QxaIOX8kvmVcFB0h2lmJ9B4uW4xqgNy1VENcF+D2DhceHJE6HuHHR7aDGYz82Wipyp7Mf6+CytMDX6pE/nudnWIH0U5GsukqVuIUi5kpgWeKAyeMcZH43G1gbXITAC8H1uYAmkvNeiq5sBYCdeHXHl6uXb+vmERAbDQX3+ZuD8Ne9ZbokPF0dkhyLaOVi04ya3XJu5VLybqAAPIke83g3mTFFyKeeYcSel7hJ+EiKxf1Tes2+RYdUVuAU06KJTHSA6Cp+Tg0V4ae2bpmaSywmo0g+f6S2syXJIib0nma2U7Ldf/h2EqmrMnNVC3SliZy9lBVqEMOAWhR3tpuHcd2Qx1B1infDYEMm/bVRs0FZ00SZT3q5ocqqRmE1Z1LvfSnNHGHe9wO2KQ9Pt6vQGk6D+oxhsLkBolTsFliDvoRM8TKIaSe9UIFrSe+t3lTg3S3LI1RpKnUceplYuKm/EV5b3lnqM83R+5rrt7+xELNSeJfBTG5QJ4brndlVYIVSgg6nJL7DQbUps3SafV5zQCCC5WltPQ35xqEWg0D7XcLINDyv7Y//06CHUoYUFeZKrCTWNx38QrJpZdYTn1J+wqJgVz3vs1cT5LRqd59Wc=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559ae2bd-c66c-4421-81ec-08daee748063
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 16:55:36.3499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QH9RJ3ygLmVEBrm4CxJrsXs3OyT5Jb8+gT2ROb6ElOjTtt8ex5MYm6KZJysmoWfyDwaKRHmRIxj1QcoaByhelg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9412
X-Proofpoint-GUID: w0i-gGV8mDhKyikzm-D0lcnJvmEn1Y1r
X-Proofpoint-ORIG-GUID: w0i-gGV8mDhKyikzm-D0lcnJvmEn1Y1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=291
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301040141
Received-SPF: pass client-ip=205.220.168.131; envelope-from=sidneym@quicinc.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--_000_BYAPR02MB550905E891B95879D05846B9BEF59BYAPR02MB5509namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ptw.c:S1_ptw_translate

After migrating to v7.2.0, an issue was found where we were not getting the=
 correct virtual address from a load insn.  Reading the address used in the=
 load insn from the debugger resulted in the execution of the insn getting =
the correct value but simply stepping over the insn did not.

This is the instruction:
ldr           x0, [x1, #24]

The debug path varies based on the regime and if regime is NOT stage two ou=
t_phys is set to addr if the regime is stage 2 then out_phys is set to s2.f=
.phys_addr.  In the non-debug path out_phys is always set to full->phys_add=
r.

I got around this by only using full->phys_addr if regime_is_stage2 was tru=
e:

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3745ac9723..87bc6754a6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -266,7 +266,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Trans=
late *ptw,
         if (unlikely(flags & TLB_INVALID_MASK)) {
             goto fail;
         }
-        ptw->out_phys =3D full->phys_addr;
+
+        if (regime_is_stage2(s2_mmu_idx)) {
+            ptw->out_phys =3D full->phys_addr;
+        } else {
+            ptw->out_phys =3D addr;
+        }
         ptw->out_rw =3D full->prot & PAGE_WRITE;
         pte_attrs =3D full->pte_attrs;
         pte_secure =3D full->attrs.secure;

This change got me the answer I wanted but I'm not familiar enough with the=
 code to know if this is correct or not.


--_000_BYAPR02MB550905E891B95879D05846B9BEF59BYAPR02MB5509namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">ptw.c:S1_ptw_transl=
ate&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">After migrating to =
v7.2.0, an issue was found where we were not getting the correct virtual ad=
dress from a load insn.&nbsp; Reading the address used in the load insn fro=
m the debugger resulted in the execution
 of the insn getting the correct value but simply stepping over the insn di=
d not.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is the instruc=
tion: <o:p>
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
11.0pt">ldr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x0,=
 [x1, #24]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The debug path vari=
es based on the regime and if regime is NOT stage two out_phys is set to ad=
dr if the regime&nbsp;is stage 2 then out_phys is set to s2.f.phys_addr.&nb=
sp; In the non-debug path out_phys is always set
 to full-&gt;phys_addr.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I got around this b=
y only using full-&gt;phys_addr if regime_is_stage2 was true:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">diff --git a/target=
/arm/ptw.c b/target/arm/ptw.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">index 3745ac9723..8=
7bc6754a6 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">--- a/target/arm/pt=
w.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+++ b/target/arm/pt=
w.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">@@ -266,7 +266,12 @=
@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(flags &amp; TLB_INVALID_MASK)) {=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ptw-&gt;out_phys =3D full-&gt;phys_addr;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (regime_is_stage2(s2_mmu_idx)) {<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptw-&gt;out_phys =3D full-=
&gt;phys_addr;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; } else {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptw-&gt;out_phys =3D addr;=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptw-&gt;out_rw =3D full-&gt;prot &amp; PAGE_W=
RITE;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pte_attrs =3D full-&gt;pte_attrs;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pte_secure =3D full-&gt;attrs.secure;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This change got me =
the answer I wanted but I&#8217;m not familiar enough with the code to know=
 if this is correct or not.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_BYAPR02MB550905E891B95879D05846B9BEF59BYAPR02MB5509namp_--

