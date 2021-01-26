Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A143039F2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:13:47 +0100 (CET)
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LM2-00060p-ML
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4LJO-0004BV-86; Tue, 26 Jan 2021 05:11:02 -0500
Received: from mail-am6eur05on2119.outbound.protection.outlook.com
 ([40.107.22.119]:1377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4LJL-000293-QU; Tue, 26 Jan 2021 05:11:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxKIgZ1E6CHmmTnfhHAWsUHJB3xDhUStJR6k6HHIUpBuicl3UlAi09YtRIkxue2ZcsrLQrSCe+20Ik5H++YKJ4u+J6g52EKOwwSBsFnJHRXPT9vWyV4v2KiNXX0ajI4vfUbh7+lI/qg+r4Ff+lKlSK/dqFZXoZBdTK6VW+IUmMrPqmoNnC1QfVdjctp+5avIzG7WMwfFZUvU5Pg+WndRFAxSSRMSW5f60JNjLTFdIZr0vQxsfsvKw9rKk04uodVA5vayq+XQRkEJV4Z2S8BY/30rtAEWTWei9oC4ki6caQqwNr1JbhIZgCinaToM8RlE5NcKVfO5FV/UtRaddL8z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFiRpiJVvLvdWTrIba8Jj1fi9r+/DrBQ/mlSPD0d8P8=;
 b=S4TGcNJoPw96DabNAk2RtYomk3+XuzgeBgaMP2/24hsqeCchuh+6VmVfvMUKrZ+p2hmcsswnz9JH3urCQguE54ALnaGkwl5OR+1qGbmIwotaU/40RYvveraX7R9UgEUeYK5YmywzJIKCxvuTYELsfokRLJ7S9JHxBilo1dsnkL88ssAmO1lo9KYbAOfHInHctQ3PPEsbBnzNo9Kp8C9zcLJbsnJLwxJ/T3ye5W4oUV3f7W0Fp5c783MyGgL6Ze6HiY5rp8x+xx5gktefhsGx/wAWVBrTxY3yRm7pDTC89iT2tUcLEA49HMhbb5tQmBkaFVppOoceBnnHNF09D6oF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFiRpiJVvLvdWTrIba8Jj1fi9r+/DrBQ/mlSPD0d8P8=;
 b=Fnii/t8dGl1HwFiWUdHeMZSnLMQ0aileTTI+nIJ0q/QbeTEXwr3rfGp2SZLYjReMkp9L0/OXmlxALWl3hBs6An/yGU5/gox+DKR65zVPM9je2O8c4vh/QINSJL5Jan2jjB+CKttKeZ2sv5quK9tbWGSksAufR595hEkEwhoHIn0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4787.eurprd08.prod.outlook.com (2603:10a6:20b:c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Tue, 26 Jan
 2021 10:10:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 10:10:56 +0000
Subject: Re: [PATCH v9 3/6] iotests: add testenv.py
To: qemu-block@nongnu.org
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210125185056.129513-4-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cbe3a602-f6d9-9b04-3e37-7c28fef43633@virtuozzo.com>
Date: Tue, 26 Jan 2021 13:10:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125185056.129513-4-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 10:10:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07730a54-f469-4efa-605b-08d8c1e2abc7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4787:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47879BE79BA6E6DC7AB249BDC1BC0@AM6PR08MB4787.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJdIA1in7bH+QQrpb6bvxI25uLBDDuKETW+UoZ5qq9mVbIJSy+SSGAXYug9ww94GTiXgYEVSZRMIHyiT6dzsV9zn8MQmF8n91UUvi0OeLUw5UFcYJrWnaP54nBc/eISlFDUZhhuyEQYUbojh6T8EuEclB49ytVmRMmlWYEXvhkaMrJKaKdwL7IHI/R6fQ0LAhRj7Fdc5Uudx9wPmnymXEKqDE95scZ2Vke8KFqVi7o0sVCmgl5A2MsKLJxCy16S78aJq2ixCXihmfLFpeTDDccwFKoeTst3j3JEq3t+Ryr9+lDMauCazhGepfjvBjRZo4q2xi0FyeZYlmVR+oXjRe2EHAbJxADGS5GEfusS2Sp3soyyOwFt9R5ccRMT84MhfgHJxQnt8Za7rQnOs4BwOhSbnAdpw6GvJS/b8HS0+jHLORmYgkfkl13nfRhm7kv2cCoE68a+Gvk9aRgnOaThV81AyN0DK3EMmD/EX0pv4kKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(316002)(86362001)(36756003)(8936002)(66476007)(2616005)(66946007)(6486002)(6916009)(956004)(31686004)(66556008)(31696002)(16576012)(4326008)(52116002)(478600001)(186003)(5660300002)(16526019)(8676002)(2906002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eXdXMVE0UnE2Wm1FU2RBNUZYZllPR2s3STVMMExhbnpYMkNFeFhwMmtzT0dN?=
 =?utf-8?B?eW9YVWFkTkpiQ1BCUUdhOEJZRkFnOURtMlZWWG5kOVkwMUVIdGxIVFgrUFVR?=
 =?utf-8?B?R1c4UlpOejFCTjNKdk1iN0dXdEh3L2NFaG40bXZTMFRJa29wcUdpeExLbkEz?=
 =?utf-8?B?NDlqVDd3c29zU1NhYzZDd0JYZGlRaW5wdkVuOC80NFFoa1VyVWVDbm1sdUpq?=
 =?utf-8?B?SGx4OVMvT2VJekdTMVBRMmI1eDdZT3AybThxY2phemxyRDNERXlTU1c4cDVH?=
 =?utf-8?B?ejVkekdrV3BXM0RReEF1aUxmUmw1ajVxMG4reHBvU0lPR0dFSVQzVUovay9v?=
 =?utf-8?B?RExGSFNIOVY3eEplaS8zd2lBdmQvSmQvOVNlWjcwejh2N0I2MVl2cVFndThx?=
 =?utf-8?B?RGxjWkRIZ0lqOVF3RFdYVzNNa3pPY2hFOU1JSFMwY3lUemVsZjIzNFYyT2hD?=
 =?utf-8?B?TE02RG80bDcvaml0SXYrQXF0T2tnQWVraStzQkxLU250Rms4alU0eGJVUkFl?=
 =?utf-8?B?VEpuZFVxdWpDem1ndUcxZ0JwOVA0UXZIRkw2a0FmR2ZEa2Y5TWg5c0NmcnpX?=
 =?utf-8?B?TEdnVDlzZ1EzTm9PcmwvRXRZR1V2SlAySjZDaFhQcHBPVzlydVJ6bllLYnNC?=
 =?utf-8?B?RExJQ052dVN4KzVZRkpaK21PT1hmZDhpK1JVOTNyaEJpK2xZeS93UnROdHlF?=
 =?utf-8?B?c1pyVlQyVHdNdlAzVFF0RTdHVVNUNC85WTZqRC83bFRsY2hXSFd2QzdHTnNl?=
 =?utf-8?B?Q25KZUJvUHpuQjVBaHRCV2RBbk1hMHMvdGVwMDkwSWE4aHhBM0Q5bFJpODR0?=
 =?utf-8?B?ZVNZam5YOUI2cnAzRno1QmlpTGh5WWJxa1hyVkRmNk0vM0pDbHphU0xWWHox?=
 =?utf-8?B?ZzhrS093ZkNCOHpzSnF5VmcyZVh2YzMrTFRCYlJOQWdYeXBXc1ZMTVFoeDE4?=
 =?utf-8?B?Yys1UmZqOGlRR015WTZHVGVwNWpMNGpGMjFSaFIvUEdyM0pzTUhtbGRVOW9o?=
 =?utf-8?B?ZnJpWDM1WngrYmlCckpxUjIzcEluazU5c3dKSjZLZFRscW9sVGVXdnRibUtZ?=
 =?utf-8?B?QXdoZnhMRUFZamdrbnFXQjFOMGdpaGpZVTk3RzMwbWpVanE2S1BGMzQyOFlK?=
 =?utf-8?B?OEViaVBPa08wTG9KbG9OU0dpbHRpODhxdG1RMU8xOEkyWGducWtqTTZjdmtK?=
 =?utf-8?B?eVBiSWFTcVB1Q0k2bjNxNFNId2RBeFJWNXRVQlhtcElVQ1JKWGJpeXp5ZWFR?=
 =?utf-8?B?TVoxM2R6ZlFITGpXM1Y0Q2JIalFPWVVrcXFEZ3Q3S3hyb0Y5dWYxQW0zTGJL?=
 =?utf-8?B?T3JqQkIxOEZpMkZRWWIrb3ZNOUh1QkJpa2NreGt4VnRvUktnT1BETkQ1T2Nm?=
 =?utf-8?B?OEN5OTQrZnVPY1VRdGxVaE1DVFFqemdLMWYrTm8xRDRxQ2FrZ0M5Nlk0NGpY?=
 =?utf-8?B?d3c1L3h1d1p2SVF2SXJhWlRvYjE5ekMxOXBNV0R3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07730a54-f469-4efa-605b-08d8c1e2abc7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 10:10:56.5697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExLei8Dfje5DBMlrfEqEHB6D3IzMg+VghrFutjpTt33SkEgvIhzzhmdxpOOkYwYg2AcXiKah/dR0KODofPDSaii+ICHbnV/lTCvZIlOrHFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4787
Received-SPF: pass client-ip=40.107.22.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.01.2021 21:50, Vladimir Sementsov-Ogievskiy wrote:
> Add TestEnv class, which will handle test environment in a new python
> iotests running framework.
> 
> Don't add compat=1.1 for qcow2 IMGOPTS, as v3 is default anyway.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>


squash-in to fix mypy complains, and try use ContextManager for CI:

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index ca9cab531b..8b80425670 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -25,8 +25,7 @@ import collections
  import random
  import subprocess
  import glob
-from contextlib import AbstractContextManager
-from typing import Dict, Any, Optional
+from typing import Dict, Any, Optional, ContextManager
  
  
  def isxfile(path: str) -> bool:
@@ -50,7 +49,7 @@ def get_default_machine(qemu_prog: str) -> str:
      return default_machine
  
  
-class TestEnv(AbstractContextManager['TestEnv']):
+class TestEnv(ContextManager['TestEnv']):
      """
      Manage system environment for running tests
  
@@ -81,7 +80,7 @@ class TestEnv(AbstractContextManager['TestEnv']):
  
          return env
  
-    def init_directories(self):
+    def init_directories(self) -> None:
          """Init directory variables:
               PYTHONPATH
               TEST_DIR
@@ -100,11 +99,11 @@ class TestEnv(AbstractContextManager['TestEnv']):
                                    os.path.join(os.getcwd(), 'scratch'))
          Path(self.test_dir).mkdir(parents=True, exist_ok=True)
  
-        self.sock_dir = os.getenv('SOCK_DIR')
-        self.tmp_sock_dir = False
-        if self.sock_dir:
+        try:
+            self.sock_dir = os.environ['SOCK_DIR']
+            self.tmp_sock_dir = False
              Path(self.test_dir).mkdir(parents=True, exist_ok=True)
-        else:
+        except KeyError:
              self.sock_dir = tempfile.mkdtemp()
              self.tmp_sock_dir = True
  
@@ -114,7 +113,7 @@ class TestEnv(AbstractContextManager['TestEnv']):
  
          self.output_dir = os.getcwd()  # OUTPUT_DIR
  
-    def init_binaries(self):
+    def init_binaries(self) -> None:
          """Init binary path variables:
               PYTHON (for bash tests)
               QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
@@ -122,7 +121,7 @@ class TestEnv(AbstractContextManager['TestEnv']):
          """
          self.python = sys.executable
  
-        def root(*names):
+        def root(*names: str) -> str:
              return os.path.join(self.build_root, *names)
  
          arch = os.uname().machine




-- 
Best regards,
Vladimir

