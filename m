Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B1E4A8CBE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:53:24 +0100 (CET)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiAV-0005Ha-EB
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhd9-0002Qs-9x
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:56 -0500
Received: from [2607:f8b0:4864:20::42a] (port=46017
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhd5-0002Fk-TF
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:54 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c194so3002642pfb.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bq6XFRx7wAa9rcjDBKgvoofz6huJBBnqUxVQ/7FlcqA=;
 b=lsEDy39xHR1L333S8S+oroJtWLoT6PnlNqit8b2WLjvbN/rMyu4E6fAW8Ss/67XdoE
 zqlhnAvRYZvhxTByXoj//Di5+u+q1TuOQk23SnhH0G143K2Z4wotcRGAudurw7wBWuj6
 BOW8iMbh1b1fl3xL1z0yy3cJbnhKZxixqn5d55Tyber05/t7325mBsIFSm4fBpON82RP
 mMQ3MsSnVrP3o3z6B02l6k8Uplaw0oahrVrSDnooC1iZrwbk38z+2vcmFNIkzKgv0hvv
 qWTtWzZfm7LVrw9PgNA2kNxRvFQBIraKWgrgYG+dYZP4TBLb82MXUloLfJnD1KJwgE1G
 1Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bq6XFRx7wAa9rcjDBKgvoofz6huJBBnqUxVQ/7FlcqA=;
 b=CQKB8XICtheEc0s1fM0oamPxPEIxcc008mHtX4Aznbz1+4uh5ddm4AVBdLcZF5Rcgk
 cBHo+JAhd9ao8OBlnQ5Zm9e3DIGjPmppO2v7Ex7DMhDkluEmG+Uf3xM72+eWxCpjAf/i
 5G0ooNKsuGGc0/+2yp4vuId6EymbdNTvaYCm17g5N7fKjB8fugsfvKJFuDUhpCX5iHQu
 3KEXBVACnBLvNiDiHPScXBNARfycT1m431ot33oxqVZ+/F1YcC+rwbGnmTtOGIYHw4kk
 Xguh1ADczlRnCSuY56xUsMlEMYaPqYbXB/CJdc5fZX7Sm1MLf0QhY7uli0E/vEBnQSe3
 LRcw==
X-Gm-Message-State: AOAM532Gqyv9kuKUx/Uq95InRYEPuUSvoD2WM/fwff51ResyKz0pJ+nj
 LJVTtZVWUTLHsbbkp3rqIosQ/kPXuFE=
X-Google-Smtp-Source: ABdhPJwwzjla+bGBOgYHjBb4QCDzaphovDxFeYkzXsb4D/S0OwWXNRxuMru3dhdxalusr8Gs3oqhDg==
X-Received: by 2002:a65:4985:: with SMTP id r5mr29467662pgs.299.1643915916625; 
 Thu, 03 Feb 2022 11:18:36 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z27sm20913347pgk.78.2022.02.03.11.18.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:18:36 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 02/21] accel/meson: Only build hw virtualization with
 system emulation
Date: Thu,  3 Feb 2022 20:17:55 +0100
Message-Id: <20220203191814.45023-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/meson.build | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/accel/meson.build b/accel/meson.build
index dfd808d2c8..b9a963cf80 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -2,12 +2,14 @@ specific_ss.add(files('accel-common.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
-subdir('hvf')
-subdir('qtest')
-subdir('kvm')
 subdir('tcg')
-subdir('xen')
-subdir('stubs')
+if have_system
+  subdir('hvf')
+  subdir('qtest')
+  subdir('kvm')
+  subdir('xen')
+  subdir('stubs')
+endif
 
 dummy_ss = ss.source_set()
 dummy_ss.add(files(
-- 
2.34.1


