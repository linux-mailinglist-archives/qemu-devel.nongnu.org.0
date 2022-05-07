Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F8B51E540
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 09:34:35 +0200 (CEST)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnExV-0003to-Tb
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 03:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nnEtq-0001zX-Sj
 for qemu-devel@nongnu.org; Sat, 07 May 2022 03:30:46 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nnEtl-0001ed-RZ
 for qemu-devel@nongnu.org; Sat, 07 May 2022 03:30:43 -0400
Received: by mail-pf1-x433.google.com with SMTP id c14so8051075pfn.2
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAt8c2p6o8v8Uk7fY4yOMvGzH1IBXO9gEoTIFff6ye8=;
 b=2645e/3AAkSIkkZhP6Crm6b/8Pk8NMyJuQSYK0/oGRoIqbT4K6v1RN+qdPXy/i0Uy6
 BJV3wmNci+DWnV3ISEgm9TuiXfkiDDATVoB9AhjM94yVQzp2FbtPXueh0bIlTFCt9v7X
 lZXETTOApowziU5zT0Sn1yJUgiYcgP/CotXM0ITLGLxGp1PuDqYX28robXqo3UJAuU1r
 1X0gTYDHDTdaXnzG6UIr4WS3zsKlHLiWK1MFeKg6yl+cuxnuBi5i+BniNFInRLcQaJT8
 isEm5OaU2UYqJR9aANQ8qbAfQlc+fqSbPqKbAMGc/5g0Q9mwrxeKFqd1UTfnKxJ1seUG
 yjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAt8c2p6o8v8Uk7fY4yOMvGzH1IBXO9gEoTIFff6ye8=;
 b=fzBz7WQ8PquKy2Yvy3Z15kcWgUU6I7tlzNzYuZhnZb3PzRh6BvSpeoF407/ct5mHIn
 w3K//kvtNpALs7wICbr0bu0WvJ8pVI+tW94Xb9pYQKzt4tUyYurTUJGNEDxtwukADCI7
 EWaDe4YJsQvKf9UJ/H3Uz9rIVvfCOjqvL0vyeYQbPgYQEE0frSwh6pwQ4SreHIxdT5vd
 wcUDwHuGR7lVfuhurvSJN3VZ/pSc5mXuaOcmvguhbp9gKdpHYqtkEVdqRDMnzH+Sr+pH
 xJGD8k+6ub8O0ILsASr4rSmA0IEbs6THoZ8VjoRfcP9qIJUGWasHrdOMNXkj8sqGbUKd
 12CA==
X-Gm-Message-State: AOAM531xBRHvs1jJGXVGuqwyZTaDJsX82TgBxqotXPE3AdaSVfcKxYVG
 FXzKDph81xO+Jsf2dS3Hc0pdYA==
X-Google-Smtp-Source: ABdhPJw0t2wXTLRkJ4kYlocwvq/kOfwCzIpc1o6PbrO0MJfHPU6eBBItKeJEp7Fa0L8J7NdRptGAow==
X-Received: by 2002:a65:6e88:0:b0:382:3851:50c8 with SMTP id
 bm8-20020a656e88000000b00382385150c8mr5973902pgb.270.1651908639578; 
 Sat, 07 May 2022 00:30:39 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 z15-20020aa7990f000000b0050dc76281c8sm4595821pff.162.2022.05.07.00.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 00:30:38 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org,
	its@irrelevant.dk,
	k.jensen@samsung.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hch@lst.de,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH 0/2] hw/nvme: support smart AEN
Date: Sat,  7 May 2022 15:26:42 +0800
Message-Id: <20220507072644.263105-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
In this series, firstly introduce smart related bits of aen cfg, then
support this in oaes.

Linux guest does not support this currently, I also send a series to
enable smart AEN:
https://lore.kernel.org/lkml/20220507065026.260306-1-pizhenwei@bytedance.com/T/#t

Test the two series together, works fine.

Zhenwei Pi (2):
  hw/nvme: introduce smart bits of aen cfg
  hw/nvme: support smart AEN

 hw/nvme/ctrl.c       | 9 ++++++++-
 include/block/nvme.h | 8 +++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.20.1


