Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23739662027
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 09:38:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEnee-0004vO-FL; Mon, 09 Jan 2023 03:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEneb-0004v2-SJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:37:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEnea-0007g4-1o
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673253429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DInKmm4Rn61yi+CpphqaWk9/SltttB2wzvO79sH+IJ4=;
 b=BG/pLuMq7+1bGrMSxQU/s62jermPc05+SO6xWFIG24iinrAkLnAQhFLFqTzoW2zHqQppbM
 U6Xm78T00/s6C5FPGMCC9whZAsDIe32uuYOIjv3HICm/aDifzg3TWsuGV2ONH7xXJPX7X0
 mQFoZQkZIUMyhR4hy9lTPOVMT6QlSrg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-rXlnUJXkMEyF1NOPWtzCFA-1; Mon, 09 Jan 2023 03:37:07 -0500
X-MC-Unique: rXlnUJXkMEyF1NOPWtzCFA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j15-20020a05600c1c0f00b003d9ec0eaa74so1058311wms.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 00:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DInKmm4Rn61yi+CpphqaWk9/SltttB2wzvO79sH+IJ4=;
 b=SPDepdoileJLcUgknmRAl1vCgpbiW2ma2n701uSmXVp27wiuBKOigMJNrhwfqRGD/5
 MSspt0VcyIpBKzVXp2y7dmOlpVarQG4ioQV4pylnaTCEzKnRyirnK3lMAUcGqwMePyL5
 Rzru0eoSDJ7zC3hAR2agWqNvCDy+Xuqw6Uk14XJViDclznsk/njG4gN8X4huCXKDF+St
 /Y6xP8oiQsNZByQ0li833MB3+GCPUp5OduKrTU6bItvK+9g/ZjG54VZ6cUrHNChK1Jz3
 QlntqKAFVzb9U9BNzyKDzXO3yQxPR/OUnPQy4Dk+zfEymybBnFpgv9eV261+RiKS1fKZ
 9FIw==
X-Gm-Message-State: AFqh2kop3HeGsQ5vX/aHZtuB9OBG6yMT81ovTfLzANKbXikgr4fLt61n
 StRBSIYn5hjk8oJYaHnfFKQzElo2Yz+6+aGc0gjsIoxP09xbEWKztlf4iAJfTElDsQBkec3wZGc
 rErff/5QxFUw1zW8=
X-Received: by 2002:a05:600c:1d8a:b0:3d9:ebab:ccff with SMTP id
 p10-20020a05600c1d8a00b003d9ebabccffmr3467792wms.33.1673253426272; 
 Mon, 09 Jan 2023 00:37:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNwZhFS2PWT+nKjVzLE8oWGA+HlI3UUdR1qHPGHR8atsn+R6GiR6En1TNuk5RhuK0JVeHb2g==
X-Received: by 2002:a05:600c:1d8a:b0:3d9:ebab:ccff with SMTP id
 p10-20020a05600c1d8a00b003d9ebabccffmr3467776wms.33.1673253425998; 
 Mon, 09 Jan 2023 00:37:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:8f00:ba3:7d27:204f:8e29?
 (p200300cbc7038f000ba37d27204f8e29.dip0.t-ipconnect.de.
 [2003:cb:c703:8f00:ba3:7d27:204f:8e29])
 by smtp.gmail.com with ESMTPSA id
 hg11-20020a05600c538b00b003cf6a55d8e8sm10351250wmb.7.2023.01.09.00.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 00:37:05 -0800 (PST)
Message-ID: <84a9bbce-bcd6-15b7-23b4-d10689738995@redhat.com>
Date: Mon, 9 Jan 2023 09:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/5] migration/ram: background snapshot fixes and
 optimiations
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
References: <20230105124528.93813-1-david@redhat.com> <Y7c9He14F8kKkffw@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y7c9He14F8kKkffw@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05.01.23 22:11, Peter Xu wrote:
> On Thu, Jan 05, 2023 at 01:45:23PM +0100, David Hildenbrand wrote:
>> Playing with background snapshots in combination with hugetlb and
>> virtio-mem, I found two issues and some reasonable optimizations (skip
>> unprotecting when unregistering).
>>
>> With virtio-mem (RamDiscardManager), we now won't be allocating unnecessary
>> page tables for unplugged ranges when using uffd-wp with shmem/hugetlb.
>>
>> Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Migration)
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>
>> David Hildenbrand (5):
>>    migration/ram: Fix populate_read_range()
>>    migration/ram: Fix error handling in ram_write_tracking_start()
>>    migration/ram: Don't explicitly unprotect when unregistering uffd-wp
>>    migration/ram: Rely on used_length for uffd_change_protection()
>>    migration/ram: Optimize ram_write_tracking_start() for
>>      RamDiscardManager
> 
> For the series:
> 
> Acked-by: Peter Xu <peterx@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


