Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC2506411
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 07:56:14 +0200 (CEST)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggqR-0004AC-Vo
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 01:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglg-000131-Bt
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggle-0004Mf-FJ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so758228wms.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4wl/18eQd19gP5MbPbPK6bIwSnFheqPxeEG+35PYvUE=;
 b=Hx9AmFCsiU6VJOJcYCENl2iEn1jo3cfpsGdTab7YJEWgGexBvdvNwKZ6Dmxiue8ICm
 63WP8qzF/KXOeHo2YRiLUY1OBuBDo89VzKXOqaECWuFcvLaUfTSwCYxwj3Bzzs0FYWee
 jK3qRiv5prtyzfaWY+N6Ir2avID48IOsptz9HNBLLK3nGPRmIQ+1ek2+9bY1NNJHouxD
 74fgBLkrajRMVwdJVfdDqfXkhvxTXKadXQgwA+hqW5OXDj/tXfE1b3gewF4txZxrzl08
 FlYP9JUIcGyjJRSqe2Dnxz83HaoQ/LkRM/7yvuhWzEO1+fau6dtm6flJdmI3gqmvJ3IY
 YE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4wl/18eQd19gP5MbPbPK6bIwSnFheqPxeEG+35PYvUE=;
 b=NdaRyX9oKasgu/CBOGt0w33F+ecqRfbFiVUDrMg/H7S/Rcl4qoz8JQu3OTsvFVpJO1
 zbEtKJrCD+t4O4Uvekehizo3s2suiCo6RgFTthrjlO1w3aUQERsRuwd+Ws3PfHgbvtLR
 N8jbo9XWicpuIHAfIXDEPrJxqFEVOAKbfMfYokBdz9495PPpC1LBcJZqBK+f+bvuOKCA
 FUJnLwvH4HQUeFdf9h4YGHc8XQoi6ogHx0QCfL9atXgiFxMsNHFz6mIGDcCeXvwCAM01
 EI0MdsdxsUXwY9JU7ZwX0n3P0UELQf0nBHlp+6KM1oDbBNv8mNfUkLT9RJGjX+dOsN2f
 CdWw==
X-Gm-Message-State: AOAM533U4lBW96jpd8jPr2AyUQgOwm9wGL3guy+hL9HUqKcm2K5gEwAP
 cfBnXkkElZqUSBN2NP4wQGbzr7NsSxJ24A==
X-Google-Smtp-Source: ABdhPJzqAqA3BGT4jnqOYlziLrfmnku66JGSDh4+G/l/9R/4McAkByj/JirhXWT+H1L+N8DqDKMZKA==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id
 q11-20020a1cf30b000000b0037bb5dec804mr18151723wmq.166.1650347472274; 
 Mon, 18 Apr 2022 22:51:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/53] qapi,
 target/i386/sev: Add cpu0-id to query-sev-capabilities
Date: Tue, 19 Apr 2022 07:50:17 +0200
Message-Id: <20220419055109.142788-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
command.  The value of the field is the base64-encoded unique ID of CPU0
(socket 0), which can be used to retrieve the signed CEK of the CPU from
AMD's Key Distribution Service (KDS).

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220228093014.882288-1-dovmurik@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/misc-target.json |  4 ++++
 target/i386/sev.c     | 42 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 036c5e4a91..bc9355b595 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -144,6 +144,8 @@
 #
 # @cert-chain:  PDH certificate chain (base64 encoded)
 #
+# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.0)
+#
 # @cbitpos: C-bit location in page table entry
 #
 # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
@@ -154,6 +156,7 @@
 { 'struct': 'SevCapability',
   'data': { 'pdh': 'str',
             'cert-chain': 'str',
+            'cpu0-id': 'str',
             'cbitpos': 'int',
             'reduced-phys-bits': 'int'},
   'if': 'TARGET_I386' }
@@ -172,6 +175,7 @@
 #
 # -> { "execute": "query-sev-capabilities" }
 # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
+#                  "cpu0-id": "2lvmGwo+...61iEinw==",
 #                  "cbitpos": 47, "reduced-phys-bits": 5}}
 #
 ##
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f8..32f7dbac4e 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -531,12 +531,46 @@ e_free:
     return 1;
 }
 
+static int sev_get_cpu0_id(int fd, guchar **id, size_t *id_len, Error **errp)
+{
+    guchar *id_data;
+    struct sev_user_data_get_id2 get_id2 = {};
+    int err, r;
+
+    /* query the ID length */
+    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
+    if (r < 0 && err != SEV_RET_INVALID_LEN) {
+        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
+                   r, err, fw_error_to_str(err));
+        return 1;
+    }
+
+    id_data = g_new(guchar, get_id2.length);
+    get_id2.address = (unsigned long)id_data;
+
+    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
+    if (r < 0) {
+        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
+                   r, err, fw_error_to_str(err));
+        goto err;
+    }
+
+    *id = id_data;
+    *id_len = get_id2.length;
+    return 0;
+
+err:
+    g_free(id_data);
+    return 1;
+}
+
 static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
     guchar *cert_chain_data = NULL;
-    size_t pdh_len = 0, cert_chain_len = 0;
+    guchar *cpu0_id_data = NULL;
+    size_t pdh_len = 0, cert_chain_len = 0, cpu0_id_len = 0;
     uint32_t ebx;
     int fd;
 
@@ -561,9 +595,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
         goto out;
     }
 
+    if (sev_get_cpu0_id(fd, &cpu0_id_data, &cpu0_id_len, errp)) {
+        goto out;
+    }
+
     cap = g_new0(SevCapability, 1);
     cap->pdh = g_base64_encode(pdh_data, pdh_len);
     cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
+    cap->cpu0_id = g_base64_encode(cpu0_id_data, cpu0_id_len);
 
     host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
     cap->cbitpos = ebx & 0x3f;
@@ -575,6 +614,7 @@ static SevCapability *sev_get_capabilities(Error **errp)
     cap->reduced_phys_bits = 1;
 
 out:
+    g_free(cpu0_id_data);
     g_free(pdh_data);
     g_free(cert_chain_data);
     close(fd);
-- 
2.35.1



