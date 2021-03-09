Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F7332B2A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:56:34 +0100 (CET)
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJein-0007Ie-0m
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJe8e-0005GU-HU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:19:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJe8c-0003Zp-VX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:19:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id b18so16361706wrn.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hQ3bbwJ1JUkpCy4P5iNwVwdXloIqxJcrdmpuzIiEkUc=;
 b=qkke5vwCU7gGVt7r13UvejiQUt38bpvx/9+6qUm79kfC2byPenSvb3VmitrcdRcTT2
 0SWCi7zGgqwC6F9CDi2VNvbAFb8FzzxegkkWmasUQMQPEe20NR43JSRRrM5gOnE2WIRW
 sCtpzzpCaSEYe1daSFdJyuhKPzfXNLzVzh3w2pXFCuU5Z/K59/c13iteEe6oDJAZbFjV
 pBlz/3pal3dskmcP0cpI2F7SFpJw1VDIbrnBU1Ghi4DvnjkpSdLfqf/UzNergECue3NG
 k5beH5fN0ACDJeiPFo+oevOEsEDjrHf8QwY/xhfWIgZe6lyPXlzQKxu7tdr0VmZi/liX
 ICrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hQ3bbwJ1JUkpCy4P5iNwVwdXloIqxJcrdmpuzIiEkUc=;
 b=MqgAgQLVzmkdHcRyndXcBSoAzRyHQIBeUY5r6aJ5zLmX/FObgUV8glvTW98qRkSsZO
 1Pgnr4AVPWfJQ8coKzZGvIDfZskpVQ/tBJp8LC+wgyGJK/FNbbswZ0jrNsVuRoPDZdfH
 SNaCy4ls4brvAha0Wo3ix+mQAVVfGTj5gr6fAOxHBpA/8uiUyXuG5jBMmpKFEebGliyT
 dLSlZR8xqQwezKRm6hbYjEQ7R6utHDQdxX1iNopw4SoqTHYtYK6oM2d0vXlNWCSe3znn
 RIHwAUtsibTyCA+ogzvzqduR7ZK/mlSndGgzSCPbmNXWnnXCStO8GE+GyGenpw7MGj7i
 WDaw==
X-Gm-Message-State: AOAM530+qEXNZQbrG+a+qKty2/4Uuijm5gYhzjIuH5/VNTN/2fY2EAGZ
 2vQpcvaR7E6Hj0k3d+Ze5FDJUGuyDuA=
X-Google-Smtp-Source: ABdhPJxR5hcvRr9eh7R4B3KN2haZnqwwVYieBS3oyzUYrUr26L5l6fCN0+O7oieevSp0r1Zj/ZlcrA==
X-Received: by 2002:a5d:6a49:: with SMTP id t9mr29473415wrw.131.1615303148953; 
 Tue, 09 Mar 2021 07:19:08 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d16sm24022808wrx.79.2021.03.09.07.19.08 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:19:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hexagon: do not specify inputs to semantics_generated.pyinc
 generation
Date: Tue,  9 Mar 2021 16:19:07 +0100
Message-Id: <20210309151907.201528-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_semantics is an executable, not an input.  Meson 0.57 special cases
the first argument and @INPUT@ is not expanded there.  Fix that by
not including it in the input, only in the command.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 15318a6fa7..8724f8f1fb 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -33,8 +33,7 @@ gen_semantics = executable(
 semantics_generated = custom_target(
     'semantics_generated.pyinc',
     output: 'semantics_generated.pyinc',
-    input: gen_semantics,
-    command: ['@INPUT@', '@OUTPUT@'],
+    command: [gen_semantics, '@OUTPUT@'],
 )
 hexagon_ss.add(semantics_generated)
 
-- 
2.29.2


