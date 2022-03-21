Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48C4E20C9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:55:54 +0100 (CET)
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWBxJ-00006H-Nq
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:55:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nWBmV-0002Jk-JA
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:44:44 -0400
Received: from [2607:f8b0:4864:20::535] (port=43522
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nWBmR-0006Z7-AW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:44:41 -0400
Received: by mail-pg1-x535.google.com with SMTP id c2so9641366pga.10
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 23:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ksXdtS//i0c6PfJk4DpuOmBnEbRaa3UByTgAIVIq8m8=;
 b=TB5jkt8D/KZFzf1T/P96zXWKXMb7tAGJepwsDALMuaRc4bHl0cibrMRLXaXUKe+4j+
 mUesAj7+pAzwMTtDAzFVn8iskGBlat9Wcjm405Ysi8vtyvQwiSCqfHdY+UYL8Ugy0w2H
 cR6RowHb4djmtXS04xsHfCBDZNKfFgq7QcAalM+lwGrBCN9hSqQaedUw/riv3pNPurcw
 9rZmTVdfi/7rS3NsYw0j/RoBUf3Kv1vw3zV01HhLOnhBwAWCLVgA1HyXFocUX1m9wm9H
 M504d56MREd6LWGV7cdsANmUgtYACtxdfGg5W0xJaz8UvI6vdhmw0rk0iJEM2HeF4DWn
 osVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ksXdtS//i0c6PfJk4DpuOmBnEbRaa3UByTgAIVIq8m8=;
 b=V57O4s+qclSOlxj9XduyQQPK1JMAPsaeaSAj6eTUV/Ydhk0Fiw0xQGNRlwOuCo3tBv
 2yJRB5mn7obOmarui5HfjhvxWqCSliuGarp90dAG+MQCxc3M8ZaPzKHN6wr7UrLnkOoH
 iYAmlybNER/841A8FsDm61x2FLMQDZXT/o2WWY5EPZ13Ma6rfWeDeV7faS8gcAiJiEtQ
 8IYYGrPXtZtXOVC1JfBhr4GSpCgPLP85R+1qWq+XZTH0LVnzURkhG+/UJgnB8Ixul2pt
 erzD6hz9oLdO0OkNB1wfAtS2ilOxPWefanZ6KxM5bW6QfxNUCZEgpiogPlb0ltVh2Hkh
 NjEA==
X-Gm-Message-State: AOAM530wPLhOS0NW83t7GV/kDu7qdPjxe2fF9HDBe1rvA51iCpUIPXIB
 2TMGZBCGArhiiHNjaYhISA3LP+SF3ry2dg==
X-Google-Smtp-Source: ABdhPJwxgJOwSLdJpWdR+XS09umck/7wfVAL5kdPkZd3jwjqdsfAc2/Zn3Lp8k3aQw4DO1kOIFLY6A==
X-Received: by 2002:a63:4707:0:b0:382:207b:889c with SMTP id
 u7-20020a634707000000b00382207b889cmr13536041pga.541.1647845074684; 
 Sun, 20 Mar 2022 23:44:34 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm18628842pfj.43.2022.03.20.23.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 23:44:34 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/1] Replace 'qemu_irq_split' with 'TYPE_SPLIT_IRQ'
Date: Mon, 21 Mar 2022 14:44:34 +0800
Message-Id: <20220321064435.126799-1-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a WIP patch set trying to resolve

https://gitlab.com/qemu-project/qemu/-/issues/811

which will totally replace 'qemu_irq_split' with use 
QOM object 'TYPE_SPLIT_IRQ' device.

I just want to make sure I'm on the right way, so
only 'realview' module is modified.

Changes since v1:

1. Remove unnecessary headers realview.c
2. Rewrite the splitter helper function. I agree that previous valist
   implementation is too complicated, but keeping it will make code
   more readable. Or any other reason we need to write the code
   directly into the init function? If that is true, I will change that
3. Use 'qdev_*' rather than 'Object' directly

Thanks for reviewing.

Zongyuan Li (1):
  hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'

 hw/arm/realview.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

-- 
2.34.0


