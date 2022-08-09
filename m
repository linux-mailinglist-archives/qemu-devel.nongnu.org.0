Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4D58D15A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 02:27:54 +0200 (CEST)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLD69-0001ff-1x
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 20:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLD3l-0005a7-N8; Mon, 08 Aug 2022 20:25:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLD3h-0007A1-RJ; Mon, 08 Aug 2022 20:25:24 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27901Fn4014155;
 Tue, 9 Aug 2022 00:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=gMzJHOWfYxNRSV1xK25wWFpdnXgJClEZl+NLI7btZe0=;
 b=cC+Hj0eZpK/nRooDMovoCuj55cBJviZGzKioVxBLlGzOviKCyL4eP5Ybl7yrpyLHmWim
 T2CrN/XabaVFdTTqJ72zhBkKzK3OWlhgje0h4S9K1vrWQOnbLXIF382EV9Wt/xBD4RAw
 3d15YQBpXPm8NX+G9JG9nR0OqBopMpzSWPxT3rHUTA7SxHR/etCS/4Ec8kc52V+1RXGA
 eV/qL/tLNGMC8iQH84grXO/dk+Zb1pv+VA2E/HGaHUSYCIk9s+K9TDUojebe9Mxjb2bX
 bW+JQnliCR8Q5wYxqZljvpdmGJ4HTZgxKEWZrJ9UqCJWLeuipM3J8/nIXd6cIp+RMJGy aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hubrq9txs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:19 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2790PBTk025228;
 Tue, 9 Aug 2022 00:25:19 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hubrq9txm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:19 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2790KIG6008286;
 Tue, 9 Aug 2022 00:25:18 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 3hsfx9bby4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2790PHGB25690404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Aug 2022 00:25:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66C27AE062;
 Tue,  9 Aug 2022 00:25:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3223AE063;
 Tue,  9 Aug 2022 00:25:16 +0000 (GMT)
Received: from localhost (unknown [9.77.141.99])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Aug 2022 00:25:16 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 mopsfelder@gmail.com
Subject: [PATCH 2/2] tests/migration: add support for ppc64le for guestperf.py
Date: Mon,  8 Aug 2022 21:24:51 -0300
Message-Id: <20220809002451.91541-3-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809002451.91541-1-muriloo@linux.ibm.com>
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rbDjnocOhG1M1vpDKWeNIEkq71NTrJER
X-Proofpoint-ORIG-GUID: YrBNYzGK7ENMSBbIHq1qVH08CN7NRRML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_14,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208080105
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add support for ppc64le for guestperf.py. On ppc, console is usually
hvc0 and serial device for pseries machine is spapr-vty.

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
---
 tests/migration/guestperf/engine.py | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 87a6ab2009..88da516899 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -282,6 +282,26 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                 resp = src.command("stop")
                 paused = True
 
+    def _is_ppc64le(self):
+        _, _, _, _, machine = os.uname()
+        if machine == "ppc64le":
+            return True
+        return False
+
+    def _get_guest_console_args(self):
+        if self._is_ppc64le():
+            return "console=hvc0"
+        else:
+            return "console=ttyS0"
+
+    def _get_qemu_serial_args(self):
+        if self._is_ppc64le():
+            return ["-chardev", "stdio,id=cdev0",
+                    "-device", "spapr-vty,chardev=cdev0"]
+        else:
+            return ["-chardev", "stdio,id=cdev0",
+                    "-device", "isa-serial,chardev=cdev0"]
+
     def _get_common_args(self, hardware, tunnelled=False):
         args = [
             "noapic",
@@ -290,8 +310,10 @@ def _get_common_args(self, hardware, tunnelled=False):
             "noreplace-smp",
             "cgroup_disable=memory",
             "pci=noearly",
-            "console=ttyS0",
         ]
+
+        args.append(self._get_guest_console_args())
+
         if self._debug:
             args.append("debug")
         else:
@@ -309,12 +331,12 @@ def _get_common_args(self, hardware, tunnelled=False):
             "-kernel", self._kernel,
             "-initrd", self._initrd,
             "-append", cmdline,
-            "-chardev", "stdio,id=cdev0",
-            "-device", "isa-serial,chardev=cdev0",
             "-m", str((hardware._mem * 1024) + 512),
             "-smp", str(hardware._cpus),
         ]
 
+        argv.extend(self._get_qemu_serial_args())
+
         if self._debug:
             argv.extend(["-device", "sga"])
 
-- 
2.37.1


