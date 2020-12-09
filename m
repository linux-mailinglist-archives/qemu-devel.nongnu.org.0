Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4E2D488E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:05:46 +0100 (CET)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3qT-00077u-Ox
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3dt-0004PV-2F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:52:45 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3dn-0002sH-FJ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:52:44 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HnXlT181653;
 Wed, 9 Dec 2020 17:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=0oxtMXUqfsKnZ2mmipX3HD+8EJWKg+SYKhNsIEYyZhE=;
 b=bTaG6dmCaDWZs5opWpVjw456hu0iwhuDqY2I3aWHLlXcExLSUBFpF+upJSff4f8zPzea
 xCJmxF+46+KW+g/i9PeIA5sYvebst4RkDknclE4Cm/CSz3r50Pee35OKLR812D5SYWwY
 gxDrhXZYZQqTBti5Q2YiB6CpFkCeqr0wNFZpGpZhLoNZv5S/hQl+iFJlLt8eiCLzjEX9
 iIDzpAx7vxs3kFZHtNGVuUwCjgS5iw+aJRPMMajgq+isBrXtE+OBb5DJHRseRad2FkKJ
 M7vz+1OquZNsB0wrFxVuVPEU8umJ6sZeE3zUdiX5SUaei8EdCfGvUvXrA25fdauABu0+ mQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35825m9hdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:52:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HpldL171625;
 Wed, 9 Dec 2020 17:52:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 358m50y24x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:52:36 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9HqZmo001047;
 Wed, 9 Dec 2020 17:52:35 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:52:35 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] qtest/pvpanic: Test panic option that allows VM to
 continue
Date: Wed,  9 Dec 2020 12:52:16 -0500
Message-Id: <1607536336-24701-5-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=1
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090126
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: david.edmondson@oracle.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test the scenario where the -action panic=none parameter is used to
signal that the VM must continue executing after a guest panic
occurs.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
---
 tests/qtest/pvpanic-test.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/pvpanic-test.c b/tests/qtest/pvpanic-test.c
index 016b32e..6dcad2d 100644
--- a/tests/qtest/pvpanic-test.c
+++ b/tests/qtest/pvpanic-test.c
@@ -11,13 +11,36 @@
 #include "libqos/libqtest.h"
 #include "qapi/qmp/qdict.h"
 
+static void test_panic_nopause(void)
+{
+    uint8_t val;
+    QDict *response, *data;
+    QTestState *qts;
+
+    qts = qtest_init("-device pvpanic -action panic=none");
+
+    val = qtest_inb(qts, 0x505);
+    g_assert_cmpuint(val, ==, 3);
+
+    qtest_outb(qts, 0x505, 0x1);
+
+    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
+    g_assert(qdict_haskey(response, "data"));
+    data = qdict_get_qdict(response, "data");
+    g_assert(qdict_haskey(data, "action"));
+    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "run");
+    qobject_unref(response);
+
+    qtest_quit(qts);
+}
+
 static void test_panic(void)
 {
     uint8_t val;
     QDict *response, *data;
     QTestState *qts;
 
-    qts = qtest_init("-device pvpanic");
+    qts = qtest_init("-device pvpanic -action panic=pause");
 
     val = qtest_inb(qts, 0x505);
     g_assert_cmpuint(val, ==, 3);
@@ -40,6 +63,7 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
     qtest_add_func("/pvpanic/panic", test_panic);
+    qtest_add_func("/pvpanic/panic-nopause", test_panic_nopause);
 
     ret = g_test_run();
 
-- 
1.8.3.1


