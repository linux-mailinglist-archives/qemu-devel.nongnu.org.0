Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A70D66E458
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:03:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpL5-0000WD-4C; Tue, 17 Jan 2023 12:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pHpL1-0000QC-3t
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pHpKz-0003Bf-6Y
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673974854;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/9tMHDqLNn9i6Z4LYDE7RAQ8nBgObnUQsdbmyuualY=;
 b=hFzRh5pRxtR2XO/OX9lUucS1omhItELuzQdtr72lQfKPFj2yL8C8OY4QeCQJADxkoqlwQu
 x3skPwB8s1orMe+cveKUoK5YKyMnm/RPOokYnwd8yqwa9zSzyGzITNwQm+cJVONWZJvBN8
 lAqmVLKsCTxWPZXGuh91/iyOtzwTDVw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-2Y1vXSlkOYmQSsGegIHXLw-1; Tue, 17 Jan 2023 12:00:32 -0500
X-MC-Unique: 2Y1vXSlkOYmQSsGegIHXLw-1
Received: by mail-qk1-f200.google.com with SMTP id
 az6-20020a05620a170600b0070689de396dso2943750qkb.18
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/9tMHDqLNn9i6Z4LYDE7RAQ8nBgObnUQsdbmyuualY=;
 b=M/5T1HoWf86Y9Pk8giZNanUFCF5wGkKjWlXtHHmYbbnzYUDj+Pi5UnUE2Xe3Ppa1B7
 1kTw39s7iHB6wJNA2b/vfMl9xWPvW6K/9wZgu1trsLt9aBE6zY1pFKCV79NVOcB5Y4nW
 Zlfwefx0amhhs+REs4UU6UUL311koEYTFtRlKp1LLzSEesCYdO/bhNgxilarn9Wft/KA
 R/HcOkNmlPicdGaOBMyjTGaFQuplTKIJ7NYMarbzL5lottSfGEe3x1Fd4z3ufbtvpBQ+
 UDxRyjFC4W1MOs7iggk3FGhBmNuE6eSTHye5rN+ZKfVLDWkkvtrtCEvQIls5Pe3Os7+l
 d2AA==
X-Gm-Message-State: AFqh2kpeBd2E9ZcD/XD8z93u1J//t37BIk7Dmm2JCUH5AtQz63g0i79v
 ey0aoitEyBgIJosLPw/9z3nrgDIE+q4H3stb/6+5Qhw4IObSyXK/P8y0uze81jbUXJ6BxgrjvCI
 ggVgF8EmAHgJVmxg=
X-Received: by 2002:a0c:e8d0:0:b0:534:8a2d:a654 with SMTP id
 m16-20020a0ce8d0000000b005348a2da654mr5503365qvo.39.1673974809373; 
 Tue, 17 Jan 2023 09:00:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuYJxuHBPlsXKQAQPrWPGaEWWrw5+yVh+5KPMrqqPmUvEtW2Vga0Ku7R+oie7S7UtnQoghA7g==
X-Received: by 2002:a0c:e8d0:0:b0:534:8a2d:a654 with SMTP id
 m16-20020a0ce8d0000000b005348a2da654mr5503345qvo.39.1673974809171; 
 Tue, 17 Jan 2023 09:00:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r7-20020ae9d607000000b0070650f5ee2fsm5656855qkk.65.2023.01.17.09.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 09:00:08 -0800 (PST)
Message-ID: <1fe1dc81-f6bc-3da8-81c1-16dd248cc23d@redhat.com>
Date: Tue, 17 Jan 2023 18:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC] 2-stage translation emulation support for SMMUv3 on TCG
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Evgeny,
On 1/16/23 16:37, Evgeny Iakovlev wrote:
> Hi!
>
>
> We are using qemu-tcg-aarch64 to run Hyper-V test and debug builds for
> arm. Besides some minor fixes that i have submitted over the last
> couple of weeks, one big compatibility item for us is SMMUv3 2-stage
> translations support. We can do fine without it right now, but having
> it would also allow us to test nested arm guests with SMMUv3, which is
> great.
>
>
> One idea we have floating around is implementing 2-stage translations
> in SMMUv3 in Qemu. We can't make a commitment yet, but before we
> consider it i think it would be wise to ask the community about it,
> specifically:
>
> * Do 2-stage translations sound like something qemu-arm would be keen
> on accepting? Are there any other use-cases for it besides an arguably
> wild corner case of nesting an EL2 hypervisor on software-emulated arm64?
Personally I don't have anything against. I guess we cannot prevent you
from adding a feature that is supported by the spec ;-) One concern I
have is the extra complexity it will bring to the device. At least I
would recommend you to try to isolate stage2 support at most from the
rest and make your utmost to keep the stage1 perf as close as possible
to what it is currently. Indeed the main "production" use case is S1
vSMMU with KVM acceleration. Currently in linux arm-smmuv3 driver, only
S1 is used. Out of curiosity how are the S2 and S1+S2 used with HyperV?

I am mostly involved in KVM accelerated use cases so I will let others
comment on potential use cases using S2.
>
> * Is there anyone already working on it as we speak maybe?
afaik I am not aware of anybody working on that at the moment
>
> * Were there any previous attempts to do this and if yes why they
> evidently didn't get through?
afaik there were no series sent publicly

Thanks

Eric
>
>
> Thanks!
>
>


