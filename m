Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B658183C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:19:13 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOD9-0005DZ-Aw
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGNTg-0005Ym-Hd
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:32:13 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGNTe-0000wY-LI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:32:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q18so10494512wrx.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 09:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K5xx+I2rg2lLQ+HiPcAYbMvuSCcza9qSmKRIocx/BW8=;
 b=xzpIrQk19NOPqlp1p7ayhtx2ll1GSbQw/VC5pw15oS9gOu/aIfMXG7w8uEgJzWVPoF
 mtRBJK4LjQvTOwWUPvyj5suZcgnholbfMt9RaZ6yNQsS2ycIt1FGnor0zQtCEA3BuKZv
 lM1z+0LJGG7N6Qj/10J8qKFYDtDXKJdI68h08EI60+T3NISkcC2Fh7PZKkgGHD3LvH2o
 NTFdD690eduLtFHo19dJ+lZlIrttLkSDw0ceKqLmQxOH1WekxBfk7RLyIkTZhk0CrMnS
 ojpz2NernyAyikvAzwGKlnDAiv8NJTgEjo5X6bI6f1EKnjYqXliv3dOPeLaPPADCvW5V
 040w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K5xx+I2rg2lLQ+HiPcAYbMvuSCcza9qSmKRIocx/BW8=;
 b=sqRBRfQ1FF6gZoHSQiV9yK7QIl0T1scfsR3uo32auchL7eMC0iJYjM6ACIfOgTVqHp
 assHuKgOmcHmhHGVCF+LXy0Zs3rhyF5tX+F/0cDT+so9cId6O+leJNXSqGHFf5M7ON0S
 GAVg1ZP52IdwLV3z/3mfhR2cgSPr3J7YhFeGq9pl8uMQpf4YkddXwXnnpkrKiFZRPsEo
 HfcJU61l2B1cMy+hhnJCBCKzAVsXQA+3FpEJ/IC2lFsnAyoP83X1aNoCmS0eFnT6mm8t
 /6IweyFpAv7tKg3WHPG2QDtFfv/fWWmtsQF1jotbF3QYyOXEReh7v7UZa/axhhR0EJFS
 o7SA==
X-Gm-Message-State: AJIora+6LsG76EyCfEXHXC8lq2NERSnylYVWQRCR2AShzvlTWT86GlWQ
 o6P8JzDZ8bxsL5sydyHsgRXb2hB484ECpg==
X-Google-Smtp-Source: AGRyM1ubhhLolZ5cs8Dzu+pvKXa/tgxJ2WiRqx34lhLGRaqO/T8u3KR+1Zv5QFgG4dwECpyvb12+kg==
X-Received: by 2002:a05:6000:3cc:b0:21e:7f8a:3925 with SMTP id
 b12-20020a05600003cc00b0021e7f8a3925mr9632177wrg.570.1658853128788; 
 Tue, 26 Jul 2022 09:32:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0039747cf8354sm19236198wmq.39.2022.07.26.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 09:32:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 0/2] pci *_by_mask() coverity fix
Date: Tue, 26 Jul 2022 17:32:04 +0100
Message-Id: <20220726163206.1780707-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset fixes a Coverity nit relating to the
pci_set_*_by_mask() helper functions, where we might shift off the
end of a variable if the caller passes in a bogus mask argument.
Patch 2 is the coverity fix (adding an assert() to help Coverity
out a bit and to catch potential future actual bugs). Patch 1
removes the _get_ versions of the functions, because they've been
in the tree for a decade and never had any callers at any point
in those 10 years :-)

thanks
-- PMM

Peter Maydell (2):
  pci: Remove unused pci_get_*_by_mask() functions
  pci: Sanity check mask argument to pci_set_*_by_mask()

 include/hw/pci/pci.h | 48 +++++++++++++++-----------------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

-- 
2.25.1


