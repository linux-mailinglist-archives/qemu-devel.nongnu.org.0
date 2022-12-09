Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AB4648152
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bDh-0004xv-3J; Fri, 09 Dec 2022 06:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bDD-0004wf-PY
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:06:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bDB-0000Ze-Vk
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:06:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5491817wme.5
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVisY9a4g41Z/A8vrAvFNSnIhhOR0GVsG193XjnQiko=;
 b=T48eZ1DC7bjMmD6mAG3NuEi7e2uphrPwZmuAKbXEYG2QxN6NwbCi2WKiwbmKbeCjN5
 3FOPwX2Ll19YPJIW8MuPOr0WEVU1IttQWMi12QAzArlg2+nNM7zAOC9PPaZCKduMViXM
 56JzUi4YbQqkSpw1OeBy7SscQ7sZBxw2V7ryHGI0PBiffcCpPropjr6ozGnvJ/SxchEY
 EDBfY9gNmWBR2aKHOO8zU/pOUzKbCId3t/9NsG9tKhlU3g/MXbJ8XGiwZSCwTYjdwEIZ
 HCdPBjkBi9+oTflevH5TCNcjJv15/h/Km6K0XkEVX4iex5EU/JB4N/59zSf/igFXUskU
 2sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVisY9a4g41Z/A8vrAvFNSnIhhOR0GVsG193XjnQiko=;
 b=Qc3BYwRmsQBnqXArMtZHiMaVX11xl5hRrOA995W3vji4xVgmFvUZdGmg+JCFoZRuqx
 OtAklvNDq1Af213hEvzF00XWe3a9ZSGwgfrUOfW4kvfcB99RhTZW19M0pCndqJDdRiZK
 w8aYMSIAlp2NDjmospXZ1rGf7Nzhe7t05bzGds28CNW+OXQr2Sm622wQKFV72drdJS+z
 /Fz2/UZjOxVMYPuN5nOnggn2m9//GJdZr6piR7uxbx1r90NTbP8k9bY07j8DcMKqwwq1
 GLB38b/ueIvpdcyNcaj6hCPWlBpqjBWEXgC10ok5yfNAefvYV/TQhRis3+MQQymQMf/i
 HfWQ==
X-Gm-Message-State: ANoB5pmJVVvHgTI0qza8SqEHHyAkrnRD8mPDs1cQBEbMotpdxyVQrzS5
 vnt0khr83iO0HPXfHiRKKp1AB4qX84Uqq+m6giM=
X-Google-Smtp-Source: AA0mqf5RG9zKkPSmq6zZc460fRcfWxQooUq08C3pSHDJUIdVFS8qrgBg+ahZLEF+7LTnrRX/NV42Cw==
X-Received: by 2002:a05:600c:1e86:b0:3cf:81af:8b73 with SMTP id
 be6-20020a05600c1e8600b003cf81af8b73mr4405489wmb.23.1670583995620; 
 Fri, 09 Dec 2022 03:06:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 dn15-20020a05600c654f00b003cf71b1f66csm1860142wmb.0.2022.12.09.03.06.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:06:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v3 0/2] physmem: Remove trace events from trace-root.h
Date: Fri,  9 Dec 2022 12:06:29 +0100
Message-Id: <20221209110631.59031-1-philmd@linaro.org>
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

Trivial housekeeping patches.

Philippe Mathieu-Daudé (2):
  physmem: Remove unused "exec/translate-all.h"
  physmem: Remove trace events from trace-root.h

 softmmu/physmem.c    | 3 +--
 softmmu/trace-events | 5 +++++
 trace-events         | 5 -----
 3 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.38.1


