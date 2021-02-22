Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D446321905
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:38:13 +0100 (CET)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBPg-0002sV-Lf
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEBL1-0007B1-UD
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:33:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEBKy-0008Ke-QR
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614000800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GndeuVZlGOyxr9eoI34S65PpUOXaIPIWGk6BH8nJ/uw=;
 b=i8gtDSS1IRCsTKhVF8JfGhtTIuotj0+dCONXb8RnT3Qs/sb3rwn6tOtb4IpKQ3/HvJ91Wr
 G/XaJpXbM/MYAb6EaelxGSM2uF6Ehxhh7ZVcAxLMi6qet0VJKrKq45RNLl3urGammubz8F
 DfqOrsFMVNObKtSp/Hu/RluJRGF7yYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-GDcgrEfxMcKkq7CVMbCmkw-1; Mon, 22 Feb 2021 08:33:16 -0500
X-MC-Unique: GDcgrEfxMcKkq7CVMbCmkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF45680197B;
 Mon, 22 Feb 2021 13:33:14 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EE5A19C81;
 Mon, 22 Feb 2021 13:33:11 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-10-david@redhat.com>
 <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v6 09/12] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
Message-ID: <d64fdd53-6868-15fd-ea81-fa26e153eced@redhat.com>
Date: Mon, 22 Feb 2021 14:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 22.02.21 14:14, Paolo Bonzini wrote:
> On 22/02/21 12:57, David Hildenbrand wrote:
>>
>>   
>> -/*
>> - * If positive, discarding RAM is disabled. If negative, discarding RAM is
>> - * required to work and cannot be disabled.
>> - */
>> -static int ram_block_discard_disabled;
>> +static unsigned int ram_block_discard_requirers;
>> +static unsigned int ram_block_discard_disablers;
> 
> Requirer is not an English word, so perhaps use required_cnt and
> disabled_cnt?

I did a internet search back then and was not completely sure if it's 
okay. See

https://en.wiktionary.org/wiki/requirer

for example (not 100% trustworthy of course).

No strong opinion on the name (required_cnt/disabled_cnt is clearer).

> 
> Also, uncoordinated require is unused, and therefore uncoordinated
> disable is also never going to block anything.  Does it make sense to
> keep it in the API?

Right, "ram_block_discard_require()" is not used yet. I am planning on 
using it in virtio-balloon context at some point, but can remove it for 
now to simplify.

ram_block_uncoordinated_discard_disable(), however, will block 
virtio-balloon already via ram_block_discard_is_disabled(). (yes, 
virtio-balloon is ugly)

-- 
Thanks,

David / dhildenb


