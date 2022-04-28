Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36EF513196
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:47:01 +0200 (CEST)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1fo-00034b-VN
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nk136-0006Wm-J6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nk134-0002wa-Fc
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651140417;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvXIVYARS0M13aQYDE1m0N2qxs6WtMYDg6I4o7+4u8Q=;
 b=b1VsJtG1ZNYdBaJqILi/eHp/nYv9bkognBOoSmukeIMnzH7A1I3BkM7PNzkIrPkfnm2gfR
 3g/kKhiQ8W7hKwOhAjgCko2Vw3D4xflxylxXJwpMSnTp584mxGt5i+NI8G/LOVZsSOR0G/
 V6uODcJGOI4GsNNlorCFyxjfHL70ASo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-JqJHBI_POOGS9edglYGPJQ-1; Thu, 28 Apr 2022 06:06:55 -0400
X-MC-Unique: JqJHBI_POOGS9edglYGPJQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 jx10-20020a0562142b0a00b00456531ba83dso2821321qvb.16
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xvXIVYARS0M13aQYDE1m0N2qxs6WtMYDg6I4o7+4u8Q=;
 b=JtWm3cGUQr1UhERJk0juWeTRouzJpuAQ+x+u5kFl1KRaHF4AILHIwV8Ol1Pte60FoS
 //AgAGsZ2GS1pZxr5brcquVUb5DjeA+ELQGWoV7e4ukjLcZE06icC+5krNAqYTevrAz7
 bB3VC9xGPfk+cCfVptnKf5xRfqXyQY8iC4t1EhQyxftQp8+z6gNy7mhuAMpn+fGB8Sa5
 gg/ucZBA4tdWX3gMSA4HjgS4vSuECFMFUbDjTcfjLY09PnrN+wqr0WcOrAj36Hb/IZ4y
 liHnN9xr85K0PZc0qapGNEhghmN2SKx3PXAdCQv3ODbY9STBsyg8XCglRKQmqqGkf9K4
 VjNA==
X-Gm-Message-State: AOAM530mClSuD1OvGbVpFT7pmCQwMjbK/WQ7w8snaa2QZzR/Vkvf1bwO
 ESZOCYV728roIJo75BJYMJx1kL8/sSM7m//3pVazn4JQlpKqbiPW6/ct+9vTDebpfeLEC9M6sGH
 8JKEjuddbio6zwZ4=
X-Received: by 2002:a05:620a:4306:b0:67b:32f1:99c4 with SMTP id
 u6-20020a05620a430600b0067b32f199c4mr18539666qko.776.1651140415529; 
 Thu, 28 Apr 2022 03:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+HnNw12vC5cG7MzvfgQwOjGRAnJJFayGKUVr+7WxhCRP/+mt4CwQSmE9p1kvJ4Pm9SywF2Q==
X-Received: by 2002:a05:620a:4306:b0:67b:32f1:99c4 with SMTP id
 u6-20020a05620a430600b0067b32f199c4mr18539650qko.776.1651140415284; 
 Thu, 28 Apr 2022 03:06:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a05620a258d00b0069c7468e123sm9742518qko.122.2022.04.28.03.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 03:06:54 -0700 (PDT)
Message-ID: <5c5cb1c4-471a-99c3-6da1-a1b92eebcea8@redhat.com>
Date: Thu, 28 Apr 2022 12:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
 <20220426160422.2353158-4-peter.maydell@linaro.org>
 <4cd9121f-6c9f-f461-836f-a4b1ba8fedcd@redhat.com>
 <CAFEAcA9jzRuJJAXUckjD4L+LB6-UXBO2WDET2Y2YYQBBr62MLw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA9jzRuJJAXUckjD4L+LB6-UXBO2WDET2Y2YYQBBr62MLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/28/22 11:26, Peter Maydell wrote:
> On Thu, 28 Apr 2022 at 09:37, Eric Auger <eric.auger@redhat.com> wrote:
>> On 4/26/22 18:04, Peter Maydell wrote:
>>>  TLB invalidation correctly removes all TLB entries matching
>>> the specified address or address range (unless the guest specifies the
>>> leaf level explicitly, in which case it gets what it asked for). So we
>> "
>>
>> unless the guest specifies the
>> leaf level explicitly, in which case it gets what it asked for
>>
>> "
>> This is the less obvious part as the spec says:
>>
>> "A TLB invalidation operation removes all matching TLB entries even if
>> overlapping entries exist for a given
>> address."
>>
>> I failed to find further precisions about the range invalidation & BBML.
> If the invalidate says "level 2" then a TLB entry that wasn't
> put in at level 2 doesn't match the TLB invalidate request and so
> isn't removed (whether it overlaps a matching one at the same
> address or not). This is defined as part of the behaviour of TLB
> invalidates which specify a TTL, eg on page 142.
>
> An implementation which did something like "find the first entry
> that matches the address, then notice that it doesn't match
> the specified TTL, so ignore it and do nothing" wouldn't be
> correct. But "invalidate all the entries which match for
> both address and TTL and ignore the ones which don't match
> on TTL" is fine.

OK Thanks

Eric
>
>> If you are confident about this, it looks good to me.
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Thanks.
>
> -- PMM
>


