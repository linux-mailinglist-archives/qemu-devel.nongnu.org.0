Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752976D8355
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:14:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5m0-0007iu-Kq; Wed, 05 Apr 2023 12:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5ls-0007hi-Ri
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:14:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5lq-0006YA-Pd
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:14:04 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e18so36744462wra.9
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680711240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hySJmhGNiy7HBpCOkc2QYsFMx5sR+aPEFCWb6zlOjxI=;
 b=I3tpQBRdYO7NclUI5y7b4CxkmUbLjgYdQkfRdqIxXZ3gqz6sLzsjyPpD8aPwvw+nj+
 12OvETgsrS8t6LyMSITwaqXXfriHzioMJ7gDzwiuaS9X+ypnIepBCb/kVhriVf2XPjsa
 4a1YCDw+UbPjuwehcbnJW4ksjNfkOnuqn5xYmflM80wLtNbWVhYnanzNvrBfd5nyRU2r
 mWcODmrb34X1wIcsyEhbbK0XEMtZ2l+2vGa5W29Ii7Ma9UBKFP49adRd2SxMELr/SCXk
 n/lsKDTV5cJyOqZUzlZH9L4djWXvVNGWyX1OeQi+bCY/7A3GLO/WQOzp9UCKsVIepDeT
 rcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680711240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hySJmhGNiy7HBpCOkc2QYsFMx5sR+aPEFCWb6zlOjxI=;
 b=Oes7B0vG91mPAZWmgJhPKWsdtL7lvYCLFOhl8HgeGPon608vY5yrsJz7nnMIiGbtyL
 DWXEeFdMMcv47jYxtbmVxCbYDoCbbZ/rmFvX6p0in4I0/MX7JwYVQwpou1ZexwUAUTEZ
 IrPJntFlMsRyeXnKbG+jXQHnIhnzIvmxJ2Er9nqc+X7UxgEc8d+dzWQGKZ+seqlllkpQ
 RgdUhq41zjyTD4I93p2duJgczf14OYBIGghtJmoBKnAjt5Jriyku0Xtvvzc4ofwarZ+y
 EMvCShzafG5rR9+HLI/jJxuqLXtL3wTpvHUO6e89J/gls5pJja0jFJ2iqT1L39cUYnKr
 3c4g==
X-Gm-Message-State: AAQBX9e07aaD8w9wYY3J5WAqGkgPTUHwlITZIijayZnHJUZZ2ZMxPkOr
 rRG2XcOUZ93p3yZRPRytB08LWA==
X-Google-Smtp-Source: AKy350YrotmbTzVq0tkKx8/EiMyJP/mHPmHYE241R8z+3aMmLyKQODCBRfZIXnZOowy8IChjZeF72A==
X-Received: by 2002:a5d:668a:0:b0:2cf:3399:998d with SMTP id
 l10-20020a5d668a000000b002cf3399998dmr4753128wru.57.1680711239512; 
 Wed, 05 Apr 2023 09:13:59 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm14753554wrr.100.2023.04.05.09.13.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:13:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] accel/stubs: Build HAX/KVM/XEN stubs once
Date: Wed,  5 Apr 2023 18:13:54 +0200
Message-Id: <20230405161356.98004-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

TCG stubs could become target agnostic but
I'm leaving that for later.

Based-on: <20230405160454.97436-1-philmd@linaro.org>

Philippe Mathieu-Daudé (2):
  accel/stubs: Remove kvm_flush_coalesced_mmio_buffer() stub
  accel/stubs: Build HAX/KVM/XEN stubs once

 accel/stubs/kvm-stub.c  |  4 ----
 accel/stubs/meson.build | 10 ++++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.38.1


