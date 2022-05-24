Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F3F5326F6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:58:47 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRJO-0005ey-Tz
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntREj-0002R8-Nc
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:53:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntREf-0000j5-QN
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653386033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WEmDBhJaXFxFwgITxbhTG6L4jz8ONd9JIC+h67CF6lw=;
 b=Iup8HjepUEjk0EQNNYCo6ZdIeLs4tc1pc7uhzzZZM4DhzfRkFPD9dnIkRwMKutJ+ceG+tv
 6RqeJj2zjkiIhyqemlWAQBOo0UiGzXqbiNIDO5A5njNTFLVIMSiZPIKl18eO/uisH+7SuP
 V7yGNngSsVnaORh1BbWLjz5vfKySXwQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-kVl9zOTcNxa1qvPy9sNsFg-1; Tue, 24 May 2022 05:53:51 -0400
X-MC-Unique: kVl9zOTcNxa1qvPy9sNsFg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q12-20020a056402040c00b0042a84f9939dso12438131edv.7
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 02:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEmDBhJaXFxFwgITxbhTG6L4jz8ONd9JIC+h67CF6lw=;
 b=uJfN+NuDKBl41EMvlTRfn6xGvdAXz1L+lZr9ABN6ve2haFdIvB+9u6UTH0l/0vAjMl
 mGGAnvoyfu/cU4VfrPniFHZ1SyjnrkhZ9bPOoOjFtCnNzP6o2AsKqezMjoGbVx+jwvZ5
 uaoZFNPv62AsoG9RFZaZTSDE0QQcEzFJ+kjMQfXLl48P3hAlbGeyX2pNRB437fVX1yXA
 g1SiSfRUEmbbDzviOQ7+gif+a/s5dOo+sU+2C3wEbpgrP8K+jCW4kKX0xEv4cm01f6L/
 tRLUq3ZYD8VUHui/gPe6DdpbT4nFIp5ZnXG6twg5WKDKge0zujETPvNSixuPtvGcWDxY
 2f1A==
X-Gm-Message-State: AOAM532I8sH2U2NwHuPB77MVmjolxAovrWPn/YrpA7G1CON5036qgsLL
 JtSraY2Hf/qJsWh8F4h/Gci6rxEXYZLTiihnztGT6crtW8whoLac5EktVHdV0fwGqiIhwLaxsiT
 zfqq2Mol0TitxY2c=
X-Received: by 2002:a05:6402:4020:b0:42a:d19f:88df with SMTP id
 d32-20020a056402402000b0042ad19f88dfmr27971564eda.56.1653386030796; 
 Tue, 24 May 2022 02:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBaZwrdEasSDDk+d/JnCdMVWCJhQIIGS0x+xE7bcTwfEslDCUVvDKgSB/O+ZGKQfX0M/q0+A==
X-Received: by 2002:a05:6402:4020:b0:42a:d19f:88df with SMTP id
 d32-20020a056402402000b0042ad19f88dfmr27971544eda.56.1653386030529; 
 Tue, 24 May 2022 02:53:50 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906004900b006f3ef214db5sm6972674ejg.27.2022.05.24.02.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 02:53:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 "open list : IDE" <qemu-block@nongnu.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] ide_ioport_read: Return lower octet of data register
 instead of 0xFF
Date: Tue, 24 May 2022 11:52:28 +0200
Message-Id: <20220524095227.396329-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520235200.1138450-1-lkujaw@member.fsf.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Queued, thanks.  The same change needs to be done in hw/ide/macio.c:

diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index f08318cf97..1c15c37ec5 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -267,7 +267,9 @@ static uint64_t pmac_ide_read(void *opaque, hwaddr addr, unsigned size)

     switch (reg) {
     case 0x0:
-        if (size == 2) {
+        if (size == 1) {
+            retval = ide_data_readw(&d->bus, 0) & 0xFF;
+        } else if (size == 2) {
             retval = ide_data_readw(&d->bus, 0);
         } else if (size == 4) {
             retval = ide_data_readl(&d->bus, 0);

while (unintentionally) hw/ide/mmio.c already works fine.

Paolo



