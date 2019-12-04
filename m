Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812D112DF9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 16:03:00 +0100 (CET)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icWB9-0008NT-8m
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 10:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1icW86-0006zG-LJ
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1icW85-0007Nf-Nz
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:59:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36861
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1icW85-0007KG-KW
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575471589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwTJmSkQBXZ1v0w1lqd1v9B8zy7LArU7KunBQNqpEYI=;
 b=DJDZW0abHvKasluLwi1+vE3O0libEscT7x5wy7bZ1VnJrx4UXwgW8Xb1i3x3ihmwgXLfQV
 ZGlnX8rRUPschS7g+u9qVWwUXo30tUv+16pnfQAAaLDm+Zzp0ZdUcJ63vKRRi4asH1eNLM
 I925r9NE1IlcQo664RNUofedDLEbzd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-EshCuojONiqwQ65vPR-4Xg-1; Wed, 04 Dec 2019 09:59:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 685FF8FF576;
 Wed,  4 Dec 2019 14:59:44 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FE52600C8;
 Wed,  4 Dec 2019 14:59:39 +0000 (UTC)
Date: Wed, 4 Dec 2019 15:59:37 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/4] s390x: Add missing vcpu reset functions
Message-ID: <20191204155937.76f6c0cd.cohuck@redhat.com>
In-Reply-To: <20191203132813.2734-3-frankja@linux.ibm.com>
References: <20191203132813.2734-1-frankja@linux.ibm.com>
 <20191203132813.2734-3-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: EshCuojONiqwQ65vPR-4Xg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  3 Dec 2019 08:28:11 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> Up to now we only had an ioctl to reset vcpu data QEMU couldn't reach
> for the initial reset, and that was also called for the clear
> reset. To be architecture compliant, we also need to clear local
> interrupts on a normal reset.

Do we also need to do something like that for tcg? David?

> 
> Because of this and the upcoming protvirt support we need to add
> ioctls for the missing clear and normal resets.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.c       | 16 +++++++++++++--
>  target/s390x/kvm-stub.c  | 10 +++++++++-
>  target/s390x/kvm.c       | 42 ++++++++++++++++++++++++++++++++--------
>  target/s390x/kvm_s390x.h |  4 +++-
>  4 files changed, 60 insertions(+), 12 deletions(-)


