Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03AF150EE6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 18:48:17 +0100 (CET)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyfpY-00054T-Q4
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 12:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iyfoO-0004RC-F5
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:47:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iyfoM-0000yd-H4
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:47:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23972
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iyfoM-0000we-Dh
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580752021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgUsDubewWfhB9JEAWF32v0uX7MoEWZRa0C9Yrwfj+M=;
 b=gIKANshOztdnxgyLSIXuBvNceN6BUSpYsMc8pD8yvgMiB+asVQojBJ77b18cWr/hpSjkf+
 ZLmPXA5xgu9jzUwakZw6q12fOXiQny9ri27ENSDyaM2JhDfl2AZ8wGnboubAnrJngi5jv0
 GJs1ticQdKHg0pJeprCYlqgaDGJGwKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-F9XVggoSNdmWljG0Rg-KvQ-1; Mon, 03 Feb 2020 12:46:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CDC01005F7E;
 Mon,  3 Feb 2020 17:46:50 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E380C60BE0;
 Mon,  3 Feb 2020 17:46:38 +0000 (UTC)
Subject: Re: [PATCH v13 03/10] virtio-iommu: Implement attach/detach command
To: Peter Xu <peterx@redhat.com>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <20200125171955.12825-4-eric.auger@redhat.com>
 <20200203134915.GA155875@xz-x1>
 <ce49f691-d944-2e5e-87a3-7e7c9651c2af@redhat.com>
 <20200203151917.GD155875@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5289913a-43fc-aaae-5b82-151922de93bf@redhat.com>
Date: Mon, 3 Feb 2020 18:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200203151917.GD155875@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: F9XVggoSNdmWljG0Rg-KvQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 mst@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/3/20 4:19 PM, Peter Xu wrote:
> On Mon, Feb 03, 2020 at 03:59:00PM +0100, Auger Eric wrote:
> 
> [...]
> 
>>>> +static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
>>>> +{
>>>> +    QLIST_REMOVE(ep, next);
>>>> +    g_tree_unref(ep->domain->mappings);
>>>
>>> Here domain->mapping is unreferenced for each endpoint, while at [1]
>>> below you only reference the domain->mappings if it's the first
>>> endpoint.  Is that problematic?
>> in [1] I take a ref to the domain->mappings if it is *not* the 1st
>> endpoint. This aims at deleting the mappings gtree when the last EP is
>> detached from the domain.
>>
>> This fixes the issue reported by Jean in:
>> https://patchwork.kernel.org/patch/11258267/#23046313
> 
> Ah OK. :)
> 
> However this is tricky.  How about do explicit g_tree_destroy() in
> virtio_iommu_detach() when it's the last endpoint?  I see that you
> have:
> 
>     /*
>      * when the last EP is detached, simply remove the domain for
>      * the domain list and destroy it. Note its mappings were already
>      * freed by the ref count mechanism. Next operation involving
>      * the same domain id will re-create one domain object.
>      */
>     if (QLIST_EMPTY(&domain->endpoint_list)) {
>         g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
>     }
> 
> Then it becomes:
> 
>     if (QLIST_EMPTY(&domain->endpoint_list)) {
>         g_tree_destroy(domain->mappings);
>         g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
>     }
> 
> And also remove the trick in attach() so you take the domain ref
> unconditionally.  Would that work?
Yes I think so. On the other hand this ref counting mechanism is also
made for that purpose of destroying objects without being forced to
explicitly call the destroy function.

Thanks

Eric
> 
> Thanks,
> 


