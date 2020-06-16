Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97591FB504
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:52:27 +0200 (CEST)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCws-0005xx-LT
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQd-0003Xd-Hs; Tue, 16 Jun 2020 10:19:11 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQc-0006xe-02; Tue, 16 Jun 2020 10:19:07 -0400
Received: by mail-ot1-x342.google.com with SMTP id n70so16046712ota.5;
 Tue, 16 Jun 2020 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H56oUyDfYltLK80fHHPutYvS4jI1ii23yt2DPH3g7jo=;
 b=mR8N9e50RCg23pLx3lKQlKlZBTAxe7ycOstMiYqo+u5iEaxm7sROaN6zZQx5Gv+Sdx
 dI1NmQ5e7eQDvYZXmue7nhzfEu0PdnXxww3/i+C+jcYC2AQz9HrrRNr+yxqSPUDWe2tx
 PwFzzk7vl6YsIp6sNN0h5AgxM4Rr4lipa7U3cazENk8YzIJfSv0Kc4gXxoTsYdI5lmEN
 sNEvCZkGe6l4U0XLJGXpgSbv5Gs7vxc+3urlyDHfgKbRGUnbZ97/68psdnQBcfCSPgdt
 dx1icNfzL+23gLTQQ4ApAU/Ob1AcaRHbydw3h9IwitxBP5/B3RMWrQ+o0/M0hgbYOHar
 LBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H56oUyDfYltLK80fHHPutYvS4jI1ii23yt2DPH3g7jo=;
 b=qWX+agNeBWFoFc35OaLZwafBPh5W2MfmW/Q12E0P77QtYlzrl1pfGMtxUTkW0JEXYc
 CND7YIfqtJgBiAIMHfpy2svwZ0TP+RQ0RuZXw4NzDyjh4tVOvxmpd3BlPO/vSxpG3ZkF
 cdjOJ+8qebKwSclxg7DkDgYGEhisa8G8/rhkUbGcwRf3iR+gLVqmWm9BU7DQ969Gw1A5
 QjZFbUQHeXFtdLFKcS7EBmmOBpgtgz2Mek+dyJukzZpNg3yzv2J6cM5GyZTViOwOQhzh
 55yx4OFMguu9pYD/Y+1/CUTLtw6JFlCysfrOkMsfzWUIOsEtk1y8Zbri6zR2J5dfSoWt
 IR8w==
X-Gm-Message-State: AOAM530whbEfiyDYzdQ6aKr5sOnwLl3HGPFCOBgCmURcRMkfAePQ752M
 u3jqLQ1rO2e0lMfPiOBZ6sB23vZr
X-Google-Smtp-Source: ABdhPJyu5pc0DvMfVeaxEpuB/WEofk2K3ge4Q2IeJ41xYDar/iRg6/OgDt74uFg+NhRVfojxbuDZew==
X-Received: by 2002:a9d:3df7:: with SMTP id l110mr2495125otc.214.1592317143900; 
 Tue, 16 Jun 2020 07:19:03 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id e25sm4082086otj.73.2020.06.16.07.19.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:02 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 58/78] qga: Installer: Wait for installation to finish
Date: Tue, 16 Jun 2020 09:15:27 -0500
Message-Id: <20200616141547.24664-59-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Sameeh Jubran <sjubran@redhat.com>, Basil Salman <basil@daynix.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Basil Salman <basil@daynix.com>

Installation might fail if we don't wait for the provider
unregisteration process to finish.

Signed-off-by: Sameeh Jubran <sjubran@redhat.com>
Signed-off-by: Basil Salman <basil@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
(cherry picked from commit bb1ce44b15f159b67fafc5f4b285bbf20a1961e9)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qga/installer/qemu-ga.wxs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 64bf90bd85..f6781752e6 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -81,7 +81,7 @@
               Arguments="-d --retry-path"
               >
             </ServiceInstall>
-            <ServiceControl Id="StartService" Start="install" Stop="both" Remove="uninstall" Name="QEMU-GA" Wait="no" />
+            <ServiceControl Id="StartService" Start="install" Stop="both" Remove="uninstall" Name="QEMU-GA" Wait="yes" />
           </Component>
           <?ifdef var.InstallVss?>
           <Component Id="qga_vss_dll" Guid="{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
-- 
2.17.1


