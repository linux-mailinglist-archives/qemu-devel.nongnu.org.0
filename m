Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0FF50646B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:29:12 +0200 (CEST)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghMN-0000BX-7x
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggls-00019K-VC
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglr-0004Pv-2J
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q3so20282540wrj.7
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCtb5iRKmFrpWSFDMJ54PwgAElhJqFeKD3Ys1qpVYa8=;
 b=jR7SzxD8uThp6R0yl4AZYRCwjBHlR0R+1At5dUalDh2XEAQnZGHN/ULiYv373WzLqf
 o09jCWQnYIE8ojSCzbW29F5gG7SeZsHxbcVrhQoS8FMpRvQiikQALt5kEtkND71QKgbg
 9b3PY7kPUX7AT+dRG1Jq0c83ZY5/UkBaousI5k2CYct2GKckRVWKCcNVm1jDYMTbyzV8
 t6DIal9v4oGh9CFdRsTtjTTi9mbMFukDQ0uiDjG2ei70fQxClPCr8NpFiyoUb1vbit+p
 DBVEAfuZIiXNXuwtuECAEidwb21EQ6b7aEx9C5BdZCBXMJAvcvHrDYsOm1KikCHoiZyc
 TJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BCtb5iRKmFrpWSFDMJ54PwgAElhJqFeKD3Ys1qpVYa8=;
 b=frbQ/GYlNw9g3p0cIyl63IDRt3XRTFeBvOSKAs7d6i2V+KxsbiQchPe/UzuW/1M6wq
 2Mi4Jx4DLcpYAbodoVCMWWMlm1md0SFzbJiJOLnC/UBF23iuPlNo1yfSDP2je9/hbpKx
 PadhqofbTIMDFf0BgvxFB7OBMMObv8n2/CeRxVmWu1/GbwI+vZBy8qfUF1F4ickurrQl
 pAa59G1gqJku6b/f9qoes6nf1bdxVTz2SBRZ4KU/hWLEAzcFf+hAZG2X0pB7OXxpPKKv
 LspuP3aWOc8HkzMdBw8V5b6VDDe6JB+rzffENXIzpoH/zTka4qzOv7lY1rPz48B7xwy1
 NHXg==
X-Gm-Message-State: AOAM531RTvsVMNsAqI+as2iZPg2qG2nN6aRbSU9PYVQjJB3jyFEHYJhi
 uiMzqXtcs9SaDfIW9i16N3TOTsK+GpTjzQ==
X-Google-Smtp-Source: ABdhPJyIpAYVB3xUNaqbGXlIFYwCSZlD76pMxDQ4MuTmaRDDmUvGLBBymEm6ILGtu6ZPbmJUWYabHA==
X-Received: by 2002:a5d:47c1:0:b0:20a:9f14:c128 with SMTP id
 o1-20020a5d47c1000000b0020a9f14c128mr3871490wrc.507.1650347485825; 
 Mon, 18 Apr 2022 22:51:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/53] util: rename qemu-error.c to match its header name
Date: Tue, 19 Apr 2022 07:50:35 +0200
Message-Id: <20220419055109.142788-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The header name is more appropriate.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-15-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/{qemu-error.c => error-report.c} | 0
 util/meson.build                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename util/{qemu-error.c => error-report.c} (100%)

diff --git a/util/qemu-error.c b/util/error-report.c
similarity index 100%
rename from util/qemu-error.c
rename to util/error-report.c
diff --git a/util/meson.build b/util/meson.build
index 2d71ab57a4..82eec004e2 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -28,7 +28,7 @@ util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
 util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
-util_ss.add(files('error.c', 'qemu-error.c'))
+util_ss.add(files('error.c', 'error-report.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
 util_ss.add(files('qemu-config.c', 'notify.c'))
-- 
2.35.1



