Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6513E470A7E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 20:37:06 +0100 (CET)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvlhY-00056O-Ku
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 14:37:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mvlfc-0004Oz-B8
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 14:35:04 -0500
Received: from [2607:f8b0:4864:20::734] (port=42501
 helo=mail-qk1-x734.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mvlfa-0001sY-6x
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 14:35:04 -0500
Received: by mail-qk1-x734.google.com with SMTP id g28so8716330qkk.9
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 11:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LZvhziiSpOBh0vC8yE04okJeIaA/J/aZR/gPEOPa60s=;
 b=l9mZTiIMsv9n8q8+YgiY4kIREo3bAQxulUzgIHa2t40ufnGDg2z8UJkCmkzaahskq6
 x1Vnjz2feT/YzNwV9GARtqjqyRrrQqN2Ozw6oVfFOg/3NqLSqiRxw/UQBiW+2sef2l2b
 yeBLzW4BTjZ8uehD2+U+q8Rmhm4QauLugTuqjaPZ5YZBknnos0BOpUplMXY7tjtN4mZV
 ZXQBDC6Ph2a76b6Sf7VoC2uWr06KqkDmi+VCNxX6nbEAgTYSN7bnlmx6rtggPYLxZszr
 oH3FdUW5kdUCoqkKOAtZaMXog6V8O1+yGo1PFJRpKK4ATGdUKkC74W7l1DnIFVQPgbp1
 TSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LZvhziiSpOBh0vC8yE04okJeIaA/J/aZR/gPEOPa60s=;
 b=WIu2jxj5kPiiwxeEXkvbpXJhyH31bCeOiH9PH1G6DW5e1PwTDNWxLuPvZHOMCxLouP
 CTnKfHDrrQMJ2nxfSsGN7mh25Hr38GossfnzoVWchtxsxE5tMtJcYUca3Esot7dexxrY
 TzMWovZOfv358ofv5YJ6ByTvBxs1GQthy6Qym2rMNrM/iO2/O8C/L88y8JapPhrLyn1U
 oRM21DewtXgWALRrYyvOkCAJzqjv/k/183EYATUuWKi+BRhT0cklEgDLTfcuiFDvMzKm
 c2CRqUQzUKOuIMwYN2i92xew0uAxPbH0TrdOURIElROT0dtCjhXpz2caK9AWfCh4FlHM
 Eyzg==
X-Gm-Message-State: AOAM531nvrrE3P0mAB3iLFPL01F4XZ+AHx+atTqhKT9/NVKtqcjyVYiX
 yNDFsGIAYpfkOF+gL5I9UAbwFU+KE38=
X-Google-Smtp-Source: ABdhPJyDLIa5qmEdPeXW6KEgPi25RJENEAYf/YSsFN0Jpk5qmuVTclAyzherT+kcfWSQ7KRIsePfjw==
X-Received: by 2002:a05:620a:e0e:: with SMTP id
 y14mr21849497qkm.760.1639164900642; 
 Fri, 10 Dec 2021 11:35:00 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204])
 by smtp.gmail.com with ESMTPSA id t35sm2852504qtc.83.2021.12.10.11.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 11:34:59 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Date: Fri, 10 Dec 2021 14:34:34 -0500
Message-Id: <20211210193434.75566-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::734
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=jandryuk@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
coded setting req.count = 1 during initial field setup before the main
loop.  This missed a subtlety that an early exit from the loop when
there are no ioreqs to process, would have req.count == 0 for the return
value.  handle_buffered_io() would then remove state->buffered_io_timer.
Instead handle_buffered_iopage() is basically always returning true and
handle_buffered_io() always re-setting the timer.

Restore the disabling of the timer by introducing a new handled_ioreq
boolean and use as the return value.  The named variable will more
clearly show the intent of the code.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 482be95415..cf8e500514 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1087,10 +1087,11 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     }
 }
 
-static int handle_buffered_iopage(XenIOState *state)
+static bool handle_buffered_iopage(XenIOState *state)
 {
     buffered_iopage_t *buf_page = state->buffered_io_page;
     buf_ioreq_t *buf_req = NULL;
+    bool handled_ioreq = false;
     ioreq_t req;
     int qw;
 
@@ -1144,9 +1145,10 @@ static int handle_buffered_iopage(XenIOState *state)
         assert(!req.data_is_ptr);
 
         qatomic_add(&buf_page->read_pointer, qw + 1);
+        handled_ioreq = true;
     }
 
-    return req.count;
+    return handled_ioreq;
 }
 
 static void handle_buffered_io(void *opaque)
-- 
2.33.1


