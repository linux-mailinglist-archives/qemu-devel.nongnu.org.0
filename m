Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7F131794
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 19:36:55 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioXFF-0006sG-Ke
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 13:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX3s-0001h1-Am
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX3r-0003r6-7p
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:08 -0500
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:41657)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX3r-0003qn-3c; Mon, 06 Jan 2020 13:25:07 -0500
Received: by mail-qv1-xf44.google.com with SMTP id x1so19419533qvr.8;
 Mon, 06 Jan 2020 10:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIopQr4qTmGaxGQiMN5TTFQQCD/j0A0k1KsTz1BsHzQ=;
 b=qsvA6ykMdsUaYwrycIaSnBHwNEA/UnDxc/XsRoNQAUOHMpjXlpz7Q5dMJQpV8uzJvi
 wHjeM/Fld3r94sYQ0FRIw9ABv2y6VXn3Zjwn9rHPiP9Tk4YFC3Yuu0LjgA6/niZyCfzi
 utUJ0T29pW/0DLN5pF1ZhaZ8qZPfFMb9PDB5Q6AyZ22Hd2hohPUTWM8yn8qV/8qDonXk
 RIOp7cpQjxV/BFtef6J5EcPXW275Vh4EKw88y1C9P1j+Mz6Tm7jms9c61gl9v2CrY1UH
 wG/i6cgvxYUNHyIYEcea6+rnz4ja9X8a6pXOiDTlem5jvnyTkroi2ONCdKuAfyJDBgzk
 aKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HIopQr4qTmGaxGQiMN5TTFQQCD/j0A0k1KsTz1BsHzQ=;
 b=J5FjlitYmGodnWImDiELQCsMA7v22xY45FQg6Md9yFaeiHmLAWP9UHAn0+X1muyvDb
 MalDFpdzfhzVvCfzD/9ZIo10K4AZXGhvk4O+nrNM0SbSCOog60YCQDWgAq37EwZwjdw1
 kL5BinS92qn3Iuwk9A0FxuW+oNZ/LrT2OvZFWiMukC3V6gIt23Ha/gX4Vx0n8WSDNkhq
 37kkO+GazFUfnqj/aqfpLtbrzWz8IH4j6evlBEOJpInU/D6YsxTvm3YPDuqfEq1zD1oa
 DkdQ27uyeYynY3941EvWZyVSZuKKEC0Ms/XDhf/462euaFCibBN5ga/v6CidjAkHjrjS
 nQsw==
X-Gm-Message-State: APjAAAX+jb3xBNPQQiwtRbfSM+zaw+0VQAjbxtaArRyFTs9wxAiOZTUK
 fYtmPljaoY8GtPLznw4fRDJvYFBu
X-Google-Smtp-Source: APXvYqyrGoztyJ3OW0uHkXVUIYehSLXql54psfC/wxm3VKSe1+tGwfTPA0tiSR1qnkYmgtNRym0H0A==
X-Received: by 2002:ad4:49cc:: with SMTP id j12mr79841188qvy.188.1578335106538; 
 Mon, 06 Jan 2020 10:25:06 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:06 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/59] chardev/char-mux.c: remove 'send_char' label
Date: Mon,  6 Jan 2020 15:23:34 -0300
Message-Id: <20200106182425.20312-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f44
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: Marc-André Lureau <marcandre.lureau@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 chardev/char-mux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 200c62a0d0..edbaaf5cbf 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -140,7 +140,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
     if (d->term_got_escape) {
         d->term_got_escape = 0;
         if (ch == term_escape_char) {
-            goto send_char;
+            return 1;
         }
         switch (ch) {
         case '?':
@@ -174,7 +174,6 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
     } else if (ch == term_escape_char) {
         d->term_got_escape = 1;
     } else {
-    send_char:
         return 1;
     }
     return 0;
-- 
2.24.1


