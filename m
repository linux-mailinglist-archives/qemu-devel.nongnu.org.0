Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F14B543E70
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:19:53 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz35j-0004lv-Ap
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz336-00017n-C3
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:08 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz333-000698-9b
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:08 -0400
Received: by mail-io1-xd32.google.com with SMTP id y79so1718870iof.2
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yHn4bD+T/kjxOdFTFg0Wx8Q6xxBzVenEU9DxlhDoVhI=;
 b=Nj04MBeuIhqgK+emAzLfGVRlTVp5uriKxYwqpTHcDMM/FkDDehQzpQ7wqhRw0ZKh59
 unVzgkp+UwydJxhX0BSlF1ju3Ze+UxUFTI5fm7oQoKd1+Kzz0irXCdL9z+Z24FmF2GqJ
 MN09BZ3K5JWT7oXQuHzmH5IhgPO7w1XDYVKAQzPrwEosh0YeRo8S+JjW6aktsh7eDpBf
 WVW+A1SVsGquaq6tmgZpaebwWRHwH4r+iiz8MLbnlvo5di45GMqmE4vhOX/Sx9hWHFr2
 0P5h486mk3DnjXb7yVXUyShFyRHbj8KwPu0nJUU33DcOwHafrDAQ0Dx4KNXAY3vFAJqe
 znFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yHn4bD+T/kjxOdFTFg0Wx8Q6xxBzVenEU9DxlhDoVhI=;
 b=x6vZMpz/jyKHZD4Z2XZQ+5Pz78yw9GFdzijIeh8sHly1v7nsuNgRmO8GKUDej1pd2i
 DfqwnRKWYiGQvM96Ua7Ob3PG5zx5+XqA30W2ZmntS/WO1eErKlZYbJY+v42KNq0kN5nb
 nI8xvRTIBmvVOCgz7ApHA52Fo3r58GJs4QZHyOixNf84oUp2l+EWEjvbtrBPpCWMkKkw
 NPDydXt2i9yWNZY+DkVLQGbz54GzTOTEU6a9wA/FvisIWqyzoGcvGI3CWM+4V0QLPesd
 rwhuaFvMuK9ORAa0zcp1VuCAE4sHL24QEK9o0tOvKr1HPqb75i1Kz/dIVeXUKRksnIy/
 d2YQ==
X-Gm-Message-State: AOAM5312dRlQiRuq4RJxW/rY/lvAVwdH+QoFD7w2CHcLxGMQQOuTxyPN
 hkjiYLyBC0kgM8UYW2hB3IUeBWyBTEtgow==
X-Google-Smtp-Source: ABdhPJwhxD65ZgpA1PzB8DhU6O6oRkjRX0qLh42D3EpKdrHxO2d/XpRy8sYBrsMHrlhm2qkq1uG99g==
X-Received: by 2002:a05:6638:1409:b0:331:53:a88c with SMTP id
 k9-20020a056638140900b003310053a88cmr20002349jad.27.1654723022159; 
 Wed, 08 Jun 2022 14:17:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k29-20020a02661d000000b0032ead96ee5csm8418552jac.165.2022.06.08.14.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:17:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v2 0/6] bsd-user upstreaming: read, write and exit
Date: Wed,  8 Jun 2022 15:17:05 -0600
Message-Id: <20220608211711.56158-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches continues the effort to get system calls working
upstream. This series was cleaved off a prior series to give me time to rework
based on the feedback from the first time I posted these.

       o bsd-user/freebsd/os-syscall.c: lock_iovec
I rewored to use g_try_new, as well as fixing bugs in the 'after a FAULT
handling code' Created a common routine to cleanup after errors that can
be used for the unlock_iovec.

       o bsd-user/freebsd/os-syscall.c: unlock_iovec
Fixed the error handling to be consistent with a normal unlock_iovec.

       o bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
Created the wrapper function as suggested in prior reviews.

V2: Use g_try_new0 and simplify based on not needing to initialize things
to zero that are already zero. Only affects the 'lock_iovec' hunk.

V2: Remove inline tags from do_bsd_* routines.

V2: Clean up logging a little

Now all the patches, except the last one, need to be reviewed.

Warner Losh (6):
  bsd-user/freebsd/os-syscall.c: lock_iovec
  bsd-user/freebsd/os-syscall.c: unlock_iovec
  bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
  bsd-user/bsd-file.h: Add implementations for read, pread, readv and
    preadv
  bsd-user/bsd-file.h: Meat of the write system calls
  bsd-user/freebsd/os-syscall.c: Implement exit

 bsd-user/bsd-file.h           | 163 +++++++++++++++++++++++++
 bsd-user/bsd-proc.h           |  43 +++++++
 bsd-user/freebsd/os-syscall.c | 217 +++++++++++++++++++++++++++++++++-
 3 files changed, 419 insertions(+), 4 deletions(-)
 create mode 100644 bsd-user/bsd-proc.h

-- 
2.33.1


