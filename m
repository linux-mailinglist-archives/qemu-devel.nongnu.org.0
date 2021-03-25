Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F374348FE0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:32:17 +0100 (CET)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPODn-00054m-N2
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBP-0003VW-E3
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:47 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBN-0006hI-HQ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:47 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so974640wmj.1
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=icH2+ws4BA3MF/VhEqXoYhWBQcPa1zTAGZW92CWb7og=;
 b=CavDZxvQHAH1WrgLmp5i96hztzD1hLZhh/QzHO6jZG9kZXrRyV0r3WJe9LQ6PWGEyg
 3gBBQyTyVkuoGJLuuYPAz9EKjxVepLUJD6whM3Ft7nzONsVQNi1rpwqDy19T3uiCPqOz
 NN5+8diIRcnaygwAX5K/3dQvc/iTSAGbOjlT/yHFSoSD/Bb2y6pGnZw/k3RlXEMQIfVT
 /YNBJMsCIvKD7QnDtS01LfUIZ0GTcAricZniU1ui5fyLQUlH6l2g0JjbEpf7Atq1OQtO
 QYaSnxUKWDDKFl2pmYaLxyVOE1dgTSSJuBAqQBTE+gUsj8fsX2VMS0uwFacSb9Tvy5rp
 j11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=icH2+ws4BA3MF/VhEqXoYhWBQcPa1zTAGZW92CWb7og=;
 b=pJn9dCH33ibA5MrpOcw6DQbcWAgqkljnmn3yuA5eqi7NdTM9ajW9y2zjzkattiDS7/
 9jlFH8ZZZptgGxsu/cvI4Qbn5wizSwhRx4hnLEj2ZajoONw0z5XNkXGAy23neFvI9TKx
 ydblwByJpYqSZn0iSgx3poYFtUmDqez/8EY+QrFpNw8FT93B3RGrFnSqEHFagfzOCYKl
 84Imkii/5a1p5kSspNdbKrgbTsmg1hbXJukEV2XxEFc+9xfRwGOHuFTmsL6dquReWMlX
 UldgTMjCMx/9sBS7v/fVrFKk6YVtpXGZOXorLy8R+fzOZNNOfyj6EeHCoERF8FC4wxKm
 QlBg==
X-Gm-Message-State: AOAM531BE8okTu8H+Z1b6+I/yRSOotwUvzCPwXtvD0PC/QAmrZLV7LKr
 0fT14PTIxbTI4ContiXf60t9gKROvWs=
X-Google-Smtp-Source: ABdhPJyGX9Z6x/cvL0dfgZbbT/0yFIg/oYTE3MQL0vwgWyHD6wRxDZs0MAI2GRzJrwGaWWg9qPqpuA==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr7329840wma.141.1616671784114; 
 Thu, 25 Mar 2021 04:29:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g11sm7220118wrw.89.2021.03.25.04.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:29:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/6] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Date: Thu, 25 Mar 2021 12:29:36 +0100
Message-Id: <20210325112941.365238-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112941.365238-1-pbonzini@redhat.com>
References: <20210325112941.365238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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
 stefanha@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

If a new bitmap entry is allocated, requiring the entire block to be
written, avoiding leaking the buffer allocated for the block should
the write fail.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-2-david.edmondson@oracle.com>
Acked-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vdi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/vdi.c b/block/vdi.c
index 5627e7d764..2a6dc26124 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -690,6 +690,7 @@ nonallocating_write:
 
     logout("finished data write\n");
     if (ret < 0) {
+        g_free(block);
         return ret;
     }
 
-- 
2.29.2



