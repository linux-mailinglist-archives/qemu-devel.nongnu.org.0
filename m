Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0743335C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:17:47 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmBn-0008JO-1n
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcm78-0001si-00
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcm76-0006rC-Ai
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634638375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=qwHC9Wz/YJDHNDeqTirkB50rKFRaz7VVW2N9v5vYbfk=;
 b=c9AaCrNdfCD8CN0Wk4kgiEzjB+qY2gHx9zeWsnR0J2JYrB8EvPGXTd0Xew+xoDLcAQtINs
 TeMz2B+a518B7YIw5Pnle0yudSofMZ04uCBHHpXmuze5gYOfyR9paR5opNxhAwqIfVnSiu
 OnNO4tFyJX+2KkZdrFJ719J0qgNA/Ec=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-xECNU2CQPHqYLorEC2JSGg-1; Tue, 19 Oct 2021 06:12:54 -0400
X-MC-Unique: xECNU2CQPHqYLorEC2JSGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso4728545wrf.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=qwHC9Wz/YJDHNDeqTirkB50rKFRaz7VVW2N9v5vYbfk=;
 b=WWKwffbM1zoQqnrVzNM6dZDru4++HTVg0ARJyU3QU26S1cBoKJ+AxhDoz8BvS+hvVy
 Uyx7z7r/WZl+rEG2yBmBfGbaoH1caG7FZUkDFNvWEBm5hG2V48rkpnL7kDp5j/MXQeH7
 AgDUb+KSu3QkIgr9RlDkRU1AmkP8GOV+D+ji+pXX5n8I+ndKHkCWbepLKfwxzYDWHM51
 2mFKqjmfK0ivIXgGSfKGof5VXjapWlvHcPNTySXGlro81s7e4TkAMTOD648v80wdLmSm
 SnxsSHXdvdESiOSO083z0JpACWoVLIr1Pm16EIBEqCapzEs3MDU11NKIEuAX+OE2JJUE
 s72A==
X-Gm-Message-State: AOAM530Wn8KYLaqj8YHKtX0h4+k/DnUSmluiKadDPeZMdNCktIpXasTQ
 owzhZkhMM9KnHlK1h5ohYjrupjzkpfRDmEudG/ZpI4FM9IH2FyxXGmTMJ/+AJd4rZU3rlhTGqjP
 1kiAZS32VCVpj3TddFnT4uqHWXZVGtSWbzWRDDo3MAfgYoh98rOlBHnGD1IqC
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr4995606wmk.43.1634638372729; 
 Tue, 19 Oct 2021 03:12:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyypTB0bWFXg7jpvfctZUSFVrCx3nzVNDDz7NbX2dQ9aIZN04WDE+h0ffQas+KEyPJsTjF6pQ==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr4995566wmk.43.1634638372382; 
 Tue, 19 Oct 2021 03:12:52 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id s186sm2273669wme.14.2021.10.19.03.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:12:51 -0700 (PDT)
Date: Tue, 19 Oct 2021 06:12:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] bios-tables-test: don't disassemble empty files
Message-ID: <20211019101245.574716-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recommended way to populate new tables is to have an
empty expected file. In this case, attempts to disassemble
will fail but it is useful to disassemble the actual files.
Detect and skip decompile step in this case.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a5546180b7..ee0ddb088e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -271,19 +271,28 @@ static void dump_aml_files(test_data *data, bool rebuild)
     }
 }
 
+static bool create_tmp_asl(AcpiSdtTable *sdt)
+{
+    GError *error = NULL;
+    gint fd;
+
+    fd = g_file_open_tmp("asl-XXXXXX.dsl", &sdt->asl_file, &error);
+    g_assert_no_error(error);
+    close(fd);
+
+    return false;
+}
+
 static bool load_asl(GArray *sdts, AcpiSdtTable *sdt)
 {
     AcpiSdtTable *temp;
     GError *error = NULL;
     GString *command_line = g_string_new(iasl);
-    gint fd;
     gchar *out, *out_err;
     gboolean ret;
     int i;
 
-    fd = g_file_open_tmp("asl-XXXXXX.dsl", &sdt->asl_file, &error);
-    g_assert_no_error(error);
-    close(fd);
+    create_tmp_asl(sdt);
 
     /* build command line */
     g_string_append_printf(command_line, " -p %s ", sdt->asl_file);
@@ -463,11 +472,20 @@ static void test_acpi_asl(test_data *data)
         err = load_asl(data->tables, sdt);
         asl = normalize_asl(sdt->asl);
 
-        exp_err = load_asl(exp_data.tables, exp_sdt);
-        exp_asl = normalize_asl(exp_sdt->asl);
+        /*
+         * If expected file is empty - it's likely that it was a stub just
+         * created for step 1 above: we do want to decompile the actual one.
+         */
+        if (exp_sdt->aml_len) {
+            exp_err = load_asl(exp_data.tables, exp_sdt);
+            exp_asl = normalize_asl(exp_sdt->asl);
+        } else {
+            exp_err = create_tmp_asl(exp_sdt);
+            GString *asl = g_string_new("");
+        }
 
         /* TODO: check for warnings */
-        g_assert(!err || exp_err);
+        g_assert(!err || exp_err || !exp_sdt->aml_len);
 
         if (g_strcmp0(asl->str, exp_asl->str)) {
             sdt->tmp_files_retain = true;
-- 
MST


