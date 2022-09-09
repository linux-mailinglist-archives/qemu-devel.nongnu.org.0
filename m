Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E755B360A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 13:09:04 +0200 (CEST)
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWbsd-00046A-6i
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 07:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWbkr-0007nh-IP
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWbkp-0004sd-K3
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662721257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=s7r37HYigu2X97YLwHEdM4f5sKBhrEueO8Ol64hNJ+U=;
 b=PKogmloycxwbXRuUgNsqWXv/ZjX5wKwFJAteTTU3F3/asgl2eylpxrG7EiydPF06Yfkz20
 fcKZ5Pawq7kSbTtrhpZnMt4wYmEncnzatvQ9ohbESUTAj/n+2cnkuFkpTeqKvVNGEyWCQz
 OfZxmH6ZJtdUQsEjTuanlERRwX5+ikw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-NDDohuehOk2qew61_7ZepA-1; Fri, 09 Sep 2022 07:00:56 -0400
X-MC-Unique: NDDohuehOk2qew61_7ZepA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 030A185A58C;
 Fri,  9 Sep 2022 11:00:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA08F2166B26;
 Fri,  9 Sep 2022 11:00:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 0/1] accel/kvm: implement KVM_SET_USER_MEMORY_REGION_LIST
Date: Fri,  9 Sep 2022 07:00:33 -0400
Message-Id: <20220909110034.740282-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use the new KVM ioctl KVM_SET_USER_MEMORY_REGION_LIST.
Based on my QEMU serie "[RFC PATCH v2 0/3] accel/kvm: extend kvm memory listener to support".

Based-on: 20220909081150.709060-1-eesposit@redhat.com

Requires my KVM serie "[RFC PATCH 0/9] kvm: implement atomic memslot updates"
https://lkml.org/lkml/2022/9/9/533

Emanuele Giuseppe Esposito (1):
  kvm/kvm-all.c: implement KVM_SET_USER_MEMORY_REGION_LIST ioctl

 accel/kvm/kvm-all.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

-- 
2.31.1


