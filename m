Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959EB502AE8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:26:19 +0200 (CEST)
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLxq-00083l-Nt
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrS-0006Xd-1Q; Fri, 15 Apr 2022 09:19:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrN-0007pv-QG; Fri, 15 Apr 2022 09:19:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id u18so9917313eda.3;
 Fri, 15 Apr 2022 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VqtX2u2JuwzPoUw1zLBzVNxh3lhGq4Pi9htsltfwjw8=;
 b=Zz1ZQmhVzD2PtSgwK0uTDjBSCPjSpIPGsLCVRf63qESXqroOUYL1oaFUK7uZQhkeJG
 KrYnOj84aZbYv0u2HM3umRqbNqZPloTAIHJn2h/f5sEeIIepOJxEcJjsSXsYf0JLLzWJ
 cMIWS+9DRE0Zx6EYF3J/FMxDdg5LXFjhoSg2KbNFr1X1MBcuPMOSPDlzcTxCHrQ6GARz
 XoMbkltzyC1Xgs592QddxoNqoZUtqIizK58Y+ejj1HqlMj8XdmSNFOnZ37hDGe4xEWTb
 YKwd8kNk9NGN2TQ+9eIpbNmFuqIcp0KsCEI9tzrn88Cpfrhj1j9vOCC3k9hfcPLjxsEM
 yqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VqtX2u2JuwzPoUw1zLBzVNxh3lhGq4Pi9htsltfwjw8=;
 b=GkWAH8tQzudXn/28FyUEiYlJzu7XDC2fpG94PxDXiiTki27jrVjwsJ/tL9OWA65Hx7
 VSc1I4CbtCKnWlAj9SX8ESDUjUzShhaLAmsiHQjXZXSf706Uh3zqLqikpuAGeAYzeUKG
 s/5WhyjetSKrGcV4llIlbioWx5l+yWQQXQqp1XA2NOwK4JxdxV5EKqzCJoOZP3KiuRvJ
 fwpdKvPQyz7NaPkEJN3qwgX9CSd+ofu4h+ZLRgQ5KXiWggXMJRPkMpcwRF38/3q4wROr
 CdQzL9NIrxXcqwpVgZ/Mtti1P92BcOcIuS6rKBzUjbX/hdJEju3Vhjrfn30IdoY+uP1X
 NZew==
X-Gm-Message-State: AOAM531QpDcsqwxM57aRK85/H+oRCP46DxkLawdFf/AKfrBtmv7GUMTk
 KyOqWvPNSmPM4Lnu1Sl1e7LGee8pksNQkQ==
X-Google-Smtp-Source: ABdhPJznQvz5aoMS9/erfAw0aoaUYIOOf8A1R15e17cx6s1mqz9s0rxsWMaURcxOgN/GkFywNSA/mw==
X-Received: by 2002:a05:6402:2709:b0:422:adc9:bc39 with SMTP id
 y9-20020a056402270900b00422adc9bc39mr1809872edd.111.1650028762878; 
 Fri, 15 Apr 2022 06:19:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/26] nbd: remove incorrect coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:37 +0200
Message-Id: <20220415131900.793161-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/nbd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index a98eb665da..5c3710fa52 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -423,6 +423,6 @@ QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                             bool blocking, Error **errp);
 
-void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
+void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
 #endif
-- 
2.35.1



