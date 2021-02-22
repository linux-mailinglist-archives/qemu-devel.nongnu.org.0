Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B631321E63
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:44:19 +0100 (CET)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFFo-0003fV-Mt
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEF4P-0004eR-3u
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEF4L-0008KQ-Bi
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RK6BqdTLgYERtPUPgUNQFBRl05B+FMe/hD1UYhdZRdo=;
 b=hI7S+WQwWgj1cyn7bQkd9RYUy4uLUzEMCYQrfIOXS4wN9GdeB0hvTb8BIyJqKLtvUeG48A
 A+xqSN1lm8t2uSFGgqu2vIiJ1K3fU2zGMU5w5Bgi88FPR7pl4yE4hgMW5pnvGv/Vb1C2OY
 VTT05UXfZZw8uZme8KF3suv6EsDYzYU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-UjC2MJETPdW6wPHQXKCKYw-1; Mon, 22 Feb 2021 12:32:20 -0500
X-MC-Unique: UjC2MJETPdW6wPHQXKCKYw-1
Received: by mail-ej1-f71.google.com with SMTP id t5so2717875eje.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RK6BqdTLgYERtPUPgUNQFBRl05B+FMe/hD1UYhdZRdo=;
 b=LPt0kPJjYGB7aWFewGQkjzxpEGczy35pqAwE3DYaGmpSuJUzbOGjLluOAs/C1kcjdi
 QZM6zdkY2PikyCA2eKiIJN2E6qXSnBl3Qy3LHdCl7H5d7ozkXwzSl95ir96k9cA5hpUZ
 lrbaPWvwt9B6OqgbPPu00rMuB07DYlbgCuuT/qEKvIhiaJay3tGRPu6rFzf7KSv+KQj5
 cOYkcBsxxzUV6N+UINPtHgFqmlX7vVd0ZGO7bDmWbIxAN3y+vXuGdvAH8hOPoBKvuWFl
 QhWOnj8cOYTaiQHl84yID0vRI8jDkEt/hyq1CaoTr0KzgG0+HNp6+Fo5NsC6e9ICx2aL
 bkNg==
X-Gm-Message-State: AOAM531V8vNo8BfxRCyuy6on2k6PzTpq5hy/7u6U1D5EDnnkG+f32HC6
 6c3Sya3dNkxvbV1bdsMj8sQQv/mNFLtlSBzhaFg+ZLt6QJ8+4LNJRrKaZMJmMJeXHTB1ZN2CAUf
 vJ7WgVO5z15lSktA=
X-Received: by 2002:a50:ee16:: with SMTP id g22mr24885749eds.235.1614015138885; 
 Mon, 22 Feb 2021 09:32:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySoITaWVzXQkBOVB0a+6DV+TgjC7HuTfoLfms4qmRidrz14DM8oBVlzGbfaIeCeE4MoSBVkg==
X-Received: by 2002:a50:ee16:: with SMTP id g22mr24885725eds.235.1614015138755; 
 Mon, 22 Feb 2021 09:32:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bz20sm11176708ejc.28.2021.02.22.09.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:32:18 -0800 (PST)
Subject: Re: [PATCH v6 09/12] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-10-david@redhat.com>
 <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
 <d64fdd53-6868-15fd-ea81-fa26e153eced@redhat.com>
 <61237335-b03f-cb89-c0be-03fc3058c13b@redhat.com>
 <9b127669-f84e-7f8c-f76c-2bf7b206d68b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fa76ac9e-933f-4cdc-0d88-d07604999f45@redhat.com>
Date: Mon, 22 Feb 2021 18:32:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9b127669-f84e-7f8c-f76c-2bf7b206d68b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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

On 22/02/21 16:38, David Hildenbrand wrote:
> On 22.02.21 15:02, Paolo Bonzini wrote:
>> On 22/02/21 14:33, David Hildenbrand wrote:
>>>> Also, uncoordinated require is unused, and therefore uncoordinated
>>>> disable is also never going to block anything.  Does it make sense to
>>>> keep it in the API?
>>>
>>> Right, "ram_block_discard_require()" is not used yet. I am planning on
>>> using it in virtio-balloon context at some point, but can remove it for
>>> now to simplify.
>>>
>>> ram_block_uncoordinated_discard_disable(), however, will block
>>> virtio-balloon already via ram_block_discard_is_disabled(). (yes,
>>> virtio-balloon is ugly)
>>
>> Oops, I missed that API.
>>
>> Does it make sense to turn the API inside out, with the
>> coordinated/uncoordinated choice as an argument and the start/finish
>> choice in the name?
>>
>> enum {
>>       RAM_DISCARD_ALLOW_COORDINATED = 1,
>> };
>>
> 
> Any reason to go with an enum/flags for this case and not "bool 
> allow_coordinated" ?

I find it slightly easier to remember the meaning of true for "bool 
coordinated" than for "bool allow_coordinated".  I don't like the API 
below that much, but having both RAM_DISCARD_ALLOW_COORDINATED for 
disable/enable and RAM_DISCARD_SUPPORT_COORDINATED for start/finish 
would be even uglier...

Paolo

>> bool ram_discard_disable(int flags, Error **errp);
>> void ram_discard_enable(int flags);
>> int ram_discard_start(bool coordinated, Error **errp);
>> void ram_discard_finish(bool coordinated);
> 
> Yeah, I tried to avoid boolean flags ;) Don't have a strong opinion. At 
> least we get shorter names.


