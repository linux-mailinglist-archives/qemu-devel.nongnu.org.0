Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9884446CB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:14:32 +0100 (CET)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJqJ-00015d-F7
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiQ-00041N-8P
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiM-0003rH-MN
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d24so4692153wra.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iU3AMdEBCQKtdf9aSWlMsz42VXkzXjYt6iiEQb9B4Do=;
 b=zGuVYFOc3HJpop7VfI/x7i4REfCFvwpx512l7Rzutq//7PhOFDGgSHZtl92sddu36K
 4WY+l97jCy1UNOtrIOWHTCBMYnilKcYuy/crJhfwZ9n7YoTuO/Q7+dHNO5NdYO6mazFf
 6syJ3AIWtD7rQds5z8+a84r05ld3CTQU47yqgG6ldGITolVTGRlyrITcgMYtJnLSbEau
 HQPx4mqrWhDOzeEz46rGpfcXYtOY9mRbGnuMoGIlD5RZYOz2A/e/cbm1X8PU2DP+44pj
 v0szCfnIZB0dl8CwGQOxTTZsCQrq7Bn+8OmCgrd3pn1RkErkJUq9rTur/kQCmNgcXn/A
 yvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iU3AMdEBCQKtdf9aSWlMsz42VXkzXjYt6iiEQb9B4Do=;
 b=ZcSoZ6Bu+2nFWjEvNtzLO2wYX9dcP/uZYCW9orf8M+veLAfghEzSbiXKdFobKPp2SW
 6xi2zk/pWQz6UwsgbaO9nmCZzDVK6KX09uVAsYd2yWR3bLwcCwX0WoPBa8e4ki5dtc0g
 A9jB4cI5AX+Rzs8zP+VcLKkzCd41sj9pSAQXXlp/UN4Z4ErM5emex7As87TjBG4mKaEf
 oQB+0ahOdp4CRDUcMdO7FYpr66p4Xr6s6BbMel67o84amusg4dVqiBRVSjK4wnZ4wugb
 dflroXixpPwbWsL9cb4tk/6xc4TvBof2dcqgFPaIJqCslbasVNtKCLV1v7Typ7MZ0iUf
 L8sA==
X-Gm-Message-State: AOAM533GnvPxPZVoU7g5R3LItLN/3HbVqdI0uBsOk8LyqTqQ6dGwSH8B
 X5OYZ/Cc7rEBGS43TgQUiQ/VUA==
X-Google-Smtp-Source: ABdhPJym7mzOdw7UGzGRcXNbGkOGV+hNDAM2Slc20VwMp2Wo6TWKI6SrpmxSlXEb2kmfYD8ia50Bww==
X-Received: by 2002:a5d:4890:: with SMTP id g16mr59196846wrq.10.1635959177312; 
 Wed, 03 Nov 2021 10:06:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm2836052wri.45.2021.11.03.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A3721FFA5;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/21] ebpf: really include it only in system emulators
Date: Wed,  3 Nov 2021 17:05:46 +0000
Message-Id: <20211103170558.717981-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

eBPF libraries are being included in user emulators, which is useless and
also breaks --static compilation if a shared library for libbpf is
present in the system.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211012162252.263933-1-pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-bt: Warner Losh <imp@bsdimp.com>
Message-Id: <20211026102234.3961636-13-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 26c58123e9..fa2e6cceff 100644
--- a/meson.build
+++ b/meson.build
@@ -2610,8 +2610,6 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-common_ss.add(libbpf)
-
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
 linux_user_ss.add(files('thunk.c'))
-- 
2.30.2


