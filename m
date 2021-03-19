Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA4341E59
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:31:32 +0100 (CET)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFDv-0005w8-5t
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF8Y-0000To-Gv
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:25:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF8V-0003kH-7V
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:25:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id 61so9094767wrm.12
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j665TjhM5QLq44DfBf+bJ2/D8M1KJ7ZU5RVFKMjbxY4=;
 b=FqCp7viG9VcjNWGJXWO3PMdiILkg+Eol/J9wFyOYigU0EK39A8J/N6nn3QjOK/Dzc6
 Qr+KEycFH15EwfzfLZDMoxqoljXWhMWSpZymOlH7GI3wog9qGeeulYv9ARdO7L3EUoIB
 zdFE2DtLZgBIXgOnMJgda5l8eYWdGUsu5QQwgRN4kjsGzrT558gOhsuxwDZ5yPF/+tV1
 zPp5CQeHIYWJ9Gje4BSQYghc1DXZmib0LgFL1JOSS8KMpB/sFWKHukIGm3u6S/a/oOMI
 hOb40gskdT/OtJwJ/OPBs9P12h9nbraIh34jwJRU8GMH3zoDh1SpvzQMrDKvkkDBp+pu
 VxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j665TjhM5QLq44DfBf+bJ2/D8M1KJ7ZU5RVFKMjbxY4=;
 b=Td5L6eNa/QkW2PmogsqfSPP2LShWx+hbImemIF985zj7y7pAfVeTngY6QNq2pPgErG
 ILWGjpaI5RvTwICubMIhVLDcDpwvWYasIENFwRpgOPsmr1DNsjm9FT5VUqQoeyvqvhFL
 fsZ8pDJ/lrjeFrb1M/5MzAgEL1tgU9RM6ZHcHPmWb9zLYArNVhVAEMjFhDg/Gk4LZt0E
 6c4ajCwZd1v2inqyEfq/fjk6PwCQzMye69Xj8IXLO6OKW6D0p5uGBJzjnMxm5Vsm1ppc
 FgWSqQhcrsvlOlTot7a5CnwE6z95jF3P8lBzfriWEHp98UCr+u3St9o1jDyb8FR/z4Mm
 Q8Ew==
X-Gm-Message-State: AOAM531g+Tsy6Vxvu/qrfWuOi9CWZ/KIr1UPSdi+exIT7pv7vu0fWCxF
 fFJCg4959MBlJ123w9bDRq9G2QUAgy8=
X-Google-Smtp-Source: ABdhPJywvQ0OTFHBLmy6Tue+555FBR53EkeUG0djz1zIYPF51krBWyPzoxsyTPU5X0FCni2J3T0QPA==
X-Received: by 2002:a5d:6052:: with SMTP id j18mr4554944wrt.295.1616160353032; 
 Fri, 19 Mar 2021 06:25:53 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:25:52 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] virtiofsd: Changed various allocations to GLib functions
Date: Fri, 19 Mar 2021 15:25:19 +0200
Message-Id: <20210319132527.3118-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced allocations done using malloc(), calloc(), and realloc()
to their equivalent functions in GLib. 

Memory that is allocated locally and freed when the function exits
are annotated g_autofree so that the deallocation is automatically
handled. Subsequently, I could remove a bunch of free() calls.

Also, tried to keep the semantics of the code as is, but when the 
allocation is a small one, or a crucial one, I replaced the 
NULL-checking mechanisms with glib's functions that crash on error.

This is related to a patch that I had submitted as a part of a 
previous series. The previous patch had some errors. Also, I thought 
that it's better to split the patch into smaller pieces. 

The previous patch can be found here: 
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05153.html

Mahmoud Mandour (8):
  virtiofsd: Changed allocations of fuse_req to GLib functions
  virtiofds: Changed allocations of iovec to GLib's functions
  virtiofsd: Changed fuse_pollhandle allocation to GLib's functions
  virtiofsd: Changed allocations of fuse_session to GLib's functions
  virtiofsd: Changed allocation of lo_map_elems to GLib's functions
  virtiofsd: Changed allocations of fv_VuDev & its internals to GLib
    functions
  virtiofsd/passthrough_ll.c: Changed local allocations to GLib
    functions
  virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib

 tools/virtiofsd/fuse_lowlevel.c  | 43 +++++++++++---------------------
 tools/virtiofsd/fuse_virtio.c    | 34 ++++++++-----------------
 tools/virtiofsd/passthrough_ll.c | 21 ++++++----------
 3 files changed, 34 insertions(+), 64 deletions(-)

-- 
2.25.1


