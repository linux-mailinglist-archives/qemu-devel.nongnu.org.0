Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0752F39BE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:13:10 +0100 (CET)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzP6K-0000Dk-T5
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOcE-0007rM-Ls
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:42:02 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOcD-0000mS-6G
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:42:02 -0500
Received: by mail-wm1-x335.google.com with SMTP id y187so3095053wmd.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 10:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2h2Lkh1nqLrN72EhYLNCgPb6E0o6hk4k8AQTBHNUFWg=;
 b=VFa5OfI3JYt17ny4tYPs2cTxoTfl8ebc1I+/UqQPq7LSIJ6cZQpQqwA9hSePvJYwQj
 dOegfF0ScNvCfqDPQhf5ZWb5+98aYjS/UshdbAIjBZzsq6a8RfXf81iYLXZ3LywZoVpb
 oPHUPBj4PutquC/xJyQYNuzTNjVAflMfcnBZ5Y9BnC90HJgWIiRB+xgk0mlxXiBA3jgH
 cdWRPTMO2iMXCIxOsa7kjijUj0JYQ1RyOfO7sG5e4tjTm0eALdNgN2RCCfEd/A4gFZEU
 Z6+H8K4N/Dy9k+asLi5SusKLxGjo824tWz4fzYgxK148ei1Tw64smsQ8ShdTC02vxkC9
 cf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2h2Lkh1nqLrN72EhYLNCgPb6E0o6hk4k8AQTBHNUFWg=;
 b=Nwxtp1TerxDLo7+LJdfB5YwOFd3aJHirbzjHC0cF79icfvuo2gyfeV6MtBDbKX4Gty
 IZmTbTnCNzVLmWTWK3XgH3dwZpjOw+yseeVSVGUmFDViTMXzV+/MW0qNESS/vMKmxXc/
 qHwzEsOWC7DcX3jTO/0Y4rHeNcsvlUk0DlWsugsJqXpsOgH7EZC6VXPdgxRIyi7wVhyL
 mmOBr07SmjudJ7kGDs7coT5syaIoSbYvp+J1TdzyGO4cQIWivQ0L6+R0b6CU/clsU78T
 F/SMt/G5PUgpi/dkE7a5rb3uNtNmYsI5jRI2kIaHSD31ER/YRu9YwZsidN/lfybIe/PE
 AZmQ==
X-Gm-Message-State: AOAM532zJW+GL3wJlQCXYMVYUQdCShfjdXW94SnMnLCdruqvjsTETX32
 ttZO89qjtsUjELIsUyOIWqo7uLxexBI=
X-Google-Smtp-Source: ABdhPJzQm4D4K8kGXLFBDWW97Zmgdh6aY2NnpDaCQ/p0Sc0qKoBCDvyV8umWvsJtBpa1dqcDsvJgng==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr588615wmr.162.1610476919149; 
 Tue, 12 Jan 2021 10:41:59 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id r13sm6016146wrt.10.2021.01.12.10.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:41:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] decodetree: Allow 'dot' in opcode names
Date: Tue, 12 Jan 2021 19:41:56 +0100
Message-Id: <20210112184156.2014305-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some ISA use a dot in their opcodes. Allow the decodetree
script to process them. The dot is replaced by an underscore
in the generated code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/decodetree.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d1..b7572589e64 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -49,7 +49,7 @@
 re_arg_ident = '&[a-zA-Z0-9_]*'
 re_fld_ident = '%[a-zA-Z0-9_]*'
 re_fmt_ident = '@[a-zA-Z0-9_]*'
-re_pat_ident = '[a-zA-Z0-9_]*'
+re_pat_ident = '[a-zA-Z0-9_.]*'
 
 def error_with_file(file, lineno, *args):
     """Print an error message from file:line and args and exit."""
@@ -1082,6 +1082,7 @@ def parse_file(f, parent_pat):
         elif re.fullmatch(re_fmt_ident, name):
             parse_generic(start_lineno, None, name[1:], toks)
         elif re.fullmatch(re_pat_ident, name):
+            name = name.replace('.', '_')
             parse_generic(start_lineno, parent_pat, name, toks)
         else:
             error(lineno, 'invalid token "{0}"'.format(name))
-- 
2.26.2


