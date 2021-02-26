Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B34732656E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:22:44 +0100 (CET)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFft5-0005if-5L
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfqy-0004PM-SL
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:20:32 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfqr-0003lo-QX
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:20:32 -0500
Received: by mail-pg1-x52c.google.com with SMTP id p21so6475359pgl.12
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kR+rPkyn1eaB2xjiJv9Rpu4FzKJYlJu2en4dmmFR0No=;
 b=sniMn1PKuw3PPWl3AW+U5UhHVPkEYD8LaTMhFdnFhNjnw+BFbpavjhpaqwD+F8fsDM
 DH/Dtf6FfVlsr5Fs1Y2YHJDJrD3MrxZOG8xj1IusQpk3682wS/0n0as/MfjONpkTL3d1
 pto8QGVjF0smr+NU5NKnBVowRuuU4rodbq/pf+3F+9i7pJaCZ5AWNePu73avIoRXhCOz
 6o0kR8ttodQPY1bEW3n2rlp3+t3Kfl3HVfQmgfRMimt8cGF0ZBkLMqFJ1ccUJB4oiqd2
 csMQV5o+MNrgT6dfctj6/AjMLtwtw20YMFhaxOdumFPCXFLELW1l2UHQZyIjQMNckhBw
 K8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kR+rPkyn1eaB2xjiJv9Rpu4FzKJYlJu2en4dmmFR0No=;
 b=p7WYuw5fTYnXaq4JmSm5J7ne14yomdcaTYrMO8MChrZnEWHUpRTQ/oKhfTxVf1UXH1
 og1/OW5M2wu5uXHQcLTYNa7QoiZnhUfL6ChCLyxPXGJu7s+y1CMOs13K6TxpE7JC2FZk
 qwMeiZU4hkKFEPvUR9A2+q16kIw2pfbICYh5JE6TX7k9jnkMjeMRz8fgIMl1g2Tg8rRC
 stWNfvplWprlfmgKqB+YRRdmq2F2JFsvY6MSDwMYRx5Qy2m7gfA15pY3zg4xdGM0K06P
 BIhCKQtb8CKK+fHD3Yg7dg1AnrCBGvCjS+1Mo4CuLhwLxqHvE9oo2z8nDY1tvm2VIIdJ
 EQcA==
X-Gm-Message-State: AOAM530JzPQxyG6MgVN2zHD7oXCaCVCOE4e39Q+f1RLb0Q60HfVwhUF/
 VWjt9EyiF+JsNBlzjTWYJxDN8KOri0qN9A==
X-Google-Smtp-Source: ABdhPJxmH9N7n1taTvWq5YLUJPsrJZGnnHmyJUoRs4dUjx6PxcIEZo+56GqlwoX4HpTXryGsV4u4hA==
X-Received: by 2002:a63:494b:: with SMTP id y11mr3470596pgk.99.1614356424162; 
 Fri, 26 Feb 2021 08:20:24 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 6sm9141291pgv.70.2021.02.26.08.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:20:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/i386: Fix cpu_x86_{fsave,frstor,fxsave,fxrstor}
Date: Fri, 26 Feb 2021 08:20:20 -0800
Message-Id: <20210226162022.375654-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, philmd@redhat.com, cfontana@suse.de,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As discussed during review of Claudio's "i386 cleanup" patch set.


r~


Richard Henderson (2):
  target/i386: Rename helper_fldt, helper_fstt
  target/i386: Split out do_fsave, do_frstor, do_fxsave, do_fxrstor

 target/i386/tcg/fpu_helper.c | 65 +++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 24 deletions(-)

-- 
2.25.1


