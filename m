Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD924443989
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:20:47 +0100 (CET)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi35C-0000wR-TT
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2fB-00081h-SE
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:53 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f8-0002vl-Nk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:53 -0400
Received: by mail-io1-xd36.google.com with SMTP id z206so654169iof.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2bQIWGL0XqjqPbzVAf7nqAzcBUhtupJ0ypcSsardcc=;
 b=FbyWJOPN4JgY8FvbYmqNCqW46yYYnQeEM76xOFFYhjX6a2jnCf6h1BQEgls21Rh4ks
 7ob40dbj9agR0pXGYKB3ZuNVMum6PUaWmrds6b9G2Gukmbq9wJyM7dY+PcGsMfoKLHJL
 eNDCglkVmwlFA1oMIPCRxv4HqJoQ5ylCpKxaomv8Z+nfTA95iDB6fPcH2xkR+GoRcinK
 kDeHE561o3r8Xrj0rv9w0kjg8vFnoWlmlf+9zF4MNq+UGBVct7wrIiga+n9R+dxsAgBC
 8yA4L/vsa8hjtLj7UeCsDY2wbdcpsYmR3PlkYI9QcfZZz32HkY7R9LurMWBvvUNvhZhp
 DqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2bQIWGL0XqjqPbzVAf7nqAzcBUhtupJ0ypcSsardcc=;
 b=vbxMhV0Wgx00GPKd2ZQgdGuVOx0+n5JDNbVgu+dcugu78CosGqmcPbjfFSDZMKulBJ
 bpXXYk5vmOw3ud6iQH6ASkgdP0L4eJSFKTt/ndxqL6dxgAip/UjzTyngbW8l+GYfSaLn
 WpxZ4aEpL1uFWEhKcb0c7qO8WG5EJCazDfq7Qia2mubw38QB2b1pMx5hVtoyH2JpTMZD
 7HWCV7y2eK7Gugr74IUv6Ns0/3v6USJ7QO1taLs6jQwxc3RDxgQIAoC7vZvkTBQLMOQ8
 ua6NF2kTg0o/Mw05VRIQ5nZ8hdLaoSRV2+c5Xpbu1PMe/9B4DIp2/7LaL5Pfx04Knlii
 1Bkw==
X-Gm-Message-State: AOAM5311rYbrYLInYnyOP2uG8oE0IWYRoJ6HuPUTvs2RuQi8ctDsspq6
 yVGKQxdv0+lL0wWi8zhiFDih3dtUklY/Sg==
X-Google-Smtp-Source: ABdhPJw0oSesAjkdoGIfe0Yp23QLnB7YgSIf6XSVFk3U1gK6kftBL64Ofezt98ZmRBfyXwfWmQIRnQ==
X-Received: by 2002:a05:6638:3052:: with SMTP id
 u18mr30704277jak.148.1635893629646; 
 Tue, 02 Nov 2021 15:53:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/30] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Tue,  2 Nov 2021 16:52:48 -0600
Message-Id: <20211102225248.52999-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8..e84aff948c 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -30,14 +30,7 @@
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-typedef struct target_ucontext {
-    target_sigset_t   uc_sigmask;
-    target_mcontext_t uc_mcontext;
-    abi_ulong         uc_link;
-    target_stack_t    uc_stack;
-    int32_t           uc_flags;
-    int32_t         __spare__[4];
-} target_ucontext_t;
+#include "target_os_ucontext.h"
 
 struct target_sigframe {
     abi_ulong   sf_signum;
-- 
2.33.0


