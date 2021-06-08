Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87839F4E0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:25:10 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZr3-0000ZK-9o
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp6-0006Oe-1o
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:08 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp2-0007vh-UZ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so1597504wmq.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wG87wbeE/isVrf5hETtnbcU1YZlRR0m+ng6fwnl+cq4=;
 b=aILVX1X4/NHCV73prq18OUT6bHvdUyK9/j7ZxEEaDuKmM0eiVBK6PvcU5TkQ5nCmtm
 6T86jI8xJsQ0BZ2/FSmIh9K1x+fF0KU44auDuMhfwimQTLUx6Hwnlf271rEJeyb0TSH1
 AvIr4f3CBPHg/RYJo5gIHws1SWTF30w/wuj7buP8hDCNOYreqEJ/KSkM0UbFJ2FV20KT
 BtfBJOtML3ggFAVswT3MWXUaaYSuOvELV7jO5CY0brfaU/7Q2tdYSG7+Hu9CYO+fhVne
 A2h2llsnkE8QiOOFBPNohj9ferDffnJ3FPw1CVt0r5XNBj8wOh/a+0IR7wkyih7SuWSj
 l1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wG87wbeE/isVrf5hETtnbcU1YZlRR0m+ng6fwnl+cq4=;
 b=qQjgwoSkQS0rMLOlgynLufxb7n0Bt5RdSw6CDtHXSpwdXtfOnxxj7naOCPv+W3XP5+
 GrwKe611jVdQQ+WoBcdCWNJh8RZx/Wz9SPY1Hq6tkDidsV55MRd88+FzMGvQEJJp4c63
 mXhcOF9upsrv53l2eXgORq+PUVeMLiEA+0KBMy9DqXSj/oH5jHMv4pyh+w5NaMDkW5zN
 x6GETxkuNQoJJ1NW1aqZ7IeptreDBu15qVDdvSUoAUs2cgWHF9e/UkhPVcF98r3jH/gr
 So3P9FwO6yf+mFnKtv7DeDmeGTEhr+2pztfJYPjubxTGdRWGs/NA/+LJBKM3xOXkVPfH
 K/fQ==
X-Gm-Message-State: AOAM530MT6FZo/0d2dkxbVe46dceqSvGXn9ZoNmBxi/zgCLfMBFdATbf
 44f/pV1YGjdnhi12u5b3dmW4Y0PIVL5pcg==
X-Google-Smtp-Source: ABdhPJwaeq5MLtBBvrNc/7TF4ay8iXNWdadDZ0xn+QneTEE5/31f/ZyYm/m5DULaK62XX1nExiIQlg==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr21619547wms.150.1623151383205; 
 Tue, 08 Jun 2021 04:23:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] Convert more checks to Meson
Date: Tue,  8 Jun 2021 13:22:35 +0200
Message-Id: <20210608112301.402434-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

This series removes about 1000 lines of code by converting the
handwritten configure checks to Meson.

Based-on: <20210603133722.218465-1-pbonzini@redhat.com>

Paolo Bonzini (26):
  meson: drop unused CONFIG_GCRYPT_HMAC
  configure: drop unused variables for xts
  configure, meson: convert crypto detection to meson
  configure, meson: convert libtasn1 detection to meson
  configure, meson: convert pam detection to meson
  configure, meson: convert libusb detection to meson
  configure, meson: convert libcacard detection to meson
  configure, meson: convert libusbredir detection to meson
  configure, meson: convert vte detection to meson
  configure, meson: convert virgl detection to meson
  configure, meson: convert libdaxctl detection to meson
  configure, meson: convert libpmem detection to meson
  configure, meson: convert liburing detection to meson
  configure, meson: convert libxml2 detection to meson
  meson: sort header tests
  meson: remove preadv from summary
  configure, meson: move CONFIG_IVSHMEM to meson
  configure: convert HAVE_BROKEN_SIZE_MAX to meson
  configure: convert compiler tests to meson, part 1
  meson: store dependency('threads') in a variable
  configure: convert compiler tests to meson, part 2
  configure: convert compiler tests to meson, part 3
  configure: convert CONFIG_STATIC_ASSERT tests to meson
  configure: convert compiler tests to meson, part 4
  configure: convert compiler tests to meson, part 5
  configure: convert compiler tests to meson, part 6

 authz/meson.build      |    2 +-
 configure              | 1343 ++--------------------------------------
 crypto/meson.build     |   41 +-
 docs/devel/kconfig.rst |    2 +-
 hw/display/meson.build |    6 +-
 hw/usb/meson.build     |    6 +-
 meson.build            |  368 ++++++++---
 meson_options.txt      |   26 +
 tests/unit/meson.build |   10 +-
 ui/vnc-auth-sasl.c     |    2 +-
 util/meson.build       |    5 +-
 11 files changed, 388 insertions(+), 1423 deletions(-)

-- 
2.31.1


