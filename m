Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54A2F86EC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:48:34 +0100 (CET)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0W1I-0000IV-V5
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1l0Vzl-0008Jx-Nr
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:46:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1l0Vzj-0006ao-DB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:46:57 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FKWFO8136440
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 15:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=AIq0Loe3YnEwQo6ElVIcFaluTIq1UTjLQfUYWq2GzyU=;
 b=PguHSC/pWe81Z1BiphIDkNXdsJwAMmIhN5iD0KFKBU33NSU8/5uF1TQotfcUFcBjnq1e
 d3m9eDd70VOduD65rFX3fXJHzc7mGaHO7weV6GV0YQ1/kutDTVZnzl4ilMBLQF8bUMPu
 Oj0sivlFrvj6oMgWAt4w9/EQqrHvyMrrQF/omJD/gsWxgthvKwIffHBwnWGtmO15UkFK
 gO4+fPMpIJfckjKNdVNlquXqtwYCFN+UGQRKv0DFGbsc/qYPQeQZ3XeWKVxVXQbFI9tP
 AEMEXStP5A++NoYfIE3YKqj67W4hpdt0Rg3FXwVNnKYqoc3ScUSr2cZhdPh2dTSapisF 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363hm81cj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 15:46:51 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10FKWEMs136315
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 15:46:51 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363hm81cj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:46:51 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FKcDeX005444;
 Fri, 15 Jan 2021 20:46:50 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 35y44ab4t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 20:46:50 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FKknuZ18809138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 20:46:49 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 591B9BE05F;
 Fri, 15 Jan 2021 20:46:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 088E0BE056;
 Fri, 15 Jan 2021 20:46:48 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 20:46:48 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: Fix memory leak in tpm-util.c
Date: Fri, 15 Jan 2021 15:46:37 -0500
Message-Id: <20210115204637.3332555-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_11:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150121
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes the following memory leak detected by asan:

Indirect leak of 560320 byte(s) in 136 object(s) allocated from:
    #0 0x556b3b3f9b57 in calloc (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
    #1 0x152b0e96b9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
    #2 0x556b3b588f61 in parse_object /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:318:12
    #3 0x556b3b588f61 in parse_value /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:546:16
    #4 0x556b3b5886e8 in json_parser_parse /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:580:14
    #5 0x556b3b52ff4a in json_message_process_token /home/stefanb/tmp/qemu-tip/build/../qobject/json-streamer.c:92:12
    #6 0x556b3b59896f in json_lexer_feed_char /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:313:13
    #7 0x556b3b598443 in json_lexer_feed /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:350:9
    #8 0x556b3b436c70 in qmp_fd_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:614:9
    #9 0x556b3b435871 in qtest_qmp_receive_dict /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:636:12
    #10 0x556b3b435871 in qtest_qmp_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:624:27
    #11 0x556b3b435c59 in qtest_vqmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:715:12
    #12 0x556b3b435c59 in qtest_qmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:756:16
    #13 0x556b3b4328c7 in tpm_util_wait_for_migration_complete /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-util.c:245:15
    #14 0x556b3b4333be in tpm_test_swtpm_migration_test /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-tests.c:117:5
    #15 0x152b0e98e29d  (/lib64/libglib-2.0.so.0+0x7b29d)

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/tpm-util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index 5a33a6ef0f..b70cc32d60 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -250,7 +250,7 @@ void tpm_util_wait_for_migration_complete(QTestState *who)
         status = qdict_get_str(rsp_return, "status");
         completed = strcmp(status, "completed") == 0;
         g_assert_cmpstr(status, !=,  "failed");
-        qobject_unref(rsp_return);
+        qobject_unref(rsp);
         if (completed) {
             return;
         }
-- 
2.26.2


