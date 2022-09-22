Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FE5E5E3E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:16:24 +0200 (CEST)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIJj-0000PO-Er
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHty-0004Le-QJ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtx-0003BY-AC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwaSWNYAiuAD3mXFQL3lA7wiv/XLnh3FlGUszdCid5I=;
 b=BJBs43f6a8GfHbznhrhs/hGf8/3AbMPhXk1Z3rFLZ5QamH+pHRgcSYYH+to44TcQeM6JjU
 Jq+wZ0UAWvhVnCw9zvgZeEKdvPAhSdsKzrW6yaeoULQXw5fYC7JV+bInzROnVop/2mVcU0
 zdoYeptNarVYqxsNXD1JPPZAVddZAco=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-OCTLUt1GMuO06UoQrMjhKg-1; Thu, 22 Sep 2022 04:49:41 -0400
X-MC-Unique: OCTLUt1GMuO06UoQrMjhKg-1
Received: by mail-ed1-f69.google.com with SMTP id
 c6-20020a05640227c600b004521382116dso6287180ede.22
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gwaSWNYAiuAD3mXFQL3lA7wiv/XLnh3FlGUszdCid5I=;
 b=vn502nHWwTk977etmNxwJ2TK0XqK67aG5Qju6GY4/f5koyPDjvB12fkX5CdNJ5Qooe
 Vq7g9qffl9qr7DH+b2q7QHim6vAxMICWympD4kKg1SEWu7hjTXarl0HC1W7zVt4zmBe2
 jPM1uWM+xTs4kvXdtfnYQ7gY2CzxNUUSsqKDAucJR4EWI21WPOucu2oLJ7gjr35sCBxF
 v8aHc2RJPfAxuTkxVG1BBWzAA+ZX0Q5GFMhS2guF+eA7l2/e528lH/qez5dYlARcmQIR
 HqUALcmaqREBBJUWsDBq1nyjwELpvyvSP+WkkcT5BGerxAtcw5WcUzm9Wc4qd2B7yGTr
 YKag==
X-Gm-Message-State: ACrzQf1eM2U7UOfZJbalGDAsdunLu/Lmgwowbwnlff+YFMP+BXwOiozk
 MPadQ4ZGJU29GwYPfRAE25tbkW6hjAOezSqOE0Kcme9zsE4UL1glg0JJH+ZZ6QuLNvDIMyHzefD
 J6z1BbpqiY/FhQ5kkEwydtCv/L5pCCysWNK22XwNS0UonzM1xICDDcrQqclilhxju7Bg=
X-Received: by 2002:a05:6402:298e:b0:451:129e:1b35 with SMTP id
 eq14-20020a056402298e00b00451129e1b35mr2135275edb.79.1663836579847; 
 Thu, 22 Sep 2022 01:49:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4g8Isy2RMVMlaJWwcgzMYmJW0kpeTdbIrhC5RQ36qw1pjXmJSZb5oJr+7Vm36lfLcVqi9ROA==
X-Received: by 2002:a05:6402:298e:b0:451:129e:1b35 with SMTP id
 eq14-20020a056402298e00b00451129e1b35mr2135246edb.79.1663836579578; 
 Thu, 22 Sep 2022 01:49:39 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kw12-20020a170907770c00b0076ff600bf2csm2357387ejc.63.2022.09.22.01.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 09/26] iscsi: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:07 +0200
Message-Id: <20220922084924.201610-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index d707d0b354..b33eeec794 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -290,7 +290,7 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
     }
 }
 
-static void iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
+static void coroutine_fn iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
 {
     *iTask = (struct IscsiTask) {
         .co         = qemu_coroutine_self(),
-- 
2.37.3


