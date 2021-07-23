Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4D3D3AAC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:54:18 +0200 (CEST)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ugz-0005kY-La
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6uff-00054R-7m
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6ufc-00007J-HY
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627044771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjIR/5HgBoMkgbV7zdEFJX4COKIj4g3GgARn3MKN838=;
 b=e7DqB6+t4fAsoDbEqtFOIu9201QYvhQTWOdpJwvLFs7XCAYDCYi2i7Dx+YN0nHsO8MMpWD
 ub9A/ujdQrx3mQ2ftfUX1XUzDRc662Iw2eYtJVnub3JWD+mrzZiE/DhKuXE+JRf8FI7dUe
 VgnFkCk/a+UuOBHRO9bbiLaP4uAWyKw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-4sV5WJQDOvmCm4vQ193TSw-1; Fri, 23 Jul 2021 08:52:50 -0400
X-MC-Unique: 4sV5WJQDOvmCm4vQ193TSw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i8-20020a1c54080000b02901e46e4d52c0so1384821wmb.6
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UjIR/5HgBoMkgbV7zdEFJX4COKIj4g3GgARn3MKN838=;
 b=BdaBntuTFF67cxYcZ43SbCdGwV/fje4HZcal5XwuDRbKS8/mdM4BbwYWIS6MTzjUE5
 QL2EyS32B06V8Bjkm9HPm6XL7UDdNwxAcwHN5shW6gbePWRGztvJ1c4fFyqTPv4tWVI3
 YWvedGAUz8gDoTfKiTtgQ46oWw6KnAXVLJg5aDmfQCNr/422mWJIPhbTLrwhlZXNjVqp
 MPJo+SO1+shMYLJCd/kYrTf0XQiWisu6p1hsSz5806BTmNci9hgmOAv7M4RbodzwoGb2
 OwK13elsANdr44DwNQcFMhSB3vHgn5FLwV9rxkfq5jxJTIy0GqlU3aqiNS72/5E2s3E4
 BEWw==
X-Gm-Message-State: AOAM532l7SPr0ftk8xUkCjM3E1JAeWTxkz99CY+LmwoITQd7TnfTiOap
 uCDbBo6eo/mL2OXp1oGEPRVJ9JgP3+oxxINTPTRcHcjf3u4XZovKYgz6CvpJRnYGf+0yarmja+y
 clKyoF6ygtuYNY10=
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr13875776wmj.37.1627044769380; 
 Fri, 23 Jul 2021 05:52:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9dnmmOF255XlEXE93sKP8YWiWFgrW5jxiRZV2kjKuL771nsubgXKJ00z6huscCC8et5tlrQ==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr13875761wmj.37.1627044769132; 
 Fri, 23 Jul 2021 05:52:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id c16sm504603wru.82.2021.07.23.05.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 05:52:48 -0700 (PDT)
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
To: Peter Xu <peterx@redhat.com>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com> <YPmF1BAHA059yYln@t490s>
 <ab4a5e1e-ed7f-5b4b-88e6-d4c56ed5a256@redhat.com> <YPmt3vrn5MfH6I13@t490s>
 <087670b0-d28c-7f3d-caf4-f37acf8f7d7e@redhat.com> <YPq7Txt3SnIpdNKD@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <30889234-668c-7867-ea6a-b411d5b2a3e5@redhat.com>
Date: Fri, 23 Jul 2021 14:52:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPq7Txt3SnIpdNKD@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Wang, Wei W" <wei.w.wang@intel.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 14:51, Peter Xu wrote:
> On Fri, Jul 23, 2021 at 09:50:18AM +0200, David Hildenbrand wrote:
>> On 22.07.21 19:41, Peter Xu wrote:
>>> On Thu, Jul 22, 2021 at 04:51:48PM +0200, David Hildenbrand wrote:
>>>> I'll give it a churn.
>>>
>>> Thanks, David.
>>>
>>
>> Migration of a 8 GiB VM
>> * within the same host
>> * after Linux is up and idle
>> * free page hinting enabled
>> * after dirtying most VM memory using memhog
>> * keeping bandwidth set to QEMU defaults
>> * On my 16 GiB notebook with other stuff running
>>
>>
>> Current upstream with 63268c4970a, without this patch:
>>
>> total time: 28606 ms
>> downtime: 33 ms
>> setup: 3 ms
>> transferred ram: 3722913 kbytes
>> throughput: 1066.37 mbps
>> remaining ram: 0 kbytes
>> total ram: 8389384 kbytes
>> duplicate: 21674 pages
>> skipped: 0 pages
>> normal: 928866 pages
>> normal bytes: 3715464 kbytes
>> dirty sync count: 5
>> pages-per-second: 32710
>>
>> Current upstream without 63268c4970a, without this patch:
>>
>> total time: 28530 ms
>> downtime: 277 ms
>> setup: 4 ms
>> transferred ram: 3726266 kbytes
>> throughput: 1070.21 mbps
>> remaining ram: 0 kbytes
>> total ram: 8389384 kbytes
>> duplicate: 21890 pages
>> skipped: 0 pages
>> normal: 929702 pages
>> normal bytes: 3718808 kbytes
>> dirty sync count: 5
>> pages-per-second: 32710
>>
>>
>> Current upstream without 63268c4970a, with this patch:
>>
>> total time: 5115 ms
>> downtime: 37 ms
>> setup: 5 ms
>> transferred ram: 659532 kbytes
>> throughput: 1057.94 mbps
>> remaining ram: 0 kbytes
>> total ram: 8389384 kbytes
>> duplicate: 20748 pages
>> skipped: 0 pages
>> normal: 164516 pages
>> normal bytes: 658064 kbytes
>> dirty sync count: 4
>> pages-per-second: 32710
>>
>>
>> Current upstream with 63268c4970a, with this patch:
>>
>> total time: 5205 ms
>> downtime: 45 ms
>> setup: 3 ms
>> transferred ram: 659636 kbytes
>> throughput: 1039.39 mbps
>> remaining ram: 0 kbytes
>> total ram: 8389384 kbytes
>> duplicate: 20264 pages
>> skipped: 0 pages
>> normal: 164543 pages
>> normal bytes: 658172 kbytes
>> dirty sync count: 4
>> pages-per-second: 32710
>>
>>
>>
>> I repeated the last two measurements two times and took the "better"
>> results.
>>
>> Looks like this patch does it job and that 63268c4970a doesn't seem to
>> degrade migration in this combination/setup significantly (if at all, we
>> would have to do more measurements).
> 
> Thanks again for helping!
> 
> Just to double check: the loop in qemu_guest_free_page_hint() won't run for a
> lot of iterations, right?  Looks like that only happens when over ramblock
> boundaries.  Otherwise we may also want to move that mutex out of the loop at
> some point because atomic looks indeed expensive on huge hosts.

I'd expect it never ever happens.

-- 
Thanks,

David / dhildenb


