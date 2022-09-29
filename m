Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFABC5EF7D9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:41:55 +0200 (CEST)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduja-0000av-Ps
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ods4G-0001Yj-99
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ods4E-0002tb-K2
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664452261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5vaMBVvnKr9/GhGXeByajIihA5fNeqmM5UP9PB4a0I=;
 b=bznO91FjX7iC/iBHb2vIsgP9S/44ysiUAzDBen4u7UN26VTumZdC/sAYHSQoP4iImFMoaK
 Qaz6pvDA1gZGjUONR13igLOjoJoLKzTLg1GSBArucgLR0IuwvbzMwv33Mhka+FQenaYaoW
 Q1oHcvYSiV9kEgBhg7ut0pYvai6ZpfU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-1OYNGBGgNhqBzkkVJi1IwQ-1; Thu, 29 Sep 2022 07:51:00 -0400
X-MC-Unique: 1OYNGBGgNhqBzkkVJi1IwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g8-20020a05600c4ec800b003b4bcbdb63cso558182wmq.7
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=n5vaMBVvnKr9/GhGXeByajIihA5fNeqmM5UP9PB4a0I=;
 b=5nMsEzzQWqGIXkbTuzoKsWrbOa+2JCCmGH7OjoE4qSJiHZyH4No0aMupDNy0L53G5M
 7RqlK5oci3HaXPw1/lKaPDVNbJtTOo6GKblC49SGgksDGnar+3THFApA0VNHglzRMNUf
 N/RfXhrd6AtBYIh6w65pGjF27oDK43fEmfEgv4V8DFNXm/5+93rE8p+q5Z9sOpfB40pp
 SbCj5i7Wd7BO39LeMlYPXzhrUeDcPVzmEeIcI7tbP9L8pstNnGMIXDUxsOlLksRLZaQD
 rc1UBYvd84Sv4psDf0j0dukHs1zCmK9UmKCq5siqctYUyW4YideMPf0IR/x5ZxJG5m0f
 2ccQ==
X-Gm-Message-State: ACrzQf2azW6OQniRKyJPUpyF9Cn5Jqqgzq65Qb1Zxa0IXGw7KmXqcfIe
 2OhwGZcXOiKacgjzj3aAtULoI5kUL2rF4zYMzAdwWAtixA2pAhHmuRTmLjJeqGvMRrRrRYBct0M
 vR1QgNEszqTcGENY=
X-Received: by 2002:a05:600c:35d2:b0:3b4:a897:d48 with SMTP id
 r18-20020a05600c35d200b003b4a8970d48mr10576706wmq.48.1664452259035; 
 Thu, 29 Sep 2022 04:50:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FUuHFFHlWk9NI4jO8etQrCHS82RTaBQPf1larPUcQ6XJmp6pvykPDp8Tggz+HZzrICPYZWg==
X-Received: by 2002:a05:600c:35d2:b0:3b4:a897:d48 with SMTP id
 r18-20020a05600c35d200b003b4a8970d48mr10576697wmq.48.1664452258708; 
 Thu, 29 Sep 2022 04:50:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ce00:b5d:2b28:1eb5:9245?
 (p200300cbc705ce000b5d2b281eb59245.dip0.t-ipconnect.de.
 [2003:cb:c705:ce00:b5d:2b28:1eb5:9245])
 by smtp.gmail.com with ESMTPSA id
 g14-20020adff3ce000000b0022af9555669sm7593879wrp.99.2022.09.29.04.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 04:50:58 -0700 (PDT)
Message-ID: <4a23fe3b-4d24-50d7-b250-d4188bb51dbd@redhat.com>
Date: Thu, 29 Sep 2022 13:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 03/17] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220925105124.82033-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 25.09.22 12:51, Richard Henderson wrote:
> When PAGE_WRITE_INV is set when calling tlb_set_page,
> we immediately set TLB_INVALID_MASK in order to force
> tlb_fill to be called on the next lookup.  Here in
> probe_access_internal, we have just called tlb_fill
> and eliminated true misses, thus the lookup must be valid.
> 
> This allows us to remove a warning comment from s390x.
> There doesn't seem to be a reason to change the code though.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


