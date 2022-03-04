Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07F4CDDB6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:05:53 +0100 (CET)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEBU-0006yw-TP
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:05:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8o-0004vm-PD
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:03:06 -0500
Received: from [2607:f8b0:4864:20::535] (port=33533
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8n-0005xk-6D
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:03:06 -0500
Received: by mail-pg1-x535.google.com with SMTP id 6so3848916pgg.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bTAP5xZoQxIprVGUmg7/sxvkZvnIeiZcIATuPHt9JCQ=;
 b=YR6eyxuOOnbyt0GbYrRNEHn771HNl0Z21HTbptG/RtYkjxtv4v9Dmfx+c/WBHHAaqM
 iu2reHBzT2In4n1RTKA7R4cSd1nLKL71qrwREoE3px3/5ycQKGuQ9qLLcw9tZDh02Rry
 kdbZfKWTmr8L6aSAztqWoN3zXvIYX9GFuBIvLUr3bLDSBHbW8MIUEvMPF+Yo7jzWd2Pa
 z2bDE5uLVv8hapwQ/s+1kqFgFs9B9sv+dy6WpPI9qGSnO8P1S6gCUnAQWAMbim08Vz5F
 x6f5TzO782A7yA0Imi7NQyIDS2Xzv631HkAxXnzEsTQca4vnAsDTw9d0j1joqoCjgawo
 1XfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bTAP5xZoQxIprVGUmg7/sxvkZvnIeiZcIATuPHt9JCQ=;
 b=LkBKC3LJg7qL/zNBa728s3mPX9u6iOV6ae9GE+d7d4lrPQu+iz1ms8xWx2jlYlQI/+
 Ha45xQeOCWyPuykntGJFJLcb8wdn9BH7dIAWFqeFGuVMPlgSZ0mMiBFlnb5igE+HBlFE
 GWCCNc4zS0LTZ7Mx5EdUl/ataP0+eWyXnQiHASbxVzY1z19+MZK9wPSSFQv6W/SChMr1
 BalyydHaVC/z8AklhgqV3ButIGb9QFBokhrB7PAIQFitfPBmWYscQauZuSElZvnJj34C
 cvR1VnzsL79pPV0j0OlO49+mXrsvqW6/ObS8+NxqgYHoj2t0eIlzek469SO3zxlu9gh3
 ekyA==
X-Gm-Message-State: AOAM532K1ZmAX2nsCh1C6Eb0E2k6NWT3HTdd6GF1I1GLIVrEeH/xf+NU
 rC6KyRvCOFITbejbgT8q9sh2TZAXoUZWTA==
X-Google-Smtp-Source: ABdhPJy/wD+094llXKlibDpONqT/aR+4HYHTtJAQMFNO3TJzPLXiTrFqk5nMJMe/965eahFiyBxLzA==
X-Received: by 2002:a05:6a02:106:b0:36c:96dd:8c17 with SMTP id
 bg6-20020a056a02010600b0036c96dd8c17mr87422pgb.190.1646424183663; 
 Fri, 04 Mar 2022 12:03:03 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 hk2-20020a17090b224200b001bf0a7d9da3sm5716744pjb.9.2022.03.04.12.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:03:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/2] target/arm: Enable LPA2
Date: Fri,  4 Mar 2022 10:02:59 -1000
Message-Id: <20220304200301.524525-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v5:
  * Most of the patch set has been merged.
  * Use hw_compat_6_2 for disabling lpa2.


r~


Richard Henderson (2):
  target/arm: Provide cpu property for controling FEAT_LPA2
  hw/core: Disable LPA2 for -machine virt-6.2

 target/arm/cpu.h            |  5 ++++-
 hw/core/machine.c           |  4 +++-
 target/arm/cpu.c            |  6 ++++++
 target/arm/cpu64.c          | 24 ++++++++++++++++++++++++
 tests/avocado/boot_linux.py |  2 ++
 5 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.25.1


