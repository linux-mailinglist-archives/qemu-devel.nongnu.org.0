Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05696AE2D2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:39:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYSd-0005Lo-8p; Tue, 07 Mar 2023 09:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSO-0005I2-U5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:27 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSN-0000aw-4t
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id h11so12346730wrm.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DYKwChssZzM1IZQYrvmlzEUEr1CtygQzBbBBtEsY4sU=;
 b=OPDWWAxtDTtD90LoZ2dEk01ZFs8oSOU906qsitXErE+vAsRfwzy+6pyJVOY4eLDcsR
 tPiX9HpL3hzC+mTyy61ZONhBWuHk/D8eKOyosoGWPAm8sCk4g6EXYwdrLvrEZmy5Mano
 hxudaJQaUcNHYPwyrU8P8oYGLnaXRrwmVhXNB6oeNwJrqva01d4T5OAeevgvKbD/q4yP
 cHXKxd64+FN9Ac+HU9f67UrBhx7x7BRlK7VWdVk26sXykijUeKOd+3AMkrx5Tuvz6rpN
 5DvN8nMI2rJGIevFkFqVCQ8kexhsD//GK4UPP5la8kjyyrXLXU5hzayYuCXBBxeb5a4l
 mn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DYKwChssZzM1IZQYrvmlzEUEr1CtygQzBbBBtEsY4sU=;
 b=tJWhvY4TEu/tRYX0X+eEkMVK+1ALbtS5wOerWdp4ZUGqqJHVL/Jfk/yOTI7UP+e9kE
 +MCuvt+ZNagiXBuml/oEnYS5VY8QOpozP6dVonnBAXVAkY7YO4AgRYy4yfpfhOCHWUf0
 JXSQnbImlJyA2oUyJQIZYf2STXhHIf6uYIKNCQEhPZT3cT6GDWyBv/nTmipZhwJ6hUB+
 o0K9bjgWUsf3acS/6o3PkdLQY6wa8jZeUkS1pz5QOwGJdGhj8leVzQ06QKequ+xBTA2F
 XF4ituSIs0qNm6Dbc3zDzZiNYNKJLAjXfuZNRSK6OlYfV+rxtobfGMnFRt9I8ImfWfm4
 bs6A==
X-Gm-Message-State: AO0yUKX9skTPylWMWfx6A7HltvvdFvQvoas+806t57XGya9vG8JF70W3
 kJk3TUxlSL0t7Fcdxo5I9xNWdg==
X-Google-Smtp-Source: AK7set9yX8DufC2qxuu7+6X6yH6bnqbATGn0NuvqgamUM9JBk5VYy227Be1hSPRyQ72OiA89ob1e2w==
X-Received: by 2002:a5d:614d:0:b0:2c7:d6a:cca9 with SMTP id
 y13-20020a5d614d000000b002c70d6acca9mr9626436wrt.23.1678199901232; 
 Tue, 07 Mar 2023 06:38:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adfea8a000000b002c7e1a39adcsm12855848wrm.23.2023.03.07.06.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:38:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD2291FFBB;
 Tue,  7 Mar 2023 14:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 3/5] scripts/ci: add libslirp-devel to build-environment
Date: Tue,  7 Mar 2023 14:38:17 +0000
Message-Id: <20230307143819.510186-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307143819.510186-1-alex.bennee@linaro.org>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Without libslip enabled we won't have user networking which means the
KVM tests won't run.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/org.centos/stream/8/build-environment.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index 0d094d70c3..1ead77e2cb 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -55,6 +55,7 @@
           - librados-devel
           - librbd-devel
           - libseccomp-devel
+          - libslirp-devel
           - libssh-devel
           - libxkbcommon-devel
           - lzo-devel
-- 
2.39.2


