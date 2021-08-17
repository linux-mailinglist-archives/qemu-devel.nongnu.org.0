Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0943EF03B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:33:47 +0200 (CEST)
Received: from localhost ([::1]:50526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG227-0001ss-1L
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG21C-0001Cf-IR
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG21A-0002lJ-7m
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629217967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwlQ32nbtd+hjp/fxoi8kJbjSm7VsIyjZaetwBPpk0Y=;
 b=L3mX7e/3FQ07dNfGdveW1MZDCWWeirp0c+Fb/AQYWN8tPmgdjM8OG8dG7/0uJngS2rVe00
 G6KkwIX7ZDerI+ewqxDZ629rnF5AGue1UXBY5RHGNH7SbQB41Dzk9hcWXyz3pjlI4emwMJ
 CIRewr6yc+R1PTPSRlbKzYAvDjeQk+s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-cA0rKgq3NbGIDcurDA9fKA-1; Tue, 17 Aug 2021 12:32:46 -0400
X-MC-Unique: cA0rKgq3NbGIDcurDA9fKA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p2-20020a05600c358200b002e6dc6adcecso1032547wmq.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 09:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AwlQ32nbtd+hjp/fxoi8kJbjSm7VsIyjZaetwBPpk0Y=;
 b=QsTwHzOgbhh31jv5OEIMzMH1CDHfEvBQWIhVg2zBhfzYxUovXpN+FLAEac+Tz3BcyS
 qWKq3LA+3tHJP1yzz9+bKIEZamcikvN5KyuxUCdi0beZ+DDNM9LAMqWqFiydom/paWeV
 VkKL5mk7/M7R0F1HGls4FgUnmZh9U9syxzBAY5N3LeHmyuPgbQP/+K/cZbmhA/9jcZaS
 ivV9DqkDoE1kQnc8YkkPlYHaN+DHPGizF5Zsr00EL4hfh7Cpk0GJwqnQHVbQxKGAxtmj
 xvE7hNunEhwFMvzaBGrQjlbwgJz5oEx23mqB78K933055pNgQcIk6R1hEizTbWJ/IoRW
 /7hA==
X-Gm-Message-State: AOAM533THkDh0XLX1e5qSSlHf6f9gZ0/NGIxAh2afxip2Z9C6d9QnPDW
 NNieOVowlLAL84P5tQQuc2EFgL/JHfKyJHTEHsRpNcfrd7L/BhVfdygQdD6nWTVH3ywPekM8q17
 KH8tcc0+MlFiS0zQ=
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr5179069wrt.226.1629217964771; 
 Tue, 17 Aug 2021 09:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMJCcYPUHVU8yjKtJYrLiw+Md+qWmOarkciP0cgLNxW8rE93pg1Ebun+7oZFVWBLYOcwDKKA==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr5179029wrt.226.1629217964444; 
 Tue, 17 Aug 2021 09:32:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id o14sm2454877wms.2.2021.08.17.09.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 09:32:43 -0700 (PDT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Steve Rutherford <srutherford@google.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
Date: Tue, 17 Aug 2021 18:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/21 01:53, Steve Rutherford wrote:
> Separately, I'm a little weary of leaving the migration helper mapped
> into the shared address space as writable.

A related question here is what the API should be for how the migration 
helper sees the memory in both physical and virtual address.

First of all, I would like the addresses passed to and from the 
migration helper to *not* be guest physical addresses (this is what I 
referred to as QEMU's ram_addr_t in other messages).  The reason is that 
some unmapped memory regions, such as virtio-mem hotplugged memory, 
would still have to be transferred and could be encrypted.  While the 
guest->host hypercall interface uses guest physical addresses to 
communicate which pages are encrypted, the host can do the 
GPA->ram_addr_t conversion and remember the encryption status of 
currently-unmapped regions.

This poses a problem, in that the guest needs to prepare the page tables 
for the migration helper and those need to use the migration helper's 
physical address space.

There's three possibilities for this:

1) the easy one: the bottom 4G of guest memory are mapped in the mirror 
VM 1:1.  The ram_addr_t-based addresses are shifted by either 4G or a 
huge value such as 2^42 (MAXPHYADDR - physical address reduction - 1). 
This even lets the migration helper reuse the OVMF runtime services 
memory map (but be careful about thread safety...).

2) the more future-proof one.  Here, the migration helper tells QEMU 
which area to copy from the guest to the mirror VM, as a (main GPA, 
length, mirror GPA) tuple.  This could happen for example the first time 
the guest writes 1 to MSR_KVM_MIGRATION_CONTROL.  When migration starts, 
QEMU uses this information to issue KVM_SET_USER_MEMORY_REGION 
accordingly.  The page tables are built for this (usually very high) 
mirror GPA and the migration helper operates in a completely separate 
address space.  However, the backing memory would still be shared 
between the main and mirror VMs.  I am saying this is more future proof 
because we have more flexibility in setting up the physical address 
space of the mirror VM.

3) the paranoid one, which I think is what you hint at above: this is an 
extension of (2), where userspace invokes the PSP send/receive API to 
copy the small requested area of the main VM into the mirror VM.  The 
mirror VM code and data are completely separate from the main VM.  All 
that the mirror VM shares is the ram_addr_t data.  Though I am not even 
sure it is possible to use the send/receive API this way...

What do you think?

Paolo


