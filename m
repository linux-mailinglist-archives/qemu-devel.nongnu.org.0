Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D600B3D3678
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:17:47 +0200 (CEST)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qNO-000446-Sr
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6qMM-00031a-SD
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6qMJ-0006sn-UR
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627028198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYQIP3wotaPTSGZwqHBJ55y7q1gGCjl/ZiOTfuHAaTE=;
 b=hH+kKLvVPp9oPPX6nhO4sgxyadBrkKAbg1HD3kNFAz+wlPRdDxZ+Z1wTo4U+JbM9pqa3iI
 f92EZtu/pHOf7YfPbTNnpJl9mvCMsa83S0d7jI4vcMeT5fx1u+W1eZZ+/H5OHGHayHJida
 a4mDVhGHbuLdh1Van1+XmtLjmu7klkI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-U2aIawobPHyAdqqc5FamCQ-1; Fri, 23 Jul 2021 04:16:37 -0400
X-MC-Unique: U2aIawobPHyAdqqc5FamCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a05600c3b87b029024e59a633baso130562wms.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 01:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qYQIP3wotaPTSGZwqHBJ55y7q1gGCjl/ZiOTfuHAaTE=;
 b=OtTAqvPnkqCxzF9eiSyZol7tkSFN08xh58hic3XrVVTT6hLmZ1QZJxCsl3cMj/1aNp
 YKXNJY4e+xLcHeqZeftcKjN6xdiTbFXNfBmEexA9TE25ePIetwv09lEXjBllE5EiSczs
 XydBiBRRHpj0CQyxeRRGOMUU36hb8ZfOj0KRQT71wegIzV4CjMim2Um2aL60DHhfGMET
 DdxrVTO3WnRvykpZ6+1AFEq1tqZJzQN/zM5UP7tz4pHAfm0nMAIKDz3oX0bLYTfdOdoP
 6pvTyMPW52SpaGrWcAGL1SYAeRHPoNcoY9+c6x547/E3gyGEnE9aSYOVtcS8MEEv+KCH
 Tnvw==
X-Gm-Message-State: AOAM533h3OAXLhONiFfKW9QdkAps4lFMa3AQ8IhkqDYDHUwrNzhZmB3v
 dgwxBQ4kXZlBUZdjDoYDFe9rRktTPLDqCve+OPArabwNLHF/ZFt5e+RieuaybskXodY4QKcCg/z
 qBq2GbMpiU+nOLMA=
X-Received: by 2002:a7b:c18f:: with SMTP id y15mr3249750wmi.128.1627028196357; 
 Fri, 23 Jul 2021 01:16:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/KC1vbPCdpo2ftKOH4vWtr1aDWsXBpv1vHiRhaTQIEoVLH3yr3W5cyQQn3AK7sRVePPTKZg==
X-Received: by 2002:a7b:c18f:: with SMTP id y15mr3249724wmi.128.1627028196145; 
 Fri, 23 Jul 2021 01:16:36 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id a14sm7554541wrf.97.2021.07.23.01.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 01:16:35 -0700 (PDT)
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
To: "Wang, Wei W" <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com> <YPmF1BAHA059yYln@t490s>
 <ab4a5e1e-ed7f-5b4b-88e6-d4c56ed5a256@redhat.com> <YPmt3vrn5MfH6I13@t490s>
 <087670b0-d28c-7f3d-caf4-f37acf8f7d7e@redhat.com>
 <30a4eb65544241719a55bc2a9e9e1605@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9d891b0f-65ff-b6e8-3ef1-81d038e9d010@redhat.com>
Date: Fri, 23 Jul 2021 10:16:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <30a4eb65544241719a55bc2a9e9e1605@intel.com>
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 10:14, Wang, Wei W wrote:
> On Friday, July 23, 2021 3:50 PM, David Hildenbrand wrote:
>>
>> Migration of a 8 GiB VM
>> * within the same host
>> * after Linux is up and idle
>> * free page hinting enabled
>> * after dirtying most VM memory using memhog
> 
> Thanks for the tests!
> 
> I think it would be better to test using idle guests (no memhog).
> With memhog eating most of the guest free pages, it's likely no or very few free pages are reported during the test.

*After dirtying*. memhog is no longer running.

... and also look again at the numbers how much memory we actually 
migrate :)

-- 
Thanks,

David / dhildenb


