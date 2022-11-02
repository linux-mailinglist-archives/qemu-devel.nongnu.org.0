Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9402615EC2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 10:03:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9eE-00055w-2F; Wed, 02 Nov 2022 05:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq9eA-00055X-OF
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:02:54 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq9e8-0004tD-LZ
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:02:54 -0400
Received: by mail-pf1-x430.google.com with SMTP id i3so15802549pfc.11
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bff8p+/+lfAesAguE58VughOHGeDeE4lgHM9uGQYUDY=;
 b=fryxbStiYCrYjf02i+chSF5iq1r/tNO1b067cfY2DuAuD/zwUDaXJQgVApdXOV7L6P
 WW+olFZCHif0zJCuev/pYen9AjTR9Dh/1Cgq0xZ2fzFIurIXx3KtLfU/MAuaqU0Vvaui
 ZpTijZdUXs4o99k/xZlCwiEe3l8vbCBk99WSbDqM4qdfE82eL8hOxPz/zZazOLGuoZhm
 jxueN5EkS83RYIyFYQUJIGRfNY8lqyvnujIi83L5ExKjNFARBlQMg9yb1PYl0XR7gFv1
 Hkb98/goyEv/xoq74lpv0Msu5xvebRwwij8imzxgsHg2u/XSkBNkkJtrJ7LANAslZ6zL
 CprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bff8p+/+lfAesAguE58VughOHGeDeE4lgHM9uGQYUDY=;
 b=ZPrZOWQE5Lf6ZemucMR5GfSRybcBO/cXHLOpzoZcys5gRTeCH1yvwam0n6vkxNLmYw
 vRIFOnudtqWefgfkCipJ9VA0uXoo19FpeYK4SprDk2yM/gf1Udm+f6ppG/hn/3Pb1D4r
 CNM7b6HcsliCYak+W6/ODos2KgCka9NKXuKMsS29LPKAI3edvxI2h6hD3jgnVLxZh2SW
 CnnUbUD5ZOCWnvKhzUm7luGlcgjqf1f2r/Q5IxauF8fN6FB/XkndmZGbeaLHGT07Vl72
 WVtdtUjJYQ3Y3PfD9LS8p60dR2egcM7ymrLJrcFMFlCRiGR304PMfGYEHIeIQhG+Gpdh
 nLgQ==
X-Gm-Message-State: ACrzQf38A8s2R5XY3X89Vwrvvi+z9HZB5DjBQzEUX8fYja3w080/3ldp
 V8pI3ynZQLsq7O94FeMTlsNDIg==
X-Google-Smtp-Source: AMsMyM4DCqkPPjnCGeXCfq7NLoGxzhDA39WlsOHUp6BHlI3f/uqoLD7r7hGrn+vG108GjjhacR7aVQ==
X-Received: by 2002:a63:2b48:0:b0:434:eb45:9c6a with SMTP id
 r69-20020a632b48000000b00434eb459c6amr20042100pgr.508.1667379770865; 
 Wed, 02 Nov 2022 02:02:50 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a623187000000b0056da073b2b7sm4359987pfx.210.2022.11.02.02.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 02:02:50 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: pizhenwei@bytedance.com, qemu-devel@nongnu.org,
 Lei He <helei.sig11@bytedance.com>
Subject: [PATCH 0/2] cryptodev: fix memory leak
Date: Wed,  2 Nov 2022 17:02:41 +0800
Message-Id: <20221102090243.52140-1-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

- Avoid using g_autoptr to free memory that not allocated
in the same function.
- Fix memory-leak when 'virtio_crypto_handle_request' returns
no-zero value.
- When error occurred, always pass negative status to function
'vritio_crypto_req_complete'.

Lei He (2):
  cryptodev: avoid unreasonable use of g_autoptr
  cryptodev: fix memory-leak occurs on error path

 hw/virtio/virtio-crypto.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

-- 
2.11.0


