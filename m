Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72B56B856
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:23:03 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9m4c-0001Qw-Pv
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o9lxN-0003HF-OR
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o9lxK-0003lS-MD
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657278930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zqomPknXHq1NY1rHi5lnA9MvgPcZcFqrctayDmijyo=;
 b=UVt0MCYvZbzsRI+OeRetnZNMFgh/btV2c1t1+/HOmDGOeHFSOdyWX18woTVu5rV8UMCgD1
 9+WbVV/qTXdi7sVFJMJb3Ghlav38i/3ZYkLS8dfwuwLL0srxHJsVH0KNSANV5owW+iuYC2
 PKvQGgJa7OdlbGhgw+LzXcRb0iT2Uxo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-UKi2GTWnMtWUILPdMWwAgA-1; Fri, 08 Jul 2022 07:15:28 -0400
X-MC-Unique: UKi2GTWnMtWUILPdMWwAgA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a6-20020a05600c348600b003a2d72b7a15so846115wmq.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 04:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6zqomPknXHq1NY1rHi5lnA9MvgPcZcFqrctayDmijyo=;
 b=49Wkyw0G9zNBiqckrODK/rNFeUc0pYeUwdSkTkIW/U6AzMvvoxcP6FhY4cZI6tr+ft
 PdRlK3xCODoiZDBExci/MRAHJ5AIhoF/f3oIpN8LuJxF8uXYVFDPEuw4LM6slKqt43xI
 5zER8kzqU8XwxhCSHO2FsuyrfV6euzzQ1ftwsoHR6qiqTGzbZpZRML0Sb91hlgxAN9x8
 GlWr3o0U4dK1UOG77pelQFD0ytr6l4GHV62eZAedO6M5pR74UbiEFvOWtBvXza91W3/3
 l7U5mhHzTeEav4IHcwavsapw2UldfJ1JcVpZOJall7pkoWDpkMkEc57ADQ33vrWwqjIz
 wkkQ==
X-Gm-Message-State: AJIora/HWLDqVaVKGu7BYoui9pUTkeSTZQFxERQ8THVyPwBfMISW7VMd
 sgfowVFB6O3DKz9mQoYYwcwJpU6CFFfH019Cs+eeLjaceHLrri845a8ftDDI33/mKYkLoddmvKI
 9YCf/O/3qTTfr/rc=
X-Received: by 2002:a05:600c:3512:b0:3a0:5005:86b5 with SMTP id
 h18-20020a05600c351200b003a0500586b5mr3192288wmq.191.1657278927769; 
 Fri, 08 Jul 2022 04:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZ56s8kBf4FXM/iFXyK97GQYae6yKDOS33nLor3F7IZYk2xFEKEJTFfvG7KApNhXedthwu2g==
X-Received: by 2002:a05:600c:3512:b0:3a0:5005:86b5 with SMTP id
 h18-20020a05600c351200b003a0500586b5mr3192264wmq.191.1657278927469; 
 Fri, 08 Jul 2022 04:15:27 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:6300:c44f:789a:59b5:91e9?
 (p200300cbc7026300c44f789a59b591e9.dip0.t-ipconnect.de.
 [2003:cb:c702:6300:c44f:789a:59b5:91e9])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d638c000000b0021d6dad334bsm12747723wru.4.2022.07.08.04.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 04:15:27 -0700 (PDT)
Message-ID: <44605af5-ef33-ec24-8ce5-8d929d3b9c9d@redhat.com>
Date: Fri, 8 Jul 2022 13:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] target/s390x: Remove DISAS_PC_STALE_NOCHAIN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: svens@linux.ibm.com, qemu-s390x@nongnu.org
References: <20220702060228.420454-1-richard.henderson@linaro.org>
 <20220702060228.420454-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220702060228.420454-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 02.07.22 08:02, Richard Henderson wrote:
> Replace this with a flag: exit_to_mainloop.
> We can now control the exit for each of DISAS_TOO_MANY,
> DISAS_PC_UPDATED, and DISAS_PC_CC_UPDATED, and fold in
> the check for PER.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


