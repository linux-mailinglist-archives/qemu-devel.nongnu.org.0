Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C0C610981
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:05:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRm-0003l1-8p; Fri, 28 Oct 2022 00:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRh-0003jV-Dj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:17 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRe-000260-Ov
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:17 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4r9ls025389; Fri, 28 Oct 2022 04:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=qcNRfGIm2ucoqWjoggKXk3tkAItqmPKDCxW2TaMsAto=;
 b=RKWHP4c9Qpdk+qKF8sEklR0Yqej9GT6orxH0B3/QzsfDFl5IzfwxvRohA0vprRY4hsij
 +JsipVhyDvxXIe/iCP5DEkARbyvKt4JsBKBpZGds7R5t0If3fQKwOZYOzMQCbKae8xup
 biOJs+ZoEiPM2An7eOtcQsEUuAtiWEXozQ8nnispKErl73jsnAVSOJLZ9vDVnJHFU6Dp
 aCfKi6XXPHx+5X7xxH/c3Fe1mPWpwDzp7kEE2BsKKYV45YQi4+E6au/UGhK9rG0d+EOy
 Yl/3sfVuT/vqkWXuh8DkuA0TTC0upDkA1RmCYs90KIA1+cPcEdzpr3avuhWZJkdWQK2U QA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56h33q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 04:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3pFHv8HB8j2G6+nNIKY/Jat6Wejss25zL92S0Q7r3bThNcvdttvjomxbsMWGdf/gEtOQwhHLgcxkAX2oXOMX515xX4/Dt84Yjc+4wEyQBW80C//9aJ6+E0WU9ol1ElQjN1G1eMiN/vrvdIPraeMqPlCNkzKn9MnzoBjvhsYbwB8lu88PRo6qLLE7sGtIu1OIex92e/A9b6uy/Y+p/FVNgTzI5nWXN9lRh9BsqbhJqeq4XTgBgV+jd6Y4Rw1K26SrMA09AQijvNWulXqDc8/PPauWdDJevHdcJyLDvZ3JeZbTbHn8v993V7H09zS0mgCD2pwp11t1r0AGM1NQWM4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcNRfGIm2ucoqWjoggKXk3tkAItqmPKDCxW2TaMsAto=;
 b=FgTKtEztN8hFvBTgg/PZ8FO/7qYhVIFRxxby1dRS0vCrVrcd+wJTm/rtOF6rdRzi/gnXH0S3y0TMxOlzM38v4gOAyCTkvti/91AdPTWbggrF64bpRvpSP+Ada2+sHzTn2fHrMznEY2JO+YkBAoNAib2xwSxPuJMUJQW9WITVjD59IHWbBlnfY2HSRhIahXnEbF4kDpIczAqhZF4GwqXJgUrzFkyKs/pzujgYODkgNw8MRBa+pZnMyUL2eeBk8Jd3pf6PQ1otNk2NZ1GjH50aBNlyTO3ck4PCzZV7H03v3W6InPvV4o9ApeMSZw8lIAUkjPLjze36YKygI2wmn5SEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:57:58 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:57:58 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 00/11] tests/qtest: Enable running qtest on Windows
Date: Fri, 28 Oct 2022 12:57:25 +0800
Message-Id: <20221028045736.679903-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: d970279d-d000-4acb-a4c7-08dab8a0fb9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtJQ5tkN9CXWgCZ/1QNavbqzLxSN0TLbe50HEpL4KBYQQLfPa6ZPo4EuQ/vFTaOzb/Mahd2N+Bvjt2GM1yGPQMQcG0fD5SyK+36jpdOJgyO5gQ2i4eO+oQXdigBkL3qhSBNMgIaqz2QwR25mseWWfKTnMpxMHJYkenEp5lUT8w9j7SrovlPEmsi7RcOhxdKU5r8mW6oKBualGd8slXUyTN78TN0bTccjGaMHPvo6lfvJFvJ9mn8zCZoKAmZ+qNdueqo/43MqHUw38XhQ/Usf0P+zg1AtfCRIAZh/t+qum5ykHyXhJ8fe7Mxr3cZwVX8ol1jlcXPY4HlokJ9SkHwAg0Af6E9AD0NlD/snc0LCdyfX+WAX0I1SS6MA5mJYeH0bL94eKodKbhKrsctpum5RFYSsZmbhhR/Nis/7j09nW81bX7+qZQg2YBG9Z+2Ve2uIBqlVp43QDdMGrcFSlDoyJhvCj1WLh4HLgjQgZcrtYodm/C9HBd4Acuo17PLN8NMU/wDvXO23d5LqpFGVqiicyVNe2tLr+qGnPW9gJIxlePKQo6I3roXkAbnjrxBu8ef4bYUMElvbKJywht6wxSyCJkRTf/YWctu3y0CPipBkhhp7g5HQ0rF9unrikzLIYo6kfgyWzo3zT2UOYGE86I6jvluuH2N8Uh2uoKMtteVcoC9FG0eT/lJCJB0fx1UMXq3aU1kuZF5dygpJLB3F0TeAqXIrQ3rDbK2Oy5LIvd+mXuhXpB9vuyE2yWQkCfTdW7pF5EI2rrkVcFzAFP+bFV8uYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(7416002)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2pNWGFFQXlDZ2lyY2dXY1dQQ2o4TklqSXN2N0xUVnVLVXl5QW9RTm13SGM3?=
 =?utf-8?B?M01GSWp3SDJzWk1kcjBVbVJ5REVsNTBCVlVwVStVT0s5aEJoOXcwNlpJNFZT?=
 =?utf-8?B?VkRud2hyd3M0ZmlRVDZKYWxPYUo2MFBuQ3VGemcrOFJjSGRrUUdKa2R4dTBY?=
 =?utf-8?B?V09wOEFoVko3WFFSazhKYTFDRVM4Z0txdGp5TDIzZ1hzZDBseldxZGZHTDBa?=
 =?utf-8?B?NW9UTkU0WEtzZzMyRy82RnhKbitOSUdRVEhzOGZ1YXQ1VmpPalYvdFlrNmgz?=
 =?utf-8?B?UllpWmZVQlJiNTY0a2s5WFF3MWpycHVDamFCQ205UFExdkhqQWN6eGhjd0tG?=
 =?utf-8?B?dW1IeTIycTd0eTdSU0NOSXJrRVI1K3NpWnpLTnlISGZsOFMvcUlFTlliZG1q?=
 =?utf-8?B?dWNRWFJTNjBMb0xrWDdoVG9hNzQwMWF4ZS85WHdnQmJtcEp0K2RTS0lhR1Zw?=
 =?utf-8?B?ZjU1Q01DMlc5b1hlSmRZc0FFYmJORGJXZmNRYU1LVjRSY2pLam1ZUXZmRnk3?=
 =?utf-8?B?SW9HZFNjV1U1RVpKM3VjS3UreDNMY1BReHk0Q0NJaVpXdk9haForVTJOOXJt?=
 =?utf-8?B?RkhzdjRFNTVCMkl6RDdXNjIvbDRsd0x4eFlTT3k1UVhmSGFnY0Jvb0tHZG53?=
 =?utf-8?B?a0xKdkFnZXpLdm1oQ2RVMlNvUHlvWlcrUVdybGdVb3BLL0w5TER5TTVYNWVX?=
 =?utf-8?B?WHVKcUVaU252cWdCbGpRWDQ4aVMzbVNFVmJaVmNYejJ5NHhxNXBjcVlld1Ax?=
 =?utf-8?B?SGVMTkErV1k3S2NBMjUvWFFzeE92WDhLaVhSWkNkOGhaMmVZNjFZYWgzbm5D?=
 =?utf-8?B?SnFxWkdEakloQWdDWTRmMkgvUTlLYTFZS2ppMFM3UW8xajZWYmJIbGd2bFVY?=
 =?utf-8?B?bVgxN1p4anZuMDBqNmFYMUNqckhXMWdYRU1EbzM5WUxWeVFaSXNiS2pRTkNq?=
 =?utf-8?B?a1YreE9Ka2p1d3prTFRhVGNzS3cwOCtvS1Q0SUNBUVNoaCs1YldoSmNjakdG?=
 =?utf-8?B?Yml6OU5HWnhPdllrVHovOE1UVXZhS3BBMXBrb0lVUzBBWFpQbVVoYXBuSEZz?=
 =?utf-8?B?dEMxWVhuZkxRbFkwSnlSYk9sQjh0Ymt2Z01KcGxld1NGVG9Pc09EZFhKZW55?=
 =?utf-8?B?cjRWSDB0NWFBaGQ4U1ltbCtuSTZFODJKOXdRT2UySnk5SHh6Y01xM0xVUTR2?=
 =?utf-8?B?ditmemt0aDYrVno1TzB0eHhhT3VVK1A2N1lFMHh0SG5QL0VtQjFCTzJDbWdr?=
 =?utf-8?B?bi9HQVZjVm9yUUNGekhVeU5wY2VKTXgyZDIyMkZYaDRSTHdIdzVKcS9veUVU?=
 =?utf-8?B?U3BZcG9EdmQxRzZ6WHRYQ1lTcWRrNDBCWnZFeUNROTZ1WkhjUEdoU2NlT0Ns?=
 =?utf-8?B?TlM5amozeVd4L090ays1QkZJeUdFRW5iMm9ZaEFjdzh1MjZML2kxa3FlOFhl?=
 =?utf-8?B?dnhweWJVd1NMUG9reC93akh6NHNsTzVEWlBDNUorWDFtRVZWbWVSQVRUaWNX?=
 =?utf-8?B?MFMwTHh0RGJ1RERrd2JVS3FiUjVtWEkySjZjTnc5UVVDaXREYm40UmJybU05?=
 =?utf-8?B?RzNWblBKYndGbDhxckZCcWRoQWVwVlk4ZXdwWnFkcldITkZLbllFRUkvdW0w?=
 =?utf-8?B?aG9MSkppeFF6RS9HQUErb1U1OGs4b1BicVloTGtmak5MZng0cjRncXE1WTVK?=
 =?utf-8?B?RU5jUWNVdUZpaWgxM0hLbEtlUGplQWNLWUdhaEJTOFFaOHRUZUlLajhuNVNC?=
 =?utf-8?B?VTRmVFM0TTc0ZDNOSGE0N25sMGU3RXJwNnBJVk85YUV5RFQ2UGo2SVBsSU5C?=
 =?utf-8?B?S0svSm5Fc0YvZDYxYmxlam0wb0JIcVdYTTE3dE8vQmJpUW9TaWJZUzMzdCtJ?=
 =?utf-8?B?RWtIWHUvTXBkaWowSXJhOGZqMEhkSW5Od29KREtXbitKYzFOVGZZbTBZdFVp?=
 =?utf-8?B?c2t6YUNmaVZ2aHc3T2gyWGo5R3Q4aUJtQ1RxZzR2QXhTTTNEOElZQ09RcWdk?=
 =?utf-8?B?WU1FeXA5UC9kZGxqVlN3a2RGSG1NeXZGZnBaNmQrQ3RyMzRBNVVEV3lLSTZK?=
 =?utf-8?B?aVBBN3pCUlhGcGNwQlZaNVA1MFFtS3FpOXdhdnFEemhpMEJFTnNUUmFpMlhj?=
 =?utf-8?Q?OI/LK8qF3adK/grZGMaFkkVw5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d970279d-d000-4acb-a4c7-08dab8a0fb9c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:57:58.4314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY+Gxv3aD9cL4oE+ZBxKRCLqhMWLrzLkYF2z31YA3Mxk+IF9SvslE2y0MM8pOD9xR9nN3AMwU66Q5wDtN2zDLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: qCL-acj5VIIqr3UgY-14_vqD-mgCB2to
X-Proofpoint-ORIG-GUID: qCL-acj5VIIqr3UgY-14_vqD-mgCB2to
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=933 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280030
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

In preparation to adding virtio-9p support on Windows, this series
enables running qtest on Windows, so that we can run the virtio-9p
tests on Windows to make sure it does not break accidently.

Changes in v6:
- drop patches that are already in Alex and Daniel's tree
- remove CONFIG_POSIX from meson.build
- include <qemu/sockets.h> in libqtest.c
- move documentation comments of qemu_send_full() from util/osdep.c
  to qemu/sockets.h
- save the "exit_code" in struct QTestState
- new patch: "tests/qtest: device-plug-test: Reverse the usage of double/single quotes"
- new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"
- new patch: "tests/qtest: libqtest: Introduce qtest_wait_qemu()"
- change to use qtest_wait_qemu() API
- new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p unconditionally"

Changes in v5:
- restore to v1 version which does not touch the posix implementation
- Drop patches that are already merged

Changes in v3:
- Add a usleep(1) in the busy wait loop
- Drop the host test

Changes in v2:
- Introduce qemu_send_full() and use it
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call
- Change to a busy wait after migration is canceled
- Change the timeout limit to 90 minutes
- new patch: "tests/qtest: Enable qtest build on Windows"

Bin Meng (8):
  tests/qtest: Support libqtest to build and run on Windows
  tests/qtest: device-plug-test: Reverse the usage of double/single
    quotes
  tests/qtest: Use EXIT_FAILURE instead of magic number
  tests/qtest: libqtest: Introduce qtest_wait_qemu()
  tests/qtest: libqos: Do not build virtio-9p unconditionally
  tests/qtest: libqtest: Correct the timeout unit of blocking receive
    calls for win32
  .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
  tests/qtest: Enable qtest build on Windows

Xuzhou Cheng (3):
  accel/qtest: Support qtest accelerator for Windows
  tests/qtest: Use send/recv for socket communication
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled

 include/hw/core/cpu.h           |   1 +
 include/qemu/sockets.h          |  13 +++
 tests/qtest/libqtest.h          |   9 ++
 accel/dummy-cpus.c              |  14 ++-
 softmmu/cpus.c                  |   9 +-
 tests/qtest/dbus-vmstate-test.c |   2 +-
 tests/qtest/device-plug-test.c  |  16 ++--
 tests/qtest/libqmp.c            |   5 +-
 tests/qtest/libqtest.c          | 151 ++++++++++++++++++++++++++++----
 tests/qtest/migration-test.c    |   8 +-
 util/osdep.c                    |  22 +++++
 .gitlab-ci.d/windows.yml        |   4 +-
 accel/meson.build               |   2 +-
 accel/qtest/meson.build         |   3 +-
 tests/qtest/libqos/meson.build  |   6 +-
 tests/qtest/meson.build         |   6 --
 16 files changed, 221 insertions(+), 50 deletions(-)

-- 
2.25.1


