Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB657B999
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:29:58 +0200 (CEST)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBe9-0006xM-BH
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBav-0002MK-CV
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBat-0005Bk-Oe
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z12so26635565wrq.7
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bpL4MGSXevB5Nl7ONE085OfoIly8kw0x9cfWXuwiwqg=;
 b=XhMoEZwZ0f6XJN9NzvXrWBCmDEbc16F8UYj2Fz1MmwU0gOjf5DAvz8AjvpTx60qA3g
 vWiZTYaKpHDDHkwwgnlo7f/E1uP9tk3AGQdKa7RHNR4Z4ngwee2DKQS2ijXmERAYI8bK
 cTVGquYB36jL2cGZMx8CTIdey4FEg1D33oWx4mrrbC4An9CyVXz+Z+bNWz3lGfCkty0W
 3yv5CJWSdmIhFJczFybuM/Jx+E4mOR5eFcevt1VaBL4noVdCkSAs/UV48SzzwICZ72ni
 NILoUNJKUKpGHZBxFB5LkISyPRaeKV7SzlUBanxLjicM8trCzeygS4Zu0D1LFEAb0HHE
 pZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bpL4MGSXevB5Nl7ONE085OfoIly8kw0x9cfWXuwiwqg=;
 b=3+qKApXjzIQmrfwYfH4cjNVTCIz9cbhvtFyuL6cW4A6CzwsIc0waEzVypT1xlm3lXt
 JwsS6Pnbh3DO2XdmjaZBEzcQEmYfSFCgY0j4+YTq+FjlgvMfb7pk9KKDHYdOkgG3m3iz
 dINimsRTnW9WnJZggKS8KMdG72F2GpZLYEu4vhVc2PnYi6ey66Av1F2PkluoV+Lnpxj7
 OHRcONUQTd/XbeE0YbsGbNSp4q3+pKzNHFQRDRF95d+ssV/zUTesoJdAulU7wWR80YAa
 tzIrXxZS7a0J0zwWPOznerlkh4QBXLcRk73LrF5PWzaQ0cxOQ10nVLfSfPL57ZefL/SC
 X2DA==
X-Gm-Message-State: AJIora/IRudtpBEm1BbdUxhh+nDl2kGkqPx/U2Zzq6rCNX49I+522wlK
 BuKb9VcFvAjrQ20s476TNeNDgdExLNEyfA==
X-Google-Smtp-Source: AGRyM1sCsHosgCqk+DWNzuOp8wyZ4nzety2XoXspRn1EaAD0mdkTiGKgyTZAPgXAI2nDRtEbo8mziA==
X-Received: by 2002:a5d:584c:0:b0:21d:a4b1:6f77 with SMTP id
 i12-20020a5d584c000000b0021da4b16f77mr30264690wrf.662.1658330793986; 
 Wed, 20 Jul 2022 08:26:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm16395987wrx.94.2022.07.20.08.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:26:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/5] configure: fix some non-portabilities
Date: Wed, 20 Jul 2022 16:26:26 +0100
Message-Id: <20220720152631.450903-1-peter.maydell@linaro.org>
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

This patchset fixes some non-portable code that has crept in recently:
notably, it fixes problems that are reported to cause configure
not to work correctly on OpenBSD and NetBSD, and a warning message
when using dash as /bin/sh on Linux. I threw in a less important
"drop some dead code" fix too, and a fix for the only other 'error'
category problem reported by shellcheck. (There are way too many
'warning' category reports to deal with all at once.)

If people who reported problems on NetBSD/OpenBSD could check that
this fixes them, that would be great.

thanks
-- PMM


Peter Maydell (5):
  configure: Add missing POSIX-required space
  configure: Add braces to clarify intent of $emu[[:space:]]
  configure: Don't use bash-specific string-replacement syntax
  configure: Drop dead code attempting to use -msmall-data on alpha
    hosts
  configure: Avoid '==' bashism

 configure | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

-- 
2.25.1


