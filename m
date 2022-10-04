Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE85F449D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:46:11 +0200 (CEST)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiFO-0003Pg-77
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgS-0007ag-HV
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgQ-00008I-N6
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id f11so18598521wrm.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bw50yxjTxmlWlH/xk2BP/gjW18+lJ2PEJ5PUJwIRVEM=;
 b=pauep516vDrGfN7x7YCIHYp5SydC1lues7j9JEh/cTyTSGH4P7Pp3YwCl2Mnnm4w1T
 VDiZd/g9XUwdbC0mfmpQvR1MaBnbctZIGmFtkbkxtJCkCgFaaTd1lxm8p+4if8/hegFw
 hdVkygK+/sS0CnHpA7vaKu34actcY04Pt3834oP0pKYs6CXekoy+yUTKs6xV8AG7I04q
 nd+ohJN9PgqfjHgFFTFzhAfYKzKgbACuJr0gE5gWaqixa9mWmk1mp3/+jZQV7IDblBg7
 m6soODgWqkpcDgYCkMg+6trmjCK9+l9GxXyMWsZoCrwUBjbE3O0WqSZfDpz3y7MEuqnG
 9RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bw50yxjTxmlWlH/xk2BP/gjW18+lJ2PEJ5PUJwIRVEM=;
 b=18cY7vMmRanhLDZ/Czt7PpcS3fBii2cuZy+802a3mBHZY1JJj0btTMjZAcx4xrVXZ3
 rivVf3T1d0kdUL7gQLmf7n5t31uQBmQZhtYPpD9ZKazDK2z+F9V5dNVHVcuFO1IzDM4T
 P2oilcWl4WH145FfphxV1yZ06NmMvBoFfvFcppi1KHDKq8uZVvWlUTRZUK4Mz/MxjSis
 UDHaV+Yg/6/gLigzGwOFLotF5BZGKmIzPvcknibYLJJ7cSjpdWFkQ5OXiY6cC7y4w8zY
 a214rbeAE79TDkJojeuxrdOJy2qymj4nSlW/DIsphgC0JSVXpEI2Qltq1M0Spn98ZRVf
 Wq6A==
X-Gm-Message-State: ACrzQf25sdwhNxpvG/715YTiEfgw1BrMWCjNCuyHsUCTTQ9IPqhZ8xk5
 97M1Z8a88tzvEPYm32C36GVLmQ2bCt8Ytw==
X-Google-Smtp-Source: AMsMyM4B0bzR4HYLmVKeDmxxXXtyn6XOwOLw6Nygp6Xtdzqh83xGe20XMsmPrM7s0qLOTKUtzbbQGw==
X-Received: by 2002:a05:6000:2a5:b0:22b:d28:5b6a with SMTP id
 l5-20020a05600002a500b0022b0d285b6amr15936247wry.477.1664889001941; 
 Tue, 04 Oct 2022 06:10:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b0022ac672654dsm12836063wre.58.2022.10.04.06.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:10:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 01FF21FFE3;
 Tue,  4 Oct 2022 14:01:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 WANG Xuerui <git@xen0n.name>
Subject: [PULL 49/54] contrib/gitdm: add WANG Xuerui to individual contributers
Date: Tue,  4 Oct 2022 14:01:33 +0100
Message-Id: <20221004130138.2299307-50-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

His blog confirms he is not affiliated with Loongson.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Message-Id: <20220929114231.583801-50-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 6322b3476d..e19d79626c 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -35,3 +35,4 @@ liq3ea@gmail.com
 chetan4windows@gmail.com
 akihiko.odaki@gmail.com
 paul@nowt.org
+git@xen0n.name
-- 
2.34.1


