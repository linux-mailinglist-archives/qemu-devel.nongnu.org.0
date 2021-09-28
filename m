Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A641B4E3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:19:30 +0200 (CEST)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGlN-0005eQ-B3
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVGjl-0004lD-C5
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVGji-0007RG-L7
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632849465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGPES9MH50HCrZ1Oc8WNDN5MJ4mYsfaXro45A5UrBKw=;
 b=TDitd91z5z83IgnKZRaZKxArhhuy2Uj/D0wE7P7bGsnB9fJHFHWMkSJSdCQyuDLjuxYNE4
 2oF5PGJa4Tc/6i0pZhU/kep83XromntlTva9zVC6swr6vKPPLIdL+3dUhTNlirOq1enMTq
 5tR1euS0l3yaZxwfNe1Bbo4FBYKygH8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-BZnzytO_ME67fXTVVzlpmQ-1; Tue, 28 Sep 2021 13:17:44 -0400
X-MC-Unique: BZnzytO_ME67fXTVVzlpmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n3-20020a7bcbc3000000b0030b68c4de38so1234350wmi.8
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 10:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yGPES9MH50HCrZ1Oc8WNDN5MJ4mYsfaXro45A5UrBKw=;
 b=a7H9aq6u7SB99hLS1pc/ssIoBEmtFu0uVo0t7Q8pLvEEpBrLaJZVH5pOlgzDHVloni
 HkyN7njToZ1G1R1B6KQuCdHdSLzELNAjrwHSq4fl5oYrG+0kuuUo5UCE9kIdqh1ACdpa
 ROPCRedb0iszUttUK5Qfdr2wYVKwz9eTJpLBxgL2jXmAE6mv9H3I/doBar7QTd+lhjEL
 pY+Z5sLE/L704jyoTUO/qZI0tJW5kP4AiBQNI86LUb0zSbpkwIwXdpPCUgu24lKpIpXQ
 jT4rKr2PTBH3H38Rhl8B2aD0q9kB2AT4jElEZhjwUkqMT46uruTchhK0r0bCy10jkZ6x
 Hs6g==
X-Gm-Message-State: AOAM5335Ro9xS7uO7x1/K0d1dAAQOEcb7xaA4FI0dYQeG9KJnzE069vB
 b9sdmOR+N7nTc1i17Wsevu5no6fggtGdPDYSTpT0dmh1HJwuXXq+Mu18tdMd/6/VOQ5MDjyxHz1
 2VKuHLxplibd6iHg=
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr1449935wrs.155.1632849462954; 
 Tue, 28 Sep 2021 10:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOtmlVuDJUGvr3P0I1I+TRH+bPi6pPsMkiAXJ/p/aHcBSNPW19foSHHhPc2oLpgW4LDJY1QA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr1449922wrs.155.1632849462817; 
 Tue, 28 Sep 2021 10:17:42 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aaf.dip0.t-ipconnect.de. [79.242.58.175])
 by smtp.gmail.com with ESMTPSA id d7sm20403966wrh.13.2021.09.28.10.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 10:17:42 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
 <20210816094739.21970-7-david@redhat.com> <YVNJSYSP/IVUipc9@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f7272da8-0c92-c53b-1d1a-fa7831280471@redhat.com>
Date: Tue, 28 Sep 2021 19:17:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVNJSYSP/IVUipc9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.09.21 18:56, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 11:47:38AM +0200, David Hildenbrand wrote:
>> Add a mutex to protect the SIGBUS case, as we cannot mess concurrently
>> with the sigbus handler and we have to manage the global variable
>> sigbus_memset_context. The MADV_POPULATE_WRITE path can run
>> concurrently.
>>
>> Note that page_mutex and page_cond are shared between concurrent
>> invocations, which shouldn't be a problem.
>>
>> This is a preparation for future virtio-mem prealloc code, which will call
>> os_mem_prealloc() asynchronously from an iothread when handling guest
>> requests.
>>
>> Add a comment that messing with the SIGBUS handler is frowned upon and
>> can result in problems we fortunately haven't seen so far. Note that
>> forwarding signals to the already installed SIGBUS handler isn't clean
>> either, as that one might modify the SIGBUS handler again.
> 
> Even with the mutex, messing with SIGBUS post-startup still isn't safe
> as we're clashing with SIGBUS usage in softmmu/cpus.c

You raise a valid point, though: this node is stale (there is no such 
comment) and shall be removed :)

Thanks!

-- 
Thanks,

David / dhildenb


