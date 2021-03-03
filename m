Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940E32B8AD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:39:56 +0100 (CET)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSfL-0002Bn-8w
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHSdp-0001P8-Dc
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHSdn-00087d-Vs
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614782299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aA0ryNvB4RqgkXaIipbDqJ057yJGCC4FNfu7WES52T0=;
 b=IJav01vY9PosaaSLGiKdf2r+YAkrOUonIxCgMuNbaIvTlA8aQGOaEk1oi5Ze+rVhjnq3MR
 pvt1YF3Rni1KfiQc9Sd7uFBfT+R1ZYGF6MuPqZXr5uSgVSaOMsThtPuHqR2Z1oQ2Mb0Hfo
 reJRYAVFitgeRKpKAEsLnw6/Spxls9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-7Qtqn3AiOJi1lChWk9bqlg-1; Wed, 03 Mar 2021 09:38:15 -0500
X-MC-Unique: 7Qtqn3AiOJi1lChWk9bqlg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33580100A8ED;
 Wed,  3 Mar 2021 14:38:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 201D11E2B4;
 Wed,  3 Mar 2021 14:38:02 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] exec: Get rid of phys_mem_set_alloc()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210303130916.22553-1-david@redhat.com>
 <20210303130916.22553-3-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dae7136e-964a-2235-8301-4d9487e8ed30@redhat.com>
Date: Wed, 3 Mar 2021 15:38:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303130916.22553-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 14.09, David Hildenbrand wrote:
> As the last user is gone, we can get rid of phys_mem_set_alloc() and
> simplify.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   include/sysemu/kvm.h |  4 ----
>   softmmu/physmem.c    | 36 +++---------------------------------
>   2 files changed, 3 insertions(+), 37 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


