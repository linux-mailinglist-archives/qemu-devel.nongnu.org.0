Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7A50642A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:08:25 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngh2G-0007mM-Ix
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggln-00017Z-Dt
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglk-0004Nz-Oe
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:23 -0400
Received: by mail-wm1-x330.google.com with SMTP id x3so9912972wmj.5
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZK2rqC2vWrEFFlHJZT8Otsp8kMdYCdYpi/DFD/DLZA=;
 b=MX5BNpRH/VZiB3Un+vQZWsMT/h+5dTr7FMJSBdAQvyNULLoJwGKmIpi8YcV2wM3SuZ
 2W8WrSv/LRIMZ3hRa6ZRFOh+jj4GLroj8kiWPVuIFBvdA9FWRF99dfuhjbJSXI6eWdM6
 9kfV7y9aCDKHyrY9iLjEe8i320hBxlH285Hp/8+2u7Rlc/52qKexxGRqwas9g3PxX2a4
 0v0aRMXmWfcjzBYH1/6KqK7qL5In0Ogz0qCXGeRl+5xbpzdESYOK/o6NoijtzKcPaV9y
 JkRDeDjPc2uNcuuQS0uX21djax0MYA96ne7ifAWyz4foEPIM3GXJ70TuZoDNpZNaOfcu
 Y40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eZK2rqC2vWrEFFlHJZT8Otsp8kMdYCdYpi/DFD/DLZA=;
 b=Xvq9ouEMN90hDT4OJ0OxFAEY/aC3hoNf+YrqhqwaIg74uiQis4bmxgguTRcGm3XO+M
 R8EUECsbcmzVPW7mwU+2slA3UMVhzjG0T1HVWwoxUPXD8+ypkX7K6f1EVSer63dyQqo6
 BlM6Z7EcWiXVKGbHz7cYKYAkDkLczwMor0bYgCWqV5/GRSBhGUoALUv0+x+R4d85kCNo
 BsvPxXxayXfFLe3gEb4PxnYMP63D8G5NwDsGSN1DeEo00KAduzQKb70RWW5HHCMDdIZE
 Ad8OBTiwdFfIFsiKpJ/NCo1bT0dNJO38wCGziTcof2QZohTRtggGCLHR4eNaJRNj5nWY
 pbeA==
X-Gm-Message-State: AOAM531ORzQHucx8vqUT9v8egpJjx8ua3FkFEcdJL5iwnTOtKYgsioZD
 yW9OHViuzuHpl17ycYh4DaHpNdJO+BLrlQ==
X-Google-Smtp-Source: ABdhPJw5V+yohFLETdkGcqrfUBztQpYdOHSUeENx9Sa/8njjWccc/ZxprmZd9nVtj107jLvW0FOYww==
X-Received: by 2002:a1c:7415:0:b0:38e:bbbf:52d9 with SMTP id
 p21-20020a1c7415000000b0038ebbbf52d9mr18201369wmc.104.1650347477488; 
 Mon, 18 Apr 2022 22:51:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/53] meson: remove unneeded py3
Date: Tue, 19 Apr 2022 07:50:24 +0200
Message-Id: <20220419055109.142788-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 1d05109eb4..4f691e8465 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,5 +1,3 @@
-py3 = import('python').find_installation()
-
 subdir('bench')
 subdir('qemu-iotests')
 
-- 
2.35.1



