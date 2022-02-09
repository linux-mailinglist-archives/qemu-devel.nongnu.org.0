Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021814B00F1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:08:01 +0100 (CET)
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHw48-0000Qu-3c
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxY-0004NA-6j
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:14 -0500
Received: from [2607:f8b0:4864:20::434] (port=45844
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxW-00034u-8u
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:11 -0500
Received: by mail-pf1-x434.google.com with SMTP id 9so4101732pfx.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4Q0dpcIvNuFDkQMGtGR7mU1AT622fYAy+5CgAtgn2A=;
 b=cmdistdAqcaIUoMaBNlTH1EN7H+uQGJCeUGmf5ARbWYDMuluAd/WHSjAZLy+UV/Ulz
 ADH0WT9PypyCon161G1uYe+9QGL8CMHpg7bLoIXGVq/+ysOEsbG8t4ygqRe3Zx8FYyAf
 xdPnbqd2FjgqpihC8ZgTkIHFEDmuzB0ko/2VHTU5BtuIztX7pPp2F69/rIE8F+Ho2Yxd
 OOOLu4nhU02J3wCgM8+DGyzsgHDnrYfKzo1fx1Ek5Dkaq/kLexFYr7/EAfYg9gWkyvu+
 zIVtYn9Fx4L64dfylsB4WsDsibRKTWMn5Gk1ghueODnFYVwQtj/yWHO4iwCWfr4aD0MH
 Oeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H4Q0dpcIvNuFDkQMGtGR7mU1AT622fYAy+5CgAtgn2A=;
 b=GznMTKVNmQKK3kTTou6HHCDKudkA/HtTK6rkeEJPucQS+OmigQp+LLjeGwUvnGuWfB
 H5VfGFSruxAG3V+rj95ri/mckyN+gW4JvySEzWHgol3kBqxbK/CjTtaP/tIpen0lOSJK
 PxcoDM0XAbNwpHLzmWvycDkMokXhaB7HYCqyAkJZaRhAxmymqFTWXNqD3vVbatyAdF6T
 Exn3eNxyD95NU3mzSAc1PpDzzQOHDILdwU2HnXpaSVfz3aOr47dRgn8qoRs3rsI8X87e
 KvnpzI6WE9Ssr9iyg1yYS86iauuuzyr2DIvwlTJ2W2SCsnX8g3t/VxDUkCVt+GBmXQ/H
 nppQ==
X-Gm-Message-State: AOAM532zj3gQfn00w/fQ1waIq4wriyU5UsjBMAB9wdzOo12t2H+GtAsi
 p5g8sIq9cbt7dyAih9Hy7M1VSHRZzlM=
X-Google-Smtp-Source: ABdhPJwkVU3f3UT/1VrCCDL5CGixRlr9ajJnGOVwcFVoNQJ+665Uv6WtOS6zH3K5+58MDXJlJWWcyg==
X-Received: by 2002:a63:8ac8:: with SMTP id y191mr3678530pgd.29.1644447668917; 
 Wed, 09 Feb 2022 15:01:08 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o7sm19487338pfk.184.2022.02.09.15.01.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:01:08 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 4/9] linux-user/exit: Add missing 'qemu/plugin.h' header
Date: Thu, 10 Feb 2022 00:00:25 +0100
Message-Id: <20220209230030.93987-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

qemu_plugin_user_exit() is declared in "qemu/plugin.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/exit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/exit.c b/linux-user/exit.c
index fa6ef0b9b4..10989f17f8 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/plugin.h"
 #include "exec/gdbstub.h"
 #include "qemu.h"
 #include "user-internals.h"
-- 
2.34.1


