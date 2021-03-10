Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4E334378
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:46:43 +0100 (CET)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1ys-0003ww-By
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lK1bS-00010q-FI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lK1bO-0002WN-IQ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615393345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVPdOUNaxxpVJfSx6BSqcYWZ03ZhUTF6iZsIeSCKXsM=;
 b=QhORrZ+Qn8Te6byu54xWwqVUBhlJOkubA4GMODJHv0+ip8ouxeFcIVoRYGiy6eWfvzpEzl
 Z+jOu2oIyYQXPQHSAcoLdmULgdfSBSbu1UOVcc/Pxkg9XquoHalFzHAHSpY2F79I7iXlmm
 z86emLmgnnfgah1rFzCjYyQJLqh/aXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-dImOJa_CPEOS7Q_wm5hXdQ-1; Wed, 10 Mar 2021 11:22:21 -0500
X-MC-Unique: dImOJa_CPEOS7Q_wm5hXdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67579108BD07;
 Wed, 10 Mar 2021 16:22:20 +0000 (UTC)
Received: from gondolin (ovpn-113-99.ams2.redhat.com [10.36.113.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4D3460C05;
 Wed, 10 Mar 2021 16:22:11 +0000 (UTC)
Date: Wed, 10 Mar 2021 17:22:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/2] Get rid of legacy_s390_alloc() and
 phys_mem_set_alloc()
Message-ID: <20210310172208.02f8b988.cohuck@redhat.com>
In-Reply-To: <20210303130916.22553-1-david@redhat.com>
References: <20210303130916.22553-1-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  3 Mar 2021 14:09:14 +0100
David Hildenbrand <david@redhat.com> wrote:

> Let's finally get rid of the alternative allocation function. Outcome of
> a discussion in:
>     https://lkml.kernel.org/r/20210303123517.04729c1e.cohuck@redhat.com
> 
> David Hildenbrand (2):
>   s390x/kvm: Get rid of legacy_s390_alloc()
>   exec: Get rid of phys_mem_set_alloc()
> 
>  include/sysemu/kvm.h |  4 ----
>  softmmu/physmem.c    | 36 +++---------------------------------
>  target/s390x/kvm.c   | 43 +++++--------------------------------------
>  3 files changed, 8 insertions(+), 75 deletions(-)
> 

Thanks, applied.


