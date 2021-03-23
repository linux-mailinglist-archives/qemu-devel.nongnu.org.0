Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1E3465FE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:09:49 +0100 (CET)
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkXM-00029f-2F
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgA-00054n-Vk; Tue, 23 Mar 2021 12:14:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjg8-0007ae-VH; Tue, 23 Mar 2021 12:14:50 -0400
Received: by mail-wr1-x42d.google.com with SMTP id o16so21385022wrn.0;
 Tue, 23 Mar 2021 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T9rgbORsGA9riDUDb8xvzjRsLP7URL+4hWLMqQizWD0=;
 b=g31nUmLOIFxJqcy4JS+AIJxozlX8sj+RZS5s/mL7jsY6DCsH/rxUXerTq7c+9084gM
 4F/3qs6pwlUAPwFNixgZgVclHGib8mORoXqK4h7PRS3FTWz2W0ApOmpUm/t0TRlOYUU3
 57VlrHbV0P6mkVEvAMujqt2XjA2ZjfwVbSdWFkNdwMijes5/5cJrMbIxJbUq8WW8DgLG
 gppm0ucY7nUv3WZxAshs1UDOTqst08TxIXi+pS+O1IKQMr9nqe7YW0j+PHOd0rIBB/Ul
 mpl+O7CgGZFUanrU6JKun4YHw5MPMg/zuKJtheaCXEskSM46yQ42fFtcewCdO+l7g5Q1
 4x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=T9rgbORsGA9riDUDb8xvzjRsLP7URL+4hWLMqQizWD0=;
 b=W3wTHItTLoh9WvlWnxplfSirq+DJ3/jGA0z1SP52BU1G8DQ+jZTyaTzfPrpREsfpkG
 93xHxxDc4lo1txBcsrdZDg2segNpXyv3cR/lJrvQXTN9gQ/Eb2Y70JruwBKuGSrcUOqJ
 U/sP6njv1r0jC/yjxJz7uvF39WqJOn1IdjTpieT8Rc+6JSUQutFUnvFumIm2hndX0XwV
 JoxdwfjeWteXmX3mJ8UXiU6Bigf2v2Uo2N6dHsJmz5VqHkKFXf8auNGTnXSBPLUHdR+u
 nX+6iRTIyR0sT8Ic5ipOX30oTfSIkM4HW+S+J1Khul2Eu7da/8HEp3p6Z1OoOmxOl3rN
 U/nQ==
X-Gm-Message-State: AOAM532DSSsnfwJumQ+ib1yCmdnPtgG4exLmdi5km//FwMxF1lSYinAu
 iNgmB30wKwWE06jvyu6Is0c7Mi8VL1u3iQ==
X-Google-Smtp-Source: ABdhPJwQNZe4oKY3Oe9KFAXTOPSje88/Gat5u3CAZE3rujNGbrUil9jJUXcDzIzkXYu1SwkFhk5fJg==
X-Received: by 2002:adf:c752:: with SMTP id b18mr4739087wrh.233.1616516086499; 
 Tue, 23 Mar 2021 09:14:46 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c8sm2982249wmb.34.2021.03.23.09.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:14:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
Date: Tue, 23 Mar 2021 17:14:40 +0100
Message-Id: <20210323161443.245636-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
Resize console on reset to create the surface, see:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg794307.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/display/bcm2835_fb: Resize console on reset=0D
  hw/display/bcm2835_fb: Use bcm2835_fb_reconfigure in bcm2835_fb_reset=0D
  hw/display/bcm2835_fb: Remove DeviceReset() call in DeviceRealize()=0D
=0D
 hw/display/bcm2835_fb.c | 7 +------=0D
 1 file changed, 1 insertion(+), 6 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

