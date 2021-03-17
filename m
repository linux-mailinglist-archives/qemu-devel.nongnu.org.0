Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA7933ED0B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:31:48 +0100 (CET)
Received: from localhost ([::1]:47948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSWo-0003Hj-F4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTs-0001ks-Bh
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:44 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTp-00011d-Al
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:44 -0400
Received: by mail-pf1-x435.google.com with SMTP id 11so699153pfn.9
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4IJgA9xHiUTgoFzKaPr1USI3SuBFKxXuOZ+JQdWjg28=;
 b=XdWF/ndwCYQcUCkf338CKMIXBzDZ8UrGV7y0cHSb03IZdDl8I3IJ40bsJxnD6sPnhG
 znWTodAwenhOGo33qhI/Sj1FyXJq2SlVLCOBT28R1UNjgT1cbk8vzQoffWnOpwzvCZzA
 3TI03jzQ80WGIqqGfozQ8sG+b84tcQ1UPUJJwEI5MChfBRk13ZhWFALsWq0jMIrW3h6d
 m+QRMPc8HZCDRDQrim5upzYQbzy77Tmkb+O/7eQP3V3FjCT9wCwMJ/HAEKwYPYPp7DK/
 ZaZlhKckP33rRpJHo4whGpTgmp3YzBtM4N+FN5n5aft8CjLK9IRaL+Ip4myMmi80cEyr
 Cx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4IJgA9xHiUTgoFzKaPr1USI3SuBFKxXuOZ+JQdWjg28=;
 b=IlPnNsUEXcBnuieM9NvrzfRlA8eQyKzKuz+2fJhE76/1fFmBkCYBkk7bB6rCz6/Fx8
 2IVdVhhKafPVWeQr6geZcayYtjea0qoD6/Sse9PQo629adPmi9jWdLFxhUHtWAhozfAH
 VjD2Vf4c8J8R1cSuPsDRujQuKMUkQBsMUejkzjT8dLYPJW0XqtLb4OOUOCieR4gizgXd
 pFCmQ1SBmZbOJCnOuXwCQe2YArrpJ5dDX4bNKOo9WQLdZiLobpYFYzwicAInqi1/zmxW
 PqKkAMamkLFXEb9AcXXJFsBjAIA6aOwGQ0I52gSxh1s8RHqpFYpp5ldr+Vle7sqdY9xJ
 7oFg==
X-Gm-Message-State: AOAM530FoACPUo7SGHrfMIaPUCiYdHmpZqijJ2i7h3yfA3ZIVb3k9muy
 /tNXgt0KQW7gCmCbkZSqMHOv
X-Google-Smtp-Source: ABdhPJzhdE+f779hN2rPV/YLBUvg3lRKPn8u12T64eeUu32G0VCBMiI12yH67Cf4eItDPdpc9V2PDQ==
X-Received: by 2002:a63:9219:: with SMTP id o25mr1848911pgd.112.1615973319250; 
 Wed, 17 Mar 2021 02:28:39 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:38 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 0/5] target/arm: Add MTE support to KVM guest
Date: Wed, 17 Mar 2021 09:28:19 +0000
Message-Id: <cover.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This version is rebased against kernel patches v10, and only header
files are updated since v1[1].

This series add support for MTE(Memory Tagging Extension)[2]
in KVM guest. It's based on Steven Price's kernel KVM patches
v10[3], and has been tested to ensure that test case[4] can be
passed in a KVM guest. Basic pre-copy migration test also passed
between two MTE enabled kvm guest. 

This is a RFC patch series becuase:
(1) Need to add some arm MTE specific codes to the ram migration
    loop. There may be better way to do that in a more abstract way.
(2) Only pre-copy migration is supported and tested currently,
    post-copy as well as compress/zero page migration are still WIP.
    
All kinds of feedbacks are very welcomed, especially for the migration
support. 

Note:
(1) To support MTE migration, tags for one page are appended to  
    the page data during ram save iteration which make it easier
    to sync the page data and tags.

[1] https://lore.kernel.org/qemu-devel/cover.1612747873.git.haibo.xu@linaro.org/
[2] https://community.arm.com/developer/ip-products/processors/b/
    processors-ip-blog/posts/enhancing-memory-safety
[3] https://patchew.org/QEMU/20210312151902.17853-1-steven.price@arm.com/
[4] https://elixir.bootlin.com/linux/latest/source/Documentation/
    arm64/memory-tagging-extension.rst

Haibo Xu (5):
  Update Linux headers with new MTE support
  Add basic MTE support to KVM guest
  Add APIs to get/set MTE tags
  Add migration support for KVM guest with MTE
  Enable the MTE support for KVM guest

 hw/arm/virt.c             | 44 +++++++++++++-------
 include/hw/arm/virt.h     |  2 +
 include/migration/misc.h  |  1 +
 linux-headers/linux/kvm.h | 16 ++++++++
 migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c          |  2 +-
 target/arm/kvm.c          |  9 ++++
 target/arm/kvm64.c        | 31 ++++++++++++++
 target/arm/kvm_arm.h      |  2 +
 9 files changed, 177 insertions(+), 16 deletions(-)

-- 
2.17.1


