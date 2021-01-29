Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025753088E2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:09:20 +0100 (CET)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SaV-0001uv-1v
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnS-0004j5-C6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:38 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnQ-00063R-Qw
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:38 -0500
Received: by mail-ej1-x631.google.com with SMTP id g3so12439952ejb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YprS6WLIVkaeg2n5pH1EgvoQ2qIhYa6VfFQv4EDnEHw=;
 b=FSu/p+2zzUugeEa6crqE4Tl+uja/V0ZWOtuHhCyamgijAo+goK0y0VfErjNiqKvd9b
 EibXmFlQyeat1RQu2sMvbl7MTdDFoR4HasYxXE2MVTlWqpXenCJ6cLjr5jpk/nJ0rvKH
 /thfy/i3KQVj5jswigtoTtkQ2qAMlA6BR/hcnBz/YCBtA8f2aYlg3Yit2fby2h2CTT1Z
 aXhk+fMZrhD4M+q2x6gYUKRB8gT0TcqUTRxni3vpicm8alpnSgbNkwEDEYysrjjQiRaN
 AYgz+V0LCox83ntHuJuIIoHj+UjQUQ9EiDkkiPA2rEQigCwuQIumNCbaruif7LH+B3KE
 bCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YprS6WLIVkaeg2n5pH1EgvoQ2qIhYa6VfFQv4EDnEHw=;
 b=gUk57JjmK2ld/s60pTMqsuoiJJHs85sUXwbo3HWPT45nUzl+CGYdXTAkcEX0OmmPow
 EK4UA9gnx2in2gEURSOj1102hXG7E1mbYBY5KUkgnL3m/p4LMgYWqDzEXSlFOxaLgAOX
 Zxxsfm9NbOtyqfHx26q3BNFWDoW/+VrLzDaSuxklFCdxqZM81BlRknF9rgZ2Zka+9cBM
 khI/foBTP9ToRql9/ud2xK0ZsNeF1THnEsTVIOymz0d/oYXJQqc6Ph874NfUQhCKnx35
 a1nguDevsMRNxPotZn4NeFJ9Pj4XC1aYS1nZUflC8+aiKq0K2I62B3wiTfGcZH3dzI2l
 KgXg==
X-Gm-Message-State: AOAM530BgvQtLq+WVTw5rRlPvD1a9qyd+tZbCwc0Ih/moO4oQt2wMJh9
 MPFixcAX9sK+1yoi8QyZ3NGZhLr/7VdThA==
X-Google-Smtp-Source: ABdhPJx2gCmFdXmNAzQ/B8GIiHqKMmUqadG6R1bixB0XI9IIt+q7JpVVoYBxsZAGYEypj3mi/5Q14g==
X-Received: by 2002:a17:907:7785:: with SMTP id
 ky5mr4150811ejc.176.1611919115645; 
 Fri, 29 Jan 2021 03:18:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/36] meson: Warn when TCI is selected but TCG backend is
 available
Date: Fri, 29 Jan 2021 12:18:00 +0100
Message-Id: <20210129111814.566629-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Some new users get confused with 'TCG' and 'TCI', and enable TCI
support expecting to enable TCG.

Emit a warning when native TCG backend is available on the
host architecture, mentioning this is a suboptimal configuration.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210125144530.2837481-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meson.build b/meson.build
index 21bc9f1b2c..b6c9db613b 100644
--- a/meson.build
+++ b/meson.build
@@ -231,6 +231,13 @@ if not get_option('tcg').disabled()
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
+  elif get_option('tcg_interpreter')
+    warning('Use of the TCG interpretor is not recommended on this host')
+    warning('architecture. There is a native TCG execution backend available')
+    warning('which provides substantially better performance and reliability.')
+    warning('It is strongly recommended to remove the --enable-tcg-interpreter')
+    warning('configuration option on this architecture to use the native')
+    warning('backend.')
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
-- 
2.29.2



