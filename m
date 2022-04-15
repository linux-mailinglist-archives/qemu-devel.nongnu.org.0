Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7831C502B02
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:36:06 +0200 (CEST)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM7J-000618-JK
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsp-0008Tt-4K; Fri, 15 Apr 2022 09:21:07 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsn-0000Dt-7S; Fri, 15 Apr 2022 09:21:06 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bv19so15367439ejb.6;
 Fri, 15 Apr 2022 06:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Jj2He4XMwehAE3Uqy98FnggkYD9lJQ14hPgJS+DCGk=;
 b=D5TDVGUgvxiGXsu3fTJdhOytolnfG1WL2JTCRbHcdJ4C0T1ri6Cckk9rpqljPc6gW4
 nE5GDSOakuHLl7+lXVevffNrCq5Di7Pn2mJL42e8tgvOdfnYOT12/+7JFHQnADFcAdtm
 FExG4vMFjyc+OzNkw+naRYl8q618IdPdIs3GqHuRiUWGGMnsv5BTs+ZzvU3KZu1nLJ2w
 u6IPN+dl2fbu81uMPVYvW0hw6jw6+GkwNzgSYmgFuNgUi1yo3zwTzJ2LvSl5n+9LNPXr
 ISEmJvTuJ4EVQY5tyK/ooe4JaPjyP6J6Y1hjQkQMk+6vSU1XhyyCTLA+/eiffvW1S0k9
 5BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4Jj2He4XMwehAE3Uqy98FnggkYD9lJQ14hPgJS+DCGk=;
 b=23EYXLvkVGZO6OLmihoPkZKp/KsQyAh+JBUV4TDenW5Cu7uuQewIOzBWhLVFBdd2IC
 xrcglT4Ik+yXOFMCuMXHx04uqThSWTEmgNo2ndY6DrzJPsWjoC0bJVWlKCA/HtACPbng
 KAe746GlREpCUpzvO83Ff2GY13pM5iI+4koCD2afkp5ZUU1vGG/INOotrl7g1MTz6i2H
 OvHVZpss5u96JR9AlUQ9IJh31QNzYoJJiunnHxsmYygB5Smwj3HbeWXDT2oK5jGDPrrl
 0tC5zRe5n5AipwhUNmWcsAhlmUM0pIL+4gjP2F0dJM4r9E8fs3EoQdxd+fwlEyakbo0G
 BvBw==
X-Gm-Message-State: AOAM530htcb89nSG1EdGnNADijMfoIg2kvCALthBCWoj9XDuL3kpo2qt
 Shcfm03ctyX56B6RMugIreBHeXIwcVIFUg==
X-Google-Smtp-Source: ABdhPJwbSZi7P9tfScj2HHBRWETQAAqZh0KHj5ov9VZHaxeVNTletqTvoAFlt8Jl8NYiUxAfxpXffQ==
X-Received: by 2002:a17:907:9493:b0:6ef:6ade:92da with SMTP id
 dm19-20020a170907949300b006ef6ade92damr619402ejc.630.1650028863592; 
 Fri, 15 Apr 2022 06:21:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:21:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/26] test-coroutine: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:19:00 +0200
Message-Id: <20220415131900.793161-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SPACE_RATIO=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, malureau@redhat.com,
 hreitz@redhat.com, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20170704220346.29244-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index aa77a3bcb3..e16b80c245 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -610,7 +610,7 @@ static void perf_baseline(void)
     g_test_message("Function call %u iterations: %f s", maxcycles, duration);
 }
 
-static __attribute__((noinline)) void perf_cost_func(void *opaque)
+static __attribute__((noinline)) void coroutine_fn perf_cost_func(void *opaque)
 {
     qemu_coroutine_yield();
 }
-- 
2.35.1


