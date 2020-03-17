Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9D187E62
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:32:56 +0100 (CET)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE9Wp-0007b1-PF
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39865)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jE9OP-00046g-Fm
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jE9ON-0003Uf-Sl
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:24:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:25027)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jE9ON-0003Om-OT
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584440650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahjKwJ9t5Zipjl3f7KqTEvmLGkx5LN5Rd7zBw+/Ob/0=;
 b=ESzycGz15CnQiCqBkEnpZQahSBz2b+kGOUbnTS9U/kiOc94GrFhvdhgtJt7Mz4lpeIBfNT
 SHrCftc2hUNqBNluenodcaK5DazbzwcVp5Gf/aopH4tumP9mBzg1S8oBuE5ZyZKL6g+vyO
 +wh7juvWWu8B0o6NIhhAjjFzgQ8aEJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-7CtWdGEYPfKjfkIJyE92Lw-1; Tue, 17 Mar 2020 06:24:09 -0400
X-MC-Unique: 7CtWdGEYPfKjfkIJyE92Lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0D0D801E5C;
 Tue, 17 Mar 2020 10:24:07 +0000 (UTC)
Received: from gondolin (ovpn-113-156.ams2.redhat.com [10.36.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBCD55C1BB;
 Tue, 17 Mar 2020 10:24:03 +0000 (UTC)
Date: Tue, 17 Mar 2020 11:24:01 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v9 06/15] s390x: Add SIDA memory ops
Message-ID: <20200317112401.7c7d2683.cohuck@redhat.com>
In-Reply-To: <20200311132151.172389-7-frankja@linux.ibm.com>
References: <20200311132151.172389-1-frankja@linux.ibm.com>
 <20200311132151.172389-7-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 09:21:42 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> Protected guests save the instruction control blocks in the SIDA
> instead of QEMU/KVM directly accessing the guest's memory.
> 
> Let's introduce new functions to access the SIDA.
> 
> Also the new memops are available with KVM_CAP_S390_PROTECTED, so

"The memops for doing so are available..." ?

> let's check for that.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.h        |  7 ++++++-
>  target/s390x/kvm.c        | 25 +++++++++++++++++++++++++
>  target/s390x/kvm_s390x.h  |  2 ++
>  target/s390x/mmu_helper.c | 14 ++++++++++++++
>  4 files changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


