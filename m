Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125306A1F02
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaPd-0005Po-WB; Fri, 24 Feb 2023 10:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVaPY-0005NO-Qb
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:05 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVaPW-0005WU-71
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:03 -0500
Received: by mail-wr1-x435.google.com with SMTP id bv17so1561079wrb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O//GpvBz7gKXETi64NiaR4BbJLf2F5pJYT7aPFCvzaU=;
 b=R+YQwUfjzIv6aWPRunE0EuSBj+gLsp/cXyROo320hMrYEqz6qpDXIuA6CzPRzfluLb
 NKASouN/pYEc7ujiytck+QpEjAKNbFhcbv/oEk4LvuZO5rQncXisbQLJU44WKaCAiujV
 1eUV4kGcDWwJKBJSDicWIK/5dAlOlPxH1/hiUiA6LHP/NC+Mqh1h3o1hLOCgvBSj5wXt
 yPRhljLcfeFZYWnRTgTONgex2ZYEb9XLVs9Lkf2NoRaw117oKapwduSnv5uiigH/91nT
 fdMpvrwpvfpndI5Pf138akeiVdeZByEY1Vn985Y65SCzHDPcd8sH1BfycCRsf56k7W4F
 2T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O//GpvBz7gKXETi64NiaR4BbJLf2F5pJYT7aPFCvzaU=;
 b=DJ4JCwyKIinzbhR1Va2Amt5Hg7NHf9x0yj9Nr9cnQfM0SPk2Ce9GVA8f6vpDl7QH3V
 0m5RcZcf5phXAcMHnqvDIG7R6Qo2YDvSNmg2s0VGU31VoA+x8bZpQgq3+YMfEW3m2Anr
 3/HOszoAIYJENuzBAg09I7rtYarV6bAehSrNINmQ/MDkKkNjFFMfQTS15D3Wj9MMgPei
 WaW5xGq+A8W5F34bXZoCz9Ho6t/IMc88TM/4VCDsJx/ja5GD8QKxjodbOOBhSmvXfCk5
 cth3JxlhIcGLdO1t5JSQG2QkutEtEtpP+pG5aQCkhnwnR25yLtE8sQf65sX6aqazQEj8
 UN/Q==
X-Gm-Message-State: AO0yUKUQGKCxEdSRi3cct0hToRz6ZXuudia0Iy9wLixO3DHh7x/+VKdM
 0IWEsfhCsf3hORrAaiih7jY64HO5FkaD0Vpv
X-Google-Smtp-Source: AK7set9rLr+9KJH2PXQT0EezvYdIFAJvV7wMy5dianUbJGP2kEM6i7zspeHE+H8MrQAM5E1yL8Wghw==
X-Received: by 2002:a5d:49d2:0:b0:2c8:37a:59b8 with SMTP id
 t18-20020a5d49d2000000b002c8037a59b8mr970982wrs.49.1677254100127; 
 Fri, 24 Feb 2023 07:55:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d698b000000b002c5a1bd5280sm14302642wru.95.2023.02.24.07.54.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 07:54:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] qapi: Do not generate default switch case in
 gen_visit_object_members()
Date: Fri, 24 Feb 2023 16:54:50 +0100
Message-Id: <20230224155451.20211-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224155451.20211-1-philmd@linaro.org>
References: <20230224155451.20211-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

When iterating over a QAPISchemaEnumType, all possible
values are covered. The 'default' switch case is unreachable,
remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/qapi/visit.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 26a584ee4c..f66a31a963 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -159,8 +159,6 @@ def gen_visit_object_members(name: str,
 
             ret += var.ifcond.gen_endif()
         ret += mcgen('''
-    default:
-        abort();
     }
 ''')
 
-- 
2.38.1


