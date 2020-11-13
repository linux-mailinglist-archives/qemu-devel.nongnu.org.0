Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E373F2B2061
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:26:09 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbtp-0002gJ-17
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amphetamachine@gmail.com>)
 id 1kdbsJ-0001hE-0l
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:24:35 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:44329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amphetamachine@gmail.com>)
 id 1kdbsF-0001wc-ER
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:24:34 -0500
Received: by mail-io1-xd43.google.com with SMTP id o11so10305563ioo.11
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCE1j1GHo/AW4ZMXJUfXmmPng+mlb1LXwlnAFMFdo8k=;
 b=JtYURsnNf+Gujx93eDmX6ChMoxYnjRUBFjci3c0/En8rI/H3LGK7S0IefygKewgxLh
 v5TwS7CqP75QlYdwzUKNeImN/2ONZKfTrjQr5XcGl6EB7F/aQPeLKP9yykKTf9UeZtCm
 cTlcu0zlyiAtnBaeF8xxMGCHj2w1TDjS/jRgJh7O8W/AHxYXPxb88YgVN7IWgVu5Vqxa
 SQ1kuLEkzMA3+vsow9kBfZffqVqrugXE0nLinAJBTolT0Awsta1unBZ17FjKdTkRUtv5
 ixqJj/Sltr43oXpyqsAjf1mcGPKEVuxzMTFSydI9VJEtBgM4YM04EuhWYOndD1GWQFEk
 OP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCE1j1GHo/AW4ZMXJUfXmmPng+mlb1LXwlnAFMFdo8k=;
 b=QovdIsjkYj2g4sSwAsdrOgWxABQefDhEP4ZOcqZ7gva2C+ziGY0Hbk3dEP3MxlqlCZ
 Bx8dXpdiGzPajCd63vAGaMRDhMAs1lgs0vDQ8Wbmns2nFUtk4z9hIlxqHwN21WBxJIs3
 BUMmovq3SUtbhUN1adXPIJbdVURcC6aRgq/syoWPZvCam2fpmKx9SD/nCm4ebXr3CmKT
 YmFH1sgSo8AGPsbv7kWqQ1ErHMW7sPjtTqTO0V+1xH+4PDFkMsYPq4+dU1YMqZGkxQBG
 XYH3ntTaP7HDuvACNioe4snci1JXGQRzpw1En71ndz6hWBoVw5J8SaUWI99htR95AKWx
 QlGg==
X-Gm-Message-State: AOAM5317DrtnyK4Q9/TnZhvunxquP8FBV/K0Hpr7d8hULa7Fm3DvHDgq
 y3UTwFGuASvuteKnfsVaWZC+XNlEqd8=
X-Google-Smtp-Source: ABdhPJyMSGHdsDzFciUYamSetXWnLzVxklmh4Op2PH4TuRdGzi3G5PUSJDDvvo1/IKsZpJ94Dv++hQ==
X-Received: by 2002:a02:c547:: with SMTP id g7mr2526306jaj.88.1605284664792;
 Fri, 13 Nov 2020 08:24:24 -0800 (PST)
Received: from necronomicon.slackware (c-68-47-17-248.hsd1.mn.comcast.net.
 [68.47.17.248])
 by smtp.gmail.com with ESMTPSA id m9sm4608791ioc.15.2020.11.13.08.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 08:24:24 -0800 (PST)
From: Dan Church <amphetamachine@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Force-remove temp dir
Date: Fri, 13 Nov 2020 10:22:50 -0600
Message-Id: <20201113162248.4131-1-amphetamachine@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=amphetamachine@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Dan Church <amphetamachine@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes the compiler will leave a write-protected .o file in the temp
directory, and GNU rm will ask before deleting it unless -f is
specified.

Signed-off-by: Dan Church <amphetamachine@gmail.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4cef321d9d..663b91a334 100755
--- a/configure
+++ b/configure
@@ -7080,4 +7080,4 @@ done
 echo ' "$@"' >>config.status
 chmod +x config.status
 
-rm -r "$TMPDIR1"
+rm -rf "$TMPDIR1"
-- 
2.29.2


