Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7096B610980
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:05:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHS0-0003o2-Hi; Fri, 28 Oct 2022 00:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRy-0003nf-5e
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:34 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRw-000295-BL
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:33 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4wVwv018028; Thu, 27 Oct 2022 21:58:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=pupwfqANM6SYjHJ+RxVx1vpyVHI+kjVmJpVUPBItn4I=;
 b=JXN8EqfMQzd5A3kX3TQi5hl4xkEudAWvMl1RHTZxde7K4xur6uzNCGwhQG79Kvi0yvKq
 b3+0P7cdhLZFXJR+GbVbrZXlErWWsO10U5Ln37tQ7RZHuujcpxbK28o5WyMNINpe+28H
 b35u0gx2ZemRCPKyDePN26qTXQkt2fp81q0dH9Cwj3DTndtX4140qQwadneHt+eIsXuB
 0S3sMYr5xKirc9GNqDQ3zn4uWFrdeH5lOWvCHKkf6i57EqsvdNiWXWP7r/acWBv85t1b
 u0HUNo9e9YQ403CHRI2EjL9lS34J0/YbDT9pD4leWq/Wr8EVAUhHYQ2MvdBeasNMiIH6 Vg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3gs4ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 21:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iD/w7C+TUeYJM17UTzZhdNl6WNFXWw2jksO15Bprm7r8Q1WEVZmemPpvXEfzon+SDMWXifOfUeVk/OfcnEYeWNg+R00hwC2Y+uuN4WF7ytaV8iA1lM/Azj0Nba1xybGvxP0ABqBzMscukSrqc1QkaealLNnKIsNT8HLPNGMjGo/DR64axI+wxUpqgK5oGexUHA5QajJAHgGgtRKEsxZ9rbWUsF7mKiWNMFZswi1RyVtFdShlW2gzVLq5t+pm2boow/KfWELBbYQz2nqUCn+P2KKQQHiULbz8LqPBOjcCyepIkshQTQkXQMFrE8GZHI5kRmHsyVo+iNIgbH9A3qDS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pupwfqANM6SYjHJ+RxVx1vpyVHI+kjVmJpVUPBItn4I=;
 b=SVASMpZ4oYX16qZKXczVTPtBIH1ZKWkzIjhbFLkLf7i4IAnhryhYXLfN4VJ1d8h+Q66MFb2dRGpY0jJFsptoUkxAlAsgzZDa6mM/57ib5aXmBsUYCxBiFdnuvp78taOXCN6CzqnjMoSfy6tPByWsKmgUf1aSPSWhIlWN24qgnjIxroVKgO+PjlBVIhKckjlVuscHuC1qUBoB/S03hudrJY69jshFUUW/zLbl94BS2OzHMNluGF3rDbniuFGpGnmGW6amiH7Hi45gtQNho/4trynK4hkk9jz1GW74LE0n+DRaasIt88F9krNGrzsfw8/jUtrNVSqQncTzu7FQc1qCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:29 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:29 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 09/11] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Fri, 28 Oct 2022 12:57:34 +0800
Message-Id: <20221028045736.679903-10-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc926f4-1e5f-4b4c-1b67-08dab8a10df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzxpbHVuvG2baJRc1xwmGWYZY/749d1+4cuBQylEZYS3M5kp3jRUGGGaSN/agOMo7csF31SL0ohdNYWgZpCnu9fKDGh2iXyJ+YUnv5BAm2qrAzP/hxg2c8mjndHQ5qclXYT/4zfz7DD9FjCNoSLDQWFHljF0AnY9Y1nsjRKAU6TFo3P/y1EbbPXw2RRofcM07fR390TkJb3r4aObz3Ep0gNE5Qs/uWDYTsewKKlTirJXhIU1T5jMmI4czHt7+0CMvTVnq8fI+2XdbnojbJ4rPOPHEpdTmY1qcV64sI/AcjhjTXDu3zsuQi75TT9SEIcHQye2IDFtHsZLjcM1oDU0YF2ClGX/mjFKe1+dLfOFgcB5XAWHvTTGRkYIBOz9gclRE5hyy5qJlPPXiFxO6KA1ETLig+KxqdRxfGlLOsz2BWMX7yYoFhCq2dzwMvke9iWttMQ+JAamyfyEz3j+FzCV5J7DPXukxnuWikjGYFIuNRF1DK+7GROEWfZl7ShN+C6MyMCd50UJzaocyUIdQ1EWtcgx0KAtzthpplFTnhKM+sFu6EYty7VdcvCiWviYGvWq2Yr53FDnUJWTzkN4VGRBnlU3ziPfjc12vJsuvecDuqR6+x2rGjvcUcwhsDTAXEs4D+PgHEhHQ192SbXFLyKt6XXzmTu5UZ9LLLHjTwx1OlIynVvq3sV7FM+pSXcRC1he1zZCko4uvvRpc0ca86P1G+J1ICfQzOusNu238nXqS+9AhgglHoaIec+StBrheK5hw4KVzDiBKCbQN1FORnPTKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkllTUNlZkZyNnRVZHFydmVTWUFybjdXMFhDcENNME81aUYxYkdUT3FCRHoy?=
 =?utf-8?B?T0Zqd0dpV2pWVzBWNjRzbnpkMG1MUStXZ3RKaEJCQzhUSThzZDdvc05qdW93?=
 =?utf-8?B?V0tRNkR3TjkrNEp0a1VKLzlsVmRtSG9RSys0eEd0ajFpTjNzU0M1TmpzL1I1?=
 =?utf-8?B?UzdGNk1PY0NSdEJyOTY1OFdqVm41dE9JMWc4M3F2Z1FLWFdmSUNrb0F2VGdM?=
 =?utf-8?B?eVhLZTluczZyblgrZWJDMnRmcWFTQzFxcDZpZlJmTFZ3MWpLdjV6NGtnVm84?=
 =?utf-8?B?QXFXelBSNzJKVUczYVBhNG5ZNFBQZUIwWFh4WjZrb0J1d25lN1QxSmxNbW5P?=
 =?utf-8?B?dWhaVVY4eGxodUNkWFpWbmJaRm9LMXBUd29Qa0c0bU4xUU5iTHlsa2lLQmlK?=
 =?utf-8?B?QTQwajBYc2xtdnZLOTFiMytKT0F2NXRSTitPYTBZSGJTSmh3M2FreVovVWxh?=
 =?utf-8?B?OWJyMmZob0QyYnFWQW9WVlZRN1JrbDJZYXluVGdFVEE0S2l2c0MzNFFyY2Nh?=
 =?utf-8?B?dDJIVVB3N2VTV0l1NExFOTNOZmJOeWRyckExMHprVlUvRnowdGlQRVdWeXps?=
 =?utf-8?B?VVBKUllKRXR4elFhOEZNbWNJOTZva2dSNFArRlgrOTQwK1k1bEx1QU85THNC?=
 =?utf-8?B?VjRET0M3MW5xYlNlQnVZb1h1NWhLenA5cyt4QVB1aWRPdjVHMjRtVEhiVmp2?=
 =?utf-8?B?Vzc4WDIzcjdjejVSTHNISi9iL0Z4LzhmZmdwQWpUT2dSdHI1eWlJZTZMcWlW?=
 =?utf-8?B?OVJhdHVlNW5hVXNVSFJtTDd1VlhTVmN2RFFVQjZDWDhLMGEwMnFjNVFrZVN5?=
 =?utf-8?B?K3o3OHlCU0p6Q1ltUXNKQXVPUEZQWnR0aHVwTXpwQlNuWjUxYnVyV2gzZGlM?=
 =?utf-8?B?OGlkZDVUY0E0UFpnbWZHN2txK0tPN2oyU3EvTXV4UXRlek1lN3dXTGg1WkVp?=
 =?utf-8?B?MllpRU40eUcyMDRGWGxsUFpzMEk4azJPTFBYWHdlZmNVU1hxSk9wMEZSeEZs?=
 =?utf-8?B?K1liYU9aaGFPQ2NsNGxWUXh2eXN6ZUxKRlhqOVJUaVp0ajBvYzd2V1pQQUts?=
 =?utf-8?B?QlpzVTJRekVVZk1qanlwT1NWazlHVkdmR0ZpNG1qQ1F0QzZYTTd3K0tleGR3?=
 =?utf-8?B?Z0Z0RzVKV3BORTJTNUg2UWwzT1M0QmtWb2hBcndWNVFaUUxJdUlNRHBOMmRz?=
 =?utf-8?B?SEI0Ry9SWFRzNEs1bjl4ZHEyR01iMXZVSHloTjMreTUyQTQ2R1VyVjFrTG5x?=
 =?utf-8?B?eWJQTW5YOEwwbnhmSnVnR0luYkZJc09KckpLQXN1NUM2aEttVE1hcFFlc3VY?=
 =?utf-8?B?c2VENHlPL3QxQVVCSCs3MDI3ajgvbk00UEdsdExVbldHYy8zbjNNTmNUQzh2?=
 =?utf-8?B?ak53cG9HMmIvR1RvaDFDUS9uN3hoVEx4WnBsUnFiMXpjUGcweGVFb01JbnBp?=
 =?utf-8?B?Q3FmbWtlQWpoZjdKMmVVc0JFdWIwSWx4WnJMMG5GSlpaeGNJcDFVTWloODM0?=
 =?utf-8?B?aHMzQ09hdnp5VTEzRkw4Zk4yOXhmQVR2QjM1WFFTd1NZTFJBTE1ubXVjQkJV?=
 =?utf-8?B?NWUwQndsK0YwbUpJNklTK0Fma3FELzRTUDFKaDBZcVF2Y0xrdzFsa1FQTnFQ?=
 =?utf-8?B?Ulc0SENMUnRnREtxSjRML2lnSkhCMDhVSmdUTENZd2gwRzljaUY0TDhTQzZ1?=
 =?utf-8?B?aDZ6Q1piQ0lLQ083elZHbzdpWGVzK3A4d1JFQ3gvSjEwckhOUlAvbnY2UTBS?=
 =?utf-8?B?K2RjODJIbHVvdXZwQWJQUHNCYWo3a2M3bGM5L1BHZSsrb3dWaUdsb0Nrb2Nr?=
 =?utf-8?B?L1lFN3BLN3h3WXNMSWM5b1lxZHlCa1lYa3RSMXBEVFhqdTIrc0Rwemt3cDZs?=
 =?utf-8?B?cmd5dUwyL1lKc2EzL01HTE1nWnRUT3h4RjdneDQ1d1RpeVR5TFpMR0k3NlBX?=
 =?utf-8?B?RkU5Yk4yRWlqaWtWQjYyUy9RMTZrT05CaU0zZTBmTkw1Mkp1bkVoUDBWb2J5?=
 =?utf-8?B?SDFZeTZ6SnBoeFFERXRDc29iU21ETENKTllCalJCQlFYYW01d2hNQzJydk9u?=
 =?utf-8?B?bXJidGhwc2FZYzk1TUNFZm5QZUd5N2kvR2d4Z1g4L2pvZ0x2QTA0TXB6OFVt?=
 =?utf-8?Q?lxQGBe6myHlhL/9PEuLZOBFjD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc926f4-1e5f-4b4c-1b67-08dab8a10df0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:29.1774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkfrn8S+5EY8dQqkh/ynNaOyM4PGW0hbAy91a50RpQrB3ZXHLy7KagL/B/z/9ZB0iZ8P7SfYmQdrsAjD5Ypq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: 23ABmq3cRudYVfdxBp8YTpqCif35qgsU
X-Proofpoint-ORIG-GUID: 23ABmq3cRudYVfdxBp8YTpqCif35qgsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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

Some qtest cases don't get response from the QEMU executable under
test in time on Windows. It turns out that the socket receive call
got timeout before it receive the complete response.

The timeout value is supposed to be set to 50 seconds via the
setsockopt() call, but there is a difference among platforms.
The timeout unit of blocking receive calls is measured in
seconds on non-Windows platforms but milliseconds on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index e1e2d39a6e..2fbc3b88f3 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -36,13 +36,14 @@
 #include "qapi/qmp/qstring.h"
 
 #define MAX_IRQ 256
-#define SOCKET_TIMEOUT 50
 
 #ifndef _WIN32
+# define SOCKET_TIMEOUT 50
 # define CMD_EXEC   "exec "
 # define DEV_STDERR "/dev/fd/2"
 # define DEV_NULL   "/dev/null"
 #else
+# define SOCKET_TIMEOUT 50000
 # define CMD_EXEC   ""
 # define DEV_STDERR "2"
 # define DEV_NULL   "nul"
@@ -106,8 +107,16 @@ static int socket_accept(int sock)
     struct sockaddr_un addr;
     socklen_t addrlen;
     int ret;
+    /*
+     * timeout unit of blocking receive calls is different among platfoms.
+     * It's in seconds on non-Windows platforms but milliseconds on Windows.
+     */
+#ifndef _WIN32
     struct timeval timeout = { .tv_sec = SOCKET_TIMEOUT,
                                .tv_usec = 0 };
+#else
+    DWORD timeout = SOCKET_TIMEOUT;
+#endif
 
     if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
                    (void *)&timeout, sizeof(timeout))) {
-- 
2.25.1


