Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B3F44363B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 20:02:22 +0100 (CET)
Received: from localhost ([::1]:55150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhz37-0007td-C8
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 15:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhz1m-0006gr-9f
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 15:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhz1j-00019W-5a
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 15:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635879654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0cypP1xjrYjPny52SCOZ/sU0juMpJN3e5sZPJTiWbEc=;
 b=Q7nUpy2Hnj4xEHO/hjCMyDAifS+oth3PpwZKi6EmHZ3Via2M1YNJSKseIZcNUuzHQqPin9
 mNvm7UaEB6U9XuSu0zCdPW1INViG0y6BwKywrNXgkNDCGyad9QEC8qGF/bs7aZKIWzAipl
 vSDPFGHIUGTkFFaE0yKQOXr/J1mpmzQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-TSr7WyHxMtWTWE8OF9qQGg-1; Tue, 02 Nov 2021 15:00:51 -0400
X-MC-Unique: TSr7WyHxMtWTWE8OF9qQGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so86274wmc.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 12:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0cypP1xjrYjPny52SCOZ/sU0juMpJN3e5sZPJTiWbEc=;
 b=v/eDEXk2P62VOZYAyOeIJuTF+rmX/fdAaB4/sV4FmOfTxfaNEXhEgTjiiKw3BUHrp7
 Xs2Y7uFrwa6I9qHxpn5PYO55cL1rbCyaqHMPLAIlqDnpanf0eIQl1fRd9cMV0wYTRqxn
 8ws3cYY8Jeukt35nBhngLqXF4nLswpvxahhHOrw4z++yK8xCAB0tsubTcprC6HQ9g62J
 itNOe/1l2qp1CsRcffRAge5jjv7ez2xoGME9TQjd6yk1ZctEjy1BHrl1ogamZsLsUbyZ
 fLye8a+DEdEgEpG/6zKYAtswO9dRQB9P9uibDmnznId4jsJIrFYrdEW/r4xNKbw3xXWC
 +c5A==
X-Gm-Message-State: AOAM532hFjGxlj6CyOtsfqIK3oeXc8CDYX1KtZwZ/RaxBmuHLrqdCVbk
 gdobq6bk2D2NcCcdCV3pi1Nnv7RB/ANej7/lon2XBre86aWJv1wAfqqBjjPg2lrVfxz9Sg59eyo
 IWO7luzQ+C3HHUYc=
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr48713464wry.382.1635879650377; 
 Tue, 02 Nov 2021 12:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMr+/HBZ3MRtnZjssAlTUjT701am6Y/UtsncBF7muKYdYeub5+hIZyZZ67InAjHYvr9VKamg==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr48713421wry.382.1635879650116; 
 Tue, 02 Nov 2021 12:00:50 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o17sm3610117wmq.11.2021.11.02.12.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 12:00:49 -0700 (PDT)
Message-ID: <4689f8a5-89a4-5bda-621f-55f57bbc1b32@redhat.com>
Date: Tue, 2 Nov 2021 20:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] sev/i386: Warn if using -kernel with invalid OVMF
 hashes table area
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-3-dovmurik@linux.ibm.com> <YYEwwMsS2SsUzypl@work-vm>
 <83e91693-5e05-ad5a-4d42-75badb2036e0@linux.ibm.com>
 <YYGFnsCAJ3lZ/h26@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YYGFnsCAJ3lZ/h26@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 19:38, Dr. David Alan Gilbert wrote:
> * Dov Murik (dovmurik@linux.ibm.com) wrote:

>>> however, maybe it needs to be more thorough before using area->base to
>>> qemu_map_ram_ptr? - I think it'll get unhappy if it's a bad address not
>>> in a ram block. (Or check you're running over the end of a ramblock)
>>>
>>
>> Does address_space_write perform these checks? Or maybe another API for
>> accessing the guest's RAM?
> 
> I'm not sure; for example in address_space_map I don't see an check that
> flatview_translate gives a valid mr.

IIUC the API the MemTxAttrs argument could help you, but I don't think
properly enforced (yet?...).


