Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA953597F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 08:42:01 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuTfc-0006tR-Dt
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 02:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nuTam-0005jL-Dh
 for qemu-devel@nongnu.org; Fri, 27 May 2022 02:37:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nuTah-0000Kj-KN
 for qemu-devel@nongnu.org; Fri, 27 May 2022 02:36:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so3547092pjf.5
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 23:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SuokLXZBT769hHza25K/JKzYPz4okNLCTIvug/IPsOQ=;
 b=w/Dtt17bexhMQfEO6bZdS8g76rcXfd1fCxzoZiPupXvbG6D1PCjYICkTcZoXMchs33
 XwQDdljexH8C7HWpuWkcd0aabZDZmfOs37/pSWL2o/Ma2ckuRkSN4tVLxE3BGT8SjmmZ
 /JHpZM9duuHTTZ/hqxVnt4BMWzchBWwfjfx1TZXxxn3s7cEvgS8S/aWR+aakyvAW8LGi
 BUHH0av/nN3KGi26NcaMjBdfZ6bmAo2QAxjbYMkVFw675/L/X8gkdLIELP7ZP9Myzhz7
 vQ/X1Rz9UX2xuO+xfYfn6QqA/MsysGxlfvyPQco5aSoo19c6jl7B2GTMxIfcgqs9i2YR
 xeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SuokLXZBT769hHza25K/JKzYPz4okNLCTIvug/IPsOQ=;
 b=O0Qkapt9OfKdDBJED0t3Ahld5G37R0FkvJ/jR7Xda0EeY5Ir5MLjv3bNVf+jINLSN1
 rQdQ/20r/4F9rsEph1FjcU4zvd7Ky0wcv6WuCZVdSw9Dji75AQnItkytz2ewoSRh5Anq
 hlrEiAyVqs/im8gzI831Xh6DItpQFFul/K9RpW7riLKjzwSg0o/OeLcknXMEax6kYF/W
 RfBvp38GJEv3w54gSyus1ljdZOjjOrko+8AQpgEuciZnU7ICb3MWeoTbaFAuTOSQaft3
 9TifhWkTP1Tqv2BxGjKRU5cwQzVZqdnzzzbvjDg7VHUYtEMMc1Hldio/n2dXD+hVEJBn
 +RdA==
X-Gm-Message-State: AOAM533FytlA/niuh+h97kK5B2+CzCawCrqqsMPPjbVtH5pw28e1a6D+
 Vx6BpjbqyG8PH1QUU7jmZF9rpQ==
X-Google-Smtp-Source: ABdhPJxOPiXIhe6VKd4CALjITeyKD3bUphXadgcUtVKUa901LvCRw8JDURlFy6QfYahvehfnBi6M3g==
X-Received: by 2002:a17:90a:bb17:b0:1e0:ab18:4491 with SMTP id
 u23-20020a17090abb1700b001e0ab184491mr6583871pjr.120.1653633413656; 
 Thu, 26 May 2022 23:36:53 -0700 (PDT)
Received: from [10.255.70.20] ([139.177.225.235])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b003f9d1c020cbsm2619464pgk.51.2022.05.26.23.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 23:36:52 -0700 (PDT)
Message-ID: <24a95dea-9ea6-a904-7c0b-197961afa1d1@bytedance.com>
Date: Fri, 27 May 2022 14:32:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Jue Wang <juew@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, jasowang@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com, =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?=
 <naoya.horiguchi@nec.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org
References: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
 <Yo/I3oLkd9OU0ice@xz-m1.local>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Yo/I3oLkd9OU0ice@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
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

On 5/27/22 02:37, Peter Xu wrote:
> On Wed, May 25, 2022 at 01:16:34PM -0700, Jue Wang wrote:
>> The hypervisor _must_ emulate poisons identified in guest physical
>> address space (could be transported from the source VM), this is to
>> prevent silent data corruption in the guest. With a paravirtual
>> approach like this patch series, the hypervisor can clear some of the
>> poisoned HVAs knowing for certain that the guest OS has isolated the
>> poisoned page. I wonder how much value it provides to the guest if the
>> guest and workload are _not_ in a pressing need for the extra KB/MB
>> worth of memory.
> 
> I'm curious the same on how unpoisoning could help here.  The reasoning
> behind would be great material to be mentioned in the next cover letter.
> 
> Shouldn't we consider migrating serious workloads off the host already
> where there's a sign of more severe hardware issues, instead?
> 
> Thanks,
> 

I'm maintaining 1000,000+ virtual machines, from my experience:
UE is quite unusual and occurs randomly, and I did not hit UE storm case 
in the past years. The memory also has no obvious performance drop after 
hitting UE.

I hit several CE storm case, the performance memory drops a lot. But I 
can't find obvious relationship between UE and CE.

So from the point of my view, to fix the corrupted page for VM seems 
good enough. And yes, unpoisoning several pages does not help 
significantly, but it is still a chance to make the virtualization better.

-- 
zhenwei pi

