Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184B76CD468
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 10:21:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phR2y-0002Ft-Rc; Wed, 29 Mar 2023 04:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phR2x-0002Fk-I4
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phR2v-0000bX-Nu
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680078040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vb0IjGfqxxwehXaOi2ztOXMOz9JLwn/dQl0LW802dXI=;
 b=b50jTNZ6v9nffbrRzhRCbM1gmq5JO+3YuPL9QudkxMJ6XOGerho8BGRSljqqgjlLdN70R1
 Dt0m9X6g6s42uaR26iQLC6CnTiHbPPo87LpuRYwIHLYm3EN+gE8Agg7gh4NJtwCCRi1yUF
 1uazC1PXiARdurhCnnjj50tqyiHi3O0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-wol4r3IpPC2oBzlAcfxtQg-1; Wed, 29 Mar 2023 04:20:39 -0400
X-MC-Unique: wol4r3IpPC2oBzlAcfxtQg-1
Received: by mail-qt1-f197.google.com with SMTP id
 n10-20020a05622a11ca00b003e4e30c6c98so7055571qtk.19
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 01:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680078039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vb0IjGfqxxwehXaOi2ztOXMOz9JLwn/dQl0LW802dXI=;
 b=JBnQYqzhCIOVAwrs5Pw+xUYtq63hC1MJhvuXAQwoIvXDm5esd5hsJFsHs49GQKxEwG
 U7gJclCOU2jJMh1kHkbj8XRtuX9D3vG5fK0d7C3YUtLdT0XVKqpOc3QNDzS28Y7wJEnY
 KpSS5sfNrNorUoGh7soBnIcB/DaGlD0Xbtq5rgLktwVXCaen9LQ26rOF1x5C0AaC9pS9
 FuvYzKfqCN6b1aBWVrcqSY0fU0eX+Y5Te20KUXw5fE+ep6dRhmF7uyLso4kMXj4HWRpg
 GrI+KuRW0kW4HFTLTuSKS7EJ3XRagQ2uQzjo9lU2izasKUAOU9A0okUC1ahyUci7u7sR
 y/qg==
X-Gm-Message-State: AO0yUKWZb7aAjFp03wBt6zhW1JTZrhgfeIJKJjMWArKouw3NRjqCTflY
 sDPSJVJJBGQCGskyhalQB87rgPIQH4zboZ74u11tmywmZQ6YSf6Z3RxPgZqjAMTwimEpkgREkuc
 SVcC6jbzC5WtvnXaRvDzWuCRylw==
X-Received: by 2002:ac8:5a0e:0:b0:3e3:7e53:9a8f with SMTP id
 n14-20020ac85a0e000000b003e37e539a8fmr29030049qta.50.1680078038812; 
 Wed, 29 Mar 2023 01:20:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set/HtRqvjJgiNhqxz2OlQoEGcBQZqJlSvPpL52td+P9euPa7xBPyxdq3U9NwUtTQEQmOi5ukyg==
X-Received: by 2002:ac8:5a0e:0:b0:3e3:7e53:9a8f with SMTP id
 n14-20020ac85a0e000000b003e37e539a8fmr29030042qta.50.1680078038579; 
 Wed, 29 Mar 2023 01:20:38 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-100.web.vodafone.de.
 [109.43.177.100]) by smtp.gmail.com with ESMTPSA id
 v6-20020ac87486000000b003bffe7fdc38sm12366072qtq.9.2023.03.29.01.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 01:20:38 -0700 (PDT)
Message-ID: <93c25ac1-7af7-1d3f-1d91-498f341a57d5@redhat.com>
Date: Wed, 29 Mar 2023 10:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: egl compile error on msys CI runners
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA96hY7wxj9NjbkZmBshA6VECUQktNXAyGdS+-zLL5rWmw@mail.gmail.com>
 <CAJ+F1C+6YYdNoFbraKwaw0A5NeUnwdJvrM6q98V6z0f-hr68Tw@mail.gmail.com>
 <ZCPxrZT+JlBNL/b6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZCPxrZT+JlBNL/b6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 29/03/2023 10.07, Daniel P. Berrangé wrote:
> On Wed, Mar 29, 2023 at 11:01:35AM +0400, Marc-André Lureau wrote:
>> Hi Peter
>>
>> On Tue, Mar 28, 2023 at 6:39 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> The msys CI runners have started failing to compile with an EGL
>>> related error:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/4015682307
>>>
>>> In file included from
>>> C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl.h:46,
>>> from C:/GitLab-Runner/builds/qemu-project/qemu/include/ui/egl-helpers.h:5,
>>> from ../ui/egl-helpers.c:21:
>>> C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl_generated.h:11:10:
>>> fatal error: EGL/eglplatform.h: No such file or directory
>>> 11 | #include "EGL/eglplatform.h"
>>> | ^~~~~~~~~~~~~~~~~~~
>>> ninja: build stopped: subcommand failed.
>>>
>>> Dan says this is because of a msys2 packaging issue:
>>> https://github.com/msys2/MINGW-packages/issues/16492
>>>
>>> Can we have a meson test that doesn't try to enable EGL on systems
>>> like this one where it's broken ? Changing the current meson.build
>>>    if cc.has_header('epoxy/egl.h', dependencies: epoxy)
>>> to whatever the meson is for "actually try to compile with the
>>> header" ought to do the trick, I think.
>>>
>>
>> This is an unfortunate consequence of using a fast-moving rolling
>> distribution, there are random breakages. It would make sense to have
>> tagged / pre-built images instead. That would also speed up the CI a
>> bit, hopefully.
> 
> IMHO if the distro is considered susceptible to ongoing random
> breakage we must not use it as a gating CI job. IOW, these
> msys jobs should have 'allow-failure: true' added to their
> definition.

I'm not a fan of 'allow-failure: true' - that basically means nobody will 
look at the failing jobs, so we could rather disable the jobs by default 
instead (and just run them manually when you want to have a look at them).

  Thomas


