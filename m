Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB342C5F4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:13:50 +0200 (CEST)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1magt3-0005Ji-GK
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magpC-0000l7-Fs
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magpA-00025d-Nr
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id k7so9979571wrd.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lb6cWnTEE4eFeZUzdUydkeMfwptufhXz0XrfcC4cp6s=;
 b=y+gymI7h/GpM0tq78lZ2uzFOS1zPv4aBraWUisIMJMfTFwi9H6+x8ohFXjSK7Z/gGf
 qq3xhqAhbEXZIunpkj8w7aMOIfY+aqJ1t/ZgIsjdZGm59djH9DzcVfgvR8Vjm51GSrLz
 ZhIv+0i1lj/xVgcMyMzsLg+9xduN/M33hXLwyahr7qtLVn+9eFdYzyX/Mkqu005N7oO0
 eBA3II3eBZucjqsygPgr+J3NkwB+LG+C7ixvQFYvil1fegYgVcbOQUZ/BvdYMC+nn7Jd
 xqjelvc8aKFJSx7CRuIoxpyGqyJz7iCmjf0b2m6Ef8pjUvBvmnNCuAgNLJqAcCHNAMWK
 U+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lb6cWnTEE4eFeZUzdUydkeMfwptufhXz0XrfcC4cp6s=;
 b=kQybDjRZgq3IPyUyF3ZCiPxDSf1bm3XJFFUtiS+8q1/WL6pgxCfEZsFOm9J1jzo/Ir
 /3QJx2wAwLsL6KMFMV4RYy5Eyd9+LQ9PyA3Ydc7LTp2zpipz4OH4bw6DYmRetV+jY7jf
 /sW/q4BL4JXPCikEmRWkFewazjKcgZT8uK0qhhnkuQNuolwqXkdqwNUh79W9pNV1mb1w
 oKOGEZJDj87jTx7ujcxQ7z7RW8DvtxXzpklbdt/+6OEbP0/Mr1ocIiloyiIiwLA8k1dx
 XMbR6ZkG280zHGNM9PHgAwrCIVM82Cpsl934viLtkm0AqMPBQeSGKYSYl4X2n6znykg6
 +JzA==
X-Gm-Message-State: AOAM533z2bce9kxfW6yvFFfMNWLlzqePv9d+JMQpUezbNaE9VfhHD5Xw
 kbgQAbrGdw1nlpefMrNMfZbFmQ==
X-Google-Smtp-Source: ABdhPJzrKOcLCZQmRCc9AlvP0iKxBbTjhBP6Hu6APkfLGEUyyYPwHhmWuoaIhN+Rfxh3sRmrcfyHIA==
X-Received: by 2002:adf:ca10:: with SMTP id o16mr68714wrh.212.1634141387133;
 Wed, 13 Oct 2021 09:09:47 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id v18sm10482wrm.63.2021.10.13.09.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:09:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: pbonzini@redhat.com,
	peter.maydell@linaro.org
Subject: [RESEND PATCH 0/2] Fix machine parameter default_bus_bypass_iommu
Date: Wed, 13 Oct 2021 17:06:06 +0100
Message-Id: <20211013160607.649990-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org,
 armbru@redhat.com, qemu-stable@nongnu.org, eauger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine option "default_bus_bypass_iommu" is broken since commit
d8fb7d0969d5 ("vl: switch -M parsing to keyval"). Fix both machines that
implement it.

Resending with Review and Tested tags, no other change since last
posting:
https://lore.kernel.org/qemu-devel/20210811085842.2511545-1-jean-philippe@linaro.org/

The fix was suggested by Paolo:
https://lore.kernel.org/qemu-devel/6e233344-dd09-598f-082a-afe73d788b33@redhat.com/

Jean-Philippe Brucker (2):
  hw/arm/virt: Rename default_bus_bypass_iommu
  hw/i386: Rename default_bus_bypass_iommu

 hw/arm/virt.c | 4 ++--
 hw/i386/pc.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.33.0


