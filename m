Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE463207541
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 16:06:18 +0200 (CEST)
Received: from localhost ([::1]:33796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo62c-0006V2-0O
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 10:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jo61F-0004m3-OP
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:04:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jo61C-0003Tx-Hc
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:04:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id a6so2429179wrm.4
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KLxxBVgESg8+q++r/+fvnKLfCmcpFTynVpvVjZzQTYc=;
 b=VwcLfqPbp+T4CAYLNWhwImrkNQUg/MCxrqpgGmWz5g/2C21hymKonLfsM6GwlacWol
 Q6vbsoWH5gYC+W1TWoRXxM3uM5kJjYeNn79or5nGcho35BNWgsTfmeoE2X7P8F6nR8Ty
 ts6EncUOKpud+pHpKq7ukXC+zeNjk5fZ2EL/9THYsilF+51TF6krgr7lS7pDTn7HE/mX
 aiAbFnWBcofwmlVz2vLYZ/+LCpGqy53SQkADa7q07rTQN4j+jn/qE2zIQ/e7kW2kyaXv
 wfbgf2HqRITx9sYY+aXART2mToePlOOx3Een48LcQh0lS2H9RxTA9VNyzER3pqCMCI62
 Egng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KLxxBVgESg8+q++r/+fvnKLfCmcpFTynVpvVjZzQTYc=;
 b=R0Q3Z76fzD+xW2/j9IwReh7NgDokcF3HjiNHCuA3KjtOCDKy1oKc7NkchPqj/MfU7P
 m9hxc81tvggHyDwME4XL+a00irVP+NrINjBPTeqQ+py6IwWTt8FNomCyB92gJS2mQLKj
 Ukw1oupafCLylz63XC6H4PsxJHAlcC0jApDASgen7YFRzXhABpVMTR4g2jFJAFfd/GNj
 gn+ETC+qe3WqLKYH9v2SlrLywgzI6dX2zLTK1/e+d69aN3sq3jXRzJCV2ihwIB35/By5
 V8ImTIlCV/NgY7EEahN3IER0WrWKhtzfE9f6neBEBn/ZT612j43dunZJjzairAq0vj3r
 hzeA==
X-Gm-Message-State: AOAM530GvUn0jhXs3gva5ZrQJ6uf+xWDgLUb46fIFBGCH+ycmBj8774Z
 GklXK7mZVbjsk5ZQVyqzSuIP/Q==
X-Google-Smtp-Source: ABdhPJx6Nn/euRo80F1/ttjqnACDmvz5KtiuijW7KTI5LR2E9CROt4Xt1mpEHUCwC5Rsee7FlmPv6w==
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr16503875wrp.45.1593007489056; 
 Wed, 24 Jun 2020 07:04:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 185sm8237788wmz.22.2020.06.24.07.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 07:04:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C6F91FF87;
 Wed, 24 Jun 2020 15:04:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/25] iotests: Fix 051 output after qdev_init_nofail()
 removal
Date: Wed, 24 Jun 2020 15:04:22 +0100
Message-Id: <20200624140446.15380-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624140446.15380-1-alex.bennee@linaro.org>
References: <20200624140446.15380-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 John Snow <jsnow@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit 96927c744 replaced qdev_init_nofail() call by
isa_realize_and_unref() which has a different error
message. Update the test output accordingly.

Gitlab CI error after merging b77b5b3dc7:
https://gitlab.com/qemu-project/qemu/-/jobs/597414772#L4375

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200616154949.6586-1-philmd@redhat.com>
---
 tests/qemu-iotests/051.pc.out | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index 0ea80d35f0e..da8ad871876 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -142,7 +142,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 
 Testing: -drive if=ide
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: Initialization of device ide-hd failed: Device needs media, but drive is empty
+(qemu) QEMU_PROG: Device needs media, but drive is empty
 
 Testing: -drive if=virtio
 QEMU X.Y.Z monitor - type 'help' for more information
@@ -214,7 +214,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 
 Testing: -drive file=TEST_DIR/t.qcow2,if=ide,readonly=on
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: Initialization of device ide-hd failed: Block node is read-only
+(qemu) QEMU_PROG: Block node is read-only
 
 Testing: -drive file=TEST_DIR/t.qcow2,if=virtio,readonly=on
 QEMU X.Y.Z monitor - type 'help' for more information
-- 
2.20.1


