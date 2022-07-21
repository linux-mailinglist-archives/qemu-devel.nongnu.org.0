Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5D57CA07
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:54:43 +0200 (CEST)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEUlO-0001Xm-Ng
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEUj2-0005uS-Dv
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:52:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:47081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEUiz-0006Y3-OW
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:52:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id z13so1869714wro.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6D6sDd402ESCD+BB+awBggor3WtO4XdYc6ljnpTQ60=;
 b=UKTPY2EbhzSHkk7PR1NdC72R9EIHwPQHdhVgaF7JE6FLtp7r16acE1hfL7SuX8Yzr5
 hxFn6lUnrcmWLO3IpsKBL9b096Qquq2wB+3DLl+i6S+XzkfRr9k7YCX4/juLtzIcqUOd
 s8dhDkV49j66dJoYQnX80xm5HlO3o/BloLnjy1D4qm2quOreOr7odaVNr1cfxZ5qfVMd
 YqSjhZCvUBfGNjhmgnq2hxL1vlqFoxrRxXQYuKzZCvPEMJiKsd6rHuCunE0G0hG3RQ0c
 4XuPXjo1I2UeLod0NcmzVXeQgCfMVmSHYCJ4MKYBZ18yAlR1u5TvKQ7xiOvu5+59KRS1
 LliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6D6sDd402ESCD+BB+awBggor3WtO4XdYc6ljnpTQ60=;
 b=wKzvc/ThZjD/5TRe7LHle2n/PG+Z2MLWg35Fxokqoejs9ZDb5rXKNo4IqUJLgHlvyx
 E4ezAmLx3ySf1qPfvlGY9detj/eqSQj8zj6jYl40/tXBezo9G5KVfiNMMq6akNSVraLK
 VgGQrVpR/A7GINBTiqzV7OXo4gjMaEwSsEhkE3FqRyN+RQQEcRRoWSKtAdIYKW9RIVx1
 jpf4NNauJqg047FahscoLqU0pclAgQB/z+3rXkTN6QNNGvhvrYqGP28hyUGyyZHowtzP
 5iU0jFZ8fY6dje/A5NrrfwoFT9+NYWeSFGnFNwbdYkMFIb6MJ7eronsSU3KZs1pUVFl8
 0eYg==
X-Gm-Message-State: AJIora+2aex0q1QVbplmuKCa+3x4kLSptqRwJmLv45c99LoKviNokhqL
 ID0vbdrxlNVa//7Pip0tra9nFdy8ZmWMpA==
X-Google-Smtp-Source: AGRyM1ussUPB2iufRmqmJGpmdn/UqSQKK0LAMssiA+EOLP1zlyuQVUK9TnNr2hd2USecf/8nXm4r2g==
X-Received: by 2002:adf:e310:0:b0:21e:3e46:81f8 with SMTP id
 b16-20020adfe310000000b0021e3e4681f8mr9105932wrj.188.1658404330849; 
 Thu, 21 Jul 2022 04:52:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a04d19dab3sm11772745wms.3.2022.07.21.04.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 04:52:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/2] migration: fix coverity nits
Date: Thu, 21 Jul 2022 12:52:05 +0100
Message-Id: <20220721115207.729615-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

This patchset fixes four Coverity nits in the migration code.
The first patch is just adding an assert() to clue coverity in
that an array index must be in-bounds. The second adds an ULL
suffix to force a multiplication to be done at 64 bits.

thanks
-- PMM

Peter Maydell (2):
  migration: Assert that migrate_multifd_compression() returns an
    in-range value
  migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long

 migration/block.c     | 2 +-
 migration/migration.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1


