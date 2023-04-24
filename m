Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444176ED2D7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:51:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqzPE-00039N-6f; Mon, 24 Apr 2023 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP2-00034p-Tv
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:51:02 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzOz-00029f-Vr
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:51:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso4243445f8f.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FXnUq/n/hcvM5B6NkjzeHjrXq1uap5u9joWbU/kw6FE=;
 b=LpLbO7ZTGCgUM20q2Iy1qxvnqeeTl34wmX6A4g3hVahd8PjwGvFA3dRnpiCaaSlVT1
 J85EwKVdEeGV7438ifTOyKiSGazThVwcGxrGiXaI0xrIy8EofWvceedGD7tiyMTXrDS+
 A/aYcaF/FpjVYSJflVpN/il5AKBKefEFkKaAitCSD9HRVTJNPlFNxHta1Fe9JRt9xecm
 vGS95dvVDfLVmWAuJ/wpNbKuCWM+WP6ASiMpbRyM68A5ppp15OKrPGdodcEwgz9MNPU+
 BoDaTRFBny4xvT2aYe9uN9xFy22VKIfuLjip5ZTMw7ZBcgNdStpmgw/OjApNIiTJfZHU
 zUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXnUq/n/hcvM5B6NkjzeHjrXq1uap5u9joWbU/kw6FE=;
 b=FTw1eFsaLz+mvP6yCgHKDsB+LgqxqFYVUKrntkv4HYqn1BRdfBFZBwx3G/emQ5FlHl
 7sl9vR/5bjXOR4b0IXx3dShSyz0vNkJPfR0gPtypDVx2eLm25VPbXXGtJbhm+fr3A85h
 J8gHffRRK+T89KIhC5LEAReAxUSRMj29VegIc4O0ZTIaD6XzxcMFORat7bVtqxVJfWk2
 kc8zwm/YxchvQbXl///BJwXPImnMDBi3mKKK/u510J790rhOUYZT4Fv2GjYm7yfT8nF8
 pYV11GEZFi0r6pOm/udulft8HvFWh1/RwwBqb0SKOMoyoSh+XhcoiThEydsWUJx+2STU
 Pqfw==
X-Gm-Message-State: AAQBX9cS53Qij5O2QgVIGiI5KlSqNkLJz/p+/x7smCLhTAXs9KLde0ma
 q1I4ap8J+sk0mQpH3j4gyHWv6A==
X-Google-Smtp-Source: AKy350aiPKOFO/R6uzJMPG2YqQjfXKhCStwHVFnZT19LmU0voJEj5mSNmjx6g/6zLsMd5gtvAL2H3Q==
X-Received: by 2002:a5d:5381:0:b0:304:794c:1534 with SMTP id
 d1-20020a5d5381000000b00304794c1534mr3449358wrv.4.1682355055224; 
 Mon, 24 Apr 2023 09:50:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm11211279wrf.73.2023.04.24.09.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 09:50:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH 0/2] arm: allwinner: fix endianness bugs in sdhost and
 sun8i-emac
Date: Mon, 24 Apr 2023 17:50:51 +0100
Message-Id: <20230424165053.1428857-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This patchset fixes bugs in the sd controller and ethernet controller
devices used in the orangepi-pc board model. The bug is the same in
both cases: we read and write a descriptor struct from guest memory
without byte-swapping it, so the code only does the right thing on
a little-endian host.

These fixes (together with some of the others I've sent out earlier
today) are enough to get the BootLinuxConsole.test_arm_orangepi_sd
avocado test passing on an s390x host.

thanks
-- PMM

Peter Maydell (2):
  hw/sd/allwinner-sdhost: Correctly byteswap descriptor fields
  hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields

 hw/net/allwinner-sun8i-emac.c | 22 +++++++++++++++-------
 hw/sd/allwinner-sdhost.c      | 31 ++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 12 deletions(-)

-- 
2.34.1


