Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BAF121011
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 17:50:41 +0100 (CET)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igtZw-00057m-5Q
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 11:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtFK-0005Kj-39
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtFJ-0007uX-1Y
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35071)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1igtFI-0007rv-Qf
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id g17so8053954wro.2
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 08:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S3pmMgcEmeHBtI4+AVbPDjiFOAavVsNacKUoCx6hTZI=;
 b=Wgvfd2pv9qciSUQyY67jFfTAiHAmvnEQry4CBMrnKwcsHtARd9DOhbwmRJeRGF/OHM
 pF2GsmOLZsWadDDOlhP3KQMvvvKKnJ+tmgVc4oXLxEXpPD8824jggPZNKblru87FI9z0
 Y+sohN3R16EN2Q4Nsavh9xhz9eF1MMjrM0xlg5v5nMsniLbCt7kRO88oPYvhQ45ltBvd
 CeAhrgfsDEYhMTsK2R3bRfj9pi34LcVYN1Vl6Veug7AP6ZodJAF1jWrXz8Va1x0f50iO
 +xxkmwyM0IF/kzmyHMUvAHn5u8ELvmDSZMMnt/OzKIAYlaoSYkhIp5SxittOwQKy+tw7
 egcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S3pmMgcEmeHBtI4+AVbPDjiFOAavVsNacKUoCx6hTZI=;
 b=HsUMQuc+DVp/CrAnlql+W6ANVqImjeVQMvsvSDS8T7LKXACYw6x0K7GbI/21j8oDv3
 mbaTJzu6i/ZlSlCNGz/O90VAI1sv/cpUmh79UuqD0F833Myf4FQZ4hNf49cmsST3nMSK
 WsmX7oJ+TfKx33j0BpRuQdWjRmX5066Y97l0E4Wu63ykIEvkVarEQbtjYJcVrgFP+bkv
 eI2ESKIO/hcRjclG3C9gebcmgixhstJ5UFp7UrT/JbY0GmdhvO0ZwpIO9hk2n4JqIYk+
 FBmjhowlN3uHo/WXOYalAnGrKfvKlw15dkCMKMygeCTzj1RTWt3BhmIzJnemDO1TuSwj
 jt+w==
X-Gm-Message-State: APjAAAVMWDI5yAIsKumIWOd9/p+9KqE4acJVPoREXpm6G+RWGhhRw8gO
 1U0EPogb8qNN4ZK/JmyuN/WuOSzR
X-Google-Smtp-Source: APXvYqwfKA/jDnPJhxErUd1LKjejfpdukyT7neBuUgWQ2d1QbfPYkShPNPJfQyPLGdxBxeb+ONoRVg==
X-Received: by 2002:adf:e984:: with SMTP id h4mr30482020wrm.275.1576513759683; 
 Mon, 16 Dec 2019 08:29:19 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q68sm19962334wme.14.2019.12.16.08.29.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 08:29:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/62] build-sys: build vhost-user-gpu only if CONFIG_TOOLS
Date: Mon, 16 Dec 2019 17:28:16 +0100
Message-Id: <1576513726-53700-33-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
References: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

vhost-user-gpu is always built and installed, but it is not part of the emulator
proper.  Cut it if --disable-tools is specified.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index a2acef3..bfd8ba3 100644
--- a/Makefile
+++ b/Makefile
@@ -321,14 +321,10 @@ HELPERS-y =
 
 HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) = qemu-bridge-helper$(EXESUF)
 
-ifdef CONFIG_LINUX
-ifdef CONFIG_VIRGL
-ifdef CONFIG_GBM
+ifeq ($(CONFIG_LINUX)$(CONFIG_VIRGL)$(CONFIG_GBM)$(CONFIG_TOOLS),yyyy)
 HELPERS-y += vhost-user-gpu$(EXESUF)
 vhost-user-json-y += contrib/vhost-user-gpu/50-qemu-gpu.json
 endif
-endif
-endif
 
 # Sphinx does not allow building manuals into the same directory as
 # the source files, so if we're doing an in-tree QEMU build we must
-- 
1.8.3.1



