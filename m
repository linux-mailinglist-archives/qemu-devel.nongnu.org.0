Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C832F5BF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 23:16:27 +0100 (CET)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIIkE-0005AN-3g
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 17:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lIIil-0004bZ-BB
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lIIii-0005DI-CL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614982489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8CtKfIZAxp7A29t2dhu1pM3e4Kxl5wG+uYivDmv09gM=;
 b=B1XH01fenNr13dmQgPZYuOPkcHpGud/APbV7IO8QGSxjvO/qSxOTCdDJdMpvWYLNFfFlIU
 +dApKmsU+1yZEnDpMppFJx4W1J0EbU5PROUiu/xGu2TZoRMqeDJ+ZIn5WuSg8wZtBGcmzH
 pNdy7cBWNofd+Li36r3k8kxrZs7bA9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-FJADDmB0PRGvAaAv1DLywQ-1; Fri, 05 Mar 2021 17:14:48 -0500
X-MC-Unique: FJADDmB0PRGvAaAv1DLywQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 411EE814315;
 Fri,  5 Mar 2021 22:14:46 +0000 (UTC)
Received: from localhost (ovpn-114-200.rdu2.redhat.com [10.10.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8AA1C95C;
 Fri,  5 Mar 2021 22:14:32 +0000 (UTC)
Date: Fri, 5 Mar 2021 17:14:31 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 9/9] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
Message-ID: <20210305221431.GG3139005@habkost.net>
References: <20210305101634.10745-1-david@redhat.com>
 <20210305101634.10745-10-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210305101634.10745-10-david@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 11:16:34AM +0100, David Hildenbrand wrote:
> Let's provide a way to control the use of RAM_NORESERVE via memory
> backends using the "reserve" property which defaults to true (old
> behavior).
> 
> Only POSIX supports setting the flag (and Linux support is checked at
> runtime, depending on the setting of "/proc/sys/vm/overcommit_memory").
> Windows will bail out.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM. This essentially allows
> avoiding to set "/proc/sys/vm/overcommit_memory == 0") when using
> virtio-mem and also supporting hugetlbfs in the future.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Paolo, will the whole series get through your memory API queue?

Also, do you think we should move backends/hostmem* under the
"memory API" section in MAINTAINERS?  Most memory backend changes
also involve changes in the memory API.

-- 
Eduardo


