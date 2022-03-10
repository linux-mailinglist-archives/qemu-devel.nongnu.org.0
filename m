Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98444D481C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:34:40 +0100 (CET)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIwB-0000es-Sc
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:34:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9X-0006c3-LD; Thu, 10 Mar 2022 07:44:23 -0500
Received: from [2a00:1450:4864:20::42e] (port=36525
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9V-00059t-Hp; Thu, 10 Mar 2022 07:44:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r10so7797585wrp.3;
 Thu, 10 Mar 2022 04:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXz+BWP/LDeXYvsbVe7m9SlkJdCNLdNyBH4D7wYcyC8=;
 b=DMzhyHo4m8WeRW05Rip3apho/Au+iwj6yRJNI8e3M8KMy1kRtoivmFLtBX13EW4AKp
 aGJafU8AcnLbn74GxFy7JflBihmuPgtJgcw92zmOvYSpEql4NWnqPwgqZEIy1uOFikys
 kqZ6XGbaVNeXdW8LVvZLencugNap/2xSCpszTM07wU6wkRal0oCvIPSMG56XTjAnbk2S
 oY6Fmrel7S0Dx9yzZmKyZEnZdaAITS8S56oGpIPFNbXGFhpqxlFfnL0E329OSEdKT7T1
 VPhoO6ucdAYgkM3JPMwynY9QTC8uxRElB0DA3KJ1lftYwSutRKcWSuCUcECambuPggo0
 z5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oXz+BWP/LDeXYvsbVe7m9SlkJdCNLdNyBH4D7wYcyC8=;
 b=8JR8fWs8zQPZf0mgdcDiiwJ6VH0NFEZHktXOkd4FxL6BrzMYis66rUp/7ylcanXwmM
 U/jzqyytt/03+xPjAHr4dzzrnvH3/ggzLAwtFO+mIwwtBLY0943b4z0c6r8Knd8aWQyx
 ORADVGk/A1ZlJVS+TDuKo0kUtgVoYyfTOVJJBZi7CaAO3+culS1JWTKQHAd4vj3fhrmR
 pi8X0vplj3CWHbHEM5bsCqHgZygyyVPVb/8DGtZ3Wez/3hz2L8qhAur/+JunNMJ1haw7
 SDCPj5CUQ4uTa0rZBzBID9KU/3ItewvCnf5/XkSc4EdGcfnVNy+FbtXCvQV4MPHPU8/R
 Bfug==
X-Gm-Message-State: AOAM5326Pksrwl/XGJC5CTPpE2otf2zjLVhDzQaIdS3tLqdD9s2q/WJ/
 Fr9tzwqcwo+QX1dGII1A99cjR5pnA+Q=
X-Google-Smtp-Source: ABdhPJzioqCrmSIVfW54LqfGr7KhYWsnopNnf8fC24PV014DE2pLGm9tOgWa9GYnECYIX73eNOQ81g==
X-Received: by 2002:a05:6000:1786:b0:1f0:36a5:e573 with SMTP id
 e6-20020a056000178600b001f036a5e573mr3439439wrg.428.1646916259671; 
 Thu, 10 Mar 2022 04:44:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/35] coroutine: qemu_coroutine_get_aio_context is not a
 coroutine_fn
Date: Thu, 10 Mar 2022 13:43:40 +0100
Message-Id: <20220310124413.1102441-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since it operates on a given coroutine, qemu_coroutine_get_aio_context
can be called from outside coroutine context.

This is for example how qio_channel_restart_read uses it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 2 +-
 util/qemu-coroutine.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index da68be5ad2..666f3ba0e0 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -92,7 +92,7 @@ void coroutine_fn qemu_coroutine_yield(void);
 /**
  * Get the AioContext of the given coroutine
  */
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
 
 /**
  * Get the currently executing coroutine
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index c03b2422ff..9f2bd96fa0 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -200,7 +200,7 @@ bool qemu_coroutine_entered(Coroutine *co)
     return co->caller;
 }
 
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co)
 {
     return co->ctx;
 }
-- 
2.35.1



