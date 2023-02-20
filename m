Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53269CBE9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:20:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU64C-0002AH-Ls; Mon, 20 Feb 2023 08:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64B-0002A3-CW
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:18:51 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU649-000721-P3
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:18:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o4so1182809wrs.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21ktG0r6ccIgO6rViL7/7XzafhkLlNAgvQ5PiKs4PAs=;
 b=w9iha3w2Mw3E1cCUYu3HPBZP+zQQvqUtY5mJKNz/gHDXRaUfXDWkADWiiJsWRfFitT
 9eGJhi2RJVoLlEUw1MTo7HiZPqx76SoiVA26v/BpXB0hLN8SgvUIXFcfMONgDMWeatB4
 sig8XvDbzhAgyQJXeZ3yupBx4Kyk2jRTyzH/iTZZxaX+WKg/AuZXeMS84CIGFDARtJ5L
 ABVHezRjyIConMSyVjLWbm2wIsxlZiQy93uFjEW3NSifa8jZJQhvtedspKnWKy+dhTcl
 /gOi2RbjydGBvJ+uYys9Gs2TjOtHL4gC6KGYabdxJFkcr929cvZjPSS3lgj0PHKLxb9Q
 RsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21ktG0r6ccIgO6rViL7/7XzafhkLlNAgvQ5PiKs4PAs=;
 b=Rwi2oaPeraYyi5G8EOBj8W4pmF+E8JJnnpgQVdaKQR8+SzFARo19IUDdfudJgoPjUy
 d7ynOoD1aGCok8nXC619v/PvAKYQeMOcHVA/4HRM7C18HweldzAgJ5fPhGb0RiEhwpiW
 0IXrX3kwNpqMVUherJEwxruwrN0qV6qZ52PPnt3ho/zjZubHOL8gzBQF5+7NMGFw8i/0
 H4YG/P3HfBu6yIbpMStvVV1kI6A/U6y1AUI2kKPu3VTHh7Boq8kGp+u7EurvI5nSyTRp
 THwlvsuvv/I5yq6l5vR/bOu4a5HHR1AVA1ffHILGIL36/dztO+qM2HE6gvswM8sRZu0W
 kkSA==
X-Gm-Message-State: AO0yUKXTfYjWkF+lDDhGNNdZcVj80J4kFpw4Ybq+UPJXTTsfbbVSPFvf
 XnzgO8Y6CIMq5b+g+5qf0yjiLaaURPu9x4Q5
X-Google-Smtp-Source: AK7set/El0e90cPczE+OSFq7PKIGT3K+CQeQKvJBtK118m+1Cb8HVps9NA4zF8gG5skv+exWsjvVFA==
X-Received: by 2002:adf:d086:0:b0:2c5:7c7a:78fb with SMTP id
 y6-20020adfd086000000b002c57c7a78fbmr498650wrh.40.1676899128235; 
 Mon, 20 Feb 2023 05:18:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a1c3b0a000000b003e21f01c426sm329546wma.9.2023.02.20.05.18.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 05:18:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/audio/hda-codec: Avoid forward-declaring HDAAudioState
Date: Mon, 20 Feb 2023 14:18:33 +0100
Message-Id: <20230220131837.26292-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220131837.26292-1-philmd@linaro.org>
References: <20230220131837.26292-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To avoid forward-declaring HDAAudioState, declare HDA_AUDIO QOM
definitions before its use in the HDAAudioStream structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/hda-codec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index feb8f9e2bb..c51d8ba617 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -145,7 +145,9 @@ static const char *fmt2name[] = {
     [ AUDIO_FORMAT_S32 ] = "PCM-S32",
 };
 
-typedef struct HDAAudioState HDAAudioState;
+#define TYPE_HDA_AUDIO "hda-audio"
+OBJECT_DECLARE_SIMPLE_TYPE(HDAAudioState, HDA_AUDIO)
+
 typedef struct HDAAudioStream HDAAudioStream;
 
 struct HDAAudioStream {
@@ -171,9 +173,6 @@ struct HDAAudioStream {
     int64_t buft_start;
 };
 
-#define TYPE_HDA_AUDIO "hda-audio"
-OBJECT_DECLARE_SIMPLE_TYPE(HDAAudioState, HDA_AUDIO)
-
 struct HDAAudioState {
     HDACodecDevice hda;
     const char *name;
-- 
2.38.1


