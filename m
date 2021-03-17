Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ABC33F7C8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:04:03 +0100 (CET)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaWY-0002ay-QK
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT1-0000i9-6p; Wed, 17 Mar 2021 14:00:23 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaSy-0004t5-Bi; Wed, 17 Mar 2021 14:00:22 -0400
Received: by mail-ej1-x633.google.com with SMTP id jt13so4109411ejb.0;
 Wed, 17 Mar 2021 11:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=d3B9zFF+hWfCt4GneGijwGdrShTr31SHNOXO72x/Tc9xOfjyslHitVe08SkrTPj0kd
 vnKoneF6cL+CmdMEESxn+P14kLPP5xI9hzW06MCp2Apj9b1xA2gLP7EebiRpAEuqOeFt
 CQ1/j7g8SdXm+FZvghYa5s7ftsz0aA7u6VuPRsCF2KxPJjQibcvk1H/hS548yBM5k1br
 hE8c7LIS82lf4AXvNq7utYyXPwhKjvtxUizVO2/9mzF1+B6nPHiY0AVoL3NXBT7fudgG
 47RPvlgs2ubYU7010f2mzUvoLY39Mfat6Yed3IdBgMQwj+GJmuEreN7+EJLYyx3mx8V/
 R5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=iFrgxDGgj57AjHoGqlris48ogFqZEuBa7ZMlbbq80RavEfBqTQpZwESk287NyWmGVX
 jNno+2hEwRm5wctpX4jF5J7hzZ+urqBvk9CRsfAMcNVu6uRtax3SPjIMypglKCLyXtKj
 AtW+dDRf8CMlVJh7df/4eKL6pFzk4a9S4MkjdwEbDLJ+KA1f/FoEots+y4V6hqN/rR22
 rfnq8WYi3cX5qtL7F65r2mOoPREdlFHlRFv/bOwy+3AoGbOtPr1OHuUwvnHhRDHcsOsr
 zAYy+CvOoNgunPBxLe6bRTmmMwl+2+l2pB5i+fAMDkhy1pnHW0CTBh2w+MRH1xBVbwx7
 sQIg==
X-Gm-Message-State: AOAM531ENJT1vr3jLaAodV4UdP1ka0DtsKjdBGZAnRYSIhLcXwQ9RjmK
 XYDAnvehtoDPhQUJpQcC1yLJh8Ho7Ec=
X-Google-Smtp-Source: ABdhPJyqt91cdCwgjAI1Gp7zDnee2nASdwo/DCaZw5dZfp1J8gOxbzY4NSetKVYyw2+IPE8omrpKDg==
X-Received: by 2002:a17:906:5902:: with SMTP id
 h2mr36594916ejq.416.1616004017891; 
 Wed, 17 Mar 2021 11:00:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b22sm13159303edv.96.2021.03.17.11.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:00:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] coroutine/mutex: Store the coroutine in the CoWaitRecord
 only once
Date: Wed, 17 Mar 2021 19:00:10 +0100
Message-Id: <20210317180013.235231-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317180013.235231-1-pbonzini@redhat.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

When taking the slow path for mutex acquisition, set the coroutine
value in the CoWaitRecord in push_waiter(), rather than both there and
in the caller.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-4-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5816bf8900..eb73cf11dc 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -204,7 +204,6 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
     unsigned old_handoff;
 
     trace_qemu_co_mutex_lock_entry(mutex, self);
-    w.co = self;
     push_waiter(mutex, &w);
 
     /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
-- 
2.29.2



