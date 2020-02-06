Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C317C1544BB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:20:10 +0100 (CET)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izh4j-0004Js-Sw
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1izgtm-0004M5-Sl
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:08:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1izgtl-0002Xm-R0
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:08:50 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37787)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1izgtl-0002UE-Iu
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:08:49 -0500
Received: by mail-wr1-x443.google.com with SMTP id w15so7117925wru.4
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFzPctSswEqSoqXGVcSnEJq7rCjL3sKfXxFcG8py+Lo=;
 b=PWTniORa2556aUjCWBZ0xnUJkT3lgrqkO4cOX40IqQmJeaNgDZB5MVPHlpDzbinRsf
 ITiXAVn91bCWcGJvJXt5oXohpMk1AWfn6KAv+GoeTPuRfGAhD+hJFGugIZEtD1NQMsPt
 10nDQhKEWPWtFWcBzHicRAsmjvbbMq5jTwQMzEon3ZU0CgT3fe1xNghSAlk1zpXswmCn
 Lcsf0fInS/Bh0vWNHF6GIGSMo95Z2XMttXP6+V46qn/Cc/J9BG2l5gex+yAp79UZSwZj
 FuW9dDC82I+H+tHCG/+ZmrZhginsAS8Vad5JusXj/eWV7iu/kwmbAim7kUBkUYhnmMa9
 8fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFzPctSswEqSoqXGVcSnEJq7rCjL3sKfXxFcG8py+Lo=;
 b=op19fFdwJ8CmCW3ky49XYIE8Brf4U2Nlmy+IUqDx3v18GSECVa7JzQXfA+pYwfiS4g
 1sJZUY4fc6P7JeRaZYWKVCrgxgzJ2POC7jo+L8p/VDbDW3nOGDAlJ+9d09/HYfHXNPqB
 zXSUO0mjjDx4L15GJrG3f0zl8fwkV9Cfp3pmBgTD+R6ZVzFZkh5WvGNpj1l2AA19Hy+F
 aSjIQVuB/38mMeaLe7I5nZNqDuXEu3y+1qmS9us5pZgG1OP67ObJBqFNK5pNk1oB2QWI
 +KxoGwMDcKtfyaoO/boJmHbQO2E2nRjg1Z9dNHOKxAayKWGayIH1hpNUB9oMKPllWHgW
 w4Zw==
X-Gm-Message-State: APjAAAUPo6CQ8TX7DIzwXaeVkwthDu6aEiapr42gvtCaAF6epi8f/44M
 sR3DJWDDKdM7OciUuXSQabls33b52eGXug==
X-Google-Smtp-Source: APXvYqzWoEE06z5GbU7aP/1g4lksZxTyNe0Kl26YfEg1FLdx1AAT9ql0+qn3ebI3PB4mDiG7arAfoA==
X-Received: by 2002:adf:f012:: with SMTP id j18mr3766517wro.314.1580994528175; 
 Thu, 06 Feb 2020 05:08:48 -0800 (PST)
Received: from cloudburst.c.hoisthospitality.com ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id c9sm4142155wrq.44.2020.02.06.05.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 05:08:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] target/arm: Reduce aa64_va_parameter overhead
Date: Thu,  6 Feb 2020 13:08:46 +0000
Message-Id: <20200206130847.11166-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20200206105448.4726-1-richard.henderson@linaro.org>
("target/arm: Implement ARMv8.1-VHE")

It's not really dependent on VHE, but there's a minor patch
conflict which I've resolved in favor of the larger patch set.


r~


Richard Henderson (1):
  target/arm: Split out aa64_va_parameter_tbi, aa64_va_parameter_tbid

 target/arm/internals.h |  3 --
 target/arm/helper.c    | 68 +++++++++++++++++++++++-------------------
 2 files changed, 37 insertions(+), 34 deletions(-)

-- 
2.20.1


