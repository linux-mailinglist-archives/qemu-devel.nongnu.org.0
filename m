Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5BE3C746A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:23:54 +0200 (CEST)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LCL-0003vE-3C
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7r-0003dU-Bu
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7o-0006qn-IK
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfnFmLjdFjG+a1kL1O42NjHflOciAkXnUmA60T9RkEw=;
 b=L1/NAdtardxZSOIy3yyAGxmwJMfsAkTLhNq9pN5EZtcT/pLiRbDSXdKJE6BXQaq+eXitys
 Ke/6jAV8hVOGIToaKg71tliag1g2Fp88//sStFUQvbew3rhEnObalEDAWeDexzXPo5iEl1
 XrEMskdlmctf1VeaubuO3BJDkzHjV4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-TPTIewfHNmev6sq9c3xi2Q-1; Tue, 13 Jul 2021 12:19:10 -0400
X-MC-Unique: TPTIewfHNmev6sq9c3xi2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B85F01009448;
 Tue, 13 Jul 2021 16:19:08 +0000 (UTC)
Received: from localhost (ovpn-113-28.rdu2.redhat.com [10.10.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CC456091B;
 Tue, 13 Jul 2021 16:19:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/11] i386: clarify 'hv-passthrough' behavior
Date: Tue, 13 Jul 2021 12:09:47 -0400
Message-Id: <20210713160957.3269017-2-ehabkost@redhat.com>
In-Reply-To: <20210713160957.3269017-1-ehabkost@redhat.com>
References: <20210713160957.3269017-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Clarify the fact that 'hv-passthrough' only enables features which are
already known to QEMU and that it overrides all other 'hv-*' settings.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210608120817.1325125-3-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/hyperv.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index e53c581f458..a51953daa83 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -209,8 +209,11 @@ In some cases (e.g. during development) it may make sense to use QEMU in
 'pass-through' mode and give Windows guests all enlightenments currently
 supported by KVM. This pass-through mode is enabled by "hv-passthrough" CPU
 flag.
-Note: enabling this flag effectively prevents migration as supported features
-may differ between target and destination.
+Note: "hv-passthrough" flag only enables enlightenments which are known to QEMU
+(have corresponding "hv-*" flag) and copies "hv-spinlocks="/"hv-vendor-id="
+values from KVM to QEMU. "hv-passthrough" overrides all other "hv-*" settings on
+the command line. Also, enabling this flag effectively prevents migration as the
+list of enabled enlightenments may differ between target and destination hosts.
 
 
 4. Useful links
-- 
2.31.1


