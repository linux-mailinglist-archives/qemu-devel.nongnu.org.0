Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E1F6F08D0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:55:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3wv-0007mM-Sc; Thu, 27 Apr 2023 11:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3wu-0007lv-5D
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3ws-0006mG-FA
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f315735514so29465495e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610861; x=1685202861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2IcmnDRTfsJw8B/y7QWIsoARNTmJ+ae9LSsjB/DsJA=;
 b=T54RLeVP8lSUZPkyiIxzY6nJJDW3uihdsUps3EkpTGKw029mj5KgJvBAMY5hJiOK9G
 9lrOfeUW8MqtqiHQNleEYKU26ptIv2Aaf0bY14R9RlgmhlXCoQCSoCrM5tK3+grmSpvv
 J/aKUD7NLnfXb0jfWvWGnP1GcaFFkDEsMl4qbyCGwdjGHWXJY23ukmgGJgAEIbOmOBWO
 j9IluvjCEo3melLVhAXGNVH+Tjaxs7ZRwlzpaQh5Hbd3Sfzk85uhtYj3ZaehkQhgngbA
 zAzAL05J5PXjQZBFnR9rlw4JTsYU2K6CJASWNx+zscKcBdL04rjPS6H+DecJGDR2RUog
 +42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610861; x=1685202861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2IcmnDRTfsJw8B/y7QWIsoARNTmJ+ae9LSsjB/DsJA=;
 b=HR6a3DviC+js0ERsIL24SXMZ3b/6B0dp2aVEDwL7p9d1zq7SUbQDRE2zLlm3Qnbse2
 uMGqMHW8YvWFZyeHmX1IBTS73y+orbwUp0DiNXDmI5X79DeJkim7rIRdrvtSFje7yVLG
 3j7ugXJfQqfafzUfiwOvW22fxwJJFakjeXusg9OBHeMlWf4QAnWzas+XVoSUbo5e60oS
 soon7XsS0s0FpU0ZkkI0MOlRbdXOXVld39SK1wOvQT42Cy+JuRtjRf+fIRsupjX10/Qb
 hWdKguvrpzydHconLB+3ZBJvVHfanps+7RhtzMDIGRenNDbYgmdN/mBkk26CD/DBnjRT
 qCkQ==
X-Gm-Message-State: AC+VfDy6AeQp30H0cAtp2mba5vGAsxYCZ7NqVdZGJONYRsKg/pEpf+rI
 Zd4j5SJjYSbjVDqbqSadg91NGq9r4X7+kneyvDY=
X-Google-Smtp-Source: ACHHUZ6ZCi5I7rfF2+nSaBUG3VfRGeVGTIoZ8VmRmeRgb4bVINh7oxDGFauw6GUWN2OfX2b+KVEbPg==
X-Received: by 2002:a05:600c:916:b0:3f1:7371:86bb with SMTP id
 m22-20020a05600c091600b003f1737186bbmr4278089wmp.20.1682610860985; 
 Thu, 27 Apr 2023 08:54:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a05600c099700b003f17af4c4e0sm24937769wmp.9.2023.04.27.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:54:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E7F81FFC5;
 Thu, 27 Apr 2023 16:45:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/18] docs/devel: make a statement about includes
Date: Thu, 27 Apr 2023 16:45:08 +0100
Message-Id: <20230427154510.1791273-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While not explicitly disallowing header macro abuse (because that
would make us hypocrites) lets at least address some things to think
about.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230424092249.58552-17-alex.bennee@linaro.org>

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 68aa776930..5bc6f2f095 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -300,6 +300,20 @@ putting those into qemu/typedefs.h instead of including the header.
 
 Cyclic inclusion is forbidden.
 
+Generative Includes
+-------------------
+
+QEMU makes fairly extensive use of the macro pre-processor to
+instantiate multiple similar functions. While such abuse of the macro
+processor isn't discouraged it can make debugging and code navigation
+harder. You should consider carefully if the same effect can be
+achieved by making it easy for the compiler to constant fold or using
+python scripting to generate grep friendly code.
+
+If you do use template header files they should be named with the
+``.c.inc`` or ``.h.inc`` suffix to make it clear they are being
+included for expansion.
+
 C types
 =======
 
-- 
2.39.2


