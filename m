Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86A6BAF3A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcPIo-00047a-MI; Wed, 15 Mar 2023 07:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPIn-00047N-Gl
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:28:17 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPIm-0000Jy-0S
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:28:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m18-20020a05600c3b1200b003ed2a3d635eso948685wms.4
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678879694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oX+4WVRTZ/A60BsfczwaSyEZb6MFjgWYIiyhESBHbIM=;
 b=Ua1l5znLet+FBlokXXG9RXLNiMYrjdZROjrXYB8iCowjcwPzMcYop7VcTuwMGYqSZ1
 Fmmo7e3Nb08TRpF4Ht+Z6cQbVmIacXDQYpO8kBi0nKBmDeEL5/yn0zK74sDNdS58rEaM
 u6j5WDd2iyi0G5I597F7zThZBuq3snsZlTEynOrTqZ4wdPCyP8VeXBYN7M4ga5DdJyTq
 53ci3OafFq/F5SCmwBR9/CWqdyfqYpBjR1/EIcVm/bDdchiZ7o88JbgNhMYs4KcxLIWy
 eYo5HEtZfoEtX397KArf6PvJcGzTyuow+43NGYtYRW6JbixzzUjx0Qv5GA/2hw09uoWi
 bAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678879694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oX+4WVRTZ/A60BsfczwaSyEZb6MFjgWYIiyhESBHbIM=;
 b=cBSBk+dWFdZVYNPSqr9Lrliic14xPxkkP13atQ8PFD4D5ele6+/var3PpyIwvedqtk
 Sdlzxkm2Nl/rUtQW0TXweX+0NqpApwpO5ihh75qzeI6DDj+0OJdXwx5j+8g2bo/tVKms
 iyMJsppGz4qRFKHKQPUTtzzJiRaKmEfeI9N83cGjmCkjWas5h80fwcmr2Qeky8Hmn3e8
 etjfnp0BBrEBXzc/5ZO94SrSivQB8dd0oVzyiDEzEc/Px8DdL0CiVvYzMEZ6v5bMPtUJ
 el4sTb3WF3PHNqOvhtQlj7AozqdkTBSq5SNAcAmavvSerADAooY/X++DxkaL7p0BkuZK
 G61Q==
X-Gm-Message-State: AO0yUKVF0uorJCYOs6ZDSPb0N3hX/ajGRrGvkO1kBV6vJkv4o3yTyzLA
 gC9hKJPXVOL6aQqa16oRyr8k/nCikVbyI5C0a/kn1g==
X-Google-Smtp-Source: AK7set8959oPXsyJ1FmdEN/Ks5i/yvxJ1j9vP/dtfwAQfQ8B3tgmATkWVojMf+m2j0UWdHaBYHXYHw==
X-Received: by 2002:a05:600c:1912:b0:3ed:2217:4636 with SMTP id
 j18-20020a05600c191200b003ed22174636mr10275601wmq.19.1678879693990; 
 Wed, 15 Mar 2023 04:28:13 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a7bc403000000b003ed1f69c967sm1623017wmi.9.2023.03.15.04.28.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Mar 2023 04:28:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/3] qapi: Simplify enum generation
Date: Wed, 15 Mar 2023 12:28:08 +0100
Message-Id: <20230315112811.22355-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

QAPI generating enum count as part of the enum forces handling
impossible switch cases. Modify qapi/types.py to generate the
enum count as a definition.
Do not try to cover the unreachable 'default' case.
Clean files covering unreachable foo__MAX case.

Since v2:
- Post correct branch generating empty foo-qapi-emit-events.h

Since v1:
- Update documentation (Markus)
- Do not generate empty enums (Markus)
- Collect R-b tags

Philippe Mathieu-Daudé (3):
  scripts/git.orderfile: Display QAPI script changes before schema ones
  qapi: Do not generate empty enum
  qapi: Generate enum count as definition

 docs/devel/qapi-code-gen.rst | 10 +++++-----
 scripts/qapi/events.py       |  2 ++
 scripts/qapi/schema.py       |  5 ++++-
 scripts/qapi/types.py        | 13 +++++++++----
 scripts/qapi/visit.py        |  2 --
 audio/audio_template.h       |  3 ---
 audio/audio.c                |  6 ------
 migration/migration.c        |  2 --
 replay/replay-input.c        | 12 ------------
 softmmu/tpm-hmp-cmds.c       |  2 --
 ui/input-linux.c             |  4 ----
 ui/input.c                   |  6 ------
 scripts/git.orderfile        |  2 ++
 13 files changed, 22 insertions(+), 47 deletions(-)

-- 
2.38.1


