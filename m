Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E484B6ABDA2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:02:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8bo-0004cT-Iu; Mon, 06 Mar 2023 06:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8bl-0004R8-7H
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:02:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8bj-00032u-Hg
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678100537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVJNq4R5eCtcyXOIxhDFopoDkSaGfuOU0U/7EEdu7kw=;
 b=Tn2n8RssOzgKFWcl+MxaUtCE4YL6bfGPqXhZxOpo44jnQhyDQGOcqGb/9a9DohcNEHQMNR
 3OWVEK2gQPDM7Y1R6TpFPbBZ9UEAhATJizS0725wURI4JQi6mFOF2YJVliiHv6EJdg7XDd
 iFz0A2RtGR4srwGM4HHzsT9rPij/K7o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-h_Rlvw0nPrKteNhUsWNlxQ-1; Mon, 06 Mar 2023 06:02:16 -0500
X-MC-Unique: h_Rlvw0nPrKteNhUsWNlxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so6600384wma.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100535;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LVJNq4R5eCtcyXOIxhDFopoDkSaGfuOU0U/7EEdu7kw=;
 b=0wAvMcX7idqJNUaRNxvjN6QYjqXw5cWYEgc+OeeGUZY8oY4rgY/HMRWGJ9ulfo/fr7
 lnxXd4SyMeeCkTxLicZZ3y6Rcw2WMQuCewuCdWAZQzvjx9Xt4keBYclW/D08J/KWx193
 E79jRFtnukTAA+LRka4k/CDjDtSI7yUDOKPgNfeBhzIiJ/XCKhropSR+0RaFjkdiEmOn
 4FvFO/ZCXbeNBmaqysXIy0ivFXi8iQDVjW0Dn0fBOkdxBcSvhQg0yQSMxapA22jkB3WI
 d+OBB5ygILtrhB702Qs4XwPIE5NiSG+TmXL6+qDnWCF1WmoiATKODp+iItfF2VRrXC8+
 46vQ==
X-Gm-Message-State: AO0yUKV5U93+fxajPuG7fj+fIv84vP+F/7ih1309EglgQueaXdC5lq5N
 k2wljb3O0lysfknkwEZcHSO674GxaNkVxB4tegdVsQmNr3xrEk3LNyCniDXMl/zyHmv8J2WGEjE
 t3ndIfPKLeExwVXo=
X-Received: by 2002:a05:600c:468b:b0:3df:fcbd:3159 with SMTP id
 p11-20020a05600c468b00b003dffcbd3159mr6817510wmo.3.1678100535429; 
 Mon, 06 Mar 2023 03:02:15 -0800 (PST)
X-Google-Smtp-Source: AK7set88U2A2wjloYDLpQ8Hzvyelv0Fy9V7p6qVBq7QkPigvuqQ+ntk0NoInPk3uapAHEe9syeL8ew==
X-Received: by 2002:a05:600c:468b:b0:3df:fcbd:3159 with SMTP id
 p11-20020a05600c468b00b003dffcbd3159mr6817497wmo.3.1678100535225; 
 Mon, 06 Mar 2023 03:02:15 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 g11-20020adffc8b000000b002c7b229b1basm9563025wrr.15.2023.03.06.03.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:02:14 -0800 (PST)
Message-ID: <e5231a96-323b-6e2c-ed42-06bda44be243@redhat.com>
Date: Mon, 6 Mar 2023 12:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 17/20] target/s390x: Remove g_out, g_out2, g_in1, g_in2
 from DisasContext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-18-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230304181900.1097116-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 04.03.23 19:18, Richard Henderson wrote:
> These fields are no longer read, so remove them and the writes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
>   target/s390x/tcg/translate.c | 17 -----------------
>   1 file changed, 17 deletions(-)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


