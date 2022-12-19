Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7443B650A32
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHP-0003L5-Vv; Mon, 19 Dec 2022 05:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGf-0003Ad-9V
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:13 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGa-0007Nh-HJ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:08 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJA0m7P003812; Mon, 19 Dec 2022 10:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=3J2NROZnClrvuX5c5BEezlgW8s+8HRmDzv9cpo+LHXE=;
 b=TWuxxvnwCzYLMsDojYpQhsFVoJK6SDsaT1NtvEPgZ7oGlZ4PMC0/KQWvmZYsWIPo+Tr1
 A+I8x30R4TFs6auJJ3y0v3FuzwuOiB5naRoKsdM3JjWG5D96I7IudTUdwpWjGa1Il/E1
 0PljYdC3W+z8pGe5ee/fHOlFYhQCobYgK84vWq5UtJwlrDNxR+35zinJo4CajGpXr4dP
 jYG7IisNuTFe8Qi7QxZzi7kL/Bt8uAzEqkzhRsrqOwpGOU3XN1HLcazWskruzsR74J+4
 Z8aAD2dv7Fh37qwF1EhMvJBEs/0Izgc1g525yvUnVl/Kimv5XNCaQQmeDph+DuFOdCty EQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301hdgm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:20:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3QDYyHGT8XP8Y//iauGY1TxjB/wKyKEY0mXo+VbzjJnWtsjta6CwfKNY2ZFjZC9fq2Fyboz3f59Bf843uWI1I6CQWSdMiSB5P+BcfSHv1sKivaJTPjgipVmKw/ppEH/eeCuEayDjcW2WFqp3EWwf7TjJvPFbEU0XoiVxZRwlGuMdXl5wfy/LF/SRzg9QYhyyotH97BvXgRAs/3BAq1F4FWwQO7GN5/pphKmKhTiHcaAVuNcaH/OOtKi6/bui4UINeuANav/lly1o1s0RzN1NbW7A6iPsRLdHc4EEvaMFlmpOrRHSP0kFe6vkpRzMlzwL6Y9tDGmY/yno8AELIC+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J2NROZnClrvuX5c5BEezlgW8s+8HRmDzv9cpo+LHXE=;
 b=L6eJ3YKNotJBPxJ4LnMUSLO2Ttv2gKwAmR7Z0rzM7Gcu0gDMMT0XVy9nGxpdpHj87JtkR67C4wE0B8Ty0hl5nDRlCokCrTJvKEOlZVa5jrVbGRCAG4CBeyz9gcm0ZBY0TEYqBnXDXQCY0yCkGyeL2HTbnwT9OpvQisYOkRKjqeRss23JcVwgJPYARryEyyVjU8575syVGln9bvsSbFRmr7isnd6LSnJ2a1dVfqc7rsGmNlo8MCql3O5jbqSA65D34XZs79uB/z1YORmJLuOpDbHlVejQFDzAvu3IJDOisa+dal9iO7rDtFt4RvyRg4D3813FAAmZyyS2SWuvUMJVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:46 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:46 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Will Cohen <wwcohen@gmail.com>
Subject: [PATCH v3 01/17] qemu/xattr.h: Exclude <sys/xattr.h> for Windows
Date: Mon, 19 Dec 2022 18:20:05 +0800
Message-Id: <20221219102022.2167736-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e128311-314d-4c1a-bcfb-08dae1aab17e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59wDUlhYi4CVIKr97v19SHfKAX6XI2KupiaxhpH7FDMdF7Fn2NN6nFzJWBzSvshaHqyl6+K0Swq1LrZL7omnUREkimErPouChH1RSHYlKGbfSo8rtvagll0QdjRhEDPzu2k42ijzPeyed96oQ431X8XqxCJ5a7DLTXYU3BVYk7Zv6ayZGDAJCDAwM8hQTSpgNAWOX3QzgkSzYFtutZaEwJHR8F8z/yzHupv2oWhkpNbnOkUZS8g5P7mopk/cdJnAAN7WFgFdvFHGVFDuUCOcT6J1UqoBGCQU93cU4Tt0/gNpREDRWvZvVBp29uqSfjRNZI+w7m7bScgY8y6gYwfnqvJBZ7FNYNNgARPyC2dsz654nHjYwwbkAsiQ20sPDYPoifKK7gKhF8Pnte43YFF92IUGebbTOIDCDCu+ztdmyqr/wL3J60W3yIB2DJblEEXHeoLamsVyUjCL7e01Z/sc1K9D4DZL1Q3pZ/3N6YTGjuyLmW4RKRSiDHKL+LHAu2e50f3tqmE2g3cd5Ag934VjU+Gm2em78qcOq1bjTfmvn5BDNTjuYM2E0CMUQqiPdxugvsSdhhwBVBrcGTb4r+dR/i48vc774wL2tQIkn7CgKKnYtwOoCglpcQq1edC+1dR+73/TxGM28dENdTnnZwAKuoKHfyctakTMXaHOLxY3jlbyhQPEwMWVEWSbQxb0KR4rGiRgm74Xm7Qvq6TLtLOgaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(8936002)(4744005)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(54906003)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0Rv2/Wfex3fg7LHneig8YlJNf/4RnHfCTX8+mjq3Y/k84+8MbOUOMkGrZJu?=
 =?us-ascii?Q?Ym2w843BFJ4b91fd64m2HU4vV6S7ooDynievX+eQgno15Gdgt4DMSmVaS19i?=
 =?us-ascii?Q?0NoQgllxUoX3hXniDAHT+ztECu7KdiQ1tDkz/y4oF0MKRlrDNzBKkSNDN7fJ?=
 =?us-ascii?Q?p0h4OMR56wc1tNE1sbI0F6q5IU8Rx0YG/MbvvVrsoYfrFQl3tOQa0Sd319ov?=
 =?us-ascii?Q?/vZmC68R5BLLyqwAWJ3Ehi2B1uy7IerTH9rcjUnKYjmzdnWGa9hEA3xaP2c0?=
 =?us-ascii?Q?Mvk2lGND99NenEkNcPPu+f82e/nIpGFHm0G8cDMp968sJezsLn7oJVksz7FN?=
 =?us-ascii?Q?3Ih7n9914KX+XxbHnZZWQKwlMb7dinlPbnuhrglFnpNQi81Ny+dhKiEeb1ZR?=
 =?us-ascii?Q?8TN2qlQuRnBESgze8741JWyPIp1fkRzOlXqG8rhPL83FaUvnByXqY77QAKwI?=
 =?us-ascii?Q?MQ9Vv97kiz54Vl/pQ+rdIMRixtmbiaINpQQkizP5zUXOE16ccjRlQ6jfG1Rs?=
 =?us-ascii?Q?1pIHfEykGXVUzz2ZZr5QJB5ai1fb+YuwTwt0IUV1Agbmjtq4yoKP1NvD+vJ/?=
 =?us-ascii?Q?4WwGr+sUoDXeaOa61N7utzyAKWzGdGRX6XjIV9ZAaUgkpCmg1dKz3wqOrH1+?=
 =?us-ascii?Q?j2IWGGDiPlLf4oiefhtnJtmOUni8RvHIf8fN6Wlm74STuBMu1+ScKgLmvyi/?=
 =?us-ascii?Q?jzlSQKEnSqPrx4k8NWgBpX2LOGWP2Z0gVfJ6yjVOGI0tyTGW0hQ8U3oIX0yM?=
 =?us-ascii?Q?CVHRVsnfo25v/F4gnSDtyN4tcdmKM4y+fwbJhKZIAY8KS/AOxjN7rM6KwrZF?=
 =?us-ascii?Q?96GpG7U53lbl3brEIQLwM0Xq/kkqn8M0bd9PdGszKZNQLOnWDbbN0tpNCxLF?=
 =?us-ascii?Q?k9f88+ifdjxJSkUju7M0jHeBW34wJN06MFgGD6g0ZJVfjQS/TSlUf79OUdT0?=
 =?us-ascii?Q?4NGtu3oPaTChpvSFxFFaC2+/I5uyr3f40wdZrcYXxV4e09QEzDAeWOE9ndTy?=
 =?us-ascii?Q?MdtB16+puN6btSzcLFlD7SQaysEV0L1SnkcbwOiML0TLyT5il+/SBcrLMFjU?=
 =?us-ascii?Q?JG/GOB8Ap1cSC3Eszi3LG5zZmxeOLGiQNhO/845g32V+ZxpRRnpWrAMJc3ie?=
 =?us-ascii?Q?DsmJpovntD7qwaoitdxlo9zPTqrFL0v4uhs5LHyaNGXXxgmmyeOILOkgIbNv?=
 =?us-ascii?Q?ANuoOb4sGcHC/PXQJPpsTOnofDnF+7btMIVrpl/cvIvH5GZnDJh+Ow14dQvQ?=
 =?us-ascii?Q?Xl8dQiJuVcD4g1U9GbKgCcvHbZ+RC8AKwfIB2OUVO7cKjwFxmCBiw41pzaRX?=
 =?us-ascii?Q?vgRdON3bZuUHilTjetnV/j2LEplYkPjbyh46LWIbyFT3nS7PXamGJ06d6Ez4?=
 =?us-ascii?Q?r2Une2MWOM4DVzbZlTc5nQ4erewHcbQOsMDBOFdYlnt+0qWNc0l3rbqv64fd?=
 =?us-ascii?Q?jETrydn1AAO530tzMfOv6tgSmY4IfQos+bD5Zv1ElMoCKPdliEPu2QvHr7mn?=
 =?us-ascii?Q?Omu0IBLZ1LN/p8tFCIy7mxXYLE2vtFvaYt3V8YUSp7Zk6JcXLq6ZEDgmEvKR?=
 =?us-ascii?Q?VPzZoMIJNEyCZ3IfUqOXE5MoQx263E5Y5cCqJNvSjzOzJVi7pSaUkMi2wm3G?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e128311-314d-4c1a-bcfb-08dae1aab17e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:46.8360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03vPqkrrOSi0xFKJiRfWVxFS6bllS1x5MHYUQT34Z3u3jV4qM8EQQVenxBu0LNP2+fWKRsEkiqbBW9XuAlUDxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-ORIG-GUID: a_Embh3W71v1dyNB6qBa4aDQhfOLCnrq
X-Proofpoint-GUID: a_Embh3W71v1dyNB6qBa4aDQhfOLCnrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=679 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212190091
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Windows does not have <sys/xattr.h>.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 include/qemu/xattr.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
index f1d0f7be74..b08a934acc 100644
--- a/include/qemu/xattr.h
+++ b/include/qemu/xattr.h
@@ -25,7 +25,9 @@
 #  if !defined(ENOATTR)
 #    define ENOATTR ENODATA
 #  endif
-#  include <sys/xattr.h>
+#  ifndef CONFIG_WIN32
+#    include <sys/xattr.h>
+#  endif
 #endif
 
 #endif
-- 
2.25.1


