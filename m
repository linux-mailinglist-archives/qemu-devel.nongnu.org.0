Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F716CBF02
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:27:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8PR-00076z-7h; Tue, 28 Mar 2023 08:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph8PP-00076h-Rm
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:39 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph8PO-0004fz-5c
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i9so12016457wrp.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680006396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=F86HaJQHbhUuB+ZUfkZhXk5RgMSe+dIuZ0sxGFN/L/o=;
 b=E8RaqvxyydS9TBaIoa6D0DJH+0KyDNXz9ZC96iPfpYpFFvgW6cy4gEzDoCqtgpG97R
 ilKsamAQxoL8SZ1t90zFRJW+ctjitS4MxZGl3DTXbQCDbBdkmo3iYEZnesLvGqIOPLFy
 p4ih+D7LEggAdVGscE2IEZX9LWcaC02Y0oJdiSOteG6uUW98+8HSdXvq9o3TOnLfRRBd
 6LEqwyuKuerctjA1Id0tT8OtTb9wHhl685QJa7TKp6z7St+yIoDKnlhs2XYTyjFEg0F0
 6/8G0fmMMdpLfebinlYK2wt7Q8enxFfzAWi1Qw+0ORaCgeFvbGXY7x5nWtD6CoKfva/o
 jzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680006396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F86HaJQHbhUuB+ZUfkZhXk5RgMSe+dIuZ0sxGFN/L/o=;
 b=FYL11wbg4NDydKkfiO5MCItmCjN3ObyR/pLVWvsfB9kitSSviCSdh+agiRBhaDMdbl
 kuKidowLz4xoR6H3iLtmkdJi9brfNc1w8LVwLfu7Y4191FKzkNjwJW/INSR2N6zU0k/v
 k6JxRJqoddOr7WlWVlu6Bo9iSg4jb+MEuOWyCZroaIOiqpFItwzodMkILen96r4g7hRI
 ylvnZzJBnB7LG/HSK5mh8vHl2JRLmqrIuubb3fMF1g7nZb5nGJ3hNSiLpuqSG7xjg4s5
 EFkOxB0sYoPhXwHFsWk9HWqP90t/5UZgHpvWyofTMxtKQ2W/MpOmpPb7cO6rEDKcp7nL
 LU0g==
X-Gm-Message-State: AAQBX9cA7FtfCpqkXt4EbGJkjD69+mE7DdccPhI8YDoIDyCZOQ7Nhgnt
 udIIa5kkhPt+2AvBukCgKRa08vCyvAU8gSR+lWI=
X-Google-Smtp-Source: AKy350ZtPSvscQapYyXuUnyjQeCfPE9QCTmx38Vl6pqpcgTh6F+Hhq8DHSt9SVHweepD1LFvjvAiQQ==
X-Received: by 2002:a5d:474e:0:b0:2ce:9f35:59b9 with SMTP id
 o14-20020a5d474e000000b002ce9f3559b9mr11998190wrs.17.1680006396384; 
 Tue, 28 Mar 2023 05:26:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003eeb1d6a470sm14993414wmi.13.2023.03.28.05.26.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:26:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] target-arm queue
Date: Tue, 28 Mar 2023 13:26:33 +0100
Message-Id: <20230328122634.2154949-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:

  Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230328

for you to fetch changes up to 46e3b237c52e0c48bfd81bce020b51fbe300b23a:

  target/arm/gdbstub: Only advertise M-profile features if TCG available (2023-03-28 10:53:40 +0100)

----------------------------------------------------------------
target-arm queue:
 * fix part of the "TCG-disabled builds are broken" issue

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      target/arm/gdbstub: Only advertise M-profile features if TCG available

 target/arm/gdbstub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

