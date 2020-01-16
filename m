Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1213FB0F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 22:07:32 +0100 (CET)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isCMV-0003mI-44
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 16:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1isCKc-0002Nu-OB
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 16:05:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1isCKb-0007MJ-Fj
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 16:05:34 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1isCKb-0007L5-7f
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 16:05:33 -0500
Received: by mail-pf1-x443.google.com with SMTP id n9so10805624pff.13
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 13:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvqPUgpaZfcUsQSa6ZEMkKOaHgFwFZ9sq6r67MntjgA=;
 b=Ua6nYxEuLJc6F2Fpg+qhcq3H2oR1tfaMQHJ97OI1cJNqh1UZoJ8ieMLswxT/QUYAYN
 BMikLGstPZkfeKCWCg8FHRJ1EdV3FGhwMabZLjR+NU36vl46Rz3M7ZrYEPJ/R3mipfAZ
 eUQNbATe5LDLqexU3zEXVtUqsbhzQkv3rtbkx7vXp6jOBLhf0XprFLsegiy96XTRM7jO
 sz51Ub5oUZYSKNNoH4cRN1bej5aZQSAhcJgVdt70LiqmMSHBWJ5cbv0S43qtEMC1/gWT
 c1Idlomb6yMbpgULEijoc83WcdPvKRQA006U45UWKzpT0lhVeF80/pNBvgeAHQjxsyf8
 Q0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvqPUgpaZfcUsQSa6ZEMkKOaHgFwFZ9sq6r67MntjgA=;
 b=FFpC3csZboBDFblZhhaB7SIKGZh0ohCKGyAEpCpcIFOgHrvzbZpfwHsxfDeJ2sfJEu
 OrLV9WtUcY2ffdjAJ9WIXfFIIJru9hLAA1/HsTVXgtSpcRfK7BP7/XfBP+jNVipCfP9B
 ZKGJZfpti/T3Z+NmCmkf+hfhUbHREeXcclMOtR6I4xKua7Iorl85a/uKdzpEdz+oetMu
 4MGJm28z9aTEjcQkGss1DeP7Rc+mmXV1xOrWGomcMy5dafTKUp019lkcI0OZ6r4bTBMQ
 XbV9hRekgR961aXTgZnjMa6fqC1do3qAoyc7yvGPNDCUbVKTodOOKS1/5grf8OIk/+JQ
 Ni6A==
X-Gm-Message-State: APjAAAUqMESVuKYZ5hCZ30NydhzEdYu9Y3tyXZGoT1nxiiyzY7gCDeEd
 fvGfj5/7G+dNr77D6rv8R+kQzfvJnr0=
X-Google-Smtp-Source: APXvYqzjRJV7OW4277BWCAyGDki5yAddQytr1JLQVGv8QaxqiYfoX7KS8CZHcZ9ihzyogbtgeLfbBQ==
X-Received: by 2002:a63:6e04:: with SMTP id j4mr40624723pgc.175.1579208731631; 
 Thu, 16 Jan 2020 13:05:31 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id k21sm25494907pgt.22.2020.01.16.13.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 13:05:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] vl: Fixes for cleanups to -accel
Date: Thu, 16 Jan 2020 11:05:24 -1000
Message-Id: <20200116210528.31953-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, aleksandar.m.mail@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running qemu-system-foo with no options should not generate
a warning for "invalid accelerator bar".

Changes in v2:
  * Rebase on master, getting the free accel_list fix from upstream.
    Re-word the resulting patch 2 to merely reduce the scope of the
    local variables.
  * Use g_str_has_suffix (ajb)


r~


Richard Henderson (4):
  vl: Remove unused variable in configure_accelerators
  vl: Reduce scope of variables in configure_accelerators
  vl: Remove useless test in configure_accelerators
  vl: Only choose enabled accelerators in configure_accelerators

 vl.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

-- 
2.20.1


