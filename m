Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA80246A57B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 20:16:47 +0100 (CET)
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muJTj-0000bc-0D
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 14:16:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1muJQj-00072G-4r
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:13:41 -0500
Received: from [2607:f8b0:4864:20::102f] (port=44880
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1muJQg-0003Ao-VY
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:13:40 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso658030pjl.3
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 11:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sviRGKMhOweHeDoZLwUZvReqW6FG4Hmzah6r+rPVGI0=;
 b=YKAa5HfIKGWGjHiS8ePCFGZ7A8o0ivfzTSELIOP0QH/eWMIzjupmymvjTvEJaSmkED
 C5xb9PkVsD0prWdz6JpthqSktbFzbqMIe6vtZiKvzaxqXsDMv3UZMxyCtixBeCRMkYwq
 QN3SYitzwgFDUWJUqeXsa+kyftnLeWQAZsIaAt/uaybb+DdwUOlSU0HdFyDDsTkqlMXx
 /NtK4vAQw8rzYhST8AqP23Tq92lOewR0oraQ5k+CyU9KyoV7ybAkL4jeeV6SxvG6bjel
 MLniZgE+4PDVPbD91ZB0VilLn2KqQcZ8TtfNf2POGObwpcZyAVLhBlMcURc5aEGXos47
 hVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sviRGKMhOweHeDoZLwUZvReqW6FG4Hmzah6r+rPVGI0=;
 b=hdjUr1vxUjmEF0ZBkS7wiWj4oRFYEqrDw3AyCWMb9ay47GSlXhD8VXv6w2MLhCvrYq
 SgvvLYOTY7WEReokRAxCiifVLXC831xXPFmW76cmutiIradwkXWznpAC50wnE/eKK1rW
 G83zV1b+nAqvmOd179ZW2MPm+Q7P+J8P8ESreVJIqv+7kbhy2sWHaruzU5xPSRMkBbRT
 4DE6OPE9w6UTQcPWLA/CgYMx1iwFygXt4n85T4c8oXCRTEKPdOJdNb764aoTAA5Dk4cv
 /J5x5j/LHqWMjlXSP3RAxoe19Y+tevaerp6inDJCgkzNH2ElFPY37rfj5hZPUgkginRL
 of3g==
X-Gm-Message-State: AOAM5317t/7jBRnFKj2uEK3SczXmJ52DsU0Ss3Hl68zJq40ZO8CBp4oj
 3VaySurEVCqk7bblMBjGELN4OON4VRECsA==
X-Google-Smtp-Source: ABdhPJwhrswDlNC36bk+O+AHW/oiR7beGbuJoHUVOBNaY5Qt36xgZjiwarnwXjouV5jpxvjn4i7giA==
X-Received: by 2002:a17:90a:4a06:: with SMTP id
 e6mr553988pjh.228.1638818016608; 
 Mon, 06 Dec 2021 11:13:36 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k6sm131225pjt.14.2021.12.06.11.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:13:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/1] tcg/arm: Reduce vector alignment requirement for
 NEON
Date: Mon,  6 Dec 2021 11:13:34 -0800
Message-Id: <20211206191335.230683-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, elima@redhat.com, alex.bennee@linaro.org,
 rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Re-post of

  https://patchew.org/QEMU/20210912174925.200132-1-richard.henderson@linaro.org/

fixing

   https://bugzilla.redhat.com/show_bug.cgi?id=1999878

which seems to have gotten lost.  In the qemu-devel thread,
I did successfully reproduce and fix the assertion failure,
but I never got Reviewed-by or Tested-by tags.


r~


Richard Henderson (1):
  tcg/arm: Reduce vector alignment requirement for NEON

 tcg/tcg.c                |  8 +++++++-
 tcg/arm/tcg-target.c.inc | 13 +++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.25.1


