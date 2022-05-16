Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376B5283CD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:04:15 +0200 (CEST)
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZSQ-0003CB-Ec
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9E-0002b4-QW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9C-0005lP-Lm
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBgdvHTSxrbwEFo3tpiVkZs9rY+u7ipcUNblbdnChHM=;
 b=cuT3sj75bYniAi0x5pRZRm7TrvmdqPaJo77XMwXGqHFbXdWTZqZ5xMWa9yhCMGRfm+mXvL
 Jay/yRHJQc3PujFvA5jmrO1VDprbvQgd1UQDmDmXv9LQGD5t8nYPoddmuv4qP/2IGb34MH
 hLc4YNK+I+U/z75dLWNB79ddnbPdnDo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-hbRl9qRyMNqzupFqffoOgA-1; Mon, 16 May 2022 06:40:17 -0400
X-MC-Unique: hbRl9qRyMNqzupFqffoOgA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so6569788wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EBgdvHTSxrbwEFo3tpiVkZs9rY+u7ipcUNblbdnChHM=;
 b=JVrw1g9RfHvQImnsEtQyL5y6DdGQbMca1uvfueNlU/OeO+VPTwQC1s5noWSs2fpLpm
 Pa7qH1V8j2bbjHq78VNGRyhJs6/dDPB040xRDbR7t8HEbZcnS0UbCXnic2aH8lHcnR5N
 FTfazdPSSt8pVm+/P05EUUeWL3iOiYuQSJ8GaXHEy0pKh243z/FltFoTeE0Z8DdajOpv
 qG+FHADUP4vxoz3LygMp7n1jxQFb8Oz5l8K7K+tlRGUtCZdwD3yoVeOvGw4rDMs6XQLC
 GpbcyboPoq2373FohVbgMiT4uupCQZGmnyjMekJe1thfw9aLZvgCcBrU90bmoauVeBgM
 Sb6w==
X-Gm-Message-State: AOAM5304N18w89Jg+i5TEbeSNH5NaI/Th7foxc3ONPPbt/tJFUg13Cv1
 Wbji/jEzUsN/hVE5nSw5oUIhaZplU78ILSAzNYS6VIhkC7VAG8UknNGIt/rxR7JOUsHVSd1XlIc
 drsZigA41WDwcs5ciSjmFi11usCxzrne7XgwFQTjqr1m6OHxAgGAyi+2Q9zfP
X-Received: by 2002:a05:6000:1a8e:b0:20c:be8c:10a4 with SMTP id
 f14-20020a0560001a8e00b0020cbe8c10a4mr13331013wry.437.1652697615588; 
 Mon, 16 May 2022 03:40:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOGAa+XF6f3K8PNaNV0DUtrnmW3lESiKOILOyKGM+0I1l4K6Bu/HoKI9CmN3lru3CX1mnbkQ==
X-Received: by 2002:a05:6000:1a8e:b0:20c:be8c:10a4 with SMTP id
 f14-20020a0560001a8e00b0020cbe8c10a4mr13330995wry.437.1652697615317; 
 Mon, 16 May 2022 03:40:15 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 o19-20020adfca13000000b0020c5253d8e1sm10986747wrh.45.2022.05.16.03.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:14 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 78/91] vhost-user: more master/slave things
Message-ID: <20220516095448.507876-79-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

we switched to front-end/back-end, but newer patches
reintroduced old language. Fix this up.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 73e710fe32..3c12607517 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -340,7 +340,7 @@ drivers cannot negotiate it.
 
 This reserved feature bit was reused by the vhost-user protocol to add
 vhost-user protocol feature negotiation in a backwards compatible
-fashion. Old vhost-user master and slave implementations continue to
+fashion. Old vhost-user front-end and back-end implementations continue to
 work even though they are not aware of vhost-user protocol feature
 negotiation.
 
-- 
MST


