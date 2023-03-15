Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D76BAEF9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:14:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcP4I-0006uA-Nf; Wed, 15 Mar 2023 07:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4F-0006tW-Lm
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4E-0005qi-0I
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 bh21-20020a05600c3d1500b003ed1ff06fb0so918326wmb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678878792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8XaO46O+XQUbG+N4rkWdsjN5zkz70OOKz1YQ5MqrEQ0=;
 b=ANFRiKz512cXDQgiRz5x48OCVngl/gh1lq7OncOkB63wdNGe7iomblFcRlcnvVkZkZ
 k7KUA2/O04iZKORVG4rdwlfkjsq1mb8jzVmqu096mML+CnZ1aALNt+qEIW8FKTK3ZrAo
 XMUAveW5G2D609/3SpBe5qa95VKfWPYPF4GrkHk/itS+9q9b7eIYtCXXA9/RtN5kQc0T
 huIt8KHoMiMr85RG973XOZxoR93Xs5JbYPZadeVZhLqRghosQFRV/SCHIibKxxBzcm0n
 g60VjjfrybVtVxSYpl7JUfEpzg+6XKR2UMrpxDg95Q+CuTvKoFOzo6TZLbxvnju5qmQx
 UpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678878792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8XaO46O+XQUbG+N4rkWdsjN5zkz70OOKz1YQ5MqrEQ0=;
 b=d4P2eXj5/UmaWHu1tkLjo6FdQbP1damjgwynBcTLrhINzGXftHpoUqrpmp/uUGRunR
 9mmDlKoyyVGP0TtN26TtGADFjvW4paAntVCVjl6+WTuaJzptnCGeBxFGuqV93ZNahXZd
 uZag7NxOi6GUBzzgvfLtYifYkTeg3QDXt4+hi1QyCBSV8RgB3b/9wNMWWTn6dKRq6JGv
 H34kJrvPEYyf/Bvid8YrIpx9/OcvQZ92hJH9q9Gcxb0eZFtEzfkARBByodp7qkuJcXcH
 vXaGwejXoM2G4b+ICI8eOU3EK+Xt0zRgWNC0cJZkc27MoPKLZqxsIeQaMXljbjsXbqVF
 yIyQ==
X-Gm-Message-State: AO0yUKUtf/FEitxUy0/NkXd3RBc4qPKPABM3JuiLKY8eIDYVWW58STQp
 9UdqTC4mdWiK3aFfFY1Wr6eqJHpGR83ubxDDO2065w==
X-Google-Smtp-Source: AK7set8QZZsH6BME3CfDn7oj8pdbbUB8mLB5Hb+KFZebrVf6Ch7Q7xG9UUwEsx4ODVPSEuvIaXPEFg==
X-Received: by 2002:a05:600c:4511:b0:3ed:307e:3f69 with SMTP id
 t17-20020a05600c451100b003ed307e3f69mr2806067wmo.7.1678878791888; 
 Wed, 15 Mar 2023 04:13:11 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c450800b003daf6e3bc2fsm5428248wmo.1.2023.03.15.04.13.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Mar 2023 04:13:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/3] scripts/git.orderfile: Display QAPI script changes
 before schema ones
Date: Wed, 15 Mar 2023 12:13:02 +0100
Message-Id: <20230315111304.21692-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315111304.21692-1-philmd@linaro.org>
References: <20230315111304.21692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

When modifying QAPI scripts and modifying C files along,
it makes sense to display QAPI changes first.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/git.orderfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 8edac0380b..70adc1a74a 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -22,6 +22,8 @@ Makefile*
 *.mak
 meson.build
 
+# qapi scripts
+scripts/qapi*
 # qapi schema
 qapi/*.json
 qga/*.json
-- 
2.38.1


