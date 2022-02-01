Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716064A5A74
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:47:12 +0100 (CET)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqgp-0007CF-Ia
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqbJ-0004Dn-Oq; Tue, 01 Feb 2022 05:41:33 -0500
Received: from [2a00:1450:4864:20::62b] (port=38585
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqbH-0007Ky-DE; Tue, 01 Feb 2022 05:41:29 -0500
Received: by mail-ej1-x62b.google.com with SMTP id k25so52402634ejp.5;
 Tue, 01 Feb 2022 02:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1z1zHXUxH5+JmA82xf2mzmko4BDuRsqcAi+TM92SOY=;
 b=kdcZ/8ztX8jCCm0QH1Q3BS2YJwDLZ966RqeYzXizKfrO1Rk1P1f5a3qW8+pSEJGr9F
 xkjBib9ecBX+1xr/NjSyxal70YbhEwaVGCj967wheB2DpcwJMmgKiamjYVuTZj4ZxVGd
 KB6XZvHNuAmx0OqABAovoMzijscBsdU4QCGRP+7q/Rm4kptbaN0j5e85oBnBWNfEBYOf
 JSPP2+RFSz9VUQjg8g0ngpMW4AsxlGE6hiAYU3Wk6GU37jUIgotXa6RLdV+xL/3oCKIh
 6FQ3n0xUNJWJ47vlT/SpfwE2//5AnYbPnXJgHexi8GGXDR07wmQW0iEshr/t/HGC6SyU
 bunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1z1zHXUxH5+JmA82xf2mzmko4BDuRsqcAi+TM92SOY=;
 b=r19OzdZChdVdsXVvQYtPdr8Wl4QPBLc6qzMHTPT+Fp/+fF35Upbvwv+v5+CxPSAnF9
 lTbY/bi6bO3Kveaj3JPTUjeQLqGpC5tFmhkhs2YSXpxVGnElFdEnJhxrCh5XcicyBx5M
 K/5ADvX/Fm1NwV76hT543aKXMv+XjYICRo+qUNVqIXzH7s22IUg4l1YHGzPxwS8UxK6T
 +YscundktmGBvDNi4pKKGMjBAlmHwUPK3tXWt/YJ5NbbB1qsi2lgJQzSf3zyRLoEMeej
 f+YonFBUElerEwjtRuFF1WrQ4VpMyPt4q5xGAZX9n9lByzovHv2yCYSVvgdnqxOvJ2m9
 3Stg==
X-Gm-Message-State: AOAM533Iy2aCNfKu2bhOuzsRyJVDwV/QK0+VL59ynojC1krmmvc6aSgi
 PV66L+qL3mbkuuTlaomMXAc=
X-Google-Smtp-Source: ABdhPJz6jMIM+xURNaUq+OEXyNKYeuuEKgwTl8tVn5RYy33DZ6EqcgWihPFh9RXsj4h1uQJUlny4TQ==
X-Received: by 2002:a17:907:3e8d:: with SMTP id
 hs13mr20802415ejc.0.1643712079190; 
 Tue, 01 Feb 2022 02:41:19 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bx18sm15916215edb.93.2022.02.01.02.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:41:18 -0800 (PST)
Message-ID: <0465db20-b572-417a-a3d8-f556b90a00c0@redhat.com>
Date: Tue, 1 Feb 2022 11:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-2-eesposit@redhat.com> <YfJ6dsVcmB4Uc2rO@redhat.com>
 <7ada78d2-0978-8f5a-f0f8-318d2f26ba41@redhat.com>
 <YffzLaIhjgfBkcXf@redhat.com>
 <3fa2d527-91f6-0869-d6b0-c82bdd04884c@redhat.com>
 <31dc1b10-655b-7465-4f55-c0b28b09b784@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <31dc1b10-655b-7465-4f55-c0b28b09b784@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 David Gibson <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 10:08, Emanuele Giuseppe Esposito wrote:
> 
> + *
> + * This function should never be used in the block layer, please
> + * instead refer to qemu_in_main_thread().


This function should never be used in the block layer, because unit 
tests, block layer tools and qemu-storage-daemon do not have a BQL.
Please instead refer to qemu_in_main_thread().

> +
> +/**
> + * qemu_in_main_thread: same as qemu_mutex_iothread_locked when
> + * softmmu/cpus.c implementation is linked. Otherwise this function
> + * checks that the current AioContext is the global AioContext
> + * (main loop).
> + *
> + * This is useful when checking that the BQL is held as a
> + * replacement of qemu_mutex_iothread_locked() usege in the
> + * block layer, since the former returns false when invoked by
> + * unit tests or other users like qemu-storage-daemon that end
> + * up using the stubs/iothread-lock.c implementation.
> + *
> + * This function should only be used in the block layer.
> + * Use this function to determine whether it is possible to safely
> + * access the block layer's globals.
> + */
> +bool qemu_in_main_thread(void);

I think the reference to qemu_mutex_iothread_locked() complicates 
things.  It's enough to explain the different policies in my opinion:

/**
  * qemu_in_main_thread: return whether it's possible to safely access
  * the global state of the block layer.
  *
  * Global state of the block layer is not accessible from I/O threads
  * or worker threads; only from threads that "own" the default
  * AioContext that qemu_get_aio_context() returns.  For tests, block
  * layer tools and qemu-storage-daemon there is a designated thread that
  * runs the event loop for qemu_get_aio_context(), and that is the
  * main thread.
  *
  * For emulators, however, any thread that holds the BQL can act
  * as the block layer main thread; this will be any of the actual
  * main thread, the vCPU threads or the RCU thread.
  *
  * For clarity, do not use this function outside the block layer.
  */

Paolo

