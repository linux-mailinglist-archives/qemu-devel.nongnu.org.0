Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718B344676
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:03:12 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOL9D-0004O4-8W
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOL6M-0002Yg-RB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:00:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOL6I-0003g9-Sy
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:00:12 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x16so16971135wrn.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M1U3MX8CXg2oweQX1NBg0mnflTVx5CKvnyZhxQNAl1g=;
 b=UiayfgF57qYUEjPY/p71PnPc1lYiva+xUla0DXm8cpcMvsjnmYTlYiz3R6d6u7JZrj
 3V6aAa/maTQxKFcFj676dXXRufo8fb+GFhALcP93CLmcdNAtNKgYoxPztPiwGdDSo9sK
 NHTgS9hRdIIfiNh58SJ96PgeuU01Oh5DTSjX0WJGbsidOjMlpDWZF4zQ9AijZZpYmCM/
 wu3bp8+A3YNBz3RO8VeHtvi1PlLnWq0KEamHIbflkvJYE+SEedvs6mnXzpYW48JipMx1
 nvjflpM8nyqrWA7lBoaQlxRt2wRd3u5fmQjGE/9GRFE02BRFr2BWmwBimxj7wLYx+TR0
 UhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M1U3MX8CXg2oweQX1NBg0mnflTVx5CKvnyZhxQNAl1g=;
 b=rZSqcrqDSaJHSecAf7oYeyacLraAZbsTp1y75iQ5wHV2MUt9HMXdIWtOvnEcvoUOiZ
 s6fC3pk3Viz38LN7wKl8bHyHubPheO0baYBnhvS4sLKthuE1ejG06KhMkQgUWCOkqdpF
 Q8UO7kbSwLU6TpOSy/dbFRoixTkvOzZte8LEIcTixtFuPe83Q4E18eiq+RAUfhBfbo1r
 7dvLGyA7LMMf2HjeF2ae2IKPhtRGFv2MlFfH+coUr0VrMm0fxuDxcLHzQHMfhCxxoXRF
 silR21CLk352ZPTbUswXiixggsjVc+jpZQ/JZ8siDG0hFUTyhptAUNvzn7jLydhVqh2r
 XR4A==
X-Gm-Message-State: AOAM530BHCjMcNyzRUg58bXi+kjb7rUny0bpUBRUFxFWpohLii48kB75
 UQUclbsu3gau4J04OhOjEoQDAslxHWo7Vg==
X-Google-Smtp-Source: ABdhPJzIttnkbsYm/dXqcOyrcCgtR9OeG8UT5Zlth3+wx8ZRLVxC3xXGgNqAIF6W78nVgTpnC6yZ3w==
X-Received: by 2002:a1c:e341:: with SMTP id a62mr19975wmh.152.1616421609251;
 Mon, 22 Mar 2021 07:00:09 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b15sm19128335wmd.41.2021.03.22.07.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:00:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] target/mips: Deprecate Trap-and-Emul KVM support
Date: Mon, 22 Mar 2021 14:59:57 +0100
Message-Id: <20210322135957.4108728-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322135957.4108728-1-f4bug@amsat.org>
References: <20210322135957.4108728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: libvir-list@redhat.com, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Upstream kernel had removed both host[1] and guest[2] support.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=45c7e8af4a5e3f0bea4ac209eea34118dd57ac64
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a1515ec7204edca770c07929df8538fcdb03ad46

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210317011235.7425-1-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 67c98dcaa0c..d3004acf948 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -186,6 +186,15 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
 instead.  As part of this deprecation, where ``nbd-server-add`` used a
 single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 
+System accelerators
+-------------------
+
+MIPS ``Trap-and-Emul`` KVM support (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
+from upstream kernel, declare it deprecated.
+
 System emulator CPUS
 --------------------
 
-- 
2.26.2


