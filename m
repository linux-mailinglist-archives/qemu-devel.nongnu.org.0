Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594C3D0A74
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:24:57 +0200 (CEST)
Received: from localhost ([::1]:36092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67XE-0004RA-Hv
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m67WM-0003mR-VH
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m67WK-0006m8-3K
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626855839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwVJhKpM8uvlatsGpJD44Da31FZmBx/7pQ6CyEgOn/o=;
 b=CT8O+mKDT/4OB5ycAvuo2JBye6w6Gqx0Aluqlg3WRk9c9GWyly1vGxDNy0N3RzqqeB33Tt
 hyq29KwMwprHfVhEI1BXIiADs5jwnIfwYFpkgC6P5yGqzbLIIsZIt+ckllVswAh5r+8ivu
 2QOCCnoN/ehhJ7eaF6peTxavOwVMEMo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-IUGIVXGXMVaGO-2vdaAs3A-1; Wed, 21 Jul 2021 04:23:58 -0400
X-MC-Unique: IUGIVXGXMVaGO-2vdaAs3A-1
Received: by mail-wr1-f72.google.com with SMTP id
 o10-20020a05600002cab02901426384855aso642091wry.11
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cwVJhKpM8uvlatsGpJD44Da31FZmBx/7pQ6CyEgOn/o=;
 b=o5uM4WUOJGXSyZnt5PjUPLnakBQR/ptl/thVeedkGdhFo1MDJ+k9yhgYey01A0Buvs
 x28TUIpO+RBfY7DKKHymOrFIGwGs5wTUtj/ymkBSMu8Abo7QwphE1o4VUEtWr094J9eC
 SKnK1MvS9I2FqTfnKy5vne2v+94O9+LWFNRo+F0OxitwM7q5suK7KpEgLrtV6FkBx6AM
 FIEq5pJgbhNFf4K3U1aCG6eg8ny/kqHM1CNJRM5FVcTj5t94QkcmI0t15uJlEn57BD28
 JIUykFazJ4VYWuiTDuSFJJPxeSR9QQj6fzVytYtwhN53n973nVX7sNS+Zem+w0wsmLdZ
 ZKUw==
X-Gm-Message-State: AOAM532uWP8h3dSiyUM1RccNA7GoI4gCUD6D6cIM3O4aTH8AonD36v/C
 eBKY0JNdceEYa8WIqBv5WRaXRVnzJY+3nBQWdA9+7Y/XBwyQKOXWhF9GKwpE2Xuq8nQHjktz6ps
 bIwDCBaPnR0TsAA8=
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr2789665wmj.128.1626855837030; 
 Wed, 21 Jul 2021 01:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI2lTnTXKL5fIpjbH6bNicpl/pQG4ugzb/FdzIkLaV2ks5rm+mMHSZoTNuLKdH4j73Ong0CQ==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr2789650wmj.128.1626855836857; 
 Wed, 21 Jul 2021 01:23:56 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65c3.dip0.t-ipconnect.de. [91.12.101.195])
 by smtp.gmail.com with ESMTPSA id w8sm14856100wrk.10.2021.07.21.01.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 01:23:56 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
 <YPbhhj1mbwFtdc4z@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 0/3] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Message-ID: <028e93aa-c25c-93db-4f3a-40e5c1eaabb2@redhat.com>
Date: Wed, 21 Jul 2021 10:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbhhj1mbwFtdc4z@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 16:45, Daniel P. Berrangé wrote:
> On Wed, Jul 14, 2021 at 01:23:03PM +0200, David Hildenbrand wrote:
>> #1 adds support for MADV_POPULATE_WRITE, #2 cleans up the code to avoid
>> global variables and prepare for concurrency and #3 makes os_mem_prealloc()
>> safe to be called from multiple threads concurrently.
>>
>> Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
>> Linux commit 4ca9b3859dac ("mm/madvise: introduce
>> MADV_POPULATE_(READ|WRITE) to prefault page tables") and in the latest man
>> page patch [1].
> 
> Looking at that commit message, I see your caveat about POPULATE_WRITE
> used together with shared file mappings, causing an undesirable glut
> of dirty pages that needs to be flushed back to the underlying storage.
> 
> Is this something we need to be concerned with for the hostmem-file.c
> implementation ? While it is mostly used to point to files on tmpfs
> or hugetlbfs, I think users do something point it to a plain file
> on a normal filesystem.  So will we need to optimize to use the
> fallocate+POPULATE_READ combination at some point ?

In the future, it might make sense to use fallocate() only when it comes 
to shared file mappings.

AFAIKS os_mem_prealloc() currently serves the following purposes:

1) Preallocate anonymous memory or backend storage (file, hugetlbfs, ...)
2) Apply mbind() policy, preallocating it from the right node when 
applicable.
3) Prefault page tables

For shared mappings, it's a little bit difficult, though: mbind() does 
not seem to work on shared mappings (which to some degree makes 
logically sense, but I don't think QEMU users are aware that it is like 
that): "The specified policy will be ignored for any  MAP_SHARED 
mappings  in  the specified  memory range. Rather the pages will be 
allocated according to the memory policy of the thread that caused the 
page to be allocated. Again, this may not be the thread that called 
mbind()."

So 2) does not apply. A simple fallocate() can get 1) done more efficiently.

So if we want to use MADV_POPULATE_READ completely depends on whether we 
want 3). It can make sense to prefault page tables for RT workloads, 
however, there is usually nothing stopping the OS from clearing the page 
cache and requiring a refault later -- except with mlock.

So whether we want fallocate() or fallocate()+MADV_POPULATE_READ for 
shared file mappings really depends on the use case, and on the system 
setup. If the system won't immediately free up the page cache and undo 
what MADV_POPULATE_READ did, it might make sense to use it.

Long story short: it's complicated :)

-- 
Thanks,

David / dhildenb


