Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E777539A32F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:29:46 +0200 (CEST)
Received: from localhost ([::1]:33614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looLx-0003Bd-Qp
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJb-0005cC-LJ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:19 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJZ-0000H5-QW
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:19 -0400
Received: by mail-ej1-x62d.google.com with SMTP id h24so9569933ejy.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsPs0rMFNl8+pk1jEMWjTDQMcWo01jeupaA5EgSeyHo=;
 b=aAIO8EQv8L6u4p8c2BSEkmr2ndl1eDxvTMZ8xa6Srk3ehklrPZSTf/56LydKB5HO3x
 2cE5dNOaviqg99LmdV0NusDhLhI8YbfX2VzfPCF3NV3T6vk7qd+3JbvNdV1tSWRjpMFt
 gM6yUC3N53lOjJzI1MldPor5tPaQRKpOxYWbn4T0l80q8LPufdg6QjmhrGLeN8+Ihdy+
 nZcRnQhuBMftd1jDBmlPbPPJ+NWPI16FnFc8TOGF5T1fNORu04ZElVgWvMZmo0uDBg9z
 0jJnz+d8fcNTGwnU/27L6q5/A+qSdy98y362Z2fL9BNIBzV67fW4r1/9mWgxGiQuxE3q
 U57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DsPs0rMFNl8+pk1jEMWjTDQMcWo01jeupaA5EgSeyHo=;
 b=RcFqGgi6CwlbRF8R3n2RIZ/4kqITLNdH0ooUDGwEb/TujJP8MdkCzjM9wT2H5f6JiM
 ME6e10YUHcdIL2IAGdTMxgIAfc9Z6s1gAy1lChnAaZPx6ZSokGOPpt+x2qLVYvicZsig
 1THB6VrR/kRieP9XkfUyNAo0wPZwLQk2QQrdn+u7j/BJD1dKXUVz+vW9orI7RcNJa4kh
 N67vSpFjx1jD0Ll/T4HUC0ZL7o3weSNWpKctbfHWzqwpynNeXqzct/1ZB2WeuLk3VbSS
 hAJpribcRw1OuGY90VCwuKojk/0jOQd5sS4yEUrjn3q8A4bxs4Vu/gw1rjosH4uX1bva
 mlvg==
X-Gm-Message-State: AOAM530oQbI1aP1o7609gZoCaegQLma43Wnr27p7hRK1MUYVKEcEyRrl
 LnGro+jSJL4PtEhg9fyDJN071UI6Tju2Sw==
X-Google-Smtp-Source: ABdhPJxCzZ10FBrRBioKsTkx7GOPj8VKdAwOrH2PUmJ01y1LJWv+DEN5Iqk2MYYr8P/ZInzwBSl6Vg==
X-Received: by 2002:a17:906:9143:: with SMTP id
 y3mr29648952ejw.465.1622730436469; 
 Thu, 03 Jun 2021 07:27:16 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p13sm1562747ejr.87.2021.06.03.07.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:27:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/i386: tcg: fixes for 16-bit protected mode tasks
Date: Thu,  3 Jun 2021 16:27:11 +0200
Message-Id: <20210603142714.224210-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few bugs found by inspection---either by me or, in the case of the first
patch, by Peter on a rare i386 incursion of his.

Paolo

Paolo Bonzini (3):
  target/i386: tcg: fix segment register offsets for 16-bit TSS
  target/i386: tcg: fix loading of registers from 16-bit TSS
  target/i386: tcg: fix switching from 16-bit to 32-bit tasks or vice
    versa

 target/i386/tcg/seg_helper.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

-- 
2.31.1


