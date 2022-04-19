Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DF5064A7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:38:14 +0200 (CEST)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghV8-0006xt-1l
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglv-0001A1-4b
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggls-0004Q0-KP
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:29 -0400
Received: by mail-wr1-x433.google.com with SMTP id p18so20086313wru.5
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GmjyLZQYsGB/Vh7JMnCX3wvH/I72Pbuvc/SQfMglBh4=;
 b=gMAzO56zSXPGsVtUuIzZhBaqFOv40fCPQWL8xDd7SayVqfhMS+KsKoLIjCFqMs8gMA
 S1RrshRH0GyOA7jqcPwqjDIYVrcAK5h518Dc8ZxRWiTYUhAX4djrqFyMqAwikbQUsljc
 nIHGEldSnnNPce2ok4lfpIrFnHmHKn6/XPDI8oe+26X1uBtcD3fT/ta5vm9xF2pghrqP
 A4aBOoDF5npQLjCZy9KIzle+P6kFeP3P01vU+pijKiBFbhLSQIuvaYcgzOq+CGRduOkt
 he+Uf6UoxBqN+F0Onffdo+XsgeD2CqquqBQupkwoR2noIYVfj9wGspC3unyH5DTpGj+b
 RTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GmjyLZQYsGB/Vh7JMnCX3wvH/I72Pbuvc/SQfMglBh4=;
 b=7qNQPZLndJFMVbj1E3+IX28nKcLTVC7WQcsK+q/cXgvMdJuewMby1uHrdd1iBtZ9oH
 WvKo6POZYmbiIsNHMjzPq9cPI+cNP70YjjuBUcTLNQU7xw9lpiJwJcuHn3xwcGMbx/NL
 adUp/gUSX7hH/dhQF42YnzRPVetQqwjAhYg6aS7hHNnx1E3cssF5l+C5/M5DnxCcuIfj
 qiPgrSDnX+3vAhVdaxbJ7g2h5xWSGfgstsZVx+0hTA2A236+eXVk6ipIhrV+mYDg97yc
 WMADhiTbNFCMzPDOhrngQdnMJ7dpxjb/svivyswqXFkuolWSuoIHoInLs07o0+++pmB0
 wOew==
X-Gm-Message-State: AOAM533VYNzbBcnpFy0rpsFbLPRboxRnljFUJJ16FCW/oAeQ7h6BdIiZ
 v5FJvZZQWG/KWm7NbZ3rQDtPLEGMi7h9zw==
X-Google-Smtp-Source: ABdhPJzO+WaG/HHIuHkEe4xucmIEvSDseI/+khIDZlKHbpkz4d0JriFw2tEvGdW5bneRttoGRjyFJA==
X-Received: by 2002:a5d:6d8f:0:b0:20a:a699:874d with SMTP id
 l15-20020a5d6d8f000000b0020aa699874dmr1225901wrs.386.1650347486409; 
 Mon, 18 Apr 2022 22:51:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/53] error-report: use error_printf() for program prefix
Date: Tue, 19 Apr 2022 07:50:36 +0200
Message-Id: <20220419055109.142788-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For consistency with other calls in the function, let's use
error_printf(). (it will use stderr since !monitor_cur())

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-16-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/error-report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/error-report.c b/util/error-report.c
index 71ce3ee700..d9d3ac30cf 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -156,7 +156,7 @@ static void print_loc(void)
     const char *const *argp;
 
     if (!monitor_cur() && g_get_prgname()) {
-        fprintf(stderr, "%s:", g_get_prgname());
+        error_printf("%s:", g_get_prgname());
         sep = " ";
     }
     switch (cur_loc->kind) {
-- 
2.35.1



