Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F22266C300
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQvw-0006VJ-T1; Mon, 16 Jan 2023 09:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHQvq-0006OC-Gw
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHQvp-0002qY-1S
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673881072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hr4uZ+k4ASY08rwdEFemjtZnhuVIx79ZqT5PQr+14+Y=;
 b=HJk235ij5grVV5/E3OxckprmDG5/UWYtzL0807vcCLX2lpNE+YgUSXqjI1dsJGQ6d+EwBE
 8XoRep5YQUGb2neVUQKJVMpNk8mq0H95FjkyesH87q5ZDITgSixx0P5LFTg/Jis8HOODtN
 H+BwPsGa/A9BSxcOnf7kJkwLfj8tPcE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-7CUeR5NbORm6msE8x194Gw-1; Mon, 16 Jan 2023 09:57:50 -0500
X-MC-Unique: 7CUeR5NbORm6msE8x194Gw-1
Received: by mail-wm1-f70.google.com with SMTP id
 9-20020a05600c228900b003daf72fc827so2232187wmf.9
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hr4uZ+k4ASY08rwdEFemjtZnhuVIx79ZqT5PQr+14+Y=;
 b=pRrkpISrxn6sPTv3ZZUfpDBNW/TzmMka2ySxNbMGzO3b+GauqtEhRCxhHXJpo+BUhr
 vF/KudZn4fy12/C18FAF4USE00/D31B/oF/aoW3ekVX8FnEREQ8Qn2GepUNb9e9+9ADG
 6vVsbZclEW/HlL3z2EOzKpAn5cD/ivkmzkb1Mj9MErLZ/ZVFrMnaTFZk4oJ5iimhK0H7
 1K2jl1j0+T+afW2/rl3MQYJ5q6WiucU5t/ToDluXXtkiUPs8uc7p4ELl4uXFYmscMTtu
 Nq9aSUD8FfTGGOdHsGm2Z2ARj0h5b/sSrDWdUf57rtfeH0GTRTxqtNk9kxdjC0Y3mWJ4
 JI2g==
X-Gm-Message-State: AFqh2kq6VdTmW+N6u9HzosW0L+pUo2W8sOaSGLN+3siFVXxEx0qqz06d
 659iQlz+WSKVteh3MOpYrhHghOuFC28w1dmOGxD4vGj0IsJa2UPhEL+afJMm48AT5hK3CaT6v0J
 cBLIiORL2r//7hvc=
X-Received: by 2002:a7b:c447:0:b0:3c6:e63d:adaf with SMTP id
 l7-20020a7bc447000000b003c6e63dadafmr68399420wmi.31.1673881069739; 
 Mon, 16 Jan 2023 06:57:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtUKCFtWekpCOKTgtH/Imc0l6Hg/pxlcGgB+nHAFK4RPYvdUgClE0ufjhIQSq0/jF4nypWYbg==
X-Received: by 2002:a7b:c447:0:b0:3c6:e63d:adaf with SMTP id
 l7-20020a7bc447000000b003c6e63dadafmr68399399wmi.31.1673881069436; 
 Mon, 16 Jan 2023 06:57:49 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1000:21d5:831d:e107:fbd6?
 (p200300cbc704100021d5831de107fbd6.dip0.t-ipconnect.de.
 [2003:cb:c704:1000:21d5:831d:e107:fbd6])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003d9fb04f658sm7735963wms.4.2023.01.16.06.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 06:57:48 -0800 (PST)
Message-ID: <fb602b97-4a9c-9d8a-078f-72fe21855dab@redhat.com>
Date: Mon, 16 Jan 2023 15:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-4-david@redhat.com>
 <Y8BJ02EiHNSr6xMv@work-vm> <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
 <Y8BlCeViRSzyTQ8+@work-vm> <Y8CGYZ3F/h1oXV+d@x1n> <Y8CJf7hCy76AtfcF@x1n>
 <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com> <Y8F2v+ikvEJa5+qc@x1n>
 <Y8F4eXdyBRKYeY4I@x1n> <9d7547c1-c670-2222-c4da-4c816f42a087@redhat.com>
 <Y8VluVbZBsGp4v4Q@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8VluVbZBsGp4v4Q@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16.01.23 15:56, Peter Xu wrote:
> On Mon, Jan 16, 2023 at 11:35:22AM +0100, David Hildenbrand wrote:
>> What about the following:
>>
>> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
>> index 7bc0cd9de9..cc910cab0f 100644
>> --- a/include/migration/vmstate.h
>> +++ b/include/migration/vmstate.h
>> @@ -188,6 +188,11 @@ struct VMStateDescription {
>>        * One SaveStateEntry should either have the save_setup() specified or
>>        * the vmsd with early_setup set to true. It should never have both
>>        * things set.
>> +     *
>> +     * Note that for now, a SaveStateEntry cannot have a VMSD and
>> +     * operations (e.g., save_setup()) set at the same time. For this reason,
> 
> This slightly duplicates with above?

Right, will merge both sections and simplify.

Thanks!

-- 
Thanks,

David / dhildenb


