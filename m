Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944F6931F3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 16:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQriH-0004lx-TP; Sat, 11 Feb 2023 10:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQriA-0004lX-Kw
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 10:22:48 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQri9-00083T-0t
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 10:22:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so8260412wmb.4
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 07:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2SdhDiijoFuqg3Ne5Ik2/MCv5Pf2VxK+mfCdOBpWK3I=;
 b=MRuSdVfZudNXMaOzEObkB8vjMaDPRGOwvWUOwnzZuZVn+8nob6OGdVx9yholQuN8q5
 4NkS5Ip7IkGXoiS3cyVPZSEb5f9uRK0ujWUPBo3V7mZ4HO38RCYIEgq1VtryTWTfL06w
 5KUSpmUFwcQEyZIM1G6eFdHQ1VL/eCyKF2uUI4e1YGyKpPDBAcC3OyxAqTYxACphxxu4
 yjZKf2I1GgnWJKHT2bG+hMHHhZAs/b8kj4NnVbiiLqgTE8m+YQFVAkPpRQwjaDroNuqT
 N7RnQbt1+uvlHv+HSivbNtH+WcmWj4xtpyZIjr6wtuQ+ciEKzhCH++iEZCQKx5tAhfIE
 a/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SdhDiijoFuqg3Ne5Ik2/MCv5Pf2VxK+mfCdOBpWK3I=;
 b=xeiOqIivfKxJ+uQN6/gtMePUqPunN5FUA4GFHNg1yr2tSraluyK2OInOUw6Crs+2Gx
 4QWQx6u3hM1wyyBJAeBnQn/G1gY+bBi1lmm0YAooksV8WVBDVOXCc9HXUHXUmDXN5i/P
 SoULjTS5Iy2PHkQTjnXw7QLecHgUfQkYCTFB0YOBFGKtIm6CcWhUfSKVBXLp1Bbtb2LY
 Af8vSu/xmZNljIXH2QqTftY5iH603LBTyNxd1iNicB1RSsI3CuAe/RTalA7HZC6QnFyw
 4QiHIkk7ycEd2NXcg4WxsrILSllucANk1ab6usi3c/9QqYPpf9Il/4by4/zyQr9JnIWw
 d0ZQ==
X-Gm-Message-State: AO0yUKVZakzbUC+xMT3xs1RcSKw55M2ZX4/n8uLobaFalGcrV7p31bLV
 szKjRK1FQijJjOVol8SaTh7BPuHYheMvr4mE
X-Google-Smtp-Source: AK7set+7qOTrQ33myH21zOOraQgJ3Hu+1s4L5DTcGlsuTQoqEedhtCyk25fePySvXj309sgqCGQl/w==
X-Received: by 2002:a05:600c:810:b0:3df:f7e7:5f01 with SMTP id
 k16-20020a05600c081000b003dff7e75f01mr14981352wmp.15.1676128962848; 
 Sat, 11 Feb 2023 07:22:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003daf681d05dsm9093049wms.26.2023.02.11.07.22.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Feb 2023 07:22:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/pci: Trace IRQ routing on PCI topology and fix a typo
Date: Sat, 11 Feb 2023 16:22:37 +0100
Message-Id: <20230211152239.88106-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Add trace event to follow how IRQ are rooted from PCI EP to RC.

Philippe Mathieu-Daudé (2):
  hw/pci: Fix a typo
  hw/pci: Trace IRQ routing on PCI topology

 hw/pci/pci.c        | 10 +++++++++-
 hw/pci/trace-events |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.38.1


