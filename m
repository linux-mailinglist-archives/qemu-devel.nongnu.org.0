Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C651F52366C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:58:22 +0200 (CEST)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonnB-0001W9-SK
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nong2-0001X5-Ob
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nonfx-0001vS-88
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652280652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cyei9CH2kjfhkfa3Td63WlyQQEauZm+D9P20TPW7prM=;
 b=MZkmZJQQS+hTS+mCQdoHwbMCRbVVPKot63vVEoCReqcBUzcgmA95zCH30hN3GDq0gtkkIF
 Nrm88cnpMT3aXJ7u7dLKeL7NAXDZsBZeSr3SNqkb181eKncLE9zztSNlIarrbkjcnrRX3y
 eESVdk6/Fv5urBRNgSR9wmXAFtKFg8s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-lnwbT1MhNzSi72Sr7WAT5Q-1; Wed, 11 May 2022 10:50:50 -0400
X-MC-Unique: lnwbT1MhNzSi72Sr7WAT5Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 w20-20020adfd1b4000000b0020cbb4347e6so934097wrc.17
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=Cyei9CH2kjfhkfa3Td63WlyQQEauZm+D9P20TPW7prM=;
 b=sX4K0DFUVHykT1eB3ay8tGNUzrUQ0C+Aj2UHxsu08n5cQFpVUq41ZRxgr3URWDYdoZ
 bYBiNKTmHvdBMfGTnKhpBMN283ojUEid1pljiwONAOYpxC/P9azsHSjy/rP0WJUkTrT5
 GQhjjJjqrgnJ/rdhfWu5LyJOsaFYVy8HstkikjNrewGEY8UEhTj2C1gNYRXHibR6Lf00
 DctL4xu9UL5Y1uBZHCQVdQ6ojX7lFLrP4J9anoDy7cMkqI1J2s0x3Bqw2Zhz+N9yZUmU
 Jin1L15WtW/EdUEMzK4dTwGluSi2IzX2qxz0nGpZpzS57KYVtL9nRJdowPTcreyUaZ/l
 7ttw==
X-Gm-Message-State: AOAM533j7Cqq/HzNkl3aHuUT4XzcvUO2Fm6KgHUMTEPhXYxl5roOOI14
 i1zC7a5ywzETToYqbKWVeVK/GI5mzRkRivxW0FNS1EPrTlfVkS9BXvXFNjXDaoTgg3tTZV3cXBy
 Y4un9wPAYStoriuY=
X-Received: by 2002:adf:f78b:0:b0:20c:e030:7e7e with SMTP id
 q11-20020adff78b000000b0020ce0307e7emr1988326wrp.160.1652280649492; 
 Wed, 11 May 2022 07:50:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoKuqdKoSmCb6lp2xxV+ty81qM5FUGnjjAAyc3mseHcgsxb5gnbDzV3PNuB7BVwTwMYr651A==
X-Received: by 2002:adf:f78b:0:b0:20c:e030:7e7e with SMTP id
 q11-20020adff78b000000b0020ce0307e7emr1988309wrp.160.1652280649273; 
 Wed, 11 May 2022 07:50:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:700:2393:b0f4:ef08:bd51?
 (p200300cbc70107002393b0f4ef08bd51.dip0.t-ipconnect.de.
 [2003:cb:c701:700:2393:b0f4:ef08:bd51])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b003942a244ee1sm1693639wmq.38.2022.05.11.07.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 07:50:48 -0700 (PDT)
Message-ID: <e1f4e4e3-8fab-04df-c76c-7383bfeb7b13@redhat.com>
Date: Wed, 11 May 2022 16:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <YnoshVqLNjGFpfEl@redhat.com>
 <c8d84b1f-2a64-fdb4-35f3-875da0575c4d@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] util: NUMA aware memory preallocation
In-Reply-To: <c8d84b1f-2a64-fdb4-35f3-875da0575c4d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

>>
>> The very last cases is the only one where this patch can potentially
>> be beneficial. The problem is that because libvirt is in charge of
>> enforcing CPU affinity, IIRC, we explicitly block QEMU from doing
>> anything with CPU affinity. So AFAICT, this patch should result in
>> an error from sched_setaffinity when run under libvirt.
> 
> Yes, I had to disable capability dropping in qemu.conf.
> 
> After all, I think maybe the right place to fix this is kernel? I mean,
> why don't prealloc threads converge to the nodes they are working with?

Good question, I think the whole machinery doesn't support hugetlb,
including recording remote faults and migrating the thread to a
different node.

-- 
Thanks,

David / dhildenb


