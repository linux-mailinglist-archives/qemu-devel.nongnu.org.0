Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F87340D9B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:57:56 +0100 (CET)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxqF-0000XX-MX
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMxob-0007vH-Od
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:56:13 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMxoY-0002Hg-Qe
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:56:13 -0400
Received: by mail-pf1-x433.google.com with SMTP id x26so4123420pfn.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZOFTWpnBXkReH6C7Obks1XTjBge5pJc8D6cyo4DCrGk=;
 b=f4sRAq78I+mzI5Mar+2QUJLbAxX6HcSNQhEu22mJRhBbgZMiMn4vNdWqiFUYKZy8iS
 KWD8Lp68B2JaRo8ukugMJMIdDEM60CxIoGBeQxPCtHM+KHzy8TkpNg+UYXl5EgqDNbwX
 WL5zPdJiDlyQrtejNg75ZJLc2Rmq2xhLIGVigfr2ZLwnIbVXtvXP64l6lWleGalstOcy
 zOQEfbDz8A6RoBSnNmS14qC0RFFQXEDMCaiZaquCuycIQ1QwD2js3+U/8KPoSsuJK3Sm
 yQKT2B7/x0/9VGIx3priY+s9X9uvbr/kOtM+6xqa/Ur/Pk4TqRazYCFrctqPf5TysNXA
 oHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZOFTWpnBXkReH6C7Obks1XTjBge5pJc8D6cyo4DCrGk=;
 b=igELK/eCcfYQbF1hQNrZkjTnwaQyMSE3eE6mhXZTBa25ifa2A1/FS74H9oqv7Wkqui
 8w5eYzGDa+tT1Sliv/vJLaPWJyycdfyEM5pELb1tfx2zYxwpQkPk99Mmc6pi1Dp34Hbg
 uOSbbpVef+yhlQYS4MJ0A9nqjXF1Uen0bIDrCqH8JVIxYE2VOcqkWhpUuHEXVJoy/2rC
 D9bkBk04MOYAEp4kx6QjRW66idmpZdaZ0vCZ2E1ZlcdVRTjk72rwKPmK8b56/75nkgoS
 ztaPP/x1C7v98ODhPf2O9QDkzVmrpcSU8Z9aVlpDItYSJWgaZ2VEDsdOuZRfEr1Blrc2
 FUPw==
X-Gm-Message-State: AOAM5322yN/7Pk1hpYhWb+ht1Ck3id5mX5FLJ/RmANEZaUn+F7cqQHj3
 X2CYOmPz/qUgpJnrANg5ycyNrH4msXbPtw==
X-Google-Smtp-Source: ABdhPJyIfO/KFe/LELxAcvaKVjgl2IdS8XgCuSYYgjqzocK+0K8YB8adZb7lmjtJ8GmH1iubQ0XvmQ==
X-Received: by 2002:a63:1518:: with SMTP id v24mr8270044pgl.119.1616093768264; 
 Thu, 18 Mar 2021 11:56:08 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id q66sm3274784pja.27.2021.03.18.11.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 11:56:07 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix qemu-plugins.symbols and improve qemu-plugins.h
Date: Thu, 18 Mar 2021 18:55:53 +0000
Message-Id: <20210318185555.434-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0D
=0D
Yonggang Luo (2):=0D
  plugins: Update qemu-plugins.symbols to match qemu-plugins.h=0D
  plugins: Move all typedef and type declaration to the front of the=0D
    qemu-plugin.h=0D
=0D
 include/qemu/qemu-plugin.h   | 187 +++++++++++++++++------------------=0D
 plugins/qemu-plugins.symbols |  25 +++--=0D
 2 files changed, 104 insertions(+), 108 deletions(-)=0D
=0D
-- =0D
2.29.2.windows.3=0D
=0D

