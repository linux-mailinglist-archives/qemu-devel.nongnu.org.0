Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E230321BD2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:49:08 +0100 (CET)
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDSN-0004xo-Gl
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEDIt-0005wb-36
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEDIc-0004FE-SD
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614008340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qmbm4iTjY+ICzOaptRWAoAKmIaPsBh1KdL6bNyn9Wg0=;
 b=c7kOKWBPvFFnS5TbB3Oeeg5PPVgmQUbw5eGgqcP0TRtZwgESFUzuNOJlVr4TPWZgYuXFph
 JHB+lMViWKRO/Kl8Ipmq/SOCyNHgYhgETzaUGXAi2s+CWahulb+5ZE7s1v6yE0H4jJZrRD
 2qrq6mW8Pm7bXhoRewiY1WzyhodkbYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-etw46VKcP5ym7nXkunnOIQ-1; Mon, 22 Feb 2021 10:38:58 -0500
X-MC-Unique: etw46VKcP5ym7nXkunnOIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CE67195D560;
 Mon, 22 Feb 2021 15:38:57 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1ABC19727;
 Mon, 22 Feb 2021 15:38:40 +0000 (UTC)
Subject: Re: [PATCH v6 09/12] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-10-david@redhat.com>
 <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
 <d64fdd53-6868-15fd-ea81-fa26e153eced@redhat.com>
 <61237335-b03f-cb89-c0be-03fc3058c13b@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9b127669-f84e-7f8c-f76c-2bf7b206d68b@redhat.com>
Date: Mon, 22 Feb 2021 16:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <61237335-b03f-cb89-c0be-03fc3058c13b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.21 15:02, Paolo Bonzini wrote:
> On 22/02/21 14:33, David Hildenbrand wrote:
>>> Also, uncoordinated require is unused, and therefore uncoordinated
>>> disable is also never going to block anything.  Does it make sense to
>>> keep it in the API?
>>
>> Right, "ram_block_discard_require()" is not used yet. I am planning on
>> using it in virtio-balloon context at some point, but can remove it for
>> now to simplify.
>>
>> ram_block_uncoordinated_discard_disable(), however, will block
>> virtio-balloon already via ram_block_discard_is_disabled(). (yes,
>> virtio-balloon is ugly)
> 
> Oops, I missed that API.
> 
> Does it make sense to turn the API inside out, with the
> coordinated/uncoordinated choice as an argument and the start/finish
> choice in the name?
> 
> enum {
>       RAM_DISCARD_ALLOW_COORDINATED = 1,
> };
> 

Any reason to go with an enum/flags for this case and not "bool 
allow_coordinated" ?

> bool ram_discard_disable(int flags, Error **errp);
> void ram_discard_enable(int flags);
> int ram_discard_start(bool coordinated, Error **errp);
> void ram_discard_finish(bool coordinated);

Yeah, I tried to avoid boolean flags ;) Don't have a strong opinion. At 
least we get shorter names.


-- 
Thanks,

David / dhildenb


