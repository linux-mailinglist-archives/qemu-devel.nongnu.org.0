Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E2398B45
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:59:44 +0200 (CEST)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRPL-0006ua-Gg
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCl-0002hL-Dn
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCj-0007X7-2J
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXp4xsK2COsg/sk8cOxH3Dv6mSNqqIz2BKhEw9890PI=;
 b=Gi/bmFbl/b1xBv7ycLuMLf0Ay1GkdC5BaE/AKxsvHDsG3ztr6Y2NBDwNRFBPyVgcg5xgfr
 qNS/amqvZqy4niL/VsPDVxLwy8ohfEXqSQV9xVsJgLCnnWhee9EUj5TPKIAXSMkAS1xwYv
 84E1sNaay8YBlDgzU2UMLaQEPTRakLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-8lfCwswKPPOobjzalGIpCg-1; Wed, 02 Jun 2021 09:46:36 -0400
X-MC-Unique: 8lfCwswKPPOobjzalGIpCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5111085137;
 Wed,  2 Jun 2021 13:45:59 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DC2F60BD9;
 Wed,  2 Jun 2021 13:45:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/20] docs/secure-coding-practices: Describe how to use
 'null-co' block driver
Date: Wed,  2 Jun 2021 15:45:29 +0200
Message-Id: <20210602134529.231756-21-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Document that security reports must use 'null-co,read-zeroes=on'
because otherwise the memory is left uninitialized (which is an
on-purpose performance feature).

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210601162548.2076631-1-philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/devel/secure-coding-practices.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/devel/secure-coding-practices.rst b/docs/devel/secure-coding-practices.rst
index cbfc8af67e..0454cc527e 100644
--- a/docs/devel/secure-coding-practices.rst
+++ b/docs/devel/secure-coding-practices.rst
@@ -104,3 +104,12 @@ structures and only process the local copy.  This prevents
 time-of-check-to-time-of-use (TOCTOU) race conditions that could cause QEMU to
 crash when a vCPU thread modifies guest RAM while device emulation is
 processing it.
+
+Use of null-co block drivers
+----------------------------
+
+The ``null-co`` block driver is designed for performance: its read accesses are
+not initialized by default. In case this driver has to be used for security
+research, it must be used with the ``read-zeroes=on`` option which fills read
+buffers with zeroes. Security issues reported with the default
+(``read-zeroes=off``) will be discarded.
-- 
2.30.2


