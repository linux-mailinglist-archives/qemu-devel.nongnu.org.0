Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB56F5476
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:19:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ck-0003WC-KZ; Wed, 03 May 2023 05:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cf-00036O-Gt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cd-0000Mi-8f
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-306342d7668so1633000f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105481; x=1685697481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SIbkDONpT/MgcuDaFYNVS9jJaHe0Is7g3tjeak7dyjM=;
 b=oWZGqr1qhY1le/QYRV8tnYVx096uuF1L+dwFN2sbLHc1JoBFG1PyyfhX51xmUGgQ2i
 r3gW5jPAafMAagG9a6OBzDeQ8+3sKE8XCCG+wIwDcqPfWdhFecRAErJBUbYMYfNgtHxL
 1A3auNvHvpkF7ewqegIuWijsYjIpGSuMcKnW6QS5HZkScgGuWnEVxT+hYm/seAT+XosB
 VXBdkRQQy+ocL5ghGfjMBtPEFNet7nELftQJaVboC7kz+0QuHdVcr9EXpUvS1yymwfjX
 9IEUwIlg9uo4rzS2S2P4+zHLbvnJTTiC0ownfqZpLYEQTH1623FTUl2Zwji11yTUiuy8
 CP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105481; x=1685697481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SIbkDONpT/MgcuDaFYNVS9jJaHe0Is7g3tjeak7dyjM=;
 b=JRLHdgemfoY2u6oFlGPaQNGXmV46e7h/eAtEAaP0A/HOEq4JKIovlHWOP+E2MjHe11
 J4FSgVf0u93TbOWhmWWZtjMiKq9WHmQ7cXGS2PoLT+koGg0mGW+WIMZfjSvS3bu8D35j
 YIBQuUDcMZLuOaXLBkomzDDhKvNHPZSXJLEKXD+StvD82M24OGQ1JtVXhPVPc9JpKMaR
 PGB0VG/FW/oYOVGojxyLlQf3H8+fM9iWce5tKrBT0vAjUqzxBRDssStG2Rmk0rl6PZIu
 eCdzeM6ZRsVOXb/uW/y+E8YMIgm+g1TsPZ+KW7SvtRMFZF7iBHtCXcOh+Czc9pSvlOOK
 dq8Q==
X-Gm-Message-State: AC+VfDyONZGOfonbyZbnlZHK/CWh+ZeQcYqnO8EkQFqtUPrSpCXkbt7U
 UaC1w/CNfYztFLWCEuUEo333kQ==
X-Google-Smtp-Source: ACHHUZ7m5lvEPfRj81aharqBjGfjPJ0nPoEuLrs9IAs3bt0+C6nxKg7Z37+9P+pfm8pfWHZrXMPceA==
X-Received: by 2002:a5d:4b50:0:b0:2fb:703d:1915 with SMTP id
 w16-20020a5d4b50000000b002fb703d1915mr14053322wrs.43.1683105481712; 
 Wed, 03 May 2023 02:18:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d15-20020adfe84f000000b002fb60c7995esm33539437wrn.8.2023.05.03.02.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1850A1FFC5;
 Wed,  3 May 2023 10:17:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 09/10] hw/9pfs: use qemu_xxhash4
Date: Wed,  3 May 2023 10:17:55 +0100
Message-Id: <20230503091756.1453057-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091756.1453057-1-alex.bennee@linaro.org>
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

No need to pass zeros as we have helpers that do that for us.

Message-Id: <20230420150009.1675181-10-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/9pfs/9p.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9621ec1341..9bf502c45f 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -741,12 +741,12 @@ static VariLenAffix affixForIndex(uint64_t index)
 /* creative abuse of tb_hash_func7, which is based on xxhash */
 static uint32_t qpp_hash(QppEntry e)
 {
-    return qemu_xxhash7(e.ino_prefix, e.dev, 0, 0, 0);
+    return qemu_xxhash4(e.ino_prefix, e.dev);
 }
 
 static uint32_t qpf_hash(QpfEntry e)
 {
-    return qemu_xxhash7(e.ino, e.dev, 0, 0, 0);
+    return qemu_xxhash4(e.ino, e.dev);
 }
 
 static bool qpd_cmp_func(const void *obj, const void *userp)
-- 
2.39.2


