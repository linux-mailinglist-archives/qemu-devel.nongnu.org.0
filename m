Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75061096A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:01:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHS5-0003op-4L; Fri, 28 Oct 2022 00:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHS2-0003oP-6V
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:38 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRz-00029F-89
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:37 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4wYlv031901; Fri, 28 Oct 2022 04:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=IE2+Kskl72A7NBUYFPuy73OT6go3GGDQv97QEBEsIXs=;
 b=E6qBlPQQkElJlrw3wdtP5fA1RoDzYADHveSR7cv3MLASezNnmXzNS90kVkP0NqFVW2yl
 z9Odjhp6Ha6ldcvqTGlmDy1j0Y4PN4CXD3pNTDLdCzPK2RDSbRxZuDUvT/zZM/SC7vXO
 2/dFDCjmJrhtAWkq+qwrfgmqETTLoGPbXtjRU/B7bpoTOFekjks+Lzs3wHA3dx+IT84X
 A5nh0KBDFms7d9BmlrWpEZd1F6PWafJWQFNwgZ7as9pzlgZPBsvgDcPIqL/MWWbJXyEf
 +D81hu5XXYHoG06meAgJ283W0+JHJE+1iqp3j7anXW8OfC7IjlS0tkbpI4SaFydeOs9J 4g== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3xh310-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 04:58:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ/kyHhZeYSU34dhJ9ygudQAnP2f1mwMZYMGJaGSIr9yxIe4I2ePwcvUF+p9T9KVzi0cTEgcrwW8qexOzLFIXgZEWKdZiJ5hXEgxi/12JsrzbnrbaZw7ixlb5hSxpUKPcHG4vklC6ZxMyNj4SVB+OnPjW4hmbFOc3NUPt4pS0mYHtVQ6ycHtzAS51WkHRxLpuLyGdoPWUu+ETtiNxC68bkEhC2yrpfusal3wWaU0t5LYgfLPczqiGLMSsyk5Lf8/2ULtuJbWosfMgeeIslHwmF1tdiChQjWW/8m6LshABJb5pGBpI81jewGClbOwT+qu7hJxzGovfUi0OzO1JyPlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE2+Kskl72A7NBUYFPuy73OT6go3GGDQv97QEBEsIXs=;
 b=ErG168AeI4qvjQG6C9zjqcshZagqw+Pad+MOpoFkXGKuiUMiAqBjHQRt+lnWcvRt3KyOYN6TPvB/cVggRraecoQopfoGIcqS7PHLLVodiIwS8JR3EhmoNlczqnx9fev9qZIxK55mpLLWUVSpwW+RxNqJ5fS3WyDEPd4QOgUH4D2z4QpFg0m7THQAdsu1VgLZydTc31LmjkwAqdvvBpdv3zq9V1Pwfd+hNOA+G/J4FbzrmQ9VTPGBZJpAhhAgx1Fey9avzKBOWA7G25uWvrn8ASVQKckwtywchDrAsZL3vmIM9Ochs0TkN+yQKf3JVa5OQxnZn1pu5XwS1ZkUGwtCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:32 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:32 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v6 10/11] .gitlab-ci.d/windows.yml: Increase the timeout to 90
 minutes
Date: Fri, 28 Oct 2022 12:57:35 +0800
Message-Id: <20221028045736.679903-11-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd20d82-729e-4b9c-4cd9-08dab8a10fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5GSUpr18mNcjcgNm4xMkF/6ZhCFhgyz+zezNn7Ax3lyjV4tIwnnh/ZEAv+/19zMch/R2B6xmjnean4IoehUwgvBFG/oTx8Dsn3DL8nI3kJRbbX2bgofBlcMVqgVeoEQSUQmaBMqcESgpA8iCpfDmwg7IRvjn5f6F1+LjdUlGcSutoERF5CuqY6g02z85qJFzFukwV0ZTBe1+ceHjyybf1mEPRprxXIeEkt6iRenLlaZZfdRxtWoX0LXpwQT4GWXFoO4aJUFlkvUFiP6yxg/JwKotlet2nOS4MOFIcqO4S2RIQcvHvZeCGwWlkl3xPteMM2192dbQP38CLSJvY4iCRMS/0LGOCSEofDcD9st23If7HdubjA3IpQISIRjfNilh3FyQ74NGDGP91ckQjF5TAo9UJTXhA1Z3V7QOUZ7IiiKt6HTwGxX5PKszUrSl7J4G7d8Hdtn6KZW8Rep5JKlkg2ejELyTapIvjXiecWJU+RiOUw7YMW5/j3XV0JOjWbj13rve4rtY8f8BcAAQX4iy4djXZeWat1SM5e3JW8Zs4HsDn4YWR6HNIiN7Ai43AuAmNrnBsk+DHGS1vI/qzVcer5kOPdeg0dhYfcNI0PyevSfzZZM4L9OiX+kBqPioDpbf/FQ9duW9Kxgqs+nxRiK3seatzi1i83aia7gXE6mWzARViYYvDGywoyMCfw7r3LSgJL3IapwZEA4qkrYGGhEIF80bcKVjpMOvtg3tTZj3FNhznegqW/uLSLtLg0b5VG5WGEBXBpchPp7Ofj3rWzfIUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5cupVAsokwEfHDs6LJmmsV7Mp34tRTUVzt3f9J2kGE2T4X9GjF/zF+YfCU/o?=
 =?us-ascii?Q?SpXo4Acd81mYKZZYKvt2U7Co8FxqsWyy6ChRpo1KIZS/qkptj7QvCm1RDeAo?=
 =?us-ascii?Q?la706vb/P0LhkhEqWwswUGydg8S8BvUzhqz07YTrTrs2AwEdzkXvoQFeW1kB?=
 =?us-ascii?Q?FFIjV2ed+ToiZrwvYeqZQmXNj9eCXtd3lWreiur1eP239I4XCuq2eOgD6Pkb?=
 =?us-ascii?Q?nxRxV7bNwCuX1Qr5dL1T0+ktv+vyATjmbFCk48Q1TjLMLTHyzmWHEzuQ6ESa?=
 =?us-ascii?Q?woLLcGLoS5kvDo9HnjaSy+7G4YcoD5YI3m189Z+wHg4tVZ+zrPpj6yIflTq1?=
 =?us-ascii?Q?lQzbBpmkEKe7D0S92wuDJhZLv2783F2Y+XFXwSzTVF2O1pKLalholvy40BB2?=
 =?us-ascii?Q?AMIrO4aoKvR/FRsnIzKF3DFG/Nt/3b+TmFcX4nH9Qd3gp+pR6GNDdW8jI9//?=
 =?us-ascii?Q?TY2Iolk3UjHNtOa5y3bjTUVI6J6XWDMonDlFCn9kmkiOefS3X5R66fvhnajN?=
 =?us-ascii?Q?6A9UanUNGXPrdfoR6WELBL4T/Dac7sJqA+ORhbU8rTQPqsu2FP+n7wRE7mBS?=
 =?us-ascii?Q?AZ3C2T3OnpySud7GNhvv/GN9el0oLTYULWN+5FHESp8MjJH6DhYhjxhuZQ4y?=
 =?us-ascii?Q?Bls6kjlHUUoaOZYkjrPERYzLr4fuHkbWkkmb4d3R57Kszymm/jUyz1bT3cVK?=
 =?us-ascii?Q?95iJahTZqkg8eA+CW2iMPOuiA85m3vw9ZaR+l0E19xV8gCZfG+A0xSiXSknt?=
 =?us-ascii?Q?RLRwEwFcMkjv69iKku3TfmWYOp+dwdIZ7Sljwz72zX6rqok/bS5IhQBj9ear?=
 =?us-ascii?Q?uodsqEXPa12O3ngWCdj5WWH7RAmkJHTS8cSTp4dQR/RaXS7EGqn7V5+MuapF?=
 =?us-ascii?Q?h4cLA3Lq42CqyzyeUJlkZ7cJZLekOylrHfY0Bl8m2A18veyAbfQJZW+OITrA?=
 =?us-ascii?Q?H3pBXDjFh9TPfBBBn7eRcBBPljw7lluYzDiYUSzNDdxj0s6TH/StwZ1pZeFl?=
 =?us-ascii?Q?h2kgVzOX075O7CO5hDaYEyaAXO7ainjGf4sMZg7iFQSC2eJmyz6lIHGVbfbs?=
 =?us-ascii?Q?quJalC+BdEKFj3pNdX0e9e8uzy8ZbzqJOL3Bkvgmyt9hsibs5g9mvYw5XFnl?=
 =?us-ascii?Q?qgabTACzmyjt8ymFtlZfPHS+IUMJS6pOw2JbYSPfSUCG43WR1HXVr8KTtmI2?=
 =?us-ascii?Q?OwUmny5IJgC6TPjIAWBHSGNXA+68Auix7yrwdOWIGUCOU8fyDTioaz7QipM0?=
 =?us-ascii?Q?9Shj9s0yTfvlZpAGgfQWOajfIgdw+eTIVBnGWgNsUPXgiT43QkWPIE0I+GeG?=
 =?us-ascii?Q?FwX2LaUPiqLiT7XJImVu5/Ap2I3EFIJEaPSaYdSr/F96DAE4tdi5zRaMyUTJ?=
 =?us-ascii?Q?GgYklRn8WytQhNyVfgVcqtz5YLTAlwYs6xJnMNdLI4PTAaLRfiDgW/0JRf+F?=
 =?us-ascii?Q?wNdqZ9GPQmCJWLvaRfBi7Vr8zYRz81yS5b/lY5/PZ40dR/+w2zoJitjtTfV7?=
 =?us-ascii?Q?JvCoI7IdykfkxEPQ9EGkA4ZQ+yxzqG2ITUneTV4LBkKkMQvWG23IwULbv3Au?=
 =?us-ascii?Q?fQmHkQqkcha8cRBhQwUD5NJgw1Mh1G9dBe2HkJs6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd20d82-729e-4b9c-4cd9-08dab8a10fd6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:32.5824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6B9VjPOPD2maWnRPDCr5QZHcyQE848SneqeeSHSSDQTc3h2RqPtorNPctBES9XNUIN0CTxeEbZdl0aCIe6P2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: NKYTTOPutp5LdxCks51iYqGiuy_1hOIJ
X-Proofpoint-ORIG-GUID: NKYTTOPutp5LdxCks51iYqGiuy_1hOIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=847 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
changed to compile QEMU with the --without-default-devices switch for
the msys2-64bit job, due to the build could not complete within the
project timeout (1h), and also mentioned that a bigger timeout was
getting ignored on the shared Gitlab-CI Windows runners.

However as of today it seems the shared Gitlab-CI Windows runners does
honor the job timeout, and the runner has the timeout limit of 2h, so
let's increase the timeout to 90 minutes and drop the configure switch
"--without-default-devices" to get a larger build coverage.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v2)

Changes in v2:
- Change the timeout limit to 90 minutes

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index a3e7a37022..093276ddbc 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 90m
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -60,7 +60,7 @@ msys2-64bit:
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
-      --enable-capstone --without-default-devices'
+      --enable-capstone'
   - .\msys64\usr\bin\bash -lc 'make'
   - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
 
-- 
2.25.1


