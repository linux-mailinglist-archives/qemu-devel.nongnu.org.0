Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0432F991
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:03:43 +0100 (CET)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUik-0001oY-JO
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUa2-00062M-A4
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUa0-0008Ff-Gz
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so5216470wry.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+3key+Awrub2yF4Xg5MLCJZCTP/he2QEe7XSC9SAec=;
 b=gDKF9Qy9GQ+NAIPcL85l9M9v9msS13fe8aFpY/9CeeVsFlwH7bwxCAb8Dvi3PiGDB3
 NDCQ8R43JW9eW6QIx8bBIyH+sAxNt5NIi/yaoB7PGyqeyMCQEMb2smSaUfixFKWAIz5s
 i9CFYHknie547Jp9RXwhPqmtJStU2LSGk+i9+4hxu84bbW4jm/g0jSz7p1IHgquPG3Wr
 31zIB3RfqatH+az+3l9gTxNtEQDZ+oMs4Rh1KSpKII9hIE5MKNZfMZV1kh7VeCIMRMxR
 MffG/LLBtTpREbyxzz0Ug6doq6XSwRr7pdufr4tq+1N6Ac3hvMzUer4jMs9f4ft9meZ6
 J6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y+3key+Awrub2yF4Xg5MLCJZCTP/he2QEe7XSC9SAec=;
 b=T6f98MyVj3v7yj3eOK209QQuJpoA9o1QMPsa/my7uf6TmtPww3H+7UobbFv+OLZi/b
 qjEsQRtSfumD5mUE7KlAZn/LjNxNtm40Fyxot2AHpZ/n2tXb9xzir7owH6niq9+wsxxv
 fWoF74v0cHvZL9BDfX2Tmnb+rE3+VvHHbeYVDelsSBqxHNb3UivypYRCUBZLV0xAd/vd
 WnX4wvNaM0PM4UTNequFTYag9YLg9AZq5vZrEFMzaYLUtU0icr3rtxzg5kJzGvGOL81/
 Elk2nybuev6OSuLqOQua3NMPMqzc9tjbUVKs3aBTzJY/h5A+WXpy1Cta6T+MJSNMMyzq
 GFWA==
X-Gm-Message-State: AOAM5314qpcFd8Ka3uxSY/HMjeZ07jkMZUOHJkxYWjb+6bmqE90SEkLv
 q6HAGtJA+LciSCcqOHIkJTO1PaC4W6M=
X-Google-Smtp-Source: ABdhPJxuH6ziU0vXUwOrJNFXcaoib1aRxtlPvjuA0j1LlQFJ0TmgNEXN/P7UcYg00cvdjhwA57kv5g==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr3146739wrq.41.1615028079321;
 Sat, 06 Mar 2021 02:54:39 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] trace: skip qemu_set_log_filename if no "-D" option was
 passed
Date: Sat,  6 Mar 2021 11:54:18 +0100
Message-Id: <20210306105419.110503-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the "simple" backend is not active but the "log" backend is,
both "-trace file=" and "-D" will result in a call to
qemu_set_log_filename.  Unfortunately, QEMU was also calling
qemu_set_log_filename if "-D" was not passed, so the "-trace
file=" option had no effect and the tracepoints went back to
stderr.

Fortunately we can just skip qemu_set_log_filename in that case,
because the log backend will initialize itself just fine as soon
as qemu_set_log is called, also in qemu_process_early_options.

Cc: stefanha@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210209145759.141231-3-pbonzini@redhat.com>
---
 softmmu/vl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2f4958db2a..ff488ea3e7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2364,7 +2364,9 @@ static void qemu_process_early_options(void)
 #endif
 
     /* Open the logfile at this point and set the log mask if necessary.  */
-    qemu_set_log_filename(log_file, &error_fatal);
+    if (log_file) {
+        qemu_set_log_filename(log_file, &error_fatal);
+    }
     if (log_mask) {
         int mask;
         mask = qemu_str_to_log_mask(log_mask);
-- 
2.29.2



