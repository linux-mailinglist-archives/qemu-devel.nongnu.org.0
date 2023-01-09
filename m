Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A4663176
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:25:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybr-00055N-Dh; Mon, 09 Jan 2023 15:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybn-00051t-VJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:04 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybl-00052q-Q8
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:03 -0500
Received: by mail-pf1-x430.google.com with SMTP id 20so1660511pfu.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hzOsUJrDFPXlUKqP2MAnpe7sa7vNVpr1DK0SSZYDLos=;
 b=s564FFbhAjnVOLFCuUiLF2v1gkMk12vQkTZ8tXh9tq2GgpAJu/b5CtT+oaNKfippWl
 genRghou15GVwj7aS6/ad6un5V6sw39PLpwllPZvIN/ZjXGhXvjbOGwrB6qmAP2Q8v2/
 CxB2mqyiUk94nuLr4274UKV+diWmui4JM1c894bBwo/yL235J+kQsAZnqMsQkSaYFJM1
 U9TWZ29Gx7lcEDaaemVujZNajx7By6+2AawSn1q+4lpubH7D2apllj61LzvYPAPWe70t
 MgHdEad9T0CTb3Z/jgi/8I6b7ASDjZ8puVQ8crVPCzV+famXLb/EOrbiwHNi76vb4oOC
 u81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hzOsUJrDFPXlUKqP2MAnpe7sa7vNVpr1DK0SSZYDLos=;
 b=4KWh/qTaKHNClXSk7OWlwVqzYFt+KMhoa5JhcoWpBWVu/PGJdp0gu/CIKEQP5YLkCd
 H+T8NLQvnTCjBQeBQfJMAIX8gfUhZg61Ul6I1wK7c8bpHkzDCnmbqZ7OcrN5TaDbO7y8
 Ccc/X/ouGyatNJAnNbjb2+GCDqb8dQQX8XafA7lQYKtmDQSxujgAi/VzLNAIqslCTwaq
 Zg/8GOAkrr7OIxsVEe1O195p+T1vkaxvTIZAhUe3XqrwYgggp75QsmQpsP+xoQoefV+P
 chdR/S7HslVE7kaJwbft49lym05cOF9gky1+Qpzfk6PlcO6kWlHnTTDRqLP+hXw1R9CL
 Roww==
X-Gm-Message-State: AFqh2kqO7Y1dLTh9HwNco5wWkvlYE7H5esxi9XQWiwLf06R77X9x+pEC
 2gZlYv2rbgrT+g1m4Ju8XjhAlrlGkTmJVRZ/
X-Google-Smtp-Source: AMrXdXtuT/rdgj5mf9zWDcjYSdwye722VS6RVX9Uibp+SgVg+0/zWODwgQktSSJVPK3D/htPotYhQw==
X-Received: by 2002:aa7:914e:0:b0:574:35fd:379e with SMTP id
 14-20020aa7914e000000b0057435fd379emr64185828pfi.2.1673295538123; 
 Mon, 09 Jan 2023 12:18:58 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:18:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 0/7] target/s390x: mem_helper.c cleanups
Date: Mon,  9 Jan 2023 12:18:49 -0800
Message-Id: <20230109201856.3916639-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

I discovered this old branch sitting around from August.
I don't think I ever sent it out.


r~


Richard Henderson (7):
  target/s390x: Fix s390_probe_access for user-only
  target/s390x: Pass S390Access pointer into access_prepare
  target/s390x: Use void* for haddr in S390Access
  target/s390x: Tidy access_prepare_nf
  target/s390x: Remove TLB_NOTDIRTY workarounds
  target/s390x: Inline do_access_{get,set}_byte
  target/s390x: Hoist some computation in access_memmove

 target/s390x/tcg/mem_helper.c | 289 +++++++++++++++-------------------
 1 file changed, 126 insertions(+), 163 deletions(-)

-- 
2.34.1


