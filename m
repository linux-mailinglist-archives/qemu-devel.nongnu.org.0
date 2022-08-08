Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9D58C8F4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:05:06 +0200 (CEST)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2RN-0002bQ-5a
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jr-0007sl-Qs
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jq-0001gE-9C
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659963437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUcJSPihr1CxmcurGisfq4kv3QpUdIwCLFpiSeuBEig=;
 b=WAuCMZwE4osiNUniiZ1MqpTgX37oNPSncdHvSxhzogFItQSLWi+B3L3wTTai2iuEndW7Mc
 YXa174XN9NX9K+oJL4VDheo3foDeKddLHiwH9A+T3qnfCWTOJllalZ87h7LF1Dfnsh9ssu
 9xHTLB5tc5nLjOf1PX5bnKxY0P0Uv1E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-oyvtYfukPw-PJx64uvkTVQ-1; Mon, 08 Aug 2022 08:57:16 -0400
X-MC-Unique: oyvtYfukPw-PJx64uvkTVQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m22-20020a056402431600b0043d6a88130aso5548051edc.18
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VUcJSPihr1CxmcurGisfq4kv3QpUdIwCLFpiSeuBEig=;
 b=clod4IC8K4TWdaxYIFUtMrQlzoVaubqiikiVvfGBI3V6SJQK6b3HDJTLWyqhPLPHkF
 6llv1PkYgSGAV3tSiZrKphWGI16B+KIvYCaDuz+OCk0eeUyggsOjwaG1htHQZFDgnghj
 cY+s8irpOYq/emWDQxTV5pZ5cXkcqPdzXPNEm7FFEUo8APL11ntrFlTbZgrnfqofLz2n
 JVN9vA/zzHPGdsRD45ajrzNa8gdYncjGNv4EbgSjOhZC+zda+GZ4UDFIuLKw1ixPaImo
 +p5ov/qyKaojAwN+2YYxFfSqInuPvj5Gg97XDvan5en1goNdGEGRQlGwJuZAqjnTUz3J
 NV/g==
X-Gm-Message-State: ACgBeo1m8xc2OtkQgIES+n4bXZH40OerPY9a3CFV4lXxniq+Tzku5kS4
 Oqvg3N8s2snmCEzVawHbkBCpnaWCYuSEO9Uova91ogS8cr0ywI9NV/4DSDR1AiQNy6YTwOqfts1
 QaSc7LaF6maYsPkDiOb4XJA16hR5KJ/ThX/ayl3MNRM0bzFgvZllimdVOYslR+62NpsY=
X-Received: by 2002:a05:6402:15a:b0:431:71b9:86f3 with SMTP id
 s26-20020a056402015a00b0043171b986f3mr17698378edu.249.1659963435023; 
 Mon, 08 Aug 2022 05:57:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7tTSyTnaXwLkQ9Pza6P5H5E+1UTr+39Kevo8oDomRp89GOaZeWo0cAqniHWM8uYziXSHyY9g==
X-Received: by 2002:a05:6402:15a:b0:431:71b9:86f3 with SMTP id
 s26-20020a056402015a00b0043171b986f3mr17698358edu.249.1659963434712; 
 Mon, 08 Aug 2022 05:57:14 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 sd27-20020a170906ce3b00b00722e50dab2csm4964939ejb.109.2022.08.08.05.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 05:57:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PULL 4/5] vl: remove dead code in parse_memory_options()
Date: Mon,  8 Aug 2022 14:57:05 +0200
Message-Id: <20220808125706.60511-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125706.60511-1-pbonzini@redhat.com>
References: <20220808125706.60511-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

mem_str will never be an empty string, because qemu_opt_get_size() fails
if it encounters one:

   $ ./qemu-system-x86_64 -m size=
   qemu-system-x86_64: -m size=: Parameter size expects a non-negative number below 2^64
   Optional suffix k, M, G, T, P or E means kilo-, mega-, giga-, tera-, peta-
   and exabytes, respectively.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 45e919de9f..706bd7cff7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1960,13 +1960,8 @@ static void parse_memory_options(void)
     prop = qdict_new();
 
     if (qemu_opt_get_size(opts, "size", 0) != 0) {
-        mem_str = qemu_opt_get(opts, "size");
-        if (!*mem_str) {
-            error_report("missing 'size' option value");
-            exit(EXIT_FAILURE);
-        }
-
         /* Fix up legacy suffix-less format */
+        mem_str = qemu_opt_get(opts, "size");
         if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
             g_autofree char *mib_str = g_strdup_printf("%sM", mem_str);
             qdict_put_str(prop, "size", mib_str);
-- 
2.37.1



