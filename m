Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230EA68B101
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 17:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOi25-0002Wk-F1; Sun, 05 Feb 2023 11:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pOi23-0002Wb-Jc
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:38:23 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pOi21-0004rE-PP
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:38:23 -0500
Received: by mail-io1-xd2e.google.com with SMTP id q6so3694203ior.12
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wLvgfRVaUDtECIcMGuwfJPisfB6xxR3143F7Ru8UkME=;
 b=tJruuBISEZGs/LAHHzl/u9cQUW+1GPcKt92jaXg3gTbqFtGWlcNcpeabtJMg7VeLkW
 spZRWjZjX/JJ+CW8P+lBbHCF56q/mue6ME5lGdR7kfT9vo1Ty/EGgV9NX5AizrVz+xcv
 XdJeNAA0rgdMQ1+eaLR7AQ4G/YHEJ4+yZc/O2JxZcS25Kvbmt4qSPL22h7aWFZlUZSbc
 2S5k2Qcc4iG/kbSym485hd3RN/5a/Y5Ri9gAwSF2egOjyUg5YvIgmST+1bTptCrmZnwS
 eZk37YGCUi9u2QxsKpYB/u65q54hLqk9MVQw7SdCc+7tLChNcgjjBpRZeRqajzM4Iz+f
 ENgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLvgfRVaUDtECIcMGuwfJPisfB6xxR3143F7Ru8UkME=;
 b=bhcw2vIkUwgxW6vcGqz+WawX4+vTgvbhqqjmqYBjukf+oAkcMvvxSBjYaFXkGJVrfH
 D4P1KWTNaekQcUSktP1KWdXRdb4pZvDT2sXOXKkOqNqUlOlr/VNxOHbxqYD/OdYYNVi8
 jBepA7NaVVbGSW0yA2CJpCvUimrWeEnuV5FmMM1tJTcNE2oAndQr+lYcvRMqt2Dq/YWz
 FWx8XQsWDqZN1MgBTL/zSPV9bOZYvRFVYeesxE6TnsRMair1alnP1+gS6z/AHDou1Io9
 dr26wyEQkkO16g7oFcF6QHNGCMMZVHJcjMTtqt9YCRuQycikDXD+b5sVVtXWwu1tZ3EO
 9PKA==
X-Gm-Message-State: AO0yUKVio52PzLQd+f/t/pVdNwwjomUv1YA3JtDfGcy1jVeNs8ZeBScX
 9EKrtmeGEju/Xq5DsNE3KNGR+9nSqx9QhVnlqtw=
X-Google-Smtp-Source: AK7set9UsBXT++5x1obymFRYL7uZmvCT3mB8in2BeLWGk5twdz1XglHs6aBqS78E9+2cMZjnJzEIGg==
X-Received: by 2002:a05:6602:2f16:b0:6e5:25a2:c63d with SMTP id
 q22-20020a0566022f1600b006e525a2c63dmr16690987iow.21.1675615099720; 
 Sun, 05 Feb 2023 08:38:19 -0800 (PST)
Received: from localhost ([143.244.47.84]) by smtp.gmail.com with ESMTPSA id
 f15-20020a6b620f000000b0071f4551300csm2417732iog.2.2023.02.05.08.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 08:38:19 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH v2 0/2] fix for #285
Date: Sun,  5 Feb 2023 11:37:56 -0500
Message-Id: <20230205163758.416992-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=cota@braap.org; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Changes since v1:

- Add configure check to only use QTree if Glib still implements gslice.
  If Glib doesn't, then we call Glib directly with inline functions.
- Add TODO's so that in the future (i.e. when the minimum version of
  Glib that we use doesn't implement gslice) we remove QTree.
- Add comment to the top of qtree.h.
- Make qtree-bench results more robust by running longer or more times.
- Drop deprecated API calls (they're unused in QEMU).
- Drop API calls that are too recent (they're unused in QEMU).
- Drop macro benchmark results from the TCG patch since they're too noisy.
- Add test program to the commit log so that we don't lose it in the future
  even if the bug tracker goes away.

Thanks,
		Emilio



