Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC549DAFE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:51:43 +0100 (CET)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCyd9-0006Hs-QI
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:51:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMf-00041d-TY
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:37 -0500
Received: from [2607:f8b0:4864:20::62b] (port=34342
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMe-0005hH-6J
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:37 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h14so1697059plf.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hu2laB6g4XBvKqqunaVLGtbR5tzEQ3k1nWJGv48o3aU=;
 b=AvygJy2hs4h51GTHPssOHaMyTwp9KJ2P05TeccH6ypOqH3Uxx8WT5quMN3iXbyxM3B
 Q7qURe4LurztQ87JOoB/t19iC+IbYAr3jiD6JrWikirstf+Yty8jm+CzVnQXoKbJFB/k
 c2PYn7xdGYtdS3xVLcMeoDuWnnlwN4ZmQPIEpJ17fCdo8aG+cxswL6vzWfYh8UCeRCod
 Iq5IsNCg4zOekhUELYpG/6sjm+Yq3phV09ulC7q67bMAG662AuPfmH7Hb7uC42e2ByfS
 QLct1acgSEFEuEKIbNo8h7xv87QiJhyW1pUox3n79tgW+GjobXF71QtRFtLqj7U1wNSp
 D7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hu2laB6g4XBvKqqunaVLGtbR5tzEQ3k1nWJGv48o3aU=;
 b=DDkizWckb/bYfvRrXfRh89ts/dLM6ufC7+BkRGEKMR7uA/OumufoY8cpQ7K6nOij5j
 GTTjIkbJ9bQheQcZmuSD+n2KAx6NpBrNui/ifmBEQNPZg+JZOpGkUY7u4exe7rr+5N0b
 D4bUzs3LB7Dc3/ksRtMh1eNRPT4mcJCnsfUFzPycwYVVawAlBqctCmpcVVCG1/m99xnJ
 CXyx2tFXxeAv8zMIUBCiNnppFjGIi+oYZ5PjxkyDM/2/XipeFZgxju8MOWxsvNDyJoNr
 KCmguRrCjBbrrtAz9/WHqGgdXeV3gwZJzaQpLdjsfj9kkyCeiNR+yYYWAKwvXwKtaCBT
 g13w==
X-Gm-Message-State: AOAM530PSP0WYWH1OERCAfVfcYOcpKz4aP+kGjmW09FaDX9vU/xqURBy
 xEsLqiSUgWgRCyOHP/hsqueeYzlBRSeZc1+y
X-Google-Smtp-Source: ABdhPJxlLl8+64AgA+6QK6FlPxwjbDQtG/OzFRLC3obVcdFx8GVnmNKnPbDb8elBbzs0q2VPl831mg==
X-Received: by 2002:a17:902:da89:: with SMTP id
 j9mr2167375plx.66.1643265273934; 
 Wed, 26 Jan 2022 22:34:33 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y20sm4231855pfi.78.2022.01.26.22.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 22:34:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: SVE fixes versus VHE
Date: Thu, 27 Jan 2022 17:34:24 +1100
Message-Id: <20220127063428.30212-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yuzenghui@huawei.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix two problems described in

https://lore.kernel.org/qemu-devel/6cdfd5de-2465-adca-73b3-9c66945cf18a@huawei.com/

with some other minor code cleanup.


r~


Richard Henderson (4):
  target/arm: Fix sve_zcr_len_for_el for VHE mode running
  target/arm: Tidy sve_exception_el for CPACR_EL1 access
  target/arm: Fix {fp,sve}_exception_el for VHE mode running
  target/arm: Use CPTR_TFP with CPTR_EL3 in fp_exception_el

 target/arm/helper.c | 118 ++++++++++++++++++++++++++++++--------------
 1 file changed, 80 insertions(+), 38 deletions(-)

-- 
2.25.1


