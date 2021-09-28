Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415AD41B154
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:56:32 +0200 (CEST)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDax-0005E8-2D
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY6-0003Cy-Si
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:34 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY5-0004Zs-BH
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:34 -0400
Received: by mail-ed1-x530.google.com with SMTP id dn26so6634811edb.13
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqrWzUBuHGRLlvPy1Nx4lrcUesHuLF5/uTXEJAL1Le0=;
 b=iWPglAgSZoFN4qsqw/codclznMHbl6qyYTLlCbf8D3CRebYxVSwTm5Olgf4dceXQjf
 HHNHkOO+wApDh0hxab26NXr+Rnbp2WiVBObftqYQmFd+K0V7/fgR6GAMNRrxKvAvZJQn
 MDEG88i6QgRzrb97j3qWYMPhfNu9raPbaRAW2D6GDPC9yJHD5CqSEN1esn0fsve7ymTn
 zQt4SLePS/Su/dMGx9U+7vu6IxYk/IVGpR1S265yP+sgWCj0W4ifWrb4vbizsBN8L6L+
 kZB3eE6iHbO2e24175YOT+HZSb1+aN9SfDLkFu3NC/NNWg8FENT1YoYbQTKLyppCxZSC
 Cdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wqrWzUBuHGRLlvPy1Nx4lrcUesHuLF5/uTXEJAL1Le0=;
 b=ThSAMqap8PcJ8AUKmv5y5RuSseX1C593Tk1DMDkLsj5Jyffu0cPAFYXyZLvQ90oUZ9
 cofo43BU9gS11T71Z0dAFXi9ZiW5AqvZ7BZBAfQvNjI0BNLidoBMt6vSSoQ8EbCThOF5
 w1GZa2+rK3K5tliRtJZ5457wXSwuQNKWjFgQqx3ckhaW/gTt4RNUSXOxYr3r+o/jq5jx
 T5O4r6Ctkzq7rNfwHIzZpgItj2xhqNT9HKs+Dxr9RlqJNNmx2S/xXqZliTFGBMrPPVz9
 e4uUaCWddEKeeAsoYLo6mvU8IVUki94sOa51CA//IDtDlekYyJvMWWgjPTAvZoBp+tE+
 Vj8A==
X-Gm-Message-State: AOAM533SUwK0bms9yxYc+2SYuuDWrHLg0KpriUwh0eN7zRmx6qaCH4NR
 Fqfx2z02KogYtWoOQ7nOIM5EGxDTYd8=
X-Google-Smtp-Source: ABdhPJwhrsC6m6dLmhR8VlNjQkWPVkHDpOxpMJdw83XaBcPSWEBN4RcfLKDi4chh261N7Vpel1tGOg==
X-Received: by 2002:a05:6402:42d4:: with SMTP id
 i20mr7794058edc.348.1632837190824; 
 Tue, 28 Sep 2021 06:53:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v13sm10373247ejh.62.2021.09.28.06.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:53:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] python: remove socket_scm_helper
Date: Tue, 28 Sep 2021 15:53:05 +0200
Message-Id: <20210928135309.199796-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I suspect no one has ever looked at socket_scm_helper.c, because when I
did my reaction was just "why".  The functionality of this 136-line program
can be reproduced in Python with fewer lines of code than it takes to
invoke it.  Do it, and let it rest in peace.

The only reason not to do that could be because of the upcoming switch
to aqmp.  For that, the new send_fd method has to be wrapped to use
transport.get_extra_info('socket') and loop.run_in_executor.  Let me
know if you prefer to hold on this until later.

Paolo

Paolo Bonzini (4):
  python: stop using socket_scm_helper
  socket_scm_helper: remove
  python: raise OSError from send_fd_scm
  python: split the two sides of send_fd_scm

 python/qemu/machine/machine.py         |  58 +++--------
 python/qemu/machine/qtest.py           |   2 -
 python/qemu/qmp/__init__.py            |  15 +++
 tests/Makefile.include                 |   5 +-
 tests/meson.build                      |   4 -
 tests/qemu-iotests/045                 |   3 +-
 tests/qemu-iotests/147                 |   3 +-
 tests/qemu-iotests/iotests.py          |   3 -
 tests/qemu-iotests/meson.build         |   5 -
 tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------
 tests/qemu-iotests/testenv.py          |   8 +-
 11 files changed, 35 insertions(+), 207 deletions(-)
 delete mode 100644 tests/qemu-iotests/meson.build
 delete mode 100644 tests/qemu-iotests/socket_scm_helper.c

-- 
2.31.1


