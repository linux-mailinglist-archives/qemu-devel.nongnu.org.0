Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23324C607A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 01:59:01 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOUNO-0006nf-Ey
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 19:58:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOULy-0004zV-5S
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:30 -0500
Received: from [2607:f8b0:4864:20::42c] (port=42505
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOULw-0004cS-9V
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:29 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a5so8735644pfv.9
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 16:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLqVpLbIl0a852/Rl89zbvE8hCK5ORwN2nBheEOdDl8=;
 b=RLiMHQ7m9kI7aspl1fEWxzSsBuT39F4hWCxGxMoKAdM0/gNld8dldDI3wDH5T+Kz7G
 +3/zt1B9cO2j0Ntr48uaKvY8kCA7f1c7xMVj939es9vNk7fyQZfDqrwlLby48+IsPMdg
 FmWU454ndIIrmbcMP4z6G4Nurv7UBUCqZ9rUaFRlGCrsjYcaWtmC4dAWscLrla/BgkXT
 YCSEBhGIGFlWGBpZ6e+WEJmz2s9qACQXyA+XVL73827LOlOo5MhUbYFARaBLk07h1bmX
 tL9n7rtUMMlOEUSY8r0p/wEmGM2Y9hD15T4IJ5oZegNna1D3QzC+xoORknQNjWxn1YqK
 v+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLqVpLbIl0a852/Rl89zbvE8hCK5ORwN2nBheEOdDl8=;
 b=7ziShJq5ThXByhfxZ/pTE7+42gXIYWqxuOJRKFVQz1f3P+6sSxEjACiHefX3+EnOqT
 HJSSgV6+QafPRXQxjGGX4W+Btuc1986P3FE8J7Lxy/nSqDi3elY1Qt6DrBYKE+YHRfpa
 v+9xBbyoWts+XCuw4rkpGyr9ytdAaW0UgOphkKEynkQccs8k6pzZZRqqNtuUC7+yuizx
 n1G3rLhOawpY2/n75Nj3TQv0UQufMYZqL8HAaPDDVZF+UtqUr02pA75vv0eWgdlspN0g
 gevnJ/3BjhH9VMSl5sVXsffhP7Cfbi9Om2nC5tCWczhNL1CY5/27WncUeJz2oymQdDtx
 15EA==
X-Gm-Message-State: AOAM530ScGxNSIhatCaOcTQ5tdc3+mx2g6DL8yMv/K1Ln15YDtLi04j/
 DddZuZpflVq4ywAmM21/HFrqyJ11tUo=
X-Google-Smtp-Source: ABdhPJzDUiILn3rWyvizfg4JJ4U8slL7wEGGL0qnwoDiOqGRJy3FJpZDWgzKqeAhSr4U6blAP2hXFQ==
X-Received: by 2002:a63:500e:0:b0:36c:3697:7aab with SMTP id
 e14-20020a63500e000000b0036c36977aabmr15083612pgb.98.1646009846809; 
 Sun, 27 Feb 2022 16:57:26 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:6839:3c6:46aa:5d85])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056a00130100b004df82ad0498sm10634610pfu.82.2022.02.27.16.57.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 27 Feb 2022 16:57:26 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 0/4] cutils: Introduce bundle mechanism
Date: Mon, 28 Feb 2022 09:57:05 +0900
Message-Id: <20220228005710.10442-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files located relative
to the installation tree. The build tree must have a new directory,
qemu-bundle, to represent what files the installation tree would
have for reference by the executables.

v3:
* Note that the bundle mechanism is for any files located relative to the
  installation tree including but not limited to datadir. (Peter Maydell)
* Fix "bridge" typo (Philippe Mathieu-Daudé)

v2: Rebased to the latest QEMU.

Akihiko Odaki (4):
  cutils: Introduce bundle mechanism
  datadir: Use bundle mechanism
  ui/icons: Use bundle mechanism
  net: Use bundle mechanism

 configure             | 13 +++++++++++++
 include/net/net.h     |  2 +-
 include/qemu/cutils.h | 19 +++++++++++++++++++
 meson.build           |  6 +++---
 net/tap.c             |  6 +++++-
 qemu-options.hx       |  4 ++--
 softmmu/datadir.c     | 35 ++++++++++++-----------------------
 ui/cocoa.m            | 20 +++++++++++---------
 ui/gtk.c              |  8 +++++---
 ui/sdl2.c             | 18 +++++++++++-------
 util/cutils.c         | 33 +++++++++++++++++++++++++++++++++
 11 files changed, 115 insertions(+), 49 deletions(-)

-- 
2.32.0 (Apple Git-132)


