Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB4158AECF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:24:54 +0200 (CEST)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK148-0001eT-VO
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oK12Z-0007PU-To
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oK12Y-0003Ae-J3
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659720193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1IZcipcr7DtJT/DRpdODj7BqNtwoMoTjmO9xn9/Rf90=;
 b=QjggJJC3hB3my08euC9j9h8b0geVmFUI8sXdVC5YLdCuYf4jEom6z0ORgr4n9oLvNqOKKC
 139cDr+yLPUAc3nG2vVh2ZDslsa1YJqRlCaYCa/uEvdNdyHqca6kKlhMK5PniRS71wJHsr
 77qGGkgIQRi6pcgakpe73z/HZremg2I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-MZeRz8OCOYursd12jTzxKQ-1; Fri, 05 Aug 2022 13:23:12 -0400
X-MC-Unique: MZeRz8OCOYursd12jTzxKQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 gs35-20020a1709072d2300b00730e14fd76eso1397829ejc.15
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=1IZcipcr7DtJT/DRpdODj7BqNtwoMoTjmO9xn9/Rf90=;
 b=vUSL/NtYg/mbMwxDwFjPhkwLQuHPDkZVnHKF9jt24mo8s1J5l/7GXI+49RwczGNC3S
 65+bWLwg4Fpzfb40uX3sDlxp0ZgWd/zw4QE9p2UCte3xP+rrC12EeH67FEq7C1jhe4HM
 TdZDvGg0l+bm8xWVbxkqWtOCeMqMz+3iRmNGoHA9n6d8TpLnBPmxQ8a+ui7XVzEnMsyV
 vrgiJDqSmV7fz+nsxngihQjtI9hB20GH6fe34FJPGppDEzqf94Spx1F0mkNv3DqpwJGu
 0jiyRdVRvl6/Jga93eMDn/NIJ1Chld0FLdN+N2fNMqDJoF2oRFzau+L72XDC9Khsqf4j
 2Jag==
X-Gm-Message-State: ACgBeo3rCoc3wIR1bo9tzLzYFKBTJWp0kckvXybwbAmz7NjENmPU8wT4
 j9I37iSZ7mggPJmiO+AsMeLWltXhgQiBg51kxzodFPw91iHB4OdcTD182uxURpRSTKTKlCaOqGS
 JnEld0Of76oVCpQOemXt9/AXEMLLIURg9XLiWatNeI4pmvqvs4GehHuROa389BZXl2x0=
X-Received: by 2002:a17:906:93f0:b0:730:6d25:8a1e with SMTP id
 yl16-20020a17090693f000b007306d258a1emr5931808ejb.431.1659720191289; 
 Fri, 05 Aug 2022 10:23:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7qtzOV//NDwoDRSK14EPAac/gMu23XAorXWDk9eqLYQCCYk1ECGs21fNrRx6dxD9f4DYXZrw==
X-Received: by 2002:a17:906:93f0:b0:730:6d25:8a1e with SMTP id
 yl16-20020a17090693f000b007306d258a1emr5931798ejb.431.1659720190951; 
 Fri, 05 Aug 2022 10:23:10 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a17090653da00b0072ffbbc3341sm1738963ejo.204.2022.08.05.10.23.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 10:23:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: remove dead code in parse_memory_options()
Date: Fri,  5 Aug 2022 19:23:09 +0200
Message-Id: <20220805172309.553441-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


