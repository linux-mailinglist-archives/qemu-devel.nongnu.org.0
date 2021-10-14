Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450E642DF41
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:36:42 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3ij-0003aS-A4
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c3-0003LB-JI
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c1-0000Wy-QY
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:47 -0400
Received: by mail-ed1-x532.google.com with SMTP id g10so26618898edj.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i00g5dv3ub0z8f0ZPTko4cFX4lVcc7Tu0/Tq5pcaoas=;
 b=BKk2BTBh1Vyq2s58zOt7G0QpuwILSEt3djti0DFycPkLue0HOVNm2rVm6vuEKXBTsp
 /WQzHed8wXd195dO3XA6ITMKO2bjnYz8Q7Y7fT3hATBnEGgEQ06nbWuYsT+1ztYXwm8+
 xFBXGOWvaUQKtW/eXUlxAl/qkZB8+rT5udf2+f3DTNm2R4/k49nC9jxEPc7WqfSL8+7I
 yuMc/ruq9Kfi8owuOPvE8zKq/tuh4w39w6L5H61xq1OF67XsvpWcriWzVPUYhvXFMRZ6
 evV6f3hiy9PfOf5XuFgtGXf6oxXzi+DgjwZarYKuEGn7mWDm4ixP55bB4qm3ZRnHGoDQ
 OIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i00g5dv3ub0z8f0ZPTko4cFX4lVcc7Tu0/Tq5pcaoas=;
 b=eC2pRCf9XbtE3nQ1hF5LukzFdP/HZZ3Cagr5As8NMFbXvhNL8nlrdkMPN1PGDjBpqE
 i2cg0ptPIj1k+ri3jWT3hUlolrOFAV4VD+/bnzQej30ySXcZ2duawfpHdXLyvczx8sB9
 WejfEkqiIrT6YBTCr6l1MRuLkLqXtDKxZulL+qsWYAIUWLvZs2jyoFc3XxC/1zaAYI+D
 TVc2NdUZnEP/6qXLAis7nV4RA9UYN7m5hfIE9oyO4ppJ2MsU32oXbFnJc7VyIi0NWaB3
 YE9FFvTOnglXAbVgZqbdpiCWSGqIYYKytJVIZgOs3aFUrTpek0zfVOEvsnhY3KW97agT
 mKtQ==
X-Gm-Message-State: AOAM53021YOG8DMOuIGfQnoanncN8ALyMUKu1Q7j3RBtntlA+yXHaKkC
 a/OtPk0DZq7WYb1daY9GoMunTNRYrl8=
X-Google-Smtp-Source: ABdhPJzSG0xNomy0eSOpimh6O07k1emgUq8tZI/HFblHX+zaI+mZZ6qq9hCE+L8EF1RjzWjVxEf8lw==
X-Received: by 2002:a50:e14c:: with SMTP id i12mr9811124edl.125.1634228984496; 
 Thu, 14 Oct 2021 09:29:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] meson: define symbols for all available audio drivers
Date: Thu, 14 Oct 2021 18:29:16 +0200
Message-Id: <20211014162938.430211-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All drivers are now built by default if the corresponding libraries
are available, similar to how all other modules behave;
--audio-drv-list only governs the default choice of the audio driver.

Adjust the CONFIG_AUDIO_* preprocessor symbols so that they are
based on library availability rather than --audio-drv-list, so that
the tests and -audiodev help follow the new logic.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20211007130630.632028-5-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 90d1b7ab61..0b9ebf9bfb 100644
--- a/meson.build
+++ b/meson.build
@@ -1217,6 +1217,9 @@ if have_system
     'pa': pulse.found(),
     'sdl': sdl.found(),
   }
+  foreach k, v: audio_drivers_available
+    config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), v)
+  endforeach
 
   # Default to native drivers first, OSS second, SDL third
   audio_drivers_priority = \
@@ -1239,9 +1242,6 @@ if have_system
     endif
   endforeach
 endif
-foreach k: audio_drivers_selected
-  config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), true)
-endforeach
 config_host_data.set('CONFIG_AUDIO_DRIVERS',
                      '"' + '", "'.join(audio_drivers_selected) + '", ')
 
-- 
2.31.1



