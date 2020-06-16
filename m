Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A81FAF01
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 13:19:30 +0200 (CEST)
Received: from localhost ([::1]:36900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl9cn-0003hf-So
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 07:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jl9bF-0002o3-8U
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 07:17:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22396
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jl9bC-0000py-ML
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 07:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592306269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=da8UnOZcqvP4RkUxtdOC7xKwlzyHgAbrTXZEHOn7keo=;
 b=PFKVwNprn6rYCTwGuRpGSlaU1bnMppJJ9AOoRMchQ3FZXZ8ON4DZkCGr8ZFLa+YgdD//rB
 9oVktuhRA1jHFTemkdXCXWC5mgewPjHBndhYz+IR3FNKwKiUyWAchCU8ppE25+H2hEzoIk
 +C3o1iHL3+06OXC1lFGQ50r01Kw0GoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-S5uGZ7BrODihBcFKB5hMLQ-1; Tue, 16 Jun 2020 07:17:44 -0400
X-MC-Unique: S5uGZ7BrODihBcFKB5hMLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A2F100945A;
 Tue, 16 Jun 2020 11:17:43 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAAE46FDD1;
 Tue, 16 Jun 2020 11:17:35 +0000 (UTC)
Date: Tue, 16 Jun 2020 13:17:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 04/21] s390x/pv: Convert to ram_block_discard_disable()
Message-ID: <20200616131732.52eb76d1.cohuck@redhat.com>
In-Reply-To: <20200610115419.51688-5-david@redhat.com>
References: <20200610115419.51688-1-david@redhat.com>
 <20200610115419.51688-5-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Jun 2020 13:54:02 +0200
David Hildenbrand <david@redhat.com> wrote:

> Discarding RAM does not work as expected with protected VMs. Let's
> switch to ram_block_discard_disable() for now, as we want to get rid
> of qemu_balloon_inhibit(). Note that it will currently never fail, but
> might fail in the future with new technologies (e.g., virtio-mem).
> 
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Janosch Frank <frankja@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Did not review in detail, but looks sane. Would like to see a sanity
check and ack from folks with access to a PV setup.

Acked-by: Cornelia Huck <cohuck@redhat.com>


