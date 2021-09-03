Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64F3FFB6B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:59:08 +0200 (CEST)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM46N-0005oT-KF
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM45V-0004wR-Vm
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:58:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM45T-0000EO-Nj
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630655890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G41YEcJGzdfzZitf4SCJrIXcvnZtTPPvU7E60sYtFy4=;
 b=ba6yKRhTQwySrZD7SO1CZKWcQSHYV/8tf6wpSE7iAX6PIXbPHKS6KJI15A1O0mahuRuXV7
 QuzM2rrvghCWaLdPkXddqAplrd3SjPrYrYiAJqWJVg4I12KZh+FVTi5U4ZnMh7f4Fe28+q
 h1QiAHo7zwPKetHYjHR8vfVMJrqaF6o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-w-FF0TvwMv6IqCtuVQ-fJw-1; Fri, 03 Sep 2021 03:58:09 -0400
X-MC-Unique: w-FF0TvwMv6IqCtuVQ-fJw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1295223wrw.22
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 00:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=G41YEcJGzdfzZitf4SCJrIXcvnZtTPPvU7E60sYtFy4=;
 b=SazATD8xSM5KfNfP92yB84Ei+4AM8Z9mY30yAyd5ge+XgEH48UZiNWuEFrKDyW3utm
 4LaJj7R8UXNsntOBk2mRgsqFf7N7qLSGVtODbS5slLBx3tobXM/LrpDULwL9a4dnVN+h
 EN3emq+9Y/VmOK6U9IkI5chGRD1UAq4lTDvp4NP3apoBPjdhb5WFWUFeyJX0PhapPTpH
 UBHOUiRZDQOp2dCF5gBWc+GuB75aHb94dUVWZ4ekYmRzcVI4a0JZNerWwuFy6qyuhVHO
 bCz85JCpmklqDTpShuX9fn8zrMMRfOCc0vJwdc3Ts7HdHeoQB43RhpQuLavkpLnAATzC
 KY/Q==
X-Gm-Message-State: AOAM530NpbuYNbDzLaB2sj1WfJPdT3WgfYJo/bNMRrINYFqo51Ij7k07
 fP1iMvxPLtm6ERerwYK2Fu0/SnYW30BEYnVeH8eDjV7UB5r3AKkdl0Kqq4zsW2sv4/VidWwQxyk
 o5d+T++EQ/D7ibww=
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr2430161wrc.233.1630655888509; 
 Fri, 03 Sep 2021 00:58:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLWBemqqoItwvj2q7X52QGiMzjQWnsI2obSDpOjRXnYKTtIKqTFGqndtUHJiNi73dTKNodMA==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr2430127wrc.233.1630655888275; 
 Fri, 03 Sep 2021 00:58:08 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e05.dip0.t-ipconnect.de. [79.242.62.5])
 by smtp.gmail.com with ESMTPSA id
 q11sm3598274wmc.41.2021.09.03.00.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 00:58:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-9-david@redhat.com> <YTFQKKPK3evHAMWN@t490s>
 <bcdb8e57-7032-f5c4-469c-f423cce923ab@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
Message-ID: <4ed5a784-986b-67a7-f8e6-0245ef10c301@redhat.com>
Date: Fri, 3 Sep 2021 09:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bcdb8e57-7032-f5c4-469c-f423cce923ab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> That'll be good enough for live snapshot as uffd-wp works for zero pages,
>> however I'm just afraid it may stop working for some new users of it when zero
>> pages won't suffice.
> 
> I thought about that as well. But snapshots/migration will read all
> memory either way and consume real memory when there is no shared zero
> page. So it's just shifting the point in time when we allocate all these
> pages I guess.

... thinking again, even when populating on shmem and friends there is 
nothing stopping pages from getting mapped out again.

What would happen when trying uffd-wp protection on a pte_none() in your 
current shmem implementation? Will it lookup if there is something in 
the page cache (not a hole) and set a PTE marker? Or will it simply skip 
as there is currently nothing in the page table? Or will it simply 
unconditionally install a PTE marker, even if there is a hole?

Having an uffd-wp mode that doesn't require pre-population would really 
be great. I remember you shared prototypes.

-- 
Thanks,

David / dhildenb


