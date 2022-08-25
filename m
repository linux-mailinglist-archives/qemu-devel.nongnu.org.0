Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46105A0A49
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:30:47 +0200 (CEST)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7KA-00085i-N2
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oR7Gg-00064q-9Q
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oR7Gb-0006h4-R7
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661412424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7Bw1XZeIh18IQ+XvXcZXVLp0HNFgBcBfNqYqFq5ZRs=;
 b=hGnP0MboH6q/Y3pKQ/nvSuF7HDEsRZQJnIDaDyYmFagIqLee0utlYpNFBbZs5rLXomnvZX
 43jKaD17vKflZRNQBr1fG0rJjqXlp8XKeKTL83Tzk/nZyUEh7XXXDrm8dQwL+1FE4dN7zj
 pq1hQJSM/KoXqnhi0gJMjZnuzALJBVA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-jyGqeX_4MACav-szgPwvJA-1; Thu, 25 Aug 2022 03:27:02 -0400
X-MC-Unique: jyGqeX_4MACav-szgPwvJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfa2cc000000b00224f577fad1so3105945wra.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 00:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=H7Bw1XZeIh18IQ+XvXcZXVLp0HNFgBcBfNqYqFq5ZRs=;
 b=mTE7l5b2LfIjcboiSWqaq3UFeHWOp0xtguxpL6XnUOyEV/16M6c9bNY7biI8wQWk1Z
 TtZxexm90K9aQW3DZHbr2M1x41/4CLfhxyM8m4FJhS/6PsTaPCJ2E27vRmkAqHPat+Ve
 fDhPwfAWc2RXb451KlTcYvMOcMiIY8ImcEcGWpBsGPDXQITWs1TkQTijhA8K6TJ09X8O
 oR8h8IKsPV7ZQsc4DKhWpkJHWeb6FiZZQysv1CxVBYk3Yxrm8ZaJXsqhffYrEhwI6lHF
 Fq9VEBTep+VR4AUj1IW4v5PEngi04q4Bn4JZORrQy7TNrpb3hbIcwk3udHyT/WbS0UBU
 uymQ==
X-Gm-Message-State: ACgBeo203VSxo74/Q4+NaDUPDnATzpKP/ZeMbYPy85xlg1sx+fnAK2dE
 mVDyo7b2YLzzVoTNah/GOTN8F5+kyV8my/9XavDfiqjXugjPuaBUR9bfhplBkzqkaHGXrLaGt5i
 g+v3u8xaWrqk7L34=
X-Received: by 2002:a05:600c:3b92:b0:3a6:5645:5fc7 with SMTP id
 n18-20020a05600c3b9200b003a656455fc7mr1349913wms.148.1661412421232; 
 Thu, 25 Aug 2022 00:27:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7qY+9aLwbYj+KA0lqi2e3gO1is3OT6AhbIJHckTNJcA2M2LHyAYksDhLJgccXI22D43aYv3A==
X-Received: by 2002:a05:600c:3b92:b0:3a6:5645:5fc7 with SMTP id
 n18-20020a05600c3b9200b003a656455fc7mr1349897wms.148.1661412421004; 
 Thu, 25 Aug 2022 00:27:01 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 g1-20020adffc81000000b0022520aba90asm19461915wrr.107.2022.08.25.00.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 00:27:00 -0700 (PDT)
Message-ID: <bd40c251-b670-3a9a-f29c-86268d06a5b7@redhat.com>
Date: Thu, 25 Aug 2022 09:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Page alignment & memory regions expectations
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qiaonuohan@cn.fujitsu.com
References: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
 <e7b3468a-cdfb-4592-8a7a-48da2fa77647@redhat.com>
 <CAFEAcA9OH4ih2pOUbsv6dTMW=3_9LTkzSRj4ogO4oxVS4fOASw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAFEAcA9OH4ih2pOUbsv6dTMW=3_9LTkzSRj4ogO4oxVS4fOASw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.22 21:55, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 17:43, David Hildenbrand <david@redhat.com> wrote:
>> One idea is doing another pass over the list at the end (after possible
>> merging of sections) and making sure everything is page-aligned.
>>
>> Another idea is specifying somehow that that memory region should simply
>> not be dumped ...
>>
>>
>> But I do wonder why the ram memory region that's mapped into the guest
>> physical address space has such a weird alignment/size ...
> 
> Lumps of memory can be any size you like and anywhere in
> memory you like. Sometimes we are modelling real hardware
> that has done something like that. Sometimes it's just
> a convenient way to model a device. Generic code in
> QEMU does need to cope with this...

But we are talking about system RAM here. And judging by the fact that
this is the first time dump.c blows up like this, this doesn't seem to
very common, no?


-- 
Thanks,

David / dhildenb


