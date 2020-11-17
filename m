Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8A2B5EF5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:18:20 +0100 (CET)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezwB-00049G-H1
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuE-0002Sy-8u
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuA-0002f0-PH
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605615374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPwnPjGTI0xkMPmJHl6JkXDRnlvL0iyeVRVlhFPIBGA=;
 b=flj51Qb5jmxm+69WKblcBGQCkB7etFD0Fk1fyMs9vWUQBN33CyIg/UphRKWPAf0Lxlbjko
 ipmFsx+LQxHfR1pZVj65LNh0sJrYfYBW+JzzORn5akkpu7tifV0WFTelNRIDbQ1oV2FlpD
 vQwbTcD6I+ik+BWxC6p9G/V+d6Jif8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-VV0A4tJpP4i1gtJXiO0RuA-1; Tue, 17 Nov 2020 07:16:11 -0500
X-MC-Unique: VV0A4tJpP4i1gtJXiO0RuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB7E18CB72A;
 Tue, 17 Nov 2020 12:16:10 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC53C10013D7;
 Tue, 17 Nov 2020 12:16:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/7] file-posix: allow -EBUSY errors during write zeros on raw
 block devices
Date: Tue, 17 Nov 2020 13:15:54 +0100
Message-Id: <20201117121558.249585-4-kwolf@redhat.com>
In-Reply-To: <20201117121558.249585-1-kwolf@redhat.com>
References: <20201117121558.249585-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

On Linux, fallocate(fd, FALLOC_FL_PUNCH_HOLE) when it is used on a block device,
without O_DIRECT can return -EBUSY if it races with another write to the same page.

Since this is rare and discard is not a critical operation, ignore this error

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20201111153913.41840-2-mlevitsk@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index c63926d592..d5fd1dbcd2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1698,6 +1698,7 @@ static int handle_aiocb_write_zeroes_unmap(void *opaque)
     switch (ret) {
     case -ENOTSUP:
     case -EINVAL:
+    case -EBUSY:
         break;
     default:
         return ret;
-- 
2.28.0


