Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C312D544E3F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:58:40 +0200 (CEST)
Received: from localhost ([::1]:40002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIgJ-0003EL-Pj
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHFj-0003XV-9t
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHFh-0007l8-PV
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654777624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OJ35y0+suNcGhXxFx3Y2EoRLWmUYK4rmwszgCk1eGlg=;
 b=SAtrCYxX+psXkc2FLwPeD7rK+2niHgtscMFvCVnwAz1CjZPCjn7DM7XbOIoOpazmmenFsI
 SjAegtQwJLqN0VaWQYYgHcQXQ9j0+ndeK/TYHCAb2P8Ri9pInUYCHRHu0pqLTK/o//KLh4
 KvsNGsolwO9BoJXYbA6DgoUuErSzXKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-avSjfUJeO7qkhuAVB9Ue0Q-1; Thu, 09 Jun 2022 08:27:03 -0400
X-MC-Unique: avSjfUJeO7qkhuAVB9Ue0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 127368041BE;
 Thu,  9 Jun 2022 12:27:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBD6D40E80E0;
 Thu,  9 Jun 2022 12:27:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/3] qemu/qsd: Unlink absolute PID file path
Date: Thu,  9 Jun 2022 14:26:58 +0200
Message-Id: <20220609122701.17172-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi,

QEMU (the system emulator) and the storage daemon (QSD) write their PID
to the given file when you specify --pidfile.  They keep the path around
and register exit handlers (QEMU uses an exit notifier, QSD an atexit()
function) to unlink this file when the process terminates.  These
handlers unlink precisely the path that the user has specified via
--pidfile, so if it was a relative path and the process has at any point
changed its working directory, the path no longer points to the PID
file, and so the unlink() will fail (or worse).

When using --daemonize, the process will always change its working
directory to /, so this problem basically always appears when using
--daemonize and --pidfile in conjunction.

(It gets even worse with QEMU’s --chroot, but I’m not sure whether
there’s any trivial fix for that (whether chroot is used or not is
confined to os-posix.c, so this would need to be externally visible; and
I guess the plain would be to skip the unlink() in that case?), so I’d
rather just skip that for now... :/)

We can fix the problem by running realpath() once the PID file has been
created, so we get an absolute path that we can unlink in the exit
handler.  This is done here.

(Another way to fix this might be to open the directory the PID file is
in, keep the FD around, and use unlinkat() in the exit handler.  I
couldn’t see any real benefit for this, though, so I didn’t go that
route.  It might be beneficial for the --chroot case, but then again,
precisely in that case we probably don’t want to keep random directory
FDs around.)


Hanna Reitz (3):
  qsd: Unlink absolute PID file path
  vl: Conditionally register PID file unlink notifier
  vl: Unlink absolute PID file path

 softmmu/vl.c                         | 42 +++++++++++++++++++++-------
 storage-daemon/qemu-storage-daemon.c | 11 +++++++-
 2 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.35.3


