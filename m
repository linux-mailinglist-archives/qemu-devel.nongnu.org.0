Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04A4DC6E3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:57:26 +0100 (CET)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpgz-0002jz-B5
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:57:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpfM-0001CZ-Kh
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:55:45 -0400
Received: from [2607:f8b0:4864:20::631] (port=34392
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpfK-0002Gx-DN
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:55:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id i11so3673392plr.1
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GqXlUJkuH0iaG1Q/oyGeSK9t+hegh4yYA/Ip18kZVdw=;
 b=GqFQbpftSW2Cx/8yPqjWv91YDfPeRdXGnX9SiPbUEXAEWP/d0wZHdxqZZuyIO+yVl3
 y2v4dLtT3UTypzkejX3CoxkFjv15aC+ACu7whGiA7QOI36Afrl7Ch8OyOxDc1AwYgf4+
 hU7DU+Ch0apCCOW6Csfuq1YggZaH2fjDZ307I7boFbtXDwHs+oNcfeRDDec06jHroLSn
 seNGMD3hUVShfdJAOiTLe6ViOs2MxlKwsqrv1El/JFedpLnQ12MzqD1Zw0zAwET0+yhA
 35XfZ+vgIOMCZ4AXHmDrMmQh3+UCJSyvzy2cG+7F9IL61bME+4JItR0B+KZGrjZK93qP
 V3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GqXlUJkuH0iaG1Q/oyGeSK9t+hegh4yYA/Ip18kZVdw=;
 b=qPTPPYVIXb0+XHZMoXY3Hn650XucXGhJkc1KIdazNY6BGR1xMY8O5f1ni+MRoKlBbp
 FaaxGsWkCjdlZpAdDB7MtHoNKz8VcWSrn7If/pP4JOlDPXFhN8Y+glrz9knWlTSSIvTq
 mXf9zA5cFeiRJITW4GBKBA/MZi+I71jHDStDDk3zCsoMMHwBLiN2tG/pCKp3ebEKRJ2a
 kbLXog5u9cIh5kVB6oaQKRPdC5i54E7/xQqXYtE24Cj7ToVdLI8v06tC5JlCO3BGQFlV
 pTLVBDnSrhPRy6tl/NHsvvolD6X5WtoG4OOP4zguf/DVI5GRtWJ/en5yfEU43jsJq2oK
 Sm5g==
X-Gm-Message-State: AOAM530AwX2uc5AALVQmRW2WyM2oniZNiPM4aULnc+XCFrZH3d+SUyqa
 Ju5GMVfSprfEROY6i3RiTXMh8dTbDHw=
X-Google-Smtp-Source: ABdhPJy5GRWEjzcBYq8MQRqouCKFJzFz9YzB+bfg2VIo5QBtnPocqOvlTUx1+Zxh5rITflm+RPBOmg==
X-Received: by 2002:a17:903:2281:b0:153:e056:f0f9 with SMTP id
 b1-20020a170903228100b00153e056f0f9mr4192222plh.32.1647521740859; 
 Thu, 17 Mar 2022 05:55:40 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c7-20020aa78e07000000b004f6e4d8ccc8sm6586224pfr.163.2022.03.17.05.55.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 05:55:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0 v4 0/2] cocoa: run qemu_init in the main thread
Date: Thu, 17 Mar 2022 13:55:32 +0100
Message-Id: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Posting v4 in case someone want to iterate.

Pending issue raised by Akihiko Odaki:

* this actually breaks the "runas" option with ui/cocoa.

  [+NSApplication sharedApplication] calls issetugid() to see if
  setgid() or setuid() is called before and calls exit() if it evaluates
  true. It does not evaluate true without this patch since setgid() and
  setuid() are called after [+NSApplication sharedApplication]. This
  patch, however, changes the order and triggers the check.

  There are two options to solve the problem:
  1. Move setgid and setuid calls after [+NSApplication
  sharedApplication] to let NSApplication initialize as the original
  user.
  2. Do: [[NSUserDefaults standardUserDefaults] setBool:YES
  forKey:@"_NSAppAllowsNonTrustedUGID"]

  Option 2 would be preferred in terms of practicality since nobody
  would want to initialize NSApplication as the original user (usually
  superuser). However, _NSAppAllowsNonTrustedUGID is not documented by
  Apple.

* Oudated comment in main():

 1970  /*
 1971   * Create the menu entries which depend on QEMU state (for consoles
 1972   * and removeable devices). These make calls back into QEMU functions,
 1973   * which is OK because at this point we know that the second thread
 1974   * holds the iothread lock and is synchronously waiting for us to
 1975   * finish.
 1976   */

(https://marc.info/?l=qemu-devel&m=164752136410805)

Since v3:
- Move qemu_event_init before cbowner alloc
- Reduce main_thread scope to applicationDidFinishLaunching
- Updated updateUIInfo() comment
  (s/cocoa_display_init/applicationDidFinishLaunching)

Since v2:
- Extracted code movement in preliminary patch

v3: https://lore.kernel.org/qemu-devel/20220317115644.37276-1-philippe.mathieu.daude@gmail.com/
v2: https://lore.kernel.org/qemu-devel/20220316160300.85438-1-philippe.mathieu.daude@gmail.com/
v1: https://lore.kernel.org/qemu-devel/20220307151004.578069-1-pbonzini@redhat.com/

Paolo Bonzini (1):
  ui/cocoa: run qemu_init in the main thread

Philippe Mathieu-Daudé (1):
  ui/cocoa: Code movement

 softmmu/main.c |  12 ++--
 ui/cocoa.m     | 161 ++++++++++++++++++++++---------------------------
 2 files changed, 79 insertions(+), 94 deletions(-)

-- 
2.34.1


