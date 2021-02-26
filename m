Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2832634B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:30:12 +0100 (CET)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFdC6-0007OH-DV
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFd9X-0006Ss-F5
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:27:31 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFd9T-0002JN-M8
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:27:29 -0500
Received: by mail-wm1-x32b.google.com with SMTP id w7so7429735wmb.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 05:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pA47ewVHElSoWhd5MIfs99xCEVT+pwReRKjeEzV9VfE=;
 b=G8mJD7d2QawR1Ym5R2fFeRP0Jt7qbRtpUJRCHJ9z43SusqRufjmtowvbNgEd/AG27y
 eNOnjTKeIv9blTvqpu/PO0ycGUkpsvwuH5APnOirMNuDIjUFVlMuhehwOvqlHjdO6F3W
 vA4FfqVqo4p0UtbULlrX1HjfRkQ1/+5YaysT4euM1W0a0S+DE3A1rdBIlTTXJFCAzrhZ
 JieDjQzlAVKj69HsqHvZyFyrh4u69/dtHb0ESjaZ/dfr4NH1G89FufYLLAtjv/XZbxwo
 Z6mCIpTZdORZroEhryHsvIvjCrfrcyI53dpGB8Ff6hP+ZGJoMcgTsh6mBX/DU2KsfLri
 8SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pA47ewVHElSoWhd5MIfs99xCEVT+pwReRKjeEzV9VfE=;
 b=t0auDdGPdf6Ci31TqR3/pZPqjHq9ugE6QqsTjEwslxhDaDDXhi5c+z+T2WHc/KK6X2
 qgKT3tFiNlCVxAd+0hJ9RF2JdjTvvvR6gnAzCPhQE9N7GqLFBmkGbt7/z93xGJ7/nseX
 f1uziaNJzhn6Bmm52oPpsLsJf1AELPloyeJ27VAg8Nh6UZUD6rxFTYacvASQP84zKN6d
 r7hOoOPzzh9+2+JuHBNZrmeYOzj2Sz+HUOJ6X+YsfYj0ZiyUQVv77mgTWuF1kXDn01vM
 BF1STZKFd+inmS2eTQbcfJ+sa6GN8JW1scziOk7XDcjGgkC0NH66Qe69+bkxHVgTHMQR
 Qcgg==
X-Gm-Message-State: AOAM530rq8/jyT/1LVj513VGZkzZl7NoOtN/1UiiUsoH62J7oyRM6n9x
 2frS2Lq+tLUCtd55TI62iJ6EjlSklH0=
X-Google-Smtp-Source: ABdhPJyj3xcVnDgz7xGTSxjddlw4hDxBGhOqXss8b7+csNS32PS7OjLU4HpGYJ4x+YsmQCTH/ZRpqA==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr2969441wmq.82.1614346045752; 
 Fri, 26 Feb 2021 05:27:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 75sm12707485wma.23.2021.02.26.05.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:27:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] hw/mips: Restrict emulated machines to TCG
Date: Fri, 26 Feb 2021 14:27:21 +0100
Message-Id: <20210226132723.3969650-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify MIPS KVM builds by removing code depending=0D
on TCG.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/mips/meson: Restrict emulated machines to TCG accelerator=0D
  hw/mips/jazz: Remove confusing ifdef'ry=0D
=0D
 hw/mips/jazz.c      |  4 ----=0D
 hw/mips/meson.build | 11 +++++++----=0D
 2 files changed, 7 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

