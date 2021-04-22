Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5E0368665
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 20:11:53 +0200 (CEST)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZdnr-0000pf-TN
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 14:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZdkW-0008Mb-HM
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:08:24 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZdkU-00043m-Aw
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:08:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id y1so8291493plg.11
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 11:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XC/OyFyZvtaiJYSgxp6MQbeRSdCAzqhE8CCOKzuY9zI=;
 b=YQ8WXGTNiOmCymbH1zQ+d2C7lI/52eZC74s2pguI37KMnlwVAABTfmbOYnsClCuZMO
 mY1Shoamf5b2+j6/1ZkI8LIufmTo5ob21r9gzOzCyGRPbgZrDLq9m1ppEOHXPp6z0CgG
 eUwuWxdhpZb2tumhEqd2dVeeUv7RqF+wjHTR9+edBC887q38dTHU9zQdvykcHlE6db17
 EnlNXov/pQKdCuI79lV6Mr+sr20fV42z2CIjiNiJipcgM264IFRFBqKKEp3YOSW5BKw2
 tWuUs9UGfovTDpvIFsYqXFZwfcS6rume9VlK+H0UWt1if4sGIenPVqj9ZtBb18gD4jy5
 RbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XC/OyFyZvtaiJYSgxp6MQbeRSdCAzqhE8CCOKzuY9zI=;
 b=LTNXfZhg/dOW+FHoX8clfM591k4DguwpjNfxRi5QCZzTTYNfMxcapVC5jzyxRCZtbt
 i8guWixuR+aGNlQz3TUDBFvo04nG939qS6TDdCHsbK8/NwwwDpRiFg/iyVOQrGT4V59m
 Pfu6LrtHL/K0TNsjXon/KcfjGGTwoJjX/fsP5mgMPbhFeOCnXgQWMD5qlp1bVraTNHVw
 UxDcGZg43M0mErHf5/zWsQx+zwQmclgqs8Q62pc+ztsi+pQXwspRd93owbeSMqSQNIPw
 ZVQdIpOyqfpu5moWAMyemfMlFoMDIZ+BdrXrMKSIdZTMLEI2czZaUi57xJ4ZJ9r6ydcP
 25QA==
X-Gm-Message-State: AOAM532x2fgywl77TpMBhK+nLZzv6vKdoYpPFwqj9uZKfEOV5V3CBytn
 Jn9Ww6VNHyWIU6kgyLcrhVTcVi1w8o4Bcw==
X-Google-Smtp-Source: ABdhPJymbj/06r/4xAV/Kem8xSY8Ftplzq08c1rsZAtTjUr7luzV8ZCTgpDnU++Ji1tFggnpsqf5cA==
X-Received: by 2002:a17:90b:368c:: with SMTP id
 mj12mr6555pjb.186.1619114900416; 
 Thu, 22 Apr 2021 11:08:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q6sm2606508pfs.33.2021.04.22.11.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 11:08:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] linux-user: sigaction fixes/cleanups
Date: Thu, 22 Apr 2021 11:08:17 -0700
Message-Id: <20210422180819.252121-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alpha had two bugs, one with the non-ka_restorer fallback
using the wrong offset, and the other with the ka_restorer
value getting lost in do_sigaction.

Because do_sigaction didn't see TARGET_ARCH_HAS_SA_RESTORER
(which is correct for alpha, as the field isn't present in
the structure), we didn't copy the field into our syscall
table.  Which meant that the extra code present in do_syscall
to stash the ka_restorer value was wasted.

I believe that Sparc has a similar bug, but this one was
worse because it was modifying the user's sigaction struct
that was passed in.


r~


Richard Henderson (2):
  linux-user/alpha: Fix rt sigframe return
  linux-user: Clean up sigaction ka_restorer

 linux-user/syscall_defs.h | 17 +++-----
 linux-user/alpha/signal.c | 10 ++---
 linux-user/signal.c       |  4 +-
 linux-user/syscall.c      | 90 ++++++++++++---------------------------
 4 files changed, 42 insertions(+), 79 deletions(-)

-- 
2.25.1


