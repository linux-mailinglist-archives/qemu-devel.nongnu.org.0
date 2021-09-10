Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52549407048
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:11:41 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOk3w-0007FK-EE
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOk1l-0005BQ-Q9
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOk1k-0006PW-3L
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631293763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ghYKpDGJ0pWXK5/GjdisrC3zwcdeSby5dhoq1hV2uM=;
 b=FgY6e6DZHKSRtHehjgPMmJJ1il5jmCLKXrZnczp2BOEawLqO9OD61r4zGFjn5Nr/HhrAWE
 e7un9RQbH1Tx2tdIp9ucn+hdBnYioB7PJmaRq1pfQINQOU8Kyg+e5XBi45GPOzDnw/ESnx
 1yeuvo+3KXPsEgv/CvItQO9aqaMesYc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-O_0olqmVMTWWnipa5KPI3w-1; Fri, 10 Sep 2021 13:09:22 -0400
X-MC-Unique: O_0olqmVMTWWnipa5KPI3w-1
Received: by mail-wm1-f72.google.com with SMTP id
 r3-20020a05600c35c300b002fbb0888a42so1184855wmq.6
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ghYKpDGJ0pWXK5/GjdisrC3zwcdeSby5dhoq1hV2uM=;
 b=buyWIcIEjizUxiuEaJ4XrA3for7r3MoBkpA5Vb4ZJCvSk9pqhTWtnV90568IRYOeao
 VLs1dpvHCSrEH8tQ86pPYzZKpnYiXnH0gDTY84FN5d0F80IXbW+Q3/L+Lc/jCWWGh7qi
 A0pb2ePB/QX1SrOC5ztlT/b6DhnyNxNZCi7/6ZA/Sjj64HjEfd4OZwwuwG9yPHIurj1s
 dyTJwcYV7kSEZLWhLqXK0yrwch5kgI5xvznK5eSAL3EreNf3sP/2/paONyWkLbclr10C
 Zi8DmIJ4RqXEJfqWomhA+N6ODKvXJBdAx2WBX+UVofdwuBa3eRnA/U9maX7I3H266wWI
 FaEg==
X-Gm-Message-State: AOAM533n95SBGYTIsNsoEEfT4GGO9R96hElGapF2rZI6BaaKIhuchrJs
 NmyTDqLcyZ3f9/W/rjUYZNIsfFki0X0IxvMLpEbJStZEqzvYhITrrssxJ0p18fqrz+977Yej6DC
 HPcZt41R5Rwostrw=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr9503841wmj.37.1631293760801;
 Fri, 10 Sep 2021 10:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA9E4K9KxZv/sZ0gA7iQOoXAEoWfMqgkLbouPWPeHIYuEhs6QuDhXer/zJ52yyU6fFwnY9Kw==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr9503816wmj.37.1631293760541;
 Fri, 10 Sep 2021 10:09:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t11sm5133601wmi.23.2021.09.10.10.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 10:09:18 -0700 (PDT)
To: Sean Christopherson <seanjc@google.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
 <YTt7H9ifqjeOQztl@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
Message-ID: <b940de84-7eac-59de-7b15-15060c31de52@redhat.com>
Date: Fri, 10 Sep 2021 19:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTt7H9ifqjeOQztl@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, jarkko@kernel.org, eblake@redhat.com,
 qemu-devel@nongnu.org, kai.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/09/21 17:34, Sean Christopherson wrote:
>> Yang explained to me (offlist) that this is needed because Windows fails to
>> reboot without it.  We would need a way to ask Linux to reinitialize the
>> vEPC, that doesn't involve munmap/mmap; this could be for example
>> fallocate(FALLOC_FL_ZERO_RANGE).
>>
>> What do you all think?
>
> Mechanically, FALLOC_FL_ZERO_RANGE could work, but it's definitely a stretch of
> the semantics as the underlying memory would not actually be zeroed.

The contents are not visible to anyone, so they might well be zero
(not entirely serious, but also not entirely unserious).

> The only other option that comes to mind is a dedicated ioctl().

If it is not too restrictive to do it for the whole mapping at once,
that would be fine.  If it makes sense to do it for a range, however,
the effort of defining a ioctl() API is probably not worth it when
fallocate() is available.

Either way, I suppose it would be just something like

	/* for fallocate; otherwise just use xa_for_each */
	size = min_t(unsigned long, size, -start);
	end = (start + size - 1) >> PAGE_SHIFT;
	start >>= PAGE_SHIFT;

	/*
	 * Removing in two passes lets us remove SECS pages as well,
	 * since they can only be EREMOVE'd after all their child pages.
	 * An EREMOVE failure on the second pass means that the SECS
	 * page still has children on another instance.  Since it is
	 * still in the xarray, bury our head in the sand and ignore
	 * it; sgx_vepc_release() will deal with it.
	 */
	LIST_HEAD(secs_pages);
         xa_for_each_range(&vepc->page_array, index, entry, start, end) {
                 if (!sgx_vepc_free_page(entry))
                         list_add_tail(&epc_page->list, &secs_pages);
         }

         list_for_each_entry_safe(epc_page, tmp, &secs_pages, list) {
		list_del(&epc_page->list);
                 sgx_vepc_free_page(epc_page);
         }
  
So another advantage of the ioctl would be e.g. being able to return the
number of successfully EREMOVEd pages.  But since QEMU would not do
anything with the return value and _also_ bury its head in the sand,
that would only be useful if you guys have other uses in mind.

Paolo


