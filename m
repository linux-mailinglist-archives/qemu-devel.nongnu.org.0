Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0979354E3A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:04:05 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTggu-0000y6-SQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lTgec-0007p8-Fp
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lTgea-00049O-IW
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617696098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sSF6Ds9D/0fRxWvwzkpV/6BnP7c+gLwWDgQ1BMYgGNs=;
 b=KSKYX1EW7XvZPBY/q8YekgGtpzc0eCH9Cd657XkNh0azjLNOYYCCIYPGm8l53x51FfYSHY
 c5FkmSbcAiw8kt/B4vlegjm8c9S7prUYnhlA2gXisMt5l9+Etkiu57vaKEQubQiX/YKqIL
 HcWGkLECGI6V93dp+cXqilkY4IYaxBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-40MaE7EjO0mtyocOWlB06A-1; Tue, 06 Apr 2021 04:01:37 -0400
X-MC-Unique: 40MaE7EjO0mtyocOWlB06A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10CB1108BD0B;
 Tue,  6 Apr 2021 08:01:36 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-79.ams2.redhat.com [10.36.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8900310023B2;
 Tue,  6 Apr 2021 08:01:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v1 0/3] softmmu/physmem: shared anonymous memory fixes
Date: Tue,  6 Apr 2021 10:01:23 +0200
Message-Id: <20210406080126.24010-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes related to shared anonymous memory, previously sent as part of
    https://lore.kernel.org/r/20210319101230.21531-1-david@redhat.com

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Cc: Richard Henderson <richard.henderson@linaro.org>

David Hildenbrand (3):
  softmmu/physmem: Mark shared anonymous memory RAM_SHARED
  softmmu/physmem: Fix ram_block_discard_range() to handle shared
    anonymous memory
  softmmu/physmem: Fix qemu_ram_remap() to handle shared anonymous
    memory

 softmmu/physmem.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)


base-commit: ee82c086baaa534d1af26cb8b86e86fb047af918
-- 
2.30.2


