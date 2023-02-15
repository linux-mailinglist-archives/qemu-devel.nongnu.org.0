Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6175B697F66
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:20:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJYL-0002WR-LL; Wed, 15 Feb 2023 10:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSU-0006xP-9R
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:10 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSS-00071T-R6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:10 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-16a7f5b6882so22099929fac.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 00:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mX57SYtJpon2cTNsshOyf7aliFPi7sRrvvpYBadrLoU=;
 b=bGjyHPYvS2lwboIpx+D/LZDCnQZckKVrrb35N4JrpEhT7zyR0OAO3WZ5ZghdNWDKSV
 DNx6rcYgoufIG7Xg8KwvOzovO0lmYV+3vIJ8Ghsz5SldtsvVcwFd38mQ+tK83u9Lixsu
 R3bpYom9YyJVxpZeVTRxb+AiexB6qTtPDv6SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mX57SYtJpon2cTNsshOyf7aliFPi7sRrvvpYBadrLoU=;
 b=scqdB4klb/56NYTFXFa8hbvVNKyzUc8pfA0XDkBLpM/hxscXk5ZiRUFs1EuqGUr2CH
 MzTFoTSWTnpCCzwyKsTR8waO6GncyULpPfQkt4Sp7RWjhhij/4FoyKe/5nV+zMvygv7S
 jTJtRfDYtiZXesr+uXSJpMmRlpM/feiZdha1gyClOYOHnptrSEbCithBZ2wZPfwt7q6C
 +v4/zSBVv2Hg7e5Jd5hqMvD4xmDXEoNW8uGoSvfKTBpqXqPPtvj8lR9u8eGNoSzFSvDi
 u+eY+8NQecdYZU+KYtrw3wEWA0AyzqBuojFMnwfEYIZ6Mohst7fzLadcvxyKd+neEfQM
 mHZA==
X-Gm-Message-State: AO0yUKXO0c8nYcYHwiWYZqsN7EoAz7GLKUpWWi/XnEfpAu1bcLZF+qcI
 9aT4eK6inHeWNRoDVJU2AmXdpcqIoGX+WTtk
X-Google-Smtp-Source: AK7set/Tcl3XzBih4cb/v4zDaM4Wit89gD1lSFIYvrisybdo+qHxVLCHkvdXSHJX8MlN4j1PKFT+CA==
X-Received: by 2002:a05:6870:9591:b0:16d:d677:fcbe with SMTP id
 k17-20020a056870959100b0016dd677fcbemr570674oao.23.1676450886653; 
 Wed, 15 Feb 2023 00:48:06 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 a9-20020a056870d60900b0013bc40b09dasm6788811oaq.17.2023.02.15.00.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 00:48:06 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 0/3] target/mips: misc microMIPS fixes
Date: Wed, 15 Feb 2023 09:47:51 +0100
Message-Id: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 10:18:35 -0500
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

Marcin Nowakowski (3):
  target/mips: fix JALS32/J32 instruction handling for microMIPS
  target/mips: fix SWM32 handling for micromips
  target/mips: implement CP0.Config7.WII bit support

 target/mips/cpu-defs.c.inc    | 1 +
 target/mips/cpu.c             | 6 ++++--
 target/mips/cpu.h             | 1 +
 target/mips/tcg/ldst_helper.c | 4 ++--
 target/mips/tcg/translate.c   | 6 ++++++
 5 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.25.1


