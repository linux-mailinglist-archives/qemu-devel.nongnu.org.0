Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7104206C0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:41:54 +0200 (CEST)
Received: from localhost ([::1]:33634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIbh-0000Yd-2y
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mXIZV-0008ES-6e
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mXIZQ-0000l6-Em
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633333169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWkEiC6WNKstEOHRcB+d0O4vO81lbVoid+4qNY3k1pU=;
 b=EVV/r0/tNlVzkoS4tyxr3hKp3gLhuWIBPzQN9SZXqx/RjhQpw3BMCP6YehJicSdUywwmZS
 c07QCaDxEjbRv3WjbWo0EQzIH/TJb+2i8HMpgCw2lt1P7bAYmzdt492O8kgS7W99or1kR0
 LMjJCe1SLVemDz6Uyyl+J1py7F+xK20=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-Q5Bs81NjPSuEZbVfSUl9iw-1; Mon, 04 Oct 2021 03:39:25 -0400
X-MC-Unique: Q5Bs81NjPSuEZbVfSUl9iw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so4314085wrg.10
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 00:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IWkEiC6WNKstEOHRcB+d0O4vO81lbVoid+4qNY3k1pU=;
 b=1s57BC+jtofBlIb3X9dghZYjC0kJ+kb5K+jQ5N8vfPqU8VbayPDoIe7ldHd6V8Nnwk
 7t/ZtY9ng1zzzPPa0jujMjprB0MbxhS/kO9qbvKGvPNXmdWeZhqkAv4wkXWHWwI2BFgI
 5+Iwq2xb79jxyTt/xrFnPIvPsnfrk/tpVQ5QS+OK1kK9xiP5PzcG9xy3mP+GCoNkE/OL
 TOc0oXqlWqghWxNfvWVf9QjuTwaonlOB235L1Bxr/BlmJf5xvzMo5hS9kyjLMOuPkvxB
 BRS04FapSNQMVQ18I8qY88uLqhTg4k5mzW5bHXEQCWjQjrLpKV2ltGmRnATtgcxfsyyv
 GP/g==
X-Gm-Message-State: AOAM532Dc3HjYtb2mbjt6OCbUk0JYb1NyQhnGNiBfnKKca/KT1EY4Xaf
 eMtFRBjfNsF+dEeN7bBBEFo03su03pwx2tn80WJwuUqNkAtZ3mngOX1eY087rjErzfwo1PM7AQy
 /wzJTyzMpIMtZuTE=
X-Received: by 2002:a5d:528a:: with SMTP id c10mr12609427wrv.101.1633333164490; 
 Mon, 04 Oct 2021 00:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl5xADYiNZXFxi97wluQQm721rf9BL2rjw6xawpK5PLuuNi89Ou2gb0WJPwAycnyrq1ZM6BA==
X-Received: by 2002:a5d:528a:: with SMTP id c10mr12609403wrv.101.1633333164319; 
 Mon, 04 Oct 2021 00:39:24 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6672.dip0.t-ipconnect.de. [91.12.102.114])
 by smtp.gmail.com with ESMTPSA id l2sm14952851wmi.1.2021.10.04.00.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 00:39:23 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] softmmu/memory_mapping: optimize dump/tpm for
 virtio-mem
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210727082545.17934-1-david@redhat.com>
 <15636272-1702-93c7-2c7d-59d889168350@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0d816d53-b882-5d46-1e4b-e2ce9787aeeb@redhat.com>
Date: Mon, 4 Oct 2021 09:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <15636272-1702-93c7-2c7d-59d889168350@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.10.21 11:55, Paolo Bonzini wrote:
> On 27/07/21 10:25, David Hildenbrand wrote:
>> Minor fixes and cleanups, followed by an optimization for virtio-mem
>> regarding guest dumps and tpm.
>>
>> virtio-mem logically plugs/unplugs memory within a sparse memory region
>> and notifies via the RamDiscardMgr interface when parts become
>> plugged (populated) or unplugged (discarded).
>>
>> Currently, guest_phys_blocks_append() appends the whole (sparse)
>> virtio-mem managed region and therefore tpm code might zero the hole
>> region and dump code will dump the whole region. Let's only add logically
>> plugged (populated) parts of that region, skipping over logically
>> unplugged (discarded) parts by reusing the RamDiscardMgr infrastructure
>> introduced to handle virtio-mem + VFIO properly.
> 
> Queued, thanks.
> 

Thanks Paolo!

-- 
Thanks,

David / dhildenb


