Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B418E34A12A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:53:04 +0100 (CET)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfP5-00032S-QE
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zachr@google.com>) id 1lPdjJ-0007Bm-JX
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 00:05:49 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zachr@google.com>) id 1lPdjH-0000Gg-Tx
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 00:05:49 -0400
Received: by mail-io1-xd2a.google.com with SMTP id n198so4163484iod.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 21:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=u2FSaFwHNbuIXo4Rj4KNZuMAQhbdV0hxmCSzZBy+Abc=;
 b=uJlv6F1bzZuMU7O7z7ZKRR3VLa1E/lFw6/pziakjv9dHI/9nrgPNgkRo8OkShfzuR2
 TODAFOoNt47zs/1IsMC+HRqcvXN+MTHGd3o5kY8UPsYGv5XhFt4w4vbPyTcUcax9s9q4
 MdyugdLSd8mLOcO1lleZs/4smzq59o7OAR8NdJyup3V2D7/k8uJg0CwsQoyGui8cAS37
 DwHlDV/C5J8A89GB2tDMzzer0UWC9p3AEjMnNdILpgOtskPLbYDiLARP+qlLoh6uNII2
 zFBoXaYo0zSeqD8WUQi6MnKJwLYMWAnLtfI93gU8UO8bQe/FNYNgImMBGGz3R9LpghF7
 rZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=u2FSaFwHNbuIXo4Rj4KNZuMAQhbdV0hxmCSzZBy+Abc=;
 b=Xbcj2kd9mt1vB9NCRp7JUwQykqXl8U+4msMyWFVywSIQSPm44wQKa9ik/7uLYcpqRH
 UJW2cu994b9N7ShXRK7avC2rc2Y9fpPfpQs4rg8ISjDUWhpVyHZhwfIBne/lXvnc/akP
 Lb2liUbGRQfNhR0nF08XM7s1TP/d8Ako4aG5zE4K2oV8rR2R7t8mF1+vGNXJRvI1SxiE
 DXW87ULaCJ2VSuytYwPNPvuLWy46/4qx6CqFBUUaJZSavZ6O5RHD/jS4+Y1I1a4yrfy+
 N6EJ6bfv+ECmqyHiVmhlerDK25ElyptJCVyFoxK211YsN2QyBglOLKmtdGT5SSL8UpIB
 QYag==
X-Gm-Message-State: AOAM530TSUgKm9Ntn/TBdu8obeNY87V7Zqc3uyqlm7L+PUuREHDOQLCb
 /BXD4CDlcKlvFWPx2DqO/Zsp3FjzpumcsuCSJzDpOEVHkbJfFw==
X-Google-Smtp-Source: ABdhPJzS7G2z5aogWOTYicUWod36iElL2okpoxBLsQLhFIbTQREZWEN2kwalSOZnnVVhlSpgztN6OcnRAbku6lG115g=
X-Received: by 2002:a5d:93ce:: with SMTP id j14mr9053470ioo.172.1616731545078; 
 Thu, 25 Mar 2021 21:05:45 -0700 (PDT)
MIME-Version: 1.0
From: Zach Reizner <zachr@google.com>
Date: Fri, 26 Mar 2021 00:05:29 -0400
Message-ID: <CAFNex=Ddc_9Sta2W+_a90Qg7hCidMhxuqmGuggygfWWCzZdBhQ@mail.gmail.com>
Subject: [PATCH] linux-user: allow NULL msg in recvfrom
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=zachr@google.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Mar 2021 01:50:09 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel allows a NULL msg in recvfrom so that he size of the next
message may be queried before allocating a correctly sized buffer. This
change allows the syscall translator to pass along the NULL msg pointer
instead of returning early with EFAULT.

Signed-off-by: Zach Reizner <zachr@google.com>
---
 linux-user/syscall.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e508576c7..332544b43c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3680,8 +3680,6 @@ static abi_long do_recvfrom(int fd, abi_ulong
msg, size_t len, int flags,
     abi_long ret;

     host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
-    if (!host_msg)
-        return -TARGET_EFAULT;
     if (target_addr) {
         if (get_user_u32(addrlen, target_addrlen)) {
             ret = -TARGET_EFAULT;
-- 
2.31.0.291.g576ba9dcdaf-goog

