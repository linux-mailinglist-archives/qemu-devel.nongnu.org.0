Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB85A2593
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:12:59 +0200 (CEST)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWKg-00062H-60
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRWIQ-0002O4-8v
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRWIN-0000F7-Qg
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661508634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWVbD50PFL8PME8pmhVDetKcw2xcZdNuhrIyCRlZtzY=;
 b=COop1pStBUp+BxXLo41kC+GIo522Wgbl1W1xpAqvfCj9GnBFKFBS80U7qayxJ7UXWbFaM0
 DeGsXTXrtsJBURIcC3TcrpDr23tzkEaEQEwAsoFE+/yPktqrUP/f0WpEmJsjXlNdvcmJpg
 vwk1pVHxuszx6LNoQCO6Tzg/T9YRjzs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-34X9T3b4MGO2exEivusbYw-1; Fri, 26 Aug 2022 06:10:32 -0400
X-MC-Unique: 34X9T3b4MGO2exEivusbYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 b4-20020a05600c4e0400b003a5a96f1756so3866423wmq.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=HWVbD50PFL8PME8pmhVDetKcw2xcZdNuhrIyCRlZtzY=;
 b=5BXL6bbbOF+OIuJSkErsYWFEqlSGdpGDiYmRLEFUmor6XB4ztcX5XfnTcGGUaWJ97e
 zi+QDoPK3ckem2LFC+yJGD0BnLPt3yUtzpKwETCvzI3ZkMOV9zB/xKYN8Eckb+bOAbtP
 G5vCZxj/bxXMIFgx2Cj44qfUOC3DRgW5avY7osuLit7GJIsl09RipsL+1BMxQ1sEK27R
 MEgEw3nwDtTI7qU2BdDOKiNoxytsZAZZZomzphoBppUAs3ZJ8XR7xi0UMiehtRBU3hr/
 Pt56Z1GCOu5GshgZjTUC4m6o2diguWxmDztAzGkkraUlA1JyAesBdtgamvMWhkKWAPk1
 k8VA==
X-Gm-Message-State: ACgBeo0TCBPzO0hjV877cRjOAvEh6aiVbefc2//BrQpKCGsioA8uy2WM
 9oW+jt4KEt+AHxWEIr3Rnr1w3mdYH3i5SwzAivOv6nx9b8Cs585WOVL+xE8M/dOZo8B+8q6U466
 G0/J22iTDHPHLQww=
X-Received: by 2002:a05:6000:1549:b0:225:652e:45d4 with SMTP id
 9-20020a056000154900b00225652e45d4mr4664546wry.15.1661508631501; 
 Fri, 26 Aug 2022 03:10:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5qbtfDCQIqwAXI+SISSs65RsXBVPHw+TvMl9pMDTjjVE+sAfn6pIRHYCa+olo1MKKtz7rjqw==
X-Received: by 2002:a05:6000:1549:b0:225:652e:45d4 with SMTP id
 9-20020a056000154900b00225652e45d4mr4664533wry.15.1661508631235; 
 Fri, 26 Aug 2022 03:10:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa?
 (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de.
 [2003:cb:c708:f600:abad:360:c840:33fa])
 by smtp.gmail.com with ESMTPSA id
 t16-20020adfe110000000b00224f7c1328dsm1434740wrz.67.2022.08.26.03.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:10:30 -0700 (PDT)
Message-ID: <5cab3776-31a7-f298-46a5-6652b773dc22@redhat.com>
Date: Fri, 26 Aug 2022 12:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] dump: fix kdump to work over non-aligned blocks
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-3-marcandre.lureau@redhat.com>
 <35072646-3bee-ba0d-4b9d-6aeb117b8431@redhat.com>
 <CAJ+F1CJs-s2v1ivdwmwkS86=JU+rrqrov8HZiyEzFGDE-injnQ@mail.gmail.com>
 <063e98e9-a10f-5b38-d1dc-63f29c7ebfbb@redhat.com>
Organization: Red Hat
In-Reply-To: <063e98e9-a10f-5b38-d1dc-63f29c7ebfbb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 26.08.22 12:07, David Hildenbrand wrote:
> On 26.08.22 12:02, Marc-André Lureau wrote:
>> Hi
>>
>>
>> On Fri, Aug 26, 2022 at 2:01 PM David Hildenbrand <david@redhat.com
>> <mailto:david@redhat.com>> wrote:
>>
>>     On 25.08.22 15:21, marcandre.lureau@redhat.com
>>     <mailto:marcandre.lureau@redhat.com> wrote:
>>     > From: Marc-André Lureau <marcandre.lureau@redhat.com
>>     <mailto:marcandre.lureau@redhat.com>>
>>     >
>>     > Rewrite get_next_page() to work over non-aligned blocks. When it
>>     > encounters non aligned addresses, it will allocate a zero-page and try
>>     > to fill it.
>>
>>     Could we simplify by using one global helper page (or caller provided
>>     page) and avoiding the allocation/freeing?
>>
>>
>> I don't think that makes a big difference, but certainly doable.
> 
> If we're using one central page, I guess we'd have to pass "flag_sync =
> true" to write_cache() in case that page is used. Or we simply specify
> on the single global page in there and force a sync. Changes would be
> limited to get_next_page() and write_cache() then.

I might be wrong. I think we might not have to touch write_cache() at
all -- it will copy the data into the DataCache buffer.


-- 
Thanks,

David / dhildenb


