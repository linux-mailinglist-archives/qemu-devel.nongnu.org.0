Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4EB429608
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:47:27 +0200 (CEST)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzOY-0006hl-5E
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzMk-0005FY-9t
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzMh-0001NF-FU
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633974329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lH2WPFOJFzCk3su3lWw58xGDele951FSS5290Y7dLQQ=;
 b=P+as6fKG5NmAilwAS31fmC5zlpioKd9QaIRJETUXpPjpG4iCvT9WrXHjA7uEvKmFsbfX+g
 eTafp28S3yZ2aQXAmgr6xb7k4kX4zi4YXZxbc3thrx+y+OEJTFjoKm6kPgonoUB2HwqRLP
 NWeDoUpvgml0X8sK7l8k7h0xk0P1bRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-KYOnn_uhMi2IBYxduw3XPw-1; Mon, 11 Oct 2021 13:45:26 -0400
X-MC-Unique: KYOnn_uhMi2IBYxduw3XPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61F1184A5E0;
 Mon, 11 Oct 2021 17:45:25 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16AAA5D9D5;
 Mon, 11 Oct 2021 17:45:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] memory: Update description of memory_region_is_mapped()
Date: Mon, 11 Oct 2021 19:45:19 +0200
Message-Id: <20211011174522.14351-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Playing with memory_region_is_mapped(), I realized that memory regions
mapped via an alias behave a little bit "differently", as they don't have
their ->container set.
* memory_region_is_mapped() will never succeed for memory regions mapped
  via an alias
* memory_region_to_address_space(), memory_region_find(),
  memory_region_find_rcu(), memory_region_present() won't work, which seems
  okay, because we don't expect such memory regions getting passed to these
  functions.
* memory_region_to_absolute_addr() will result in a wrong address. As
  the result is only used for tracing, that is tolerable.

Let's clarify the documentation of memory_region_is_mapped() and change
one user that really should be checking something else.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>

David Hildenbrand (2):
  machine: Use host_memory_backend_is_mapped() in
    machine_consume_memdev()
  memory: Update description of memory_region_is_mapped()

 hw/core/machine.c     | 2 +-
 include/exec/memory.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.31.1


