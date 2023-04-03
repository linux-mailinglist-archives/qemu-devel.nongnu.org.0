Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C36D4D95
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:25:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMzE-00078S-AU; Mon, 03 Apr 2023 12:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjMzC-000780-KZ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjMzA-0006aT-U3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680539087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTASNOIQ4ZJ8UuUzEMmCBEjmYWpBaUwBkj2MK0lhyE8=;
 b=YPN1tau/mhCY60d+1YLvZlkxfEe40cOlfA+lQm2ErmgUSvL9wRr8A//bFPF7wtE6GuMJ6p
 W2LwFvhwOfd05XRgwIoE2FvlQsK9W+1A0djWTVstF/DCC5MuULkTv0WY3goRDdU2zfOPbJ
 UZYir/qSe303a13pVF03wHjDensjlCM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-6uaHGAkvOK-fl3J4GXAh3g-1; Mon, 03 Apr 2023 12:24:46 -0400
X-MC-Unique: 6uaHGAkvOK-fl3J4GXAh3g-1
Received: by mail-wm1-f72.google.com with SMTP id
 o7-20020a05600c4fc700b003edf85f6bb1so16406077wmq.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539085;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NTASNOIQ4ZJ8UuUzEMmCBEjmYWpBaUwBkj2MK0lhyE8=;
 b=l6uy3jXZXaPTEp3WTugeF7nznncGT6o0lm4CAvV2AxU9JhAqLGTxr30y6x8h6wTtu6
 YK/pg2Fq/NYjsch97NZKg5mFwAsVbVBtn9rE38ccR7k/1pXqC30UNWPNMwX2BcEDUfJ8
 lUX8m55eZknqktbJ5G6lK1l24dovNanDMc7LCe2jGmG41hoJiFV+ah5PJmH3kKjb7bLK
 pFwMVmJqT5nJvBayjHTbquwuQm/bPtwPK2DaZHzL09fIvUzawPj4CTC2jwN7I8/CYY2Z
 mTX47Od4yur1RH/h9REcXEVBJSoIr0KM7tO2QLXCAIeM9g1898Z4EissGzK3Co8f1JrI
 A6YA==
X-Gm-Message-State: AAQBX9fWeeDWtYm5npe+lEYZyWWBpozJElFOHaSdIDtFvclS34Zwn7m5
 aPoSQtBJJ1FxwdYPnpZA7tVI5M52kPRV2pj3lYRI9626+QCCSMijyAUZxh5dpCNPzI98OoePhkR
 L+qBhhh3KKJNc53Q=
X-Received: by 2002:a1c:7717:0:b0:3f0:48f4:8454 with SMTP id
 t23-20020a1c7717000000b003f048f48454mr33122wmi.27.1680539084956; 
 Mon, 03 Apr 2023 09:24:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1fYZVljjtBAOmCq+d10/2UbMZaKcqyrM8sBBy1nyT5sBKdToPKqemyCv1/fzjmSguHBeEsA==
X-Received: by 2002:a1c:7717:0:b0:3f0:48f4:8454 with SMTP id
 t23-20020a1c7717000000b003f048f48454mr33110wmi.27.1680539084607; 
 Mon, 03 Apr 2023 09:24:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:5e00:8e78:71f3:6243:77f0?
 (p200300cbc7025e008e7871f3624377f0.dip0.t-ipconnect.de.
 [2003:cb:c702:5e00:8e78:71f3:6243:77f0])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a1cf612000000b003ee58e8c971sm12508549wmc.14.2023.04.03.09.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:24:43 -0700 (PDT)
Message-ID: <39fb1702-1db3-4525-24f1-5f4f506a6d0b@redhat.com>
Date: Mon, 3 Apr 2023 18:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with multifd
 and fixed-ram
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com, 
 dgilbert@redhat.com, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de>
 <733d9f6b-476c-a401-bc0b-e01fd2206a2a@redhat.com> <87355hf2pd.fsf@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87355hf2pd.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03.04.23 16:41, Fabiano Rosas wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 30.03.23 20:03, Fabiano Rosas wrote:
>>> Hi folks,
>>>
>>> I'm continuing the work done last year to add a new format of
>>> migration stream that can be used to migrate large guests to a single
>>> file in a performant way.
>>>
>>> This is an early RFC with the previous code + my additions to support
>>> multifd and direct IO. Let me know what you think!
>>>
>>> Here are the reference links for previous discussions:
>>>
>>> https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01813.html
>>> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01338.html
>>> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05536.html
>>>
>>> The series has 4 main parts:
>>>
>>> 1) File migration: A new "file:" migration URI. So "file:mig" does the
>>>      same as "exec:cat > mig". Patches 1-4 implement this;
>>>
>>> 2) Fixed-ram format: A new format for the migration stream. Puts guest
>>>      pages at their relative offsets in the migration file. This saves
>>>      space on the worst case of RAM utilization because every page has a
>>>      fixed offset in the migration file and (potentially) saves us time
>>>      because we could write pages independently in parallel. It also
>>>      gives alignment guarantees so we could use O_DIRECT. Patches 5-13
>>>      implement this;
>>>
>>> With patches 1-13 these two^ can be used with:
>>>
>>> (qemu) migrate_set_capability fixed-ram on
>>> (qemu) migrate[_incoming] file:mig
>>
>> There are some use cases (especially virtio-mem, but also virtio-balloon
>> with free-page-hinting) where we end up having very sparse guest RAM. We
>> don't want to have such "memory without meaning" in the migration stream
>> nor restore it on the destination.
>>
> 
> Is that what is currently defined by ramblock_page_is_discarded ->
> virtio_mem_rdm_is_populated ?

For virtio-mem, yes. For virtio-balloon we communicate that information 
via qemu_guest_free_page_hint().

> 
>> Would that still be supported with the new format? For example, have a
>> sparse VM savefile and remember which ranges actually contain reasonable
>> data?
> 
> We do ignore zero pages, so I don't think it would be an issue to have
> another criteria for ignoring pages. It seems if we do enable postcopy
> load w/ fixed-ram that would be already handled in postcopy_request_page.

Ok, good. Just to note that we do have migration of sparse RAM blocks 
working and if fixed-ram would be incompatible we'd have to fence it.

-- 
Thanks,

David / dhildenb


