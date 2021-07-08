Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C53C15E9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:26:08 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vuh-0001s5-Et
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-00009G-Is
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:03 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmp-00089r-D3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:02 -0400
Received: by mail-ej1-x634.google.com with SMTP id hr1so10293197ejc.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5+BoEOvWJdz3WwwMfkv9w8Vit2xcmxJtHUq+bWmynlM=;
 b=lBGjBq947nOiqJXEy5FOdowBVlOSI16JFJqmdhoIkfSprtW8F2sWAk2p4uDheI3Vjm
 xAcNvTj6pomN0uiidI0EJUrUI/hIeMA+2RxQz2NPZc8kl8A+xqVgMQc8jUBfWyhtEowt
 CYLJJJNPX0BlrLdy/tPx4OctMrnTzhSBmPvBCzcaDlXhC8I9++UUt/omsGpmUTQujB1+
 Ct0cBHUxqnBik4+jjOMgzrNhXsCwOUf9f7r6k7Chw3YKKlb7f3epkdDExQzzZx5pUo73
 uXwxvy9DmunTOjRFsGa0RUNHMNUoTCqLSgK38e2/RoqJ74ibC48haUF//JB/l/ImSKC0
 wHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5+BoEOvWJdz3WwwMfkv9w8Vit2xcmxJtHUq+bWmynlM=;
 b=Ywwhwh7NfCELWhYLeseWlPjdapOJEkEEw6UJ8M3vxVT7j+3fzbYxWKSdsWPru4A4bn
 YBiEnJ0IurvhTkl9SgKGicNfXDRr+4PJSrIv17gISw0O+oGoLrk6JBaOwILSsu7uL6/w
 aXByRkn3otIAlLAZf0kUNZ2ZE1OXZK24b5hiuuzoDPVLklO6Y8RM6qBcUyJLn9ieG07l
 7dbpQensHVSOgA8jbelGQJVmmi1G5vkpG0S4Dtv9VjrTkP4Kkl6JOWKITfWoTIDCdd44
 b4K3L4hiY7SuPf8jl6k+otFb8QXumF4p+GDyz0BoBkBhsva2IZ5N3JF1R3AZHu1nvNZ3
 LLNg==
X-Gm-Message-State: AOAM5324YopIPBj70o9fkN23xybL8Wu0Shaxwik1VFULSh4FTY6mfXEs
 WX1Wa3/0Y5zHsI6Q/axs7muubk6SIlQ=
X-Google-Smtp-Source: ABdhPJymMDIDO3/IrHeAOnG/j8U8RSE4gTBEf1lptvmv17YA+qKkqmQw/1B8/kbmCr3s0YLL6iEFwA==
X-Received: by 2002:a17:907:3d8a:: with SMTP id
 he10mr10115472ejc.16.1625757475581; 
 Thu, 08 Jul 2021 08:17:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/48] modules: check if all dependencies can be satisfied
Date: Thu,  8 Jul 2021 17:17:08 +0200
Message-Id: <20210708151748.408754-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jose R. Ziviani" <jziviani@suse.de>

Verifies if all dependencies are correctly listed in the modinfo.c too
and stop the builds if they're not.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-5-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/modinfo-generate.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
index a6d98a6bc4..f559eed007 100755
--- a/scripts/modinfo-generate.py
+++ b/scripts/modinfo-generate.py
@@ -59,6 +59,7 @@ def generate(name, lines):
     print_array("deps", deps)
     print_array("opts", opts)
     print("},{");
+    return deps
 
 def print_pre():
     print("/* generated by scripts/modinfo-generate.py */")
@@ -71,14 +72,26 @@ def print_post():
     print("}};")
 
 def main(args):
+    deps = {}
     print_pre()
     for modinfo in args:
         with open(modinfo) as f:
             lines = f.readlines()
         print("    /* %s */" % modinfo)
         (basename, ext) = os.path.splitext(modinfo)
-        generate(basename, lines)
+        deps[basename] = generate(basename, lines)
     print_post()
 
+    flattened_deps = {flat.strip('" ') for dep in deps.values() for flat in dep}
+    error = False
+    for dep in flattened_deps:
+        if dep not in deps.keys():
+            print("Dependency {} cannot be satisfied".format(dep),
+                  file=sys.stderr)
+            error = True
+
+    if error:
+        exit(1)
+
 if __name__ == "__main__":
     main(sys.argv[1:])
-- 
2.31.1



