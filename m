Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE732B7EF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:11:33 +0100 (CET)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRHo-00085k-Tn
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHRFs-0006gr-I9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHRFr-0005c8-4Q
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614776970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vBkU9PYoHb2RYR75LHHbOZBics9l/7QqXUZvwkT/bfc=;
 b=ILksb5JztHqlO4/wbhCeUbuR9IxsA3yLW/spCtgHekL79Dp2qagJXNFjszhBKJNuxFm0+G
 cC3XX8hhcEFiyTFJZcvDq4kYDSTLk44TJOibnPPcrTuzUo1oIz4Wo0UPEAnz4tL8KWhgdP
 VrZ78CbVDeNbZVI5cwDpAOWvjj79m+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-HiyUce2xNGa5IYeQ4WiPqg-1; Wed, 03 Mar 2021 08:09:28 -0500
X-MC-Unique: HiyUce2xNGa5IYeQ4WiPqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08BA6100B3B0;
 Wed,  3 Mar 2021 13:09:27 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51E8060BFA;
 Wed,  3 Mar 2021 13:09:17 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] Get rid of legacy_s390_alloc() and phys_mem_set_alloc()
Date: Wed,  3 Mar 2021 14:09:14 +0100
Message-Id: <20210303130916.22553-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's finally get rid of the alternative allocation function. Outcome of
a discussion in:
    https://lkml.kernel.org/r/20210303123517.04729c1e.cohuck@redhat.com

David Hildenbrand (2):
  s390x/kvm: Get rid of legacy_s390_alloc()
  exec: Get rid of phys_mem_set_alloc()

 include/sysemu/kvm.h |  4 ----
 softmmu/physmem.c    | 36 +++---------------------------------
 target/s390x/kvm.c   | 43 +++++--------------------------------------
 3 files changed, 8 insertions(+), 75 deletions(-)

-- 
2.29.2


