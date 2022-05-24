Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719653312D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:02:47 +0200 (CEST)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntZnp-0007nk-Ur
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ntZkY-0005sY-88
 for qemu-devel@nongnu.org; Tue, 24 May 2022 14:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ntZkU-0004jI-9T
 for qemu-devel@nongnu.org; Tue, 24 May 2022 14:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653418754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/u3XlUG6KtQr1BQPpeDQC4OLmlAGTwSNLNWZkdYSkog=;
 b=YfICYk1DtlgD5jQRw+BhJIfe4ve8rvI87YHCO9ZkdHxoUqiWfo7t7BI1nCWNNGn8l3jBul
 pTOH0RV7onGljkYVZYO9ze2M7skLkS159PQb/yEfPrGfhjHhFjEdwC8q5i9rv/Vuwv17Cj
 8pnj7q51Y8wNYptFE3S1EGJMxJ9je80=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-GEV_ohj9PDqDHwgIcOfeAA-1; Tue, 24 May 2022 14:59:13 -0400
X-MC-Unique: GEV_ohj9PDqDHwgIcOfeAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m26-20020a05600c3b1a00b00397220d6329so1640595wms.5
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 11:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/u3XlUG6KtQr1BQPpeDQC4OLmlAGTwSNLNWZkdYSkog=;
 b=2CbZ3JT5SuSObWUPfLHIdcXQtJlvnZeKVZtv3eu0f4A2z6BnYGK400tRS29r5zgdeM
 v1rczhFTNoPaZ2ukZCDa9pX81HufUTNiETB/Z0M1a58Bb0EsW8FsxF51QtROp2sWc/3W
 CBza7RBs3pdpS5P+xxjVqE7HZXdv5pZcR1/UkQs0dJ0i73zu6jvmtDMLpGk2E+aRip5u
 +uk0+LY1kWMJkRXRYOqhWZfxkKi4BSjguN/jxxGNvwVU0m1UxDcoJsk0iBcZcsy6uTcw
 ZlpvV0SI0kOVpC08zNJU/HFfJdMBOtuOoXj3f86LdGPbwNboHQRGetA4FZT/fUtNOppg
 ehFA==
X-Gm-Message-State: AOAM530nfJrZ05Qj8L0uvdW0h8JbrmXAoRS/b/1RX6K3uo1CaVfDcftS
 b6oDV5oF1c9Ebh5yfVceEB/ss5wxqdsCpBpOsGevGGN0OP9DYtPJPDiQs87zkxSCHGRLI/sPzzN
 MeNLolRyBKfV/NCY=
X-Received: by 2002:adf:c80a:0:b0:20c:ffa0:6a3 with SMTP id
 d10-20020adfc80a000000b0020cffa006a3mr23572799wrh.360.1653418751820; 
 Tue, 24 May 2022 11:59:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGSz2pcp7eL3O58tziWOYGbUj4OEBI4+pd8yfPiv1mrR1trcb64B+iGECL8KJSWE+HJH27zw==
X-Received: by 2002:adf:c80a:0:b0:20c:ffa0:6a3 with SMTP id
 d10-20020adfc80a000000b0020cffa006a3mr23572784wrh.360.1653418751530; 
 Tue, 24 May 2022 11:59:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:5200:b78b:b654:3bbe:992?
 (p200300cbc70a5200b78bb6543bbe0992.dip0.t-ipconnect.de.
 [2003:cb:c70a:5200:b78b:b654:3bbe:992])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a056000014f00b0020e609dd274sm187544wrx.76.2022.05.24.11.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 11:59:10 -0700 (PDT)
Message-ID: <68a4a96b-9c66-6509-e75d-b1bea6cd55d1@redhat.com>
Date: Tue, 24 May 2022 20:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, akpm@linux-foundation.org,
 naoya.horiguchi@nec.com, mst@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220520070648.1794132-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20.05.22 09:06, zhenwei pi wrote:
> Hi,
> 
> I'm trying to recover hardware corrupted page by virtio balloon, the
> workflow of this feature like this:
> 
> Guest              5.MF -> 6.RVQ FE    10.Unpoison page
>                     /           \            /
> -------------------+-------------+----------+-----------
>                    |             |          |
>                 4.MCE        7.RVQ BE   9.RVQ Event
>  QEMU             /               \       /
>              3.SIGBUS              8.Remap
>                 /
> ----------------+------------------------------------
>                 |
>             +--2.MF
>  Host       /
>        1.HW error
> 
> 1, HardWare page error occurs randomly.
> 2, host side handles corrupted page by Memory Failure mechanism, sends
>    SIGBUS to the user process if early-kill is enabled.
> 3, QEMU handles SIGBUS, if the address belongs to guest RAM, then:
> 4, QEMU tries to inject MCE into guest.
> 5, guest handles memory failure again.
> 
> 1-5 is already supported for a long time, the next steps are supported
> in this patch(also related driver patch):
> 
> 6, guest balloon driver gets noticed of the corrupted PFN, and sends
>    request to host side by Recover VQ FrontEnd.
> 7, QEMU handles request from Recover VQ BackEnd, then:
> 8, QEMU remaps the corrupted HVA fo fix the memory failure, then:
> 9, QEMU acks the guest side the result by Recover VQ.
> 10, guest unpoisons the page if the corrupted page gets recoverd
>     successfully.
> 
> Test:
> This patch set can be tested with QEMU(also in developing):
> https://github.com/pizhenwei/qemu/tree/balloon-recover
> 
> Emulate MCE by QEMU(guest RAM normal page only, hugepage is not supported):
> virsh qemu-monitor-command vm --hmp mce 0 9 0xbd000000000000c0 0xd 0x61646678 0x8c
> 
> The guest works fine(on Intel Platinum 8260):
>  mce: [Hardware Error]: Machine check events logged
>  Memory failure: 0x61646: recovery action for dirty LRU page: Recovered
>  virtio_balloon virtio5: recovered pfn 0x61646
>  Unpoison: Unpoisoned page 0x61646 by virtio-balloon
>  MCE: Killing stress:24502 due to hardware memory corruption fault at 7f5be2e5a010
> 
> And the 'HardwareCorrupted' in /proc/meminfo also shows 0 kB.
> 
> About the protocol of virtio balloon recover VQ, it's undefined and in
> developing currently:
> - 'struct virtio_balloon_recover' defines the structure which is used to
>   exchange message between guest and host.
> - '__le32 corrupted_pages' in struct virtio_balloon_config is used in the next
>   step:
>   1, a VM uses RAM of 2M huge page, once a MCE occurs, the 2M becomes
>      unaccessible. Reporting 512 * 4K 'corrupted_pages' to the guest, the guest
>      has a chance to isolate the 512 pages ahead of time.
> 
>   2, after migrating to another host, the corrupted pages are actually recovered,
>      once the guest gets the 'corrupted_pages' with 0, then the guest could
>      unpoison all the poisoned pages which are recorded in the balloon driver.
> 

Hi,

I'm still on vacation this week, I'll try to have a look when I'm back
(and flushed out my overflowing inbox :D).


-- 
Thanks,

David / dhildenb


