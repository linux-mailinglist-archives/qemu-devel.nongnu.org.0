Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7464872D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:02:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gke-0000xs-8V; Fri, 09 Dec 2022 12:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gk2-0000nQ-Sf
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:01:00 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gjx-00054x-1v
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:00:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h11so5784464wrw.13
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1XajmtbYEkgzRibNF8Oj7Gk+GgHhVT6qc73OIOn19uY=;
 b=e4xGWl6Iz1CY/CkQZR6k4KD5zl4TlLGpn4DWB83lFsSJSHfx+Is6IrdHUJIkyWC/dL
 paV/HKanuaH3phTRROShW/nMK0AGwVWfcCbhBzd4v8+ihM7k19BOI+d7Jqzldn97iWJ1
 LPo8T2+haZC7xF60lJPKXCdAZ5yX+Gq3bcrRpGf05cOYG0I1mJ43YkAsELy5ZlEKnLBC
 z3iKZhZOufv90zZVjRSw0WjlHsn4zYQ1CEvOI33y+XcczAgaiMfjfek1GVmBDCqrlPow
 e5arP6QV3TNhCAoJKg7vhOEdU8ee+QBW9Dd4Bm4wlZc3t17LSeM58ssCDuTrOs4fZiGx
 BQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1XajmtbYEkgzRibNF8Oj7Gk+GgHhVT6qc73OIOn19uY=;
 b=hcntf/QkmHMHF2TjpUrORvdZXtmeWIxLky2UCOhagMaIZkQCcVJdGqz27jE7SrsNFr
 z5HUMKh+6xjZTpZVbLIBxyHRKFp9wBXWih4CcfQwo4QgBwGqsHq1TwlJcu/SZHevnl2w
 XdgDTFQQj/4Lxhn8eoefuRytZ4d0j+1Oti1QfglWGMRv9VW2x4tiRogFreQTGPlC9bvQ
 TSK85O/TpjjZxCmMYjxhF/nbh0nzuiGeHcHk/qxHUj5j7D5xYx9hvjcwYu8TUHFojooa
 KIgzTAvhx/xGFL1mEmCx6fmhWWrkCcITmnQQxw/9BSj/FcnJAO/B1ktfpUkbNhZqPy+j
 +Z0Q==
X-Gm-Message-State: ANoB5pnfJei5qzZaXVdYMz367m4pqd/AUkqt7tyzHn67OdUjq//vZSgf
 sNbK2iveaeIHam+QZETDZrNn/xTv9VVVjzZSAXQ=
X-Google-Smtp-Source: AA0mqf47fw41O+BgGx/QKXDkBrM906XPlma+wlvZBzG+5op01vHzgJ/hkLqCotWfIMq3v1ty6n6DNw==
X-Received: by 2002:adf:fcc6:0:b0:242:1ba0:208b with SMTP id
 f6-20020adffcc6000000b002421ba0208bmr4626694wrs.64.1670605244730; 
 Fri, 09 Dec 2022 09:00:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a5d54c4000000b00241b5af8697sm1818587wrv.85.2022.12.09.09.00.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 09:00:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 0/3] hw: Move few units out of the target-specific
 source set
Date: Fri,  9 Dec 2022 18:00:39 +0100
Message-Id: <20221209170042.71169-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

With this series my '--enable-tcg --enable-system'
config reduced from 7713 to 7706 objects!

Philippe Mathieu-Daudé (3):
  hw/display: Move omap_lcdc.c out of target-specific source set
  hw/intc: Move omap_lcdc.c out of target-specific source set
  hw/tpm: Move tpm_ppc.c out of target-specific source set

 hw/display/meson.build | 2 +-
 hw/intc/meson.build    | 5 +++--
 hw/tpm/meson.build     | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.38.1


