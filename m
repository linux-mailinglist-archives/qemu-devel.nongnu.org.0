Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE7457133
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:53:33 +0100 (CET)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5Ge-00051z-Et
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo59F-0002ml-RJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:55 -0500
Received: from [2a00:1450:4864:20::52c] (port=35683
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo598-0003cy-Ti
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id v1so10296557edx.2
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ejfNglUO8k6Fc/DKJDw6PTnm2iPEvk0IjXsaBppK+20=;
 b=FeR+KFkcGUX22x+O5eprElAYSSU9NQ0qM1fSvipgrKM7G5sn7wbdkieRDSkjyFDcqG
 1I+SSMSt10HB1LQ0vItfH5iITyrjWS7lkKk0Q8LADrGAWiyL8yn0nURIexcghujGQLEN
 5mcCOESqnAujLGdAILg1up41HyG1fHOW+R3wEdx9Tkt6mLef0BvmEaatChaWrbP2uJ49
 LFIxrsdnQxgjt9fznipGoKFXEokE7W7bL51g4qPVxt/USzslcl90CwvxPrUctL/c/7UC
 h2dJ02zWPHI3GQcfKhcL/JpWPUp+8EQ1qkZNIUI+/OBCB8e9bXTqhZqfTVNrzH4QYHKt
 6gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ejfNglUO8k6Fc/DKJDw6PTnm2iPEvk0IjXsaBppK+20=;
 b=vti9SZ2ngTKoe3DnBk0PPbpH5D4ejHC4JgcbPpwtpFP9+Omj0hyYi231ly7mxAjw6H
 KgKvo71eyD79P3tTfXlKW2NDYtLnNJ/Jo5Z8aZNduV13UigdJUim5TP5dQxmE8gRSaAV
 GWoxlCZ2iRYpZmvsnxR96wEQF+uz3xEpLDZkaoZyt2sQYPrMhZf7mNMGzEca+IfZ6sk5
 FduLU8Aem6g3In6wh9S6bFYQNNRyPPiWV51Ny/82/qPQj8VSLnnYXv2fVd2mjyIU3/L6
 PkMux9knK9zMIRBhbrZqZ6Vcu4WNupHyrfCa/cVlCD//XdPFv+kqEf9lNWxkiuEc1KmC
 YxKw==
X-Gm-Message-State: AOAM530wBFCOo6JjDsKgOQhmuYpGdGXVFhpGT/yYwXq5YPi2ItEwQ1jQ
 xaE0NXSPh/Bxi5TQZSpeTeoE6Gma6b0=
X-Google-Smtp-Source: ABdhPJywtJHps4oKDgNckE4X9Kf7JGvMKHBL7XrzACJ9o51m8G5OKIPBXUJgPAf/5cxmcKguR+h0qg==
X-Received: by 2002:a17:906:7305:: with SMTP id
 di5mr8402572ejc.182.1637333145592; 
 Fri, 19 Nov 2021 06:45:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] chardev/wctable: don't free the instance in
 wctablet_chr_finalize
Date: Fri, 19 Nov 2021 15:45:39 +0100
Message-Id: <20211119144539.285740-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
References: <20211119144539.285740-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

Object is supposed to be freed by invoking obj->free, and not
obj->instance_finalize. This would lead to use-after-free followed by
double free in object_unref/object_finalize.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211117142349.836279-1-d-tatianin@yandex-team.ru>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/wctablet.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 95e005f5a5..e8b292c43c 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -320,7 +320,6 @@ static void wctablet_chr_finalize(Object *obj)
     TabletChardev *tablet = WCTABLET_CHARDEV(obj);
 
     qemu_input_handler_unregister(tablet->hs);
-    g_free(tablet);
 }
 
 static void wctablet_chr_open(Chardev *chr,
-- 
2.33.1


