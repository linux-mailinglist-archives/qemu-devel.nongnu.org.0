Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2E610200
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:53:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7sz-0005dz-1S; Thu, 27 Oct 2022 14:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sC-0005SY-8k
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:03 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7s7-0004ja-Ks
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:44:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so4857489wms.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aG1xVErKESKleoE/OSV+q8fYxMoqJp+CHoFu5AxaIU=;
 b=vBXlkmWlFmkm9hVAPhfC1lycGrFBfxRvBh90D9FG1s+PSVGeqGt/odLSOV9PM6TctX
 mND22dJ9J6D+SCSaws2cOrkFKMqLNPkGX2hJNm2uFXHDPltF5M0z2LAXP665rRuiVnOS
 S1vmm7A/o3PZQQqWujTCwgQsYhdvpB3WApe1IlrucOKNQdJMnmUooNwJrd99DZkZvXSZ
 9rDWRvwNTmBrNuvYMTl/hrWZNPCbDQ+dfGnLk3g2UuO8KkYnfS1c6dyE669qCo9hYiEe
 vTv92tgWjKfYVSXQQ+1CnCkiOfciQyCHlR/GtR/0wlonrv4RYFxhDcX/Mo/eg7C5nW7H
 sj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1aG1xVErKESKleoE/OSV+q8fYxMoqJp+CHoFu5AxaIU=;
 b=qybx/5dXED+eL7NaUbcePvUb/dyjiuoK0MZRpnAyj5jD21iDu8mxb0pYdG0EkkDPRv
 jo+yR8Goc/RTCT8JY+Bz9X++FQ7TLWWNLCceJuh4wr0bQ6V3YTnCMBYhzMyItv1ooW8N
 rGtjguk6webd0TRj61CO8/QqK71BfMl7pcjnRiyqiAHs0dNMqGH9pvTvOmtKjYCI43w5
 P3ZwMBmb+TYj8SB8QEKG0/5X1ScU2i8xu4uAM/S7XkMcbEYfV15qBKaEh6A1sjRURPp/
 LiaeJLUEIZBNQjktYlpb4qC1H/SaP6czkFFfSf9U/13P0gbsBC3CFE0H3FF9tTm6eOgS
 ATLA==
X-Gm-Message-State: ACrzQf28DamkyN6klhJy79s7qHXFDgmK2Zy1BubUIemIORM/4nB179QD
 9USeOSR7qg0kIIjdGRDFELGPu7n/uuETTw==
X-Google-Smtp-Source: AMsMyM4fz+H3bGx4fCkpY1qbnWaIeMSUAOiunyB/trBOTaXl/mcbUjmUmwI/rATPGaaEyG6Wm7rZgA==
X-Received: by 2002:a7b:c30c:0:b0:3c6:f26a:590f with SMTP id
 k12-20020a7bc30c000000b003c6f26a590fmr6969772wmj.205.1666896294280; 
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p28-20020a05600c1d9c00b003cf55844453sm1792352wms.22.2022.10.27.11.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D0CD01FFC7;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v4 16/30] MAINTAINERS: add features_to_c.sh to gdbstub files
Date: Thu, 27 Oct 2022 19:36:22 +0100
Message-Id: <20221027183637.2772968-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f72f02d661..f0a6a588e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2695,6 +2695,7 @@ F: gdbstub/*
 F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
+F: scripts/feature_to_c.sh
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
-- 
2.34.1


