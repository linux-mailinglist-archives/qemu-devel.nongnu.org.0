Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114046D462F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:50:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYt-0002xp-AD; Mon, 03 Apr 2023 09:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYq-0002vJ-GY
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYn-0004uV-9V
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so18180052wms.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIAbN9ckX3lGfUzvEPz/vzPNYZxaSL+GVZgf5wv9fMw=;
 b=LWUprjACAXh+rLjO+aP8mffyvPwH4ehS4JZikFQAibUBF0T9DkF4kdhb7lHWFZKQRr
 /4ALZYok7J+Boq7MVhqfKjWiCieBWXUjgeEJGbFtw1Gds6GKdMxi9wLJzMjrcdJqohlV
 OoEZ8CMWkpf2UDeGOvCGc6UJHpsMgIGU8iejcuZl1+Bp+OKnTfv1/AYDwIGGA9ZYn4bB
 DVlZHzvRpSe45DYQHZsUV8HowyoYF7txt7KNlkEbkUdkQFEt6b7odwVWcP7zut9mXuEF
 BU32cAEjuwEi2re9se/CocXw7PQ4xlznkJFvt9jpcG88WWkCPUHT2fIj0ckekv1APwPG
 2xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QIAbN9ckX3lGfUzvEPz/vzPNYZxaSL+GVZgf5wv9fMw=;
 b=auxNn6wa2yofFMcAS0fKTYSNZSyFpQf7jYKmdD4bDiv1RAvxvenEEePFAhBAjKdqqQ
 VcshBDe7u/2Kwx8dE3nmvi8eRm83kWRvXoyiUXJEpAc/tDSkanPmiNs4+ndm3/YQLVpH
 VhrUNy+3r1lPZI1K16u1HLO28DVH3F8+B+f9CTC8FEPqiMBgz67XCMRD7V4chVzu0cNg
 EVMBNg+y1IjmFhE0hrwtEAVXPW7VYQZvFPnMNUJ1Vl1Dpv6+0LmOlNxhC4yvk8Xgv/6O
 MxLj8R6QugdIyBNLp379WHfP8ubIdoSAZ6P2Wivd7Los2y+LjZ90956c8PfyQGDBauo+
 RhIg==
X-Gm-Message-State: AO0yUKVLbWbU3gIgGR8OnF8qqLtMBPyxnNmj339mUG32PikidiWZpiIx
 x65oSwYpJGEbOKJtF5b9N9EkKg==
X-Google-Smtp-Source: AK7set/iPqa1oDkXeWQmk6LoRUQ6t2lI5DVpIiIXbiFyL4cXuZzRcD8PTVowcXFiJ8fJgH1SLa7O1Q==
X-Received: by 2002:a05:600c:ace:b0:3ed:98c1:2e5b with SMTP id
 c14-20020a05600c0ace00b003ed98c12e5bmr26622637wmr.9.1680529763808; 
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003ef5deb4188sm19526847wmq.17.2023.04.03.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 329FE1FFBD;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v2 05/11] qemu-options: finesse the recommendations around
 -blockdev
Date: Mon,  3 Apr 2023 14:49:14 +0100
Message-Id: <20230403134920.2132362-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

We are a bit premature in recommending -blockdev/-device as the best
way to configure block devices, especially in the common case.
Improve the language to hopefully make things clearer.

Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230330101141.30199-5-alex.bennee@linaro.org>
---
 qemu-options.hx | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..9a69ed838e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1143,10 +1143,14 @@ have gone through several iterations as the feature set and complexity
 of the block layer have grown. Many online guides to QEMU often
 reference older and deprecated options, which can lead to confusion.
 
-The recommended modern way to describe disks is to use a combination of
+The most explicit way to describe disks is to use a combination of
 ``-device`` to specify the hardware device and ``-blockdev`` to
 describe the backend. The device defines what the guest sees and the
-backend describes how QEMU handles the data.
+backend describes how QEMU handles the data. The ``-drive`` option
+combines the device and backend into a single command line options
+which is useful in the majority of cases. Older options like ``-hda``
+bake in a lot of assumptions from the days when QEMU was emulating a
+legacy PC, they are not recommended for modern configurations.
 
 ERST
 
-- 
2.39.2


