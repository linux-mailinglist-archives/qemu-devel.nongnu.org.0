Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964B444497
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:23:02 +0100 (CET)
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI6P-0006Yh-N4
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpA-0003Uf-Iz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp8-0000x7-Dp
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s13so4085093wrb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIzr7BKpCxEPcBjLKnsn6ExhpeVbY0ouQ+sU6JtlHwo=;
 b=g02Y/gRA7lX8t+Ijq8qtwjoe6PLwAig3BW7H6Pnl7jjSDJfDZxC/Q4MUqD5T+AJhpi
 TC6LTGrmG2L6mpFBsYI2gegCmgyev/FpaHXaKqpZ/Gy9GnHXkM78OZJ/Nw8SrNMAWdSk
 1OAfDEE9TRPDg3xUBn609mQCRzWLGl/NuPrA67RZDbH8mS6FB3U92xzquXQkpdk8hPpp
 jxu8xhgDaLYrktQwdLjCkScMpSLSYtv8nKbT1kh4toQcTyex580pc/O1tvobrg2UibtH
 v2xYmJLiPhkJ7OvzcUk9a7mAuK9Zvr4Xs7kfJU5hAcJdfmBwHYXaB6UgXgsD9jGzOUah
 pyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FIzr7BKpCxEPcBjLKnsn6ExhpeVbY0ouQ+sU6JtlHwo=;
 b=wIKAnqQqjUS9ec+FELYP1ClnzKDT2MWorLKuOyd3XzmjygVsXHoB/mt28EmITffHgm
 7R726H2vgoMoX70YXHMv6kIzmR8OVIHuwa5dIaOlG3RVVsLYhcZrNgW7DxcSGF08oktS
 kVsB++oX4i3w0VCXbeMjw5fP6FOKV5v0OfGwRMCp9OCP+BF77HJeux0FB3uIsrnX5vTC
 QwLGn0D99lkmvUcT41bvoMNJO3AlfSV5MKl/BfNDTy+O1v0Ck8lrAvOIS0n3cKNa64AO
 jSPDbjjkkNiLhNmGysTZMAc4TwfyimEaCTDNJYRhWFR1ig28U6CW5RTdph5HTrql53L8
 ifPg==
X-Gm-Message-State: AOAM530O91XpjCfSjgTRwKp4WEkyroYUZ5yI6a9wbPBiIkB90wyVXIli
 UnvggA1b3gNv8KmDcrOphn2mzyDlkZc=
X-Google-Smtp-Source: ABdhPJwqkz76q88NrfP+EvICcFTl7p6apu8RsDsRGoMxY8kuwQbe8y+yaVTr9DplhWB/JpTgVm+VNA==
X-Received: by 2002:a5d:6d51:: with SMTP id k17mr56971453wri.233.1635951908534; 
 Wed, 03 Nov 2021 08:05:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/27] meson.build: Allow to disable OSS again
Date: Wed,  3 Nov 2021 16:04:37 +0100
Message-Id: <20211103150442.387121-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

If sys/soundcard.h is available, it is currently not possible to
disable OSS with the --disable-oss or --without-default-features
configure switches. Improve the check in meson.build to fix this.

Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211102105822.773131-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 85f1e43dfe..0ab9c43bf2 100644
--- a/meson.build
+++ b/meson.build
@@ -911,7 +911,7 @@ if liblzfse.found() and not cc.links('''
 endif
 
 oss = not_found
-if not get_option('oss').auto() or have_system
+if have_system and not get_option('oss').disabled()
   if not cc.has_header('sys/soundcard.h')
     # not found
   elif targetos == 'netbsd'
-- 
2.31.1



