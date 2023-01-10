Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3EF6647B9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:51:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIkK-00089R-4d; Tue, 10 Jan 2023 12:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFIkG-00087G-If
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFIkE-0003wG-A6
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673372945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vtIEYD2VVJF6jXYuGELYYcJOZX5tvp3QWu4CigQscNg=;
 b=iUvkj7fuTVN7LyYyEPvrixXjWF08J8vp1rlZpuqP6YQnSUQ/T4/HprfFCf+8aFlThV4o5Y
 VTm0YbC/nU/LcadQSqny8yflGLBTjfGQ2doZu5gkezRD6Mo/4tHAmn+dpwg/qBHI3HbQ07
 /LLgwNeVSB8ofN+juYeZuVokcGhrPzM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-OKl6jTyPP-ip_eMi86jbNQ-1; Tue, 10 Jan 2023 12:49:02 -0500
X-MC-Unique: OKl6jTyPP-ip_eMi86jbNQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBE153811F31;
 Tue, 10 Jan 2023 17:49:01 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76C3F492C14;
 Tue, 10 Jan 2023 17:49:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] linux-user: revert previous workaround for glibc >= 2.36
Date: Tue, 10 Jan 2023 12:48:59 -0500
Message-Id: <20230110174901.2580297-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

It didn't appear that glibc was going to fix the problem
breaking includes of linux/mount.h vs sys/mount.h, so
QEMU applied a workaround copying the symbols/structs we
need into a local header.

Since then Linux modified linux/btrfs.h to pull in
linux/fs.h which caused a clash with our workaround.
Rather than invent workarounds for our workarounds,
we can luckily just drop our previous workarounds.
glibc has been fixed after all, and backported this
fix to the stable 2.36 release series too. We should
just expect distros to pull in the stable fix, which
Fedora at least has already done.

Daniel P. Berrangé (2):
  Revert "linux-user: add more compat ioctl definitions"
  Revert "linux-user: fix compat with glibc >= 2.36 sys/mount.h"

 linux-user/syscall.c | 43 -------------------------------------------
 meson.build          |  2 --
 2 files changed, 45 deletions(-)

-- 
2.38.1


