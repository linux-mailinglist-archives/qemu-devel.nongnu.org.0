Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCF2AF221
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:28:17 +0100 (CET)
Received: from localhost ([::1]:38048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqAa-00059d-3R
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvJ-0007N7-Dx
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvG-0002GS-7n
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tRk+VsAm5cXSsSJkpxworVPoJ+oOeYmX9krht8arW8=;
 b=S0m1BOS8ElXD2wxtKFQhFPoZf7rJahApcD6czacSeVZTCjtZT1ptm7N0VZvMEPX9xa8DZB
 k4Fzaydw0oLQq7S0miqBUIqMtasgqw6BfLAHbZBEmlbbHnat8cmpOtVI+DP+3lGwRYBd8i
 iFOHAVE9lfdAWJYPLdEjzADOVlOd5ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-k9mv4xeLMUuJrXZYnkUKFw-1; Wed, 11 Nov 2020 08:12:23 -0500
X-MC-Unique: k9mv4xeLMUuJrXZYnkUKFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8701C1087D63;
 Wed, 11 Nov 2020 13:12:22 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3411D55760;
 Wed, 11 Nov 2020 13:12:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 16/17] hw/net/can/ctucan_core: Handle big-endian hosts
Date: Wed, 11 Nov 2020 21:11:40 +0800
Message-Id: <1605100301-11317-17-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The ctucan driver defines types for its registers which are a union
of a uint32_t with a struct with bitfields for the individual
fields within that register. This is a bad idea, because bitfields
aren't portable. The ctu_can_fd_regs.h header works around the
most glaring of the portability issues by defining the
fields in two different orders depending on the setting of the
__LITTLE_ENDIAN_BITFIELD define. However, in ctucan_core.h this
is unconditionally set to 1, which is wrong for big-endian hosts.

Set it only if HOST_WORDS_BIGENDIAN is not set. There is no need
for a "have we defined it already" guard, because the only place
that should set it is ctucan_core.h, which has the usual
double-inclusion guard.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/can/ctucan_core.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/can/ctucan_core.h b/hw/net/can/ctucan_core.h
index f21cb1c..bbc09ae 100644
--- a/hw/net/can/ctucan_core.h
+++ b/hw/net/can/ctucan_core.h
@@ -31,8 +31,7 @@
 #include "exec/hwaddr.h"
 #include "net/can_emu.h"
 
-
-#ifndef __LITTLE_ENDIAN_BITFIELD
+#ifndef HOST_WORDS_BIGENDIAN
 #define __LITTLE_ENDIAN_BITFIELD 1
 #endif
 
-- 
2.7.4


