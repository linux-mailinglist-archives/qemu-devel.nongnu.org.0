Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488E2F374E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:39:01 +0100 (CET)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNdD-0004vs-P7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG0-0003Yh-Dx
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:02 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFy-0004qd-7o
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:14:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id r5so3128463eda.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uDdBDQv1M/RCTaZ/6xEdFdq+6TJMipRFR+HVm3kYAo=;
 b=Pos9oaAOAB8eoWXhQoBBhIAPb3RWOc3bh86dtu/IUl3YtE4tsg/SNX+pxTk41fMAyt
 Es0IGVE5YvmfRcICHwANgPGQXzM6ekp/1LzEPY0OrzabfGObTVeRrxARk5NW56WrgMkP
 12Y15dnVp+2WJiWtI1/a3yP0RcEvti3r1elDkft6DokNHDxIBKrnzhFHOGt5oOfief0y
 c6gujPPCs4tWVhgrYVJhRlY32UsYlwJZHYZBPWDyWf6hhTTlJPo9UBm3mIowlH5/k/YC
 5F5bMrRf24BiIPSd/Iwl3W59crnnGJnHpBazS85739M9LQLCB7i3eHDWjb862A6Z0RmC
 VyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2uDdBDQv1M/RCTaZ/6xEdFdq+6TJMipRFR+HVm3kYAo=;
 b=o5nIbTXan3TIzoM/1+qylmiGIFeDNbNKeQRiMOZ7v1yK2qj0SC0Ymwbd4l+QsFoHAJ
 2l5Gwd78keRLDsyriUNO3tnj+6YwnzndnjHmJWLvxwuocyUwt6Ua0ADvB2jlA04x+dcb
 jrV39Q5WgWtwCd/gK7yeGm9cCClObhNJHjxWCrdAc/Y4Yz/cEzvkoE6DfHvafIYSBaug
 AVMZ34XzHMoAk0G+rmzOKQZZvk4i7t/MMVnVBJV8xuIU8M0+pGf+Zlueb0/JaUqxzP/U
 XY4TRerzteOZsj6NzcWVsOA3DtuYE+cooNwAm51NMOC/rY1upMoViJyX107e+LyNiH6/
 vM+A==
X-Gm-Message-State: AOAM533FZpp/d7nv3YSgSkLlvQV5vQ3hNxhYZWhdHZ8ezvjFA4AF+11d
 xaKE6WwKpW50ygDJ7SE37FdFrwGnDmXIeA==
X-Google-Smtp-Source: ABdhPJxBpmHdPUN8YLG16U0pPflMS53kX60CfqC6GjPQtzNZ/J+oIfLLUNqC/lL36Jjeoq/IktDzMw==
X-Received: by 2002:a50:e8c4:: with SMTP id l4mr99409edn.337.1610471695925;
 Tue, 12 Jan 2021 09:14:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] cirrus/msys2: Exit powershell with $LastExitCode
Date: Tue, 12 Jan 2021 18:14:34 +0100
Message-Id: <20210112171450.791427-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Currently if we don't exit with $LastExitCode manually,
the cirrus would not report the build/testing failure.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210107101919.80-2-luoyonggang@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .cirrus.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 3907e036da..68b8a8fa9c 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -137,5 +137,7 @@ windows_msys2_task:
     - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
+    - exit $LastExitCode
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
+    - exit $LastExitCode
-- 
2.29.2



