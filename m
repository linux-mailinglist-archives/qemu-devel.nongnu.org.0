Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD93537448
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 07:54:34 +0200 (CEST)
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvYML-0006pe-G0
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 01:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nvYJ3-0005EU-TK
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:51:10 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nvYIv-0000G5-D3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:51:06 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t2so1791711pld.4
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BobJJoukDoqDMc7RsnBOslTuYcnA41bZYrPd0qFtxLo=;
 b=HEF7yI75q4/jLPdr8k8FIN79TtOolBn3y8oOoLyjUcQYCeEubGiOVFNCZYHOP2DodO
 U3Wxv75HH2hosZRM/pbXPabBahO3aYxmP0MTfPaO68wLdg/hinLanrclStogNjTTwQet
 TXtPyvEsQ6saNOUa+1mNKc6Jy9BktQiF2Kn9xg0R9GqRE4g7x9dMKt1nuKZKzXbP2761
 E7HNl6lR5tnBzQTLUjEb3ZF82XKABWtVYbmq+1/P/ZQE4Su6qZ7HeRTiNyUXy0u4HbTt
 scgUx+yUTiFQ0fPdV8vmfKAUE6m7EVxKXGJUpVytEDTAHK9P1G/8K5VY6f6E7W6N0KhU
 1qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BobJJoukDoqDMc7RsnBOslTuYcnA41bZYrPd0qFtxLo=;
 b=L254B0edXv5mdobMoBnGwFkPSMopWWIiGxwVAzWAX4vNTqYf8Adbkmt05hUZ4czC7n
 TmAfmL3oee9fAJZthIupwhgmSRi0VQ3XzNJarq6yZ4h/kVf3l6iPXtA7nbal/Pgw1P3I
 Fgr2QAhNy5OZy4R8lG/jsXZf3MigP1XkpDO8Dak+SuGHPzk9Uz5VBHIaRrLn72R0/ltc
 WGweiJIXMGYIx7B7SFvrEtKUdZK6Ksxr4FjC0sqdVgNDvSI/wZdb8Jti1Y8e3Yj1dm32
 IQ8NUV+NwrkhoGYjTVkgNn83XpRKffHxM0bt1ys452DMDbwanRCS2YnW1bvHe4vRB+fj
 U1Kw==
X-Gm-Message-State: AOAM533OE+VumgQE6en6AIUxhvOUqdAZFEWgMgZlemjGuy5iaJdetID3
 g8cbAMqtRwgrEDyLrE+A4P8GUw==
X-Google-Smtp-Source: ABdhPJzcG+Wj6HLqctwFpGM4LHkzUb2FX/9k6M4jkgCUJI4u5NtU/hy1qSKbgIOb5h07et2CFwjE5A==
X-Received: by 2002:a17:90b:224a:b0:1e2:7afb:3367 with SMTP id
 hk10-20020a17090b224a00b001e27afb3367mr16511516pjb.37.1653889857790; 
 Sun, 29 May 2022 22:50:57 -0700 (PDT)
Received: from [10.255.89.136] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170903204b00b00163be997587sm3169891pla.100.2022.05.29.22.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 22:50:57 -0700 (PDT)
Message-ID: <286dbd1f-1c62-a171-7453-d772bd98332c@bytedance.com>
Date: Mon, 30 May 2022 13:46:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Re: [PATCH 2/3] mm/memory-failure.c: support reset PTE during
 unpoison
Content-Language: en-US
To: =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?=
 <naoya.horiguchi@nec.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mst@redhat.com" <mst@redhat.com>, "david@redhat.com" <david@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
 <20220520070648.1794132-3-pizhenwei@bytedance.com>
 <20220530050234.GA1036127@hori.linux.bs1.fc.nec.co.jp>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220530050234.GA1036127@hori.linux.bs1.fc.nec.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/30/22 13:02, HORIGUCHI NAOYA(堀口 直也) wrote:
> On Fri, May 20, 2022 at 03:06:47PM +0800, zhenwei pi wrote:
>> Origianlly, unpoison_memory() is only used by hwpoison-inject, and
>> unpoisons a page which is poisoned by hwpoison-inject too. The kernel PTE
>> entry has no change during software poison/unpoison.
>>
>> On a virtualization platform, it's possible to fix hardware corrupted page
>> by hypervisor, typically the hypervisor remaps the error HVA(host virtual
>> address). So add a new parameter 'const char *reason' to show the reason
>> called by.
>>
>> Once the corrupted page gets fixed, the guest kernel needs put page to
>> buddy. Reuse the page and hit the following issue(Intel Platinum 8260):
>>   BUG: unable to handle page fault for address: ffff888061646000
>>   #PF: supervisor write access in kernel mode
>>   #PF: error_code(0x0002) - not-present page
>>   PGD 2c01067 P4D 2c01067 PUD 61aaa063 PMD 10089b063 PTE 800fffff9e9b9062
>>   Oops: 0002 [#1] PREEMPT SMP NOPTI
>>   CPU: 2 PID: 31106 Comm: stress Kdump: loaded Tainted: G   M       OE     5.18.0-rc6.bm.1-amd64 #6
>>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
>>   RIP: 0010:clear_page_erms+0x7/0x10
>>
>> The kernel PTE entry of the fixed page is still uncorrected, kernel hits
>> page fault during prep_new_page. So add 'bool reset_kpte' to get a change
>> to fix the PTE entry if the page is fixed by hypervisor.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   include/linux/mm.h   |  2 +-
>>   mm/hwpoison-inject.c |  2 +-
>>   mm/memory-failure.c  | 26 +++++++++++++++++++-------
>>   3 files changed, 21 insertions(+), 9 deletions(-)
>>
> 
> Do you need undoing rate limiting here?  In the original unpoison's usage,
> avoiding flood of "Unpoison: Software-unpoisoned page" messages is helpful.
> 
> And unpoison seems to be called from virtio-balloon multiple times when
> the backend is 2MB hugepages.  If it's right, printing out 512 lines of
> "Unpoison: Unpoisoned page 0xXXX by virtio-balloon" messages might not be
> so helpful?
> 

All the suggestions(include '[PATCH 1/3] memory-failure: Introduce 
memory failure notifier') are reasonable, I'll fix them in the next 
version. Thanks a lot!


-- 
zhenwei pi

