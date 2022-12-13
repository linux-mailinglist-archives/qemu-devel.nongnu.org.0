Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6149864AC07
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 01:15:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4swj-0000mV-IS; Mon, 12 Dec 2022 19:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4swi-0000mE-05
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:14:56 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4swg-0003Qn-GW
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:14:55 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 v62-20020a4a7c41000000b004a0a214dfbaso2113752ooc.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8TUpw7PhWuIVf+cq6ML6UdC64P/nq8yHGYeMejtCS00=;
 b=ZZplR3CCgkwruz+GY3vuWDFRf1wIIzEz9BJmm6wI6Fv8XHi/vf1SVCvTFck8tk/j8g
 j2Xonz1ubnYOshDLFNKZAeueU3aQpvlf78XUf7l8Msu0/aJbmzUEE6gUO4tDRjo1xZLI
 Ekq1fYxwcLJhUAm7Mpw+4e9Ql0k/I9I0I7TAI/SgPx79Dk7f8moAtS4a6wdyWj5yY0d3
 a58HQE27fuG+DGUIYJdVElKuyKWuyJUmH5MCB+MH2WroZbD7m3tPDW85zW8G8kXF3pq0
 hmcN1cXLFHZyyAozkRhgeKcdh38bOhNykj29uaoXGgNCZht3GKG8r7HQDr/vUF4KI9df
 YAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8TUpw7PhWuIVf+cq6ML6UdC64P/nq8yHGYeMejtCS00=;
 b=T5NQ4hAbbMOvE18/4sepfkcoYTT+gwxCVo+tJZzTzNEdKjVzA7HWtzysS9VVzjWsN+
 TwA3ApaUIXSyLzZbSYTfb5ALCNwtjqDFnL/y4E9uofLm9dHOzvN0xD/MPE/0XGHAC2q8
 m7ikk+sCQyNEsPLmxU6RegTuFx/mWwoNOAFwd800CYhTwZmtBlPnB6kxf5RQ2Th7LvOI
 KuELy2E4+VyYTiTlxuZmU0NUIRlFWAHT4k7b2qCTmMGNwyKvxnRwbK3cMjYLEdwCVBix
 xl/fbc13/zx20SKen3KD0BJ4MNeomdXMUEhooKj0Pjy5m3DyawE9gwJDjqH6H8Z6Ia5d
 E7Dg==
X-Gm-Message-State: ANoB5pkT10voJNlEZNgZT0tMK5vPTVeEmakfAFgYKMciQNxWf9GK2itt
 GDqFxAODQjK2P1sxfxgPfedplQ==
X-Google-Smtp-Source: AA0mqf6FUw7eQJEfiWynYToMi5wmHQ1ZRVR9Cxq9A5boWEIYmwAcdtphwTMKSpWeHTbB7JkaWwnjNg==
X-Received: by 2002:a4a:e3c4:0:b0:49e:9a02:8bbe with SMTP id
 m4-20020a4ae3c4000000b0049e9a028bbemr9056731oov.7.1670890493088; 
 Mon, 12 Dec 2022 16:14:53 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:71d1:c9fb:8efe:ce5d?
 ([2806:102e:18:2efc:71d1:c9fb:8efe:ce5d])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a4adc8f000000b004a394578e14sm524290oou.32.2022.12.12.16.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 16:14:52 -0800 (PST)
Message-ID: <94c26d02-94d5-ec42-99bf-3fac080e567e@linaro.org>
Date: Mon, 12 Dec 2022 18:14:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian
 value in VirtIODevice state
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221212230517.28872-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
> The device endianness doesn't change during runtime.

What are you talking about?  Of course it does.

I mean, it doesn't often in practice, because the Linux kernel is compiled for one 
endianness and doesn't keep toggling state, but the hooks that you're replacing test for 
the *current* endianness state of the cpu.  So this is a behaviour change.

Have you considered that the bootloader and the kernel may use different endianness?


r~

