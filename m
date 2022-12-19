Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C410F650BC1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:34:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7M-0008Fh-5x; Mon, 19 Dec 2022 07:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F72-0008B3-4z
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F6z-0006Ty-6H
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id w15so8410655wrl.9
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmm1q5luVwlaL467p5wTRYN8zH7xh8m8zzkdleT8jNI=;
 b=zkHLP/ZfL22hTy1m7Ue/M4f0easnZTobPsr1h6/C2o6EQliThqdb7cS2iugh3oa5YB
 O7KNyEla1vzvpXA5fguerho5Nx0+oHTpoYXDPHHN4Sv8bR3GQVxZeoftMIgfKSN33sZV
 OmlRuBXxBu6x7AHmyGpVKYuF8//BPTLj4Qz+MJRpPJTNIFF05AEHvyH3c0wbm/iNnvQL
 /1iHKsYJF7UeGpVJN96ciB73YngO01op82A7xlVhTXftThU4et/B6MjGkCuGG4SQLxW3
 5WA+nlSfIm2MOZW6t3ln29lMSA5OboiMixSlZg7d3HHgHgU+gh4DG8i2hLu7B5Nuqoei
 ud9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmm1q5luVwlaL467p5wTRYN8zH7xh8m8zzkdleT8jNI=;
 b=dj5UbMnfNIi0Tc4+mFhdo1KkYOqMYSDRiK3W55fOfZvEc1KhaxFzDS/RVH++AVt5XA
 DwAY3Y66MBXBxrzUJVYSaTMwIKLadpUNcMrkr9e/YlF0Bg21aBvxP/WoYDOQ172BzGtG
 XAwtoL7lRlgIzViXr5UoSs+fQzH+PzNBKZ7RYsfPkWfSkdEYZyYjit0grtDShdV1CUJs
 TcH4HxK18Iuk7I+KNx8D0z69XYOFhIRhB3Y/k+n3zdkAFDFXyJOe/FZ3veJGQRaZT3BE
 CheCHQYPQMEzkQBsYkm4c++G45jekYCTJXdGtvLCalUQgkPXbEH7d055BhD2DiRZqCPN
 JgTw==
X-Gm-Message-State: ANoB5pmEhi4F5izS+mDMKerJ604iTz/9JkEnnX+yxY2vRlNa2ZuwwgRM
 5EpYftzz3Se70LyCdU6xTUVvNojehDhGJPAK
X-Google-Smtp-Source: AA0mqf7FkGZDkUqSq9UrHaNh0mkvi4ltZUU6e7tYYbv2gN9altSrhEQ203KUlf+GmFqy64S9RZU+Og==
X-Received: by 2002:a5d:4492:0:b0:242:3600:d221 with SMTP id
 j18-20020a5d4492000000b002423600d221mr26054160wrq.55.1671452355624; 
 Mon, 19 Dec 2022 04:19:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfeb52000000b002423dc3b1a9sm9812060wrn.52.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B15421FFB8;
 Mon, 19 Dec 2022 12:19:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Guo Ren <ren_guo@c-sky.com>, Liu Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 01/11] contrib/gitdm: add C-Sky to the domain map
Date: Mon, 19 Dec 2022 12:19:04 +0000
Message-Id: <20221219121914.851488-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Although the majority of the recent work has been done by LIU Zhiwei
it does appear to be a corporate effort.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 3727918641..6f3a24b399 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -7,6 +7,7 @@
 amd.com         AMD
 baidu.com       Baidu
 bytedance.com   ByteDance
+c-sky.com       C-Sky
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
 crudebyte.com   Crudebyte
-- 
2.34.1


