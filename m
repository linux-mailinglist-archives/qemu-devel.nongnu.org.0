Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED80349040
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:34:00 +0100 (CET)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOFT-0008BB-4B
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBQ-0003Vj-Oh
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBP-0006iA-Ew
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v11so1903160wro.7
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=cty7rJ8veC1Qjnh0f60jvJPzV9DMq8zRdSDzVqNn44UGm2R+7qhheW596Kz81gFRIo
 +s5lkN7+IpNZfmlP8WuAhy0kAGy8iUVul3qj6fYkLyspqAIZPhWtSF+HQfS2rI3TABQD
 36L4w+OFxAC+m/e1B66mW8AYTcktxjvV4r2q8OdAOF1eFJg4gMznGldsbNG8Bka9Crfn
 1fk2xHOn5nEAlJbrj4W+0I/uHkVVtyaEQyiuwmeAcMQNXurCvEJm+ML+NpLRrY5O4dOY
 bSi4JZvSSLJdvyE/Yxz08LyOkBFOZL2CGPqBahtuwNr7nsHOgKcooFd72i1iZkzOOtjo
 9d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=drFpYG/o62NsqaEeLqrrgngVm0SZabnELTlrwSW9C4UNbbO0jFse57mS4ekK14vSRh
 TiodUdmTCAmxXjQQh4Jc+nV8oGLdnQ2Xw8X7alod72NjN2peLKR44sYLnWo+vkwF0c9D
 X2+jW0mIbTsT+I+tqFgAVoVwyJvGWY0usdRSYLe4YbERvDPcRTr43jSDNB7xgQlq6L2d
 RZxCpxQ1brDDt24SKtr5acjUYlnAQ47D1quNh1Uq3N6+UEXbG3+3fenkuyaWlqVaKpYD
 UDsypyz2CMjJaN1qwCfyrj6IMXkMG1zfCvMvdxVC21kxutT+tOPkkV3GLaXLYzbIqEvd
 FbiA==
X-Gm-Message-State: AOAM531t3mIvEFi2pFQqwuw/BnanxSQig+St4jPKm9/o0d4Uqkqyqh+n
 FQEhM6aucNRTZfBVK9e506Zxd7yvwoo=
X-Google-Smtp-Source: ABdhPJwvhRwnVVVGaSeQt6fHDd711rF/w4wFIcqLadAHX4J0twUe6K+sOmpQJcg/BopYpn/eYllM9g==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr8324081wrc.138.1616671786210; 
 Thu, 25 Mar 2021 04:29:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g11sm7220118wrw.89.2021.03.25.04.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:29:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/6] coroutine-lock: Store the coroutine in the
 CoWaitRecord only once
Date: Thu, 25 Mar 2021 12:29:38 +0100
Message-Id: <20210325112941.365238-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112941.365238-1-pbonzini@redhat.com>
References: <20210325112941.365238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: david.edmondson@oracle.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 stefanha@redhat.com
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



