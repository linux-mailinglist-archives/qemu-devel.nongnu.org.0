Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CFA32AC1E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:11:57 +0100 (CET)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCJA-0001bV-7J
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHC79-0006Zv-LQ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHC77-0000zi-P9
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614718766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFeFwgd416hJgfI8CWTw0qkdzSGitcUKICDrANuntTg=;
 b=XLN/KyCobY5mv7LN0QlS3SJnyobSGgqHpgH3BD/GSyLmr9jSI5eM+8IDKoCHZMiv8GO0qG
 /ZQvAD6jYXoKuYAHs+AZw3Gox3TTloqUMBpDKkP7tW9IJZ+Wh3gvHyTGP2d2SfNvnRYLB5
 ij9LWbcbbDTwrFghEzBBgfFtSgJG7eY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-3qt4LCbVM_iATpODKkWvrA-1; Tue, 02 Mar 2021 15:59:23 -0500
X-MC-Unique: 3qt4LCbVM_iATpODKkWvrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5014A193578B;
 Tue,  2 Mar 2021 20:59:21 +0000 (UTC)
Received: from [10.36.112.56] (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 034C05D9C2;
 Tue,  2 Mar 2021 20:58:46 +0000 (UTC)
Subject: Re: [PATCH v1 7/9] memory: introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
To: Peter Xu <peterx@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-8-david@redhat.com> <20210302173243.GM397383@xz-x1>
 <91613148-9ade-c192-4b73-0cb5a54ada98@redhat.com>
 <20210302205432.GP397383@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9b7294f9-5269-0429-265d-47cf9c9b33c9@redhat.com>
Date: Tue, 2 Mar 2021 21:58:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302205432.GP397383@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.03.21 21:54, Peter Xu wrote:
> On Tue, Mar 02, 2021 at 08:02:34PM +0100, David Hildenbrand wrote:
>>>> @@ -174,12 +175,18 @@ void *qemu_ram_mmap(int fd,
>>>>                        size_t align,
>>>>                        bool readonly,
>>>>                        bool shared,
>>>> -                    bool is_pmem)
>>>> +                    bool is_pmem,
>>>> +                    bool noreserve)
>>>
>>> Maybe at some point we should use flags too here to cover all bools.
>>>
>>
>> Right. I guess the main point was to not reuse RAM_XXX.
>>
>> Should I introduce RAM_MMAP_XXX ?
> 
> Maybe we can directly use MAP_*?  Since I see qemu_ram_mmap() should only exist

I think the issue is that there is for example no flag that corresponds 
to "is_pmem" - and the fallback logic in our mmap code to make "is_pmem" 
still work is a little bit more involved. In addition, "readonly" 
translates to PROT_READ ...

> with CONFIG_POSIX.  However indeed I see no sign to extend more bools in the
> near future either, so maybe also fine to keep it as is, as 4 bools still looks
> okay - your call. :)

Well, I had the same idea when I added yet another bool :) But I guess 
we won't be adding a lot of additional flags in the near future. 
(MAP_POPULATE? ;) fortunately we use a different approach to populate 
memory)

I'll think about it, not sure yet if this is worth proper flags. Thanks!

-- 
Thanks,

David / dhildenb


