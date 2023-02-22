Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D469EDAD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 04:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgCA-0000q5-B9; Tue, 21 Feb 2023 22:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUgC8-0000p9-6U
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 22:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUgC5-0006nU-OF
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 22:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677038004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjUkYCUVqaMmDhb6xO88XGQ8LsJPU2Yg/Fk3P6KsjkA=;
 b=X+z24Yf2hmAuAlAg75RYitsv091crB+tdS9M/Kbq1+A/oiPVcfRcg49py0FssAc2Rwdw4V
 RK/PBJxdA0EIg8yzMHLky3P0zjYpBaa1G3FowIa1TPb7wzk4w1bH7w1/d8Zy5sexR9GVju
 PqpU/2XFqN5/ZqgVYD52qfK4xAC1+EM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-TUJSf8hbNo6SCHf7Va1grQ-1; Tue, 21 Feb 2023 22:53:23 -0500
X-MC-Unique: TUJSf8hbNo6SCHf7Va1grQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so3010822wmj.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 19:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yjUkYCUVqaMmDhb6xO88XGQ8LsJPU2Yg/Fk3P6KsjkA=;
 b=ztX8iTejiaW6TNA6LsGgW4q6NtlTJ0U7Q6I7btQVPpdmHSF7f3iHQo0eDFJur960PU
 BJlIce0L4p/rb8kdgmbLqtEJyfB4gScY45MiHmb8xwF8CuaIjDgL6wOMUyS66NuJfSIk
 sNa+Lu2nqUY+WWwM6eELZRM9+GUBO0vBWlE4VXhDM71LASv7NkUTwo3JVZf9alQ6vA9P
 zmoaaX2LItPh0937co7fwMIKwMz1m55jsteoq2EBK3xWIQjZh/NHLMWm12PQZDjZU/Br
 ulbaOC1nJybAgeoNYh8ye4uDZLNvDKBEL1ceZ3SsjF+fVAHkBKZH+4HSGyXBOoWuUHeh
 vyDw==
X-Gm-Message-State: AO0yUKUNd4W7m3Y6c/EQpJ1NRrqxiAQrOeS5Rkb8RGr+MtTh39FwhvjO
 zRnC0R2Dcm5h/cnp6gYuimnQjKvkBD/Mbnr9wGnFRWLP4k0dqHx4/pKb6/MXboagIi8aHlSguxk
 Gj5A+7dleM2t44pg=
X-Received: by 2002:a05:600c:340a:b0:3e7:5142:cf17 with SMTP id
 y10-20020a05600c340a00b003e75142cf17mr3654515wmp.18.1677038002476; 
 Tue, 21 Feb 2023 19:53:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZFD3D2vzzx9GCrFWXl/CzPzTl2SigNlbp6THthXi3FllROIBBVf/jCxIhlKAbAjLrfgALsA==
X-Received: by 2002:a05:600c:340a:b0:3e7:5142:cf17 with SMTP id
 y10-20020a05600c340a00b003e75142cf17mr3654504wmp.18.1677038002180; 
 Tue, 21 Feb 2023 19:53:22 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003dc4a47605fsm6492126wmi.8.2023.02.21.19.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 19:53:21 -0800 (PST)
Message-ID: <2352caa0-ae10-1807-d055-6bd7757113e8@redhat.com>
Date: Wed, 22 Feb 2023 04:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/5] scripts/checkpatch.pl: Do not allow assert(0)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221232520.14480-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
> Since commit 262a69f428 ("osdep.h: Prohibit disabling assert()
> in supported builds") we can not build QEMU with NDEBUG (or
> G_DISABLE_ASSERT) defined, thus 'assert(0)' always aborts QEMU.
> 
> However some static analyzers / compilers doesn't notice NDEBUG
> can't be defined and emit warnings if code is used after an
> 'assert(0)' call. See for example commit c0a6665c3c ("target/i386:
> Remove compilation errors when -Werror=maybe-uninitialized").

commit c0a6665c3c only uses g_assert_not_reached(), so that looks like a bad 
example for your asset(0) case?

  Thomas


