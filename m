Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A524A3C77C7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:20:01 +0200 (CEST)
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Osq-0001yn-IN
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Oou-0001Y5-3z
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:15:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Oor-0004x5-ET
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:15:55 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DK3iNm054753
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MVOJgdr4wexwAri1vQ8wjQWuBqv9P3ZScgXkInrKN3o=;
 b=qr6BbT4wPrHZUHKMKajdqzFww2ywvPxnC8uOMyaNZTWISMUzSy4SlaKM5W1NFxDSxNB6
 6V40BSfPC8FqwKVXnHg9sdla9Q5xJFmdi4vPRHAwtgshbMVGnou/woVLDzvlyVLAP3UP
 1cTWk8iDXI2eM541pyhTW6nUf7KJQQm+3q6JY95K686gLoYAp6UE/v8nmgYXoRw7bp4M
 M7EAgZXvadEIEfDHTqxv+g24sv7LB2r5lf2FszaONxkEuY8JWftir9rom6KQMJ/mdke5
 QTSwnHPJExzDZQfUVKr3QqEmoWXQmkRzg6yVL6GcCievQ/OkL1fMGBxZ0mXjlBLcTrp9 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc2xaxd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:52 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DK3j7p054881
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:52 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc2xaxcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 16:15:52 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DKC6NN030494;
 Tue, 13 Jul 2021 20:15:51 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 39q36bf0uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 20:15:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DKFo8G15860014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 20:15:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6674C7806D;
 Tue, 13 Jul 2021 20:15:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E05F778063;
 Tue, 13 Jul 2021 20:15:49 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 20:15:49 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v5 04/10] tests: Add suffix 'tpm2' or 'tpm12' to ACPI table
 files
Date: Tue, 13 Jul 2021 16:15:39 -0400
Message-Id: <20210713201545.903754-5-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
References: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mNLqQ3GAEBlaJ5WESh2dIwhriCw5rXy8
X-Proofpoint-ORIG-GUID: JQE7XAxVwo1lKtrYshc19NTTWrQeHulH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_12:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130124
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 93c9d306b5..4ccbe56158 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1101,7 +1101,8 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     TPMTestState test;
     test_data data;
     GThread *thread;
-    char *args, *variant = g_strdup_printf(".%s", tpm_if);
+    const char *suffix = tpm_version == TPM_VERSION_2_0 ? "tpm2" : "tpm12";
+    char *args, *variant = g_strdup_printf(".%s.%s", tpm_if, suffix);
 
     tpm_tis_base_addr = base;
 
-- 
2.31.1


