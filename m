Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B233F017
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:18:43 +0100 (CET)
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMV8L-0003qa-VL
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6Y-0002De-FT; Wed, 17 Mar 2021 08:16:50 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6V-0007iv-7U; Wed, 17 Mar 2021 08:16:50 -0400
Received: by mail-ed1-x52e.google.com with SMTP id y6so1990303eds.1;
 Wed, 17 Mar 2021 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=CkDfnq2nsQUGebocK+FZmp2+91b7X8No6vVzYCfFgLEbdqvE2IBmB9W0D6rFPBR8BZ
 Wvi1XK9UN78vZ5Qk1kaDT3juFp75BltgQfP13Xwfnew4KdO9SKLOh65O2XGGmu3mPCLA
 CMx409tlhYU2p/lVhM6SJO312b4AnxTE+dXymMNk45pscieOKPWQHuM87ppAlm2QOY1Z
 HdARLROnK7eUvgaWHWedPo/huFroXr3dPQFvuRxUZxfE8Jx2Hc3XFv6M8vnw9aZN2eDQ
 sqycxfjVqh+PybPb8OHej3/+br+OKr/Tn0OaV5bon5W6tbhkVbvDncwETlpFLXd9X5EI
 xweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=X4jp3O7AHLZiaMZw8I86Hsl4Z2sMOlyOkHHYasZ0vsma6r1RD1LT/EHHhTfpF9F0r6
 jJBHOLTJmxiSKN/xCEWHsogjXauo0PemoioXllSl8xWvMdTJv3o/iEQ+9mshj8fW/mpO
 cBb0XERwZ9eL1uShs/pWENYyTTFFMB5ad6A4KidQxRQOUMkUvIjvFM2ir14YBZ4XB3gf
 Z5sArRkRh2W1NlrwXVACDpOOQLemHP1Ow6oeJWOINNf7yOP27wmJIqzkkss7UyBza/8x
 EN/EWHEXVDQHoKexUSfxwDup2ITHBrx82d9HpORSj7NTFv95dDC80PqYT+uiMRPPIN9/
 AB9g==
X-Gm-Message-State: AOAM531rZHGH0jj7yXISXJ2kk1ZVYfx/K5ZDkPqifwlK0ZtvxiKtRoWD
 OB5m6fUy7L49/jXq4ySffI+jpavtfAk=
X-Google-Smtp-Source: ABdhPJw0pEgq1SqlrnTx7Elrj4nB12+aduC3VdHdg14sHvPThfeOGpRR0T+SW5gJHpfLUjmVgG/Lig==
X-Received: by 2002:aa7:d954:: with SMTP id l20mr41746369eds.1.1615983405213; 
 Wed, 17 Mar 2021 05:16:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm11520996ejb.85.2021.03.17.05.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:16:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] coroutine/mutex: Store the coroutine in the CoWaitRecord
 only once
Date: Wed, 17 Mar 2021 13:16:38 +0100
Message-Id: <20210317121641.215714-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317121641.215714-1-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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



