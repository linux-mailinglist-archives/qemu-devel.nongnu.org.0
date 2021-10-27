Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E443CB2E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:51:32 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjL1-0002RD-7k
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfijc-00026P-7j
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:54 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfijZ-0005fB-4i
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:51 -0400
Received: by mail-ed1-x531.google.com with SMTP id g10so10410513edj.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YP//+gZEuiiaftiEX3vnR7gaMlbwgWW6l4uyF5N0mZQ=;
 b=IcIwqJPjPD9XNiTPUaJgy8lt7y4SzAHU40wT4ot0Nz9iw25sP/Ln4oEAL+iMFrGuE9
 1eTTw5ocgr/IMb5jn3vr92ol33ZrxFa4prooXAJIK7kcwXZ9Dr1C2CnPzlghKtdR9WM3
 bqzqbjWgaXPAEstmslhqM713ejzRVihxvzAHcrvJYt+CUqU6vdFiX19yj8lnPOWwt1Zl
 N3dw/5fVcuoJm4dEzyplyOdtyUXAN+c8rkcGy+wKvCrZFBB2YLLLwhtdRuBQ/0Qd+jYm
 RIlZLsRMBhW58qdFYkW8xpF5eqHQV0xoNbAbryQy1MJFpURe6qkCLIoIMcMvnoDPt5g3
 G1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YP//+gZEuiiaftiEX3vnR7gaMlbwgWW6l4uyF5N0mZQ=;
 b=wsbZdYDt8Vj5v9ojIxRrxngIBlxIAjVf6Bi1glW/P+Q4i3d7JsUauG1WYYnQhEKz8o
 OzLwGanGBw2csMHuG2bM5KL7WpHWLlS5b5yIQr0Od60I8iKNK4Dqoh39ByOHNVMhmIwP
 FTg8v/tc7dCPxi+NMZiz/jJgzcRgB8IJdR7g98jVlMd5W0bqJxj2LCEjp2hKhfUfO9gL
 GfXLoFjoYsxk3SsBLRDFWpL3Yv43EXpk8/Yk6BY3YdpvQiO1y0HXkJBnmMXyvwtEFSpR
 HUoX9py7cpuF4IwezquQ6eiWreo2Jztk9wE28F6rLKaTA45CN5iLjnIxVDCMFgEHXuY4
 V00A==
X-Gm-Message-State: AOAM533GWpHhFNfGi4svHa0tH92rHUuSC6XU55037KnYv0Rdw+ODysSn
 Y1O7XlV5z/PJ4o9xVTgeNLI2TnjE/y4=
X-Google-Smtp-Source: ABdhPJze5WB12Jk8ZUM9T032UdXtlpALL14RDBXy/DbreKrZ9LaXenGUIR628IanwdUu74zNqaRKGw==
X-Received: by 2002:a17:906:13ce:: with SMTP id
 g14mr29663508ejc.203.1635340362322; 
 Wed, 27 Oct 2021 06:12:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p26sm12716943edu.57.2021.10.27.06.12.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 06:12:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] vl: deprecate -watchdog
Date: Wed, 27 Oct 2021 15:12:38 +0200
Message-Id: <20211027131239.802564-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027131239.802564-1-pbonzini@redhat.com>
References: <20211027131239.802564-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-watchdog is the same as -device except that it is case insensitive (and it
allows only watchdog devices of course).  Now that "-device help" can list
as such the available watchdog devices, we can deprecate it.

Note that even though -watchdog tries to be case insensitive, it fails
at that: "-watchdog i6300xyz" fails with "Unknown -watchdog device",
but "-watchdog i6300ESB" also fails (when the generated -device option
is processed) with an error "'i6300ESB' is not a valid device model name".
For this reason, the documentation update does not mention the case
insensitivity of -watchdog.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst | 5 +++++
 softmmu/vl.c              | 1 +
 2 files changed, 6 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0bed6ecb1d..3540f5754b 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -160,6 +160,11 @@ Use ``-display sdl`` instead.
 
 Use ``-display curses`` instead.
 
+``-watchdog`` (since 6.2)
+'''''''''''''''''''''''''
+
+Use ``-device`` instead.
+
 ``-smp`` ("parameter=0" SMP configurations) (since 6.2)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 55ab70eb97..33908860e7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3216,6 +3216,7 @@ void qemu_init(int argc, char **argv, char **envp)
                     error_report("only one watchdog option may be given");
                     exit(1);
                 }
+                warn_report("-watchdog is deprecated; use -device instead.");
                 watchdog = optarg;
                 break;
             case QEMU_OPTION_action:
-- 
2.31.1



