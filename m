Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CAD47E09F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 09:54:52 +0100 (CET)
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0JsA-0000ne-Vj
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 03:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0Jqt-0008QP-LK; Thu, 23 Dec 2021 03:53:32 -0500
Received: from mail-eopbgr150115.outbound.protection.outlook.com
 ([40.107.15.115]:9094 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0Jqn-0004WP-9F; Thu, 23 Dec 2021 03:53:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQGH2O4seykeCmQRIkx3uoToeRmGE+shkOWBxx/BXdHTCyyErEEMr5TLJ9olelW4oiRMmk/GwaAG4AWKsh/2huSn6Z4jI33rPRCJOD6B4IpFpfrSd9fRdY7OCX8M5qw8pARjQpclVEo3M3y8ZYaFnD4YfFplQ8gmuCIeNXMks6TRg9Yf6HZMCXAZqeQplj5JSzsDOyGOQ4epZ2fqyTK4HoVkfcLUgMnOps5F/92MjISkoOWiq7BmaVZiBl8K6oMKcsaBut/k5QnUsT+/wwjrZF7r7rUz8ljjL24eqMOvW3iAzxsVfxZG7d6QCoe8VgZhB+Iv8/0E6stGZb7vtK2hDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q+ebd+lucWaMqpbTCMZo9CLMOb1bmrDWSsWBdoqP+Q=;
 b=iGvaFGaM0j/4P5CtcJVDDzzusCCmE1Is//zUqrUu6KkHGflW70s4uo3BCoKcttcUXrJl1P+gTk8IQLsIBVw8aYkVl3GLKxq2htuKfJ0PloKoijXPPzY+5W6JyfSH3TjXMdAbeaT3U06LZP7uh1L48MdPfJAOWxbui9bZFQTTpiuAOZR0z+lX7l9Tq5okT9EhGsVQOizmMpjKLql4En8CsTxsuDIhUyhKt8ydhbJP1xk+Z6tZnfdwfvPCx/l7fo0SdbMl/AfxJ9dgbBLlp4QcuAaEoA2jt2KHy62tr8CIGOTz3nO7mGYh16+5GNjN2Z2skJE/s7SOCe3QwB8AbRz3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q+ebd+lucWaMqpbTCMZo9CLMOb1bmrDWSsWBdoqP+Q=;
 b=AWRpevJ8N/UC6E+X2kUiIEWwQqUc1HXOG+KF8g4bA3Ui5W96BPKSFnm9V0iGQhAkTmaMXDAeHaD72L/2WNUmg9GVqpLJSFxQ8QjuEk7GnkQ7lzxuX/HilF++sn1xMM6thRZ9dnlDVZNyXaUUC+7Wg36UqgoN1FQVXYL5g5qOF5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3649.eurprd08.prod.outlook.com (2603:10a6:208:d3::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 08:53:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 08:53:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL v2 4/7] iotests.py: add qemu_tool_popen()
Date: Thu, 23 Dec 2021 09:53:09 +0100
Message-Id: <20211223085309.511450-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223085309.511450-1-vsementsov@virtuozzo.com>
References: <20211223085309.511450-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39f5ec07-5710-4cd3-3f6f-08d9c5f1aba0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3649:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3649E98C1593E17984D8DD5AC17E9@AM0PR08MB3649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RxKDVZH4K2geXL4lrWlvQsQHbmI+SVLvnO/yloNvBdgdASp5WvWyVG+AD1MC3Q+PRruQIMv/ZDmyck8JDIHRFiwoJtljGi1qRkMR1+HrP3VXF3tAhGWBnfGT6411Yk9qajXcRy0KP+7br2h5HI9dD5xr61suO4exCxzC7BDOXEhTtddd0Eyi0mRlaQJQljSg74CHDf3nz7S67gW8xjw/P35s98zsoKteoFOt6DA3rU0fxp78gjAvym26jMSZOpIXw9WCE+QrQfU/OA3CbcPVJ207/OiQTc45QVziipw+8hMe04jNo5GeKv9qhWimeakNIsVEJJKMEzGCv3h/vISPdIIDitnk+gtS0fYaDDfKrHhm4ucPua8oNVxjEY5ol2GXZSSY4y6gzPUB2XIwyN1r+Jf3hx1UrfVgtuOuhVjN6IX74yCE0zbM5obSba/hNgDDBBefmQILpIVMoqstZM2dB1BI514Pef/8mhMcSHiPXAzNLC0Ena3uHcHs4p/6K/hsHpQKq7srv9nud+zFJ8SJ5dqQSDLdCi4wPIvO9YIEHCLXDA5DGMM5jqQ6xI/TaExFOp0MRr7AUykaQIbWiIO1gMjoGCjW9TFLO6cx6xj66tTz4UTJ7iJrsRUmbZ2anmaLam2mRQUJVeC1OVlPl0wtvBF4MnqvH1gWMhjNvNrayW/TqH0KoYdeVDzQg6H+aHG0vkfUDmemGkuHxV+/oKG0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(6512007)(186003)(107886003)(6506007)(5660300002)(6666004)(38350700002)(6486002)(8676002)(4326008)(38100700002)(8936002)(66556008)(6916009)(2906002)(2616005)(36756003)(83380400001)(52116002)(86362001)(508600001)(316002)(66476007)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zd+HRk4OCoRxV9DMkPkE2McuKUbI7p/TMA1GiRQTV2NWPZLHPSkkVuIX7voD?=
 =?us-ascii?Q?hYhFkjUbzmLCJUcnooCFVHMwenMEIxUNOpDslB4VBkXWUbZE3QQjsJuQ3nYM?=
 =?us-ascii?Q?zT7LM2yhbieJWMVaHrxNm+pAEOcXL7lxB+2GZTMnhMHgrpj0VPvbPH5M/tEN?=
 =?us-ascii?Q?k5wwwZJmzSc1cxdMly57/60pqDD0J1wL/N02MlsA3Y6eT7KGn/HZeKuJtmkK?=
 =?us-ascii?Q?eX4Q7ZKgsRchhjYW+iKArI0zjdw+RYU3rnbegsADg/4efYGTE0FP2FywKA+Q?=
 =?us-ascii?Q?Rp5+mJQWZ0Qpz/xcETgQwQ6y42K9vnH659njxn7EbXdA4BaySC41AuM5H2Qq?=
 =?us-ascii?Q?KLzryiulWFibEWmBz8pAvINjPiyFulV9mSIagEGeDqA/Z598wLAsTDWdoxO9?=
 =?us-ascii?Q?p7213xK+xCg/Ke9h+Fz3zttyC+Wvkw8/uPrZF4hUw02XAJCch5r+VjHjsSGu?=
 =?us-ascii?Q?KXvU43jCptehZ9/GeiYavnbUjs7LWrj+WZZxLjrxKEwL+fAoFaehtxCt1tLa?=
 =?us-ascii?Q?kGTJmXaZX5nHhAvBEACC7zIngR2f5IdxQwt8Le99UtD1AlXalYkM7K4HwH46?=
 =?us-ascii?Q?z2HcmYkc1qkUFtvsewDquoOmru3OdhbhJ6H9Jc8W4TTuxYG47nZo44pv3i5d?=
 =?us-ascii?Q?nMzwyadP/blqNOEusa17y6bj/AfZNICFE8E956VR+rJQdjNiD+vvFVQJrueW?=
 =?us-ascii?Q?FK9JaThPPvwSAJoOMlAWgvWwDwL5kENp9pMLbYlCiF7T/MZx1t97gwZ8evLI?=
 =?us-ascii?Q?spXWUBaqN49la5JMOJZcbASrA3scWQm6TgYOUd53cO9CCQLUyM6F6UO13oXY?=
 =?us-ascii?Q?9zsAoQ/UgibnYNS0hYPMYlwgQ1Uzuu5ZUTWv7SPCFDMM8jrffrgDEuaxeEyY?=
 =?us-ascii?Q?NlSBp6tqfyoBBfgjUt7HiAFAOUJGurFwLBzNm63CswZJaP5kvFpR9oHTdG29?=
 =?us-ascii?Q?EmyZeeLk810CS6XabRMKpRWYsz7MG6GkKYhOeZpkLmrwgjCAcKeLypAIaAEq?=
 =?us-ascii?Q?8pk9g8arfn0FMbf8ZyFBX0/Zo4DDTKjbP5qx1j60s+o/A8j9d2IgqAaIe/d6?=
 =?us-ascii?Q?8feKAlPRabqBnk9KP1Lcb75RKfQqoPbs6uKJ0PgiJDNF04SGJoCUXNOgsLCW?=
 =?us-ascii?Q?0nTBTDkrqLXHCz/CZKkl7qgqCm1hq41S0FNAF52x48rg/9SruvCb7zmeQRut?=
 =?us-ascii?Q?NwEVT+CtWyZKGM0WkO4XHH9AFQBfapLmM+uqBLQOEe/ms5Y9m/NZGTwOmRea?=
 =?us-ascii?Q?0F3nRHzetgtp3taZbYiUzL97NTg7p997WI5DPOZ1eyNZm2zP/P5dcejsZgdY?=
 =?us-ascii?Q?oFvhQMmuO2TcMFFJsXq1DxbbnBui1nIfKFRp59DGz/zm+W4ebLho1Qx8X5KO?=
 =?us-ascii?Q?umxudHm0MKsuT6GDgxnZm8KX6t2DhNeBQz5eztE5pWvI0XmhjGW8iL+RCFkG?=
 =?us-ascii?Q?CEzelg1RLXBELyPO9l3qmG0bbnuOeV/2p7fP1MZVBCIIXKZLqZhlazept3ZA?=
 =?us-ascii?Q?MjXLKsW0Q+8Vj+WaYgiBwSm4H0IulInJiyVc9bneG4b6AQAA9ZHnb1ta3WSe?=
 =?us-ascii?Q?Q9cgZhqkxz83JxTSqZbml6CgDdasUMLGswDGUYN/Z2Ge2AWW2Dyct3zxUAY/?=
 =?us-ascii?Q?PbHh+Y1Jj5XCKPpzWtHHHGgfIBVksllyx4eYgJiWeeUsPYPhRf7fLjrdtPyS?=
 =?us-ascii?Q?vyEZFz2f/mPtMvC7cu7Zs9QvlRA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f5ec07-5710-4cd3-3f6f-08d9c5f1aba0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 08:53:20.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcvNnotvVvT6SZqyKQGm436J/KJhUAncAcS5sEFMP0q5S/wMfpVQWNxBjNtVWP2cxph2SLzCnB3SR9o97SgioWympcwqdmq8QWuOi7Akp9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3649
Received-SPF: pass client-ip=40.107.15.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split qemu_tool_popen() from qemu_tool_pipe_and_status() to be used
separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 83bfedb902..452d047716 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -138,14 +138,22 @@ def unarchive_sample_image(sample, fname):
         shutil.copyfileobj(f_in, f_out)
 
 
+def qemu_tool_popen(args: Sequence[str],
+                    connect_stderr: bool = True) -> 'subprocess.Popen[str]':
+    stderr = subprocess.STDOUT if connect_stderr else None
+    # pylint: disable=consider-using-with
+    return subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=stderr,
+                            universal_newlines=True)
+
+
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                               connect_stderr: bool = True) -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
-    stderr = subprocess.STDOUT if connect_stderr else None
-    with subprocess.Popen(args, stdout=subprocess.PIPE,
-                          stderr=stderr, universal_newlines=True) as subp:
+    with qemu_tool_popen(args, connect_stderr) as subp:
         output = subp.communicate()[0]
         if subp.returncode < 0:
             cmd = ' '.join(args)
-- 
2.31.1


