Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6156ABD9A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:02:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8aj-00022i-MH; Mon, 06 Mar 2023 06:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8af-0001s7-5y
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8ad-0002pg-Kr
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678100470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLYCxC9QXh8QBvj1S0Uhg7Of4cDY0hV5I/2B9IuNIj0=;
 b=RhMEBlJyzpKaRUrb4tytz4o/azbCscZQWuR7jJJl1a1NhX3NIOIT+6soRGTndTLIumJvfW
 7O+jhP9TFcOblOm8AGBsw9YUoZuB+6ztNBvR/P63N94ppFH378hrUhJuyRedP4f/lwKq0W
 2ivo2ETcWJPuZUOpWqEoCxUNP8VfQr8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-y2nQvWfCMNi--8FiVlXDUg-1; Mon, 06 Mar 2023 06:01:08 -0500
X-MC-Unique: y2nQvWfCMNi--8FiVlXDUg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so3587632wmq.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100467;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yLYCxC9QXh8QBvj1S0Uhg7Of4cDY0hV5I/2B9IuNIj0=;
 b=uyKd1a/AwR51PEJiSyP/5opA7Y4ST3YiGr0Y8UXVqCLsWgMbj9bEF6HhAU5/7YRETa
 y+k6RINMI5EetSadccNdqazZcV/I4CDNYwsMUbULfAzUiyaYDDz+65sc+ipqQMduH3Wn
 e/tQoZu3h+hzfikihjNJxdYE7D15aLuXMsX/EacO+98lf2CELeZh1ush3uFsEQe6l6Rg
 S9MlFhHqVc3G3a2nAjj25AVghuQgVhNsR7/yV7E+3J0ontFpqh745efzvs8SPwuZfAix
 BcGvyA5EdaqdozdTzXH36xgWgvRzJSjhn6NIUAgAoYsmfObNvMh3FShob7FvWWwAUDX7
 U4gA==
X-Gm-Message-State: AO0yUKW27eiG6QrV5bHXzzOED583RkyAfIrAM4eaSXDNqcLDt0DoWeL8
 aFwNl6jv2/32VarxyjIHHbtw+D4RAHjWLeLEdM6/7yKt5tni7P7yazBzz3yqKKiSiCvbMyOr2JO
 sT5+7XjRlXjhiP5g=
X-Received: by 2002:a05:600c:3ba6:b0:3ea:e7f6:fc2e with SMTP id
 n38-20020a05600c3ba600b003eae7f6fc2emr9021830wms.6.1678100467755; 
 Mon, 06 Mar 2023 03:01:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8sea1QofiUw28PDWjbBfwOYJKHlGaTpLkdHrpAnTdKBh6iHGT2i1W0kKgWOGjIY6juaEzMNg==
X-Received: by 2002:a05:600c:3ba6:b0:3ea:e7f6:fc2e with SMTP id
 n38-20020a05600c3ba600b003eae7f6fc2emr9021810wms.6.1678100467438; 
 Mon, 06 Mar 2023 03:01:07 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c080700b003e21ba8684dsm9958370wmp.26.2023.03.06.03.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:01:06 -0800 (PST)
Message-ID: <9c36a0d4-1db4-0ddf-d13c-34ad68ba859f@redhat.com>
Date: Mon, 6 Mar 2023 12:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 14/20] target/s390x: Drop tcg_temp_free from
 translate_vx.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-15-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230304181900.1097116-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
>   target/s390x/tcg/translate_vx.c.inc | 143 ----------------------------
>   1 file changed, 143 deletions(-)

that's a pleasant surprise

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


