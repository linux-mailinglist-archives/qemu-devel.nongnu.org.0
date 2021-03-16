Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E32A33E069
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:22:24 +0100 (CET)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH8x-0005wb-A6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2k-0005kQ-KQ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2e-0003Xd-UY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh8sn3aqQA2d6yGp+dL+fOy2B9FyyZ4ULlc68iipLb0=;
 b=eE9ytzdRwP/bQMm6BtVDXf7MjwK7xUyZcYKveIDMjZk/vbuwSWQfG/JL3VQRAQCQciGKOD
 mjC4Fg2uBao004O4fRPUL3YGjtz74yqTSy+ozpiZbNs+GoQmY2Eds+PwYSWypF9sP+fyjt
 2Pth7QpX2QxVqLz6RE7XiuqzIYjvHLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-ke5x-UPlMheJm7BmPn8JHQ-1; Tue, 16 Mar 2021 17:15:50 -0400
X-MC-Unique: ke5x-UPlMheJm7BmPn8JHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46E387A82A;
 Tue, 16 Mar 2021 21:15:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 844B1610AF;
 Tue, 16 Mar 2021 21:15:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] hw/i8254: fix vmstate load
Date: Tue, 16 Mar 2021 17:15:30 -0400
Message-Id: <20210316211531.1649909-16-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

QEMU timer of channel 0 in i8254 is used to raise irq
at the specified moment of time. This irq can be disabled
with irq_disabled flag. But when vmstate of the pit is
loaded, timer may be rearmed despite the disabled interrupts.
This patch adds irq_disabled flag check to fix that.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161537170060.6654.9430112746749476215.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/timer/i8254.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index c01ee2c72a..c8388ea432 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -324,7 +324,7 @@ static void pit_post_load(PITCommonState *s)
 {
     PITChannelState *sc = &s->channels[0];
 
-    if (sc->next_transition_time != -1) {
+    if (sc->next_transition_time != -1 && !sc->irq_disabled) {
         timer_mod(sc->irq_timer, sc->next_transition_time);
     } else {
         timer_del(sc->irq_timer);
-- 
2.26.2



