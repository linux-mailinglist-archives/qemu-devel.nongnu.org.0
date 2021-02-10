Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850943163BB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:25:41 +0100 (CET)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mgm-0003MX-Jy
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9meg-0002fr-Ph; Wed, 10 Feb 2021 05:23:30 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mef-00089X-9I; Wed, 10 Feb 2021 05:23:30 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s5so2255244edw.8;
 Wed, 10 Feb 2021 02:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JkHFcJt5HkgpwIw4fjvY/YJ/nOUviizgFk3DyArHyHg=;
 b=RtDPeE+CchM1ddqL3kQmB/JZWyjd2dcoeyNtiz5INGvnOxQGIV/rOTKc/xa29ufhxq
 hl8m4s/OQaYBRR8La+D8r/t+UwzKFUPnPBK3jo/eueFkFUApJEECehE8ZV8BoWAvTwAg
 21eo9pUL0fJuTcvzNr2Jqd3AB7FnxTwyTHbTwM8tMjJm2Z5lTrQeMupXFo5uGvmNPQnq
 Bqd8VEmND+jInKX5vwYWK9+vU2/6ovQ+2Hl92r7o2bz09vYtnOcXGrXn+c+/r+IRZCxr
 mWMR5W4eXvzgyDNjsr59UIGZdoCtUHh37oeFwDJ87IZNpvII/3Lj0PbHSq83cISDul9V
 UCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JkHFcJt5HkgpwIw4fjvY/YJ/nOUviizgFk3DyArHyHg=;
 b=MVtJozriARnO8I47vLio8D9rKb/siT7Okl1bkG5e8DsabVkeLZkZLX1wrL6f5h6roG
 QJMzdHeGd29YDMEbujD9fAK1QgicbLepC4MVOWyLW38TFVoq5l+vLtlRdNiphsBi8jDh
 RZ0vE9XHZflA3LkA/jQZwXsIlX5IA+i5/9427+h9JElYU5s5yQ0GFRWEHkSj8EGGDa08
 c9uwj8LFkxV3yBK3ZJP2tc0ryd78EyfVBs705OFfGdQpNQ1RF4IfbndPIahRNoHI4chD
 RnxkH4cX+bQaPzyGp56W2ioAHOyYGrtvjHuibIvP77x535DBh7WrGQPJ8TniPXa6Xuc8
 OelA==
X-Gm-Message-State: AOAM533YCEzKWNv5MBl5Ae/q/BR7E2mSGnajtz9qYRYo1qNNitm2AtSh
 PJFeVZm0qpgYMtgsJpJBGmo=
X-Google-Smtp-Source: ABdhPJwJbdkp/QQ0sTSt+mqGn+RXwTkAjmQzHxhnFlLbouACC7l77trZIs0DGb/SaDrMlsvHkssCfg==
X-Received: by 2002:aa7:d696:: with SMTP id d22mr2419487edr.361.1612952606854; 
 Wed, 10 Feb 2021 02:23:26 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id g3sm789926ejz.91.2021.02.10.02.23.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:23:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
Date: Wed, 10 Feb 2021 18:23:17 +0800
Message-Id: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current QEMU HEAD nvme.c does not compile:

  hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         ^
  hw/block/nvme.c:3150:14: note: ‘result’ was declared here
     uint32_t result;
              ^

Explicitly initialize the result to fix it.

Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- update function name in the commit message

 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5ce21b7..c122ac0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = ns->features.err_rec;
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
+        result = 0;
         for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
-- 
2.7.4


