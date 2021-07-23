Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01B3D3E8A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:23:28 +0200 (CEST)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ytT-0002qO-8f
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygI-0005xj-9o
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygC-0008HK-Dn
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so3918942wmh.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h84vwhgT+K1IZ4lMWu6g8SbYtYvD55wEZlBZwEany9o=;
 b=BNwVsBmXWNw7E72WXXvgn2FzOi2F6D6vF3Olga3MhhoiQa3tHhWGdhELes8Ytbbvhr
 L1oH1u97Qd3dCZOAjYvQDzZkEat0vugI/2L40cDiAeZd3taM58IjE+8yQLK/SCAcjfXv
 GwDZT2yKOcO8qCIlq2n47XYMci8sk79Y8UfgNSEGGIIWN/1CvH2eYU3+NNVD2ybmem06
 1sO9V3nNLoPWCaoGCkc3xhjWtzHFh0THbrDFnetudcfl7oFv6MUFClrBRH0UFuUDA4IB
 WuxY11ef7fDW+WECp7UIqAv92N32hdqwjCjRAZjBRJag0RdW+7TA/tJLOKjUO8KwJ/AH
 YmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h84vwhgT+K1IZ4lMWu6g8SbYtYvD55wEZlBZwEany9o=;
 b=a9Ci7zaQMc2sPM1apgD43352Hw0IVDdT4gsJokfBB4MaAg58lJ4iUlnqPirKNso1+K
 6BqVb7XiAoRJo4fL0DADw44WuG/Kbi+qBCdTB+0YZ9OzzArr0mzoVSARxmCGX/5NhYRa
 i6cHZ9rGeqkSqDwfIvf9EgIOTGloJXK7vWf7olNQbhwMnkd9wHgHMMtY/jpTfUBCS+JI
 nftPW9d1DnY/eXcTlhETYVJD3wWyLzEKlWWhTCdLPdJV9x1Hxa+W5tBmKp9qb00dkF+d
 7SDtLts4CXcjbzla5B47lfe7LZ+Jd4ftjBxW7foTtFkf23+nwp6S68wNXtvn2YUFflIt
 Wdhw==
X-Gm-Message-State: AOAM530rd/544T6jk3uTUVPgiKZ8LXl/45KlNNT1BinPIz6W8hYJIGbq
 SrZ80NWF0Gh9pntaAbx0d5mPnA==
X-Google-Smtp-Source: ABdhPJzXTfhzXe7DRJbJ2gBbVM7AWJG+Puqrj6l2HHmmVkTtxiFyANk9ZcDj4NbXe0WS9LhGJtIVtA==
X-Received: by 2002:a1c:1f12:: with SMTP id f18mr14688835wmf.183.1627060183097; 
 Fri, 23 Jul 2021 10:09:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v30sm36231363wrv.85.2021.07.23.10.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4B161FFA6;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/28] contrib/gitdm: add a new interns group-map for
 GSoC/Outreachy work
Date: Fri, 23 Jul 2021 18:03:44 +0100
Message-Id: <20210723170354.18975-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It makes sense to put our various interns in a group so we can see the
overall impact of GSoC and Outreachy on the project.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Cc: César Belley <cesar.belley@lse.epita.fr>
Message-Id: <20210720232703.10650-19-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-interns b/contrib/gitdm/group-map-interns
new file mode 100644
index 0000000000..fe33a3231e
--- /dev/null
+++ b/contrib/gitdm/group-map-interns
@@ -0,0 +1,13 @@
+#
+# Group together everyone working as an intern via one of the various
+# outreach programs.
+#
+
+# GSoC 2020 Virtual FIDO/U2F security key
+cesar.belley@lse.epita.fr
+
+# GSoC 2020 TCG performance
+ahmedkhaledkaraman@gmail.com
+
+# GSoC 2021 TCG plugins
+ma.mandourr@gmail.com
diff --git a/gitdm.config b/gitdm.config
index 5d5e70fe5f..288b100d89 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -40,9 +40,10 @@ GroupMap contrib/gitdm/group-map-redhat Red Hat
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
-# and those working under academic auspices
+# and those working under academic or intern auspices
 GroupMap contrib/gitdm/group-map-individuals (None)
 GroupMap contrib/gitdm/group-map-academics Academics (various)
+GroupMap contrib/gitdm/group-map-interns GSoC/Outreachy Interns
 
 # Group together robots and other auto-reporters
 GroupMap contrib/gitdm/group-map-robots Robots (various)
-- 
2.20.1


