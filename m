Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A654370504
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 04:31:14 +0200 (CEST)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcfPU-0000E8-Ou
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 22:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcfNo-0007N7-Ag
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 22:29:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcfNm-0007Hh-Lt
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 22:29:27 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 20so33617591pll.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2GGbGpAIqXUvvXeuggaJtKvV34ClqVjEhrAxTtbzZRU=;
 b=ueuA4E0WDWV/5KNMt4Ab/AuXG/qHzPXwfCZy74Qk979kUtffi4Ixcv8/cGxwmkfRmc
 HsYiknU4l9xVe5mPznvDlgDmxQp1pZnVo3yBDc+trt6VEXNdFpnntHqAcgEQEuWZrnk9
 AVadJ+Iyv79fLUGN9LYiuMtTRxspURzYe0ZaUK8G7x+L4SOGsPbZizwAmXn+ZgomUiPc
 G9cKa58nA8cEUO3kD+SQz5XtfteuzWt+yMskGQITam8QeIomWV7f8JFO4n73rcm9yU/V
 Ht5NpFjEhyRq4XMXUHtqtOWhAMSdqdiLivXfky4WdFLQ+rU7GPPjks7eAHpOcOyUre5o
 rY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2GGbGpAIqXUvvXeuggaJtKvV34ClqVjEhrAxTtbzZRU=;
 b=AP4hjBZpvhMKq+EFXLpgm2K6k+lX854GKz3XbRHfbxFFALlNnY24IkLtGzJDAurO2O
 xbDUYS6Uq1LhWvhoF2dv2Pmqg1J65vAR/Z+/DTuUU5NgYoQXoL2fuuvzUUOha3dHjD6u
 bPuIitFAKDT7rU18IqgnqmBYL+iC8RxjR5XaF9y1IUnm/NQGF8GEe23/OrpOU/xuQCRO
 E2HP9qorgekVdwbFrBnVlGNE5jh1Xy0Tu+bxyB1EM+Rp9MYJ0wD3OgAXBNC7hFn48tfw
 jd/HtH8XpEHAHqO2sYn7Ig5mU/25KWp/+Y3kI7ZxAsVC4cP1lqBUxy0GTmpAU6SwP9yc
 T4hw==
X-Gm-Message-State: AOAM532eM2uodFwJ3+VMz36e2ws7OCLGAKvq6WS404AcAh+za/XgOXDy
 uIWfpeT0BvwIogrJ2GWDd+tKOip2Pmeihg==
X-Google-Smtp-Source: ABdhPJx/TgrJSYI/rIiCt0sVgZL8VtpRBTbRyAkbYkHHv034y1E7GivZDRp6wf1Y6jn6cs2fEeOFYw==
X-Received: by 2002:a17:902:bc88:b029:ee:7ef1:e770 with SMTP id
 bb8-20020a170902bc88b02900ee7ef1e770mr8295491plb.19.1619836164862; 
 Fri, 30 Apr 2021 19:29:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n6sm684905pgq.72.2021.04.30.19.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 19:29:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/ppc: Clean up _spr_register
Date: Fri, 30 Apr 2021 19:29:21 -0700
Message-Id: <20210501022923.1179736-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: qemu-ppc@nongnu.org, luis.pires@eldorado.org.br,
 matheus.ferst@eldorado.org.br, bruno.larsen@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a fleshed out version of the pseudo-patch I posted
in response to Bruno Larsen's "untangle CPU init" patch set,
specifically to replace

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg06754.html

Plus, ppc_spr_t can use some love to match.

r~


PS, I generated this vs master, so it might not apply without
conflict against Bruno's prerequisites.


Richard Henderson (2):
  target/ppc: Clean up _spr_register et al
  target/ppc: Reduce the size of ppc_spr_t

 target/ppc/cpu.h                |  12 ++-
 target/ppc/translate_init.c.inc | 154 +++++++++++++++-----------------
 2 files changed, 82 insertions(+), 84 deletions(-)

-- 
2.25.1


