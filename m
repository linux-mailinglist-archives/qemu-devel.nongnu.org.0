Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B215AD9B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 17:44:29 +0100 (CET)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1v7k-0008V0-SR
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 11:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j1v51-0003Fo-6v
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:41:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j1v50-0001gY-9M
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:41:39 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41686)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j1v50-0001fm-3R
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:41:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id c9so3191290wrw.8
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 08:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sk9WshqGTq9cCur9E6esTWtP0xlnXywDapbkjl0RGOM=;
 b=Q6+kKDxBlMkENLKz28HVgnBJtW8Q5wB+Dbgs7tPkrz2SUaWnBKVs5g8472EBH6pkC/
 enGWcIAps1DJiDcZqkJoxRr5MvVkz6qzlZ8p9ISVs5Hkj9Fvg5pCn3Rv+nUomdYkpn7m
 jszlHhOc19DOpOYy3rHxtqAYWd8i7vi6Mk+fXOleynGWcJN859phidjtLYQGA83mPwyo
 itN0SXRq+QL8nUT5ufbHf9+S8RKGbdkFYM6CqqRtBuZcjEYaRQbVu87iOWF3KKlgSJ5t
 qjqVFju71PV7TT58YL6um4VPaQlN+SjxqBb0YNBFAoCqrkrshX2EQKoF2YwJAsmqnlOX
 625w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sk9WshqGTq9cCur9E6esTWtP0xlnXywDapbkjl0RGOM=;
 b=TB5wgJAbgCCmJicKzlHXiTyOmhSppbnYHsXT1FfNtTGcmBfCpboFkw6j7Cab+mfAPL
 Lzxx1R1YUEYB4J8RC2+4aW5A5USq0s0JqjhxiHtAvs2hbUhPDudG4Lp7ZFeNMBlo+3gG
 pNQYNKEHFzo1MdPW4iIRkoW7ojlnxuklhqk2omdhPomQUC/j7Frvv7t5PrPbVPE54t8j
 7p3ZYILwcFY3acI1FYED0dthZTadsnV25JcWgz+/vI4Gd+DOb7UOb0y8NG0UX8gy5Dno
 5zm4CHNLC1MZ7U5cJ3XDAfKzGd/Cm1B3XsJO+Q2tLQgCVd03DUmfKwhhWPtTl4p08xfy
 fxkg==
X-Gm-Message-State: APjAAAXRlx1we93SRoXp///iBOTYyJdmu22bHMCrygoJV7TTTDkftlne
 yBl1MjPTfROtA0PcXo+N7zKAvQd3
X-Google-Smtp-Source: APXvYqzMW9M8hAiYtzselwEvAJXNDK/EGBCOfZGvTJmRnyb2RU7e1mR95B315E7gVOZwsiXtqbZlTg==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr16103264wrq.412.1581525696743; 
 Wed, 12 Feb 2020 08:41:36 -0800 (PST)
Received: from donizetti.fritz.box ([151.30.86.140])
 by smtp.gmail.com with ESMTPSA id a16sm1195122wrt.30.2020.02.12.08.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 08:41:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] minikconf: accept alnum identifiers
Date: Wed, 12 Feb 2020 17:41:24 +0100
Message-Id: <20200212164129.6968-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200212164129.6968-1-pbonzini@redhat.com>
References: <20200212164129.6968-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/minikconf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/minikconf.py b/scripts/minikconf.py
index 40ae1989e1..febd9a479f 100644
--- a/scripts/minikconf.py
+++ b/scripts/minikconf.py
@@ -645,7 +645,7 @@ class KconfigParser:
             self.cursor = self.src.find('\n', self.cursor)
             self.val = self.src[start:self.cursor]
             return TOK_SOURCE
-        elif self.tok.isalpha():
+        elif self.tok.isalnum():
             # identifier
             while self.src[self.cursor].isalnum() or self.src[self.cursor] == '_':
                 self.cursor += 1
-- 
2.21.0



