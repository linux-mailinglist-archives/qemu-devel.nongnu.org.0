Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBDF634353
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXh3-0001Nl-P2; Tue, 22 Nov 2022 13:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXgq-0001Lq-16
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXgn-0000L4-M8
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id x5so21874234wrt.7
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8chKRQKS8m6Pjqk6EobtUrJwdS4LtzoBT1XYpKwFqc=;
 b=AA0PcZ6mwFChxKA5nWMXoCCpkypfs7ADcyGhAYgQkKj7QuskSkg9VantT775AyQ7oF
 RmQiOtQ5Fq3MUQvAivAxnDX+A2aFH4WbOfz1kjypQrR+sBGEqEsv3sWmY5zHc8jcWEEM
 qWMmIpj/ZmOEbrM4OsftWWz3JZ4acozhqbSxu5ElkEk6EfQGvu5wISk4NNtzkZTXaU9E
 W8tTEensHWqu8+OtFgA4TbDSZ05VQCQbobaOj4m/iGKk4+V7xObVi5eTnP8CFB/5mE7t
 tO7nCwqzhujqY4jzJVrsZVBKPnJbmVhF6VbwuT2XqQOTI6qmsQEndHlIJfYsW1n0M9Z6
 b44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8chKRQKS8m6Pjqk6EobtUrJwdS4LtzoBT1XYpKwFqc=;
 b=6qD7HwPO9mXi5wZS3Cd6fJSPNqc3jr5JHrLNUV4vnB+SNYiwn0n1quxq/XGsF/8xBA
 yxiQkjSlm77S9f4DllOHcufMerRozsGQWsrnPJRvm9ncPcTYzSxTD3cNZYhrMFuVVVRx
 2NDktREbije18IiqeXZJ6VTSm+kODRO+ZKKYgfoq2okcBB+tPkuVZYiu1/R4QlxAE68m
 43Fy0lhnOL03VPZm/PT70oKfSZ/kf1qy1oBCz2x11IJDCPEp9cFR4WHpWquZkq+PWz44
 wkOLssz26bitU+tvmgMEcO+bKcmnGSg0k33gGOk6mrKbSdz1bKUidcWHaXtPaaT2fDxx
 imLQ==
X-Gm-Message-State: ANoB5pmEFIXKRzpSp09jeKPzaOCeXogbtT0zbizNatURZq3AHGNq4mhb
 TwlCRJ5r2qPjIb3dDrlgy9k5+Uoh5GD1RA==
X-Google-Smtp-Source: AA0mqf7SnmOIsn1akgmCCYBNzJr6iKC/ru/+xlfvGo9m7RrwLd1/vmghmg3cBYLk1Rr7dbgq/MHEAw==
X-Received: by 2002:a5d:6790:0:b0:241:e8fc:cc27 with SMTP id
 v16-20020a5d6790000000b00241e8fccc27mr749197wru.511.1669140486491; 
 Tue, 22 Nov 2022 10:08:06 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d005aab31asm18863504wmq.40.2022.11.22.10.08.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Nov 2022 10:08:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] tcg: Move ffi_cif pointer into TCGHelperInfo (splitted)
Date: Tue, 22 Nov 2022 19:08:01 +0100
Message-Id: <20221122180804.938-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111074101.2069454-27-richard.henderson@linaro.org>
References: <20221111074101.2069454-27-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Hi Richard,

Your "Move ffi_cif pointer into TCGHelperInfo" patch was
not obvious (to me) at first, so I split it in 3 trivial
patches.

Philippe Mathieu-Daudé (2):
  tcg: Convert typecode_to_ffi from array to function
  tcg: Factor init_ffi_layouts() out of tcg_context_init()

Richard Henderson (1):
  tcg: Move ffi_cif pointer into TCGHelperInfo

 tcg/tcg-internal.h |   7 +++
 tcg/tcg.c          | 125 +++++++++++++++++++++++++--------------------
 2 files changed, 78 insertions(+), 54 deletions(-)

-- 
2.38.1


