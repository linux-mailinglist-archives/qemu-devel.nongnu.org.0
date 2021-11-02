Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2804439B6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:28:59 +0100 (CET)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3D8-0002OR-GF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f8-0007lG-Gk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f5-0002u0-BK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: by mail-il1-x130.google.com with SMTP id f10so664900ilu.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IP/CrjZ71MNpMBK9SbbROnnwU4huuf4Ai9hfA2D/slk=;
 b=XQqB4KgxunMQWpH3GPrDFJpoHDCdxNMVuDFedzg9FmRF54V/y7PtRbFjhLxRpI3PUt
 k9gPzClI9Vbf/THMfRGr0Opzy/ZPx6O7xRqpTNsfi81I0buHfLLJ0SZIWAseB05k+xOr
 HIS9D0njSp4gScV58PdmlBiUsiRI90gUtf2f6/LXz8AG6SC3Pl/VSuPGcgIYauXEziXC
 aNkeiwBAugBafN5j0d2meGmyBYEFbLgjlc+hmkFi5lvb9GBdbgKa2yK29ZGktmAs3Lxk
 hnqtgpUQghAgu10fAzgrxYg4sM+QyFJ09KJvsHOvCyHwEr5thXVDgfR1zKDa2pEnZSM5
 8XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IP/CrjZ71MNpMBK9SbbROnnwU4huuf4Ai9hfA2D/slk=;
 b=A0kwtKHmowkzOxNHOTUgBQ3cu4WW4ufRQX2zK9AxsrW3+7GDDS4A7zNZEQI7cCZ9HX
 7N6uv4ELkvdhDeFmu7fiNzgh0NqYXJyIEkDqSPMJy1QWYpHZC9cTMo7JnhJet4RmjDtx
 YpjaTLmV20lNRUNR5Uw9SJriZJpaMukncqLuK1jELJZ5nvPyAkdiL9iuAYC0j1Yuk4Xn
 iIFS/ujTDFF6LunJqeXZhHrvEsrkdvp7Yn87pVJTLPVzrvE9U/Yo2yN/i3I8P9kK6mzr
 Kcop9+4jpSeTI2PMgBPDZgTjruQBM91tGQk9UwclMz+DpgHqFgyhlZVu+quBfXEB0t64
 CTdw==
X-Gm-Message-State: AOAM5336qDh2/A80Eut7t/q3xI97xLiVLJhezaTg9NW5J0c0K2O2Y6C1
 k4vXcRLlIbVpUIj49/QYen3HJeu6xLdukw==
X-Google-Smtp-Source: ABdhPJzVaBFfXxNzN017erO6cqwFdJ9t9sfNtUCHSkAtBorFFzIICmCkiUfiHUBJWoqGW1XoFMlYbw==
X-Received: by 2002:a92:9513:: with SMTP id y19mr26490865ilh.300.1635893626055; 
 Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/30] bsd-user: add arm target build
Date: Tue,  2 Nov 2021 16:52:44 -0600
Message-Id: <20211102225248.52999-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/arm-bsd-user.mak | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 configs/targets/arm-bsd-user.mak

diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
new file mode 100644
index 0000000000..90b6533195
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
-- 
2.33.0


