Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5536D0E4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 05:33:39 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbaxG-0000n1-EM
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 23:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbavv-0007xW-K8
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:15 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbavs-0008SS-V1
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:15 -0400
Received: by mail-pg1-x533.google.com with SMTP id y32so43774777pga.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3WkZmiXiK9zjklfE92BZ71djtpto9P+JsuziNgjdRk=;
 b=E1wRDt3Fg0yE5tTlM5PAlu7XvLnqS5rKu4QUsQgoigXO9Q8jMqpjE8Jia3TVD27xzs
 DcQWZStoJDcL3aAoKDJWfmk9UCEKW5XIC5RJIDqShELOTOSVK4rWizXruY5ybMB0Xzsh
 UtZcptcEzDtrv7509IALP2H8iH85hCYfmVqkOh8BMW40Y6HuEpMl53sl2NAkoBFW26vS
 3P3LvHQuM1kIc3wVaaqYB9FL4O+3Lt5Tcsrd0833tXyWxTEIyGg1StXiqCU5PJF8FUFx
 lc9JwLS3fH8ofdlqOSXyyQuCx4emzb7En6w74BKF/q/jWRWJtSvYOeCR7aJAPZbQFXl8
 MfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3WkZmiXiK9zjklfE92BZ71djtpto9P+JsuziNgjdRk=;
 b=g4hgP1AwZkXSHElQemPb14NUiyzftIhmbry/dvxSa+xmb2pcqpoLG9KqeFRhn/9hkH
 Tr/YKE7hc/9xBrLxxYF5b0/NsSwnoBJgtyPeIunaAmsd6eQ5nVRJJtpTHr0ib6HwbuRf
 oDdSN50z9Se/xYmBEGcpkG2771Swc4C6Dnp1pe5LSfvYiT13knewwX32tCfi7+Saf2C/
 4vGd2Z9pU75FXfGjrM4CilX0Og4zNE2Ip0ax4yPjc6NF2w9+nGMfcvHgI3dkhrrKdHTg
 apZReC8C1ZM+gL1RgSwRlXIGtsMoxxH4uGa+AEf9N0mhVcNSUKzq1j0Xylx9aNMHvTXM
 QSuQ==
X-Gm-Message-State: AOAM533dxSOKqaRbWTiCVUhnxI6Yg/5Wt0vLsXwA/T5ids0Fxjj84BHk
 1GLsf7/jxYXamkuK9bbQ3oNAaITIMVbzlg==
X-Google-Smtp-Source: ABdhPJx8fA9OWJd2/9hOh/S8MawEyDMFNxFbNdvgk4vE2NsLs9XxLlBwBxlxynG8SP6pv3uXm7lxWg==
X-Received: by 2002:aa7:8f15:0:b029:27a:4eb9:7c9a with SMTP id
 x21-20020aa78f150000b029027a4eb97c9amr6911115pfr.62.1619580731067; 
 Tue, 27 Apr 2021 20:32:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 18sm3572335pji.30.2021.04.27.20.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 20:32:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] linux-user/s390x: some signal fixes
Date: Tue, 27 Apr 2021 20:32:01 -0700
Message-Id: <20210428033204.133471-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch fixes a clang sanitize=undefined abort.

The second patch is probably does too much and should be split,
but I'm lazy tonight.  I'll wait for comment before changes.

The third patch is new functionality, which should have gone
in with the s390x vector support.


r~


Richard Henderson (3):
  linux-user/s390x: Fix sigframe types
  linux-user/s390x: Clean up signal.c
  linux-user/s390x: Handle vector regs in signal stack

 linux-user/s390x/signal.c | 265 +++++++++++++++++++++++---------------
 1 file changed, 159 insertions(+), 106 deletions(-)

-- 
2.25.1


