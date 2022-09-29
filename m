Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B35EF787
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:28:52 +0200 (CEST)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduWx-0006bY-3z
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3X-0000kW-Rg
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3I-0002NF-St
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id n10so1757523wrw.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CtbYQsfls7HKk9T4QA6Y6Rsyc/LAyFcunfAWWUDR2rM=;
 b=RZBb0tR97Q0MsnS7WYstLsjwQKAG8UX8QTe+Mrk5fcWD51A2bC1YrS75ww898AfDLO
 NrLUbhJ9MASjm0jmwaloEPkUQhbqFzqzzmr4+SwVsg96tevD+v3mCzMwEBwTNksUl4zl
 B9e/xedssgjScdd6yejK9u+H2tOCa2Bgvm9tbj0dzrq3GkTfuwKRx+uHK/b6CaPRDSGp
 fEnujl+y20irATJi6ndOLWnh+Xzt6PTfURdgjoSXWEl4xH53pOuFELk1z9cj4+Qm4NNp
 fS1xexhnegabuK30BU98gqfBjyvxneT+mZWaqyzj6n04JTPeoXFiWSc/2uyR3KlLc4DF
 dJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CtbYQsfls7HKk9T4QA6Y6Rsyc/LAyFcunfAWWUDR2rM=;
 b=b8i0OH5g92J7rYaADLb8b+Wekr3j2/On60uBAIk+oUsvgfGbKGCXrTxc9vamXhOllh
 UH+0E3wvQbfdeBC1lcAVuDn85efW+AFiT/Phmdrf3dlk/KC2D4Ll5Dnw284QKxHZxpJa
 y9MGKc2hqespTB38wgfoiwW2be1eZMq7gV5WtC5vW/XC6J9r8lBgXNBPK+Rbtp7+8uxw
 pQQ6sSXr1N5z9CQItkGQdL0EidLm/3jWBDkVOPawSIxPtNKpsh6/NRFUHt3H8CETFCyX
 siCDvGLOuFnuTcSe/SGiZ3yRNWzqd08kRRP+iP+jDzzsmXG3Xw1QT1GEpigU3Be+Mxaf
 fsbg==
X-Gm-Message-State: ACrzQf1bKd583iE2FwVRbjWH/Kl2LRnaynLKPbsYJWx3eUgWKhWnPcG3
 MT1G/WXtWeTUR1W31DFj9PiQcA==
X-Google-Smtp-Source: AMsMyM7epQMXhOnv+2YeREg/OGo4DRvLGJOGxiqhvZHmLVwO6sfGtxeWrCbVNQb6uRWnnHquiZkZxA==
X-Received: by 2002:a5d:668a:0:b0:22c:c79f:6a3c with SMTP id
 l10-20020a5d668a000000b0022cc79f6a3cmr2085372wru.252.1664452203183; 
 Thu, 29 Sep 2022 04:50:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003b4de550e34sm4003457wmb.40.2022.09.29.04.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E6171FFE7;
 Thu, 29 Sep 2022 12:42:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH  v1 50/51] contrib/gitdm: add ISCAS to the academics group
Date: Thu, 29 Sep 2022 12:42:30 +0100
Message-Id: <20220929114231.583801-51-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The English website (http://english.is.cas.cn/) in on a slightly
different domain but has the same logo as http://www.iscas.ac.cn/.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20220926134609.3301945-6-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-academics | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
index 44745ca85b..877a11e69b 100644
--- a/contrib/gitdm/group-map-academics
+++ b/contrib/gitdm/group-map-academics
@@ -19,3 +19,6 @@ edu.cn
 
 # Boston University
 bu.edu
+
+# Institute of Software Chinese Academy of Sciences
+iscas.ac.cn
-- 
2.34.1


