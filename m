Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB84BB8DC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 13:11:41 +0100 (CET)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL26s-0007p1-JI
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 07:11:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nL23t-0005Rr-JC
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nL23p-00042T-WA
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645186109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGukzFyjFr7UwmRjyxPpQ0rHYGyYOHF55GO4rwD0qug=;
 b=SnF3G2tGy8/T8vFlhdvwy4OTfgz/Bz0Ao6hO2EmOWQ3udprjiHOCA2zdZF32BKUwbJx55n
 1tKkiUOMlj3dtCHhX+Z6l2mVQrPegtho9OwoAXCJRor7AiXO7jMCcQuA1ul4Ap8MOfMmv+
 cUT8p2Q0tqp5C/NPvhH2jk3UgVOT1k4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-yQ91tLQtNfutvHmlospbtA-1; Fri, 18 Feb 2022 07:08:28 -0500
X-MC-Unique: yQ91tLQtNfutvHmlospbtA-1
Received: by mail-ed1-f71.google.com with SMTP id
 f9-20020a0564021e8900b00412d0a6ef0dso422341edf.11
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 04:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aGukzFyjFr7UwmRjyxPpQ0rHYGyYOHF55GO4rwD0qug=;
 b=6pTrOCyyVhlGHidYAaBEjG22rJE/g5FrKVyhdiaiP4l9VmW7EhKTGiG20LDDJKV5Dd
 gxFEh5eSmV35/qEw53enxUdamw+oaTYfqUJxGTEkm6OO95OAzEoUJeP2zAEo8hKt/8Du
 +W8aZ9McUUVNL9Mww0v9bd4T0/4Ul0fFpHq6HS1wLM7qyOT5rcSZl9ukE6DBU5YRY9UY
 5YX8A7OzXg53iFoDtwJjWyItN7+z1itSlQ/OrCVd6LnmhN0WotRoF9x4lv+LO42vPkf1
 keUdhS1pNgwvIyPLIkyZamJREWbns9xx4Llfwt0HU0XNS/I5DS7LV7DyN49S6NyiDvvQ
 BLuA==
X-Gm-Message-State: AOAM5335E9QVXJdvkgtMBFS9hP0K3bA7JGCRpBs9c9LYiZ5dPBP7gFep
 zktkeRqOOzjiPYg3btKgKPOfuTvzNfR43hULoIBkU882IskT7+WGo/5JXaGG8nk5TX6g2kDnmN0
 oDuPdJvgGtekVCRI=
X-Received: by 2002:a50:ed0c:0:b0:410:bbf:ec14 with SMTP id
 j12-20020a50ed0c000000b004100bbfec14mr7617225eds.116.1645186107011; 
 Fri, 18 Feb 2022 04:08:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy36CVOePz+q3YELzdQyBwEvqExFwmGYnM+OkF/T34/SjpvVjxs2SdUqT2zePzbI9V2wrdcRA==
X-Received: by 2002:a50:ed0c:0:b0:410:bbf:ec14 with SMTP id
 j12-20020a50ed0c000000b004100bbfec14mr7617201eds.116.1645186106782; 
 Fri, 18 Feb 2022 04:08:26 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id y23sm2234761ejk.153.2022.02.18.04.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 04:08:26 -0800 (PST)
Message-ID: <fafc47f7-2801-92e3-61ca-fbdf407a8f92@redhat.com>
Date: Fri, 18 Feb 2022 13:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: meson incremental build doesn't handle config file going away
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA8nyOuQ_HziMVxgjFZYer9LUv-_QsKxzQY50By=6YUO=w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8nyOuQ_HziMVxgjFZYer9LUv-_QsKxzQY50By=6YUO=w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 18/02/2022 12.59, Peter Maydell wrote:
> I've noticed that the meson incremental build doesn't seem to
> cleanly handle a config file going away, as ppc64abi32-linux-user
> has recently. The build fails with:
> 
> ../../meson.build:1941:2: ERROR: Failed to load
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/targets/ppc64abi32-linux-user.mak:
> [Errno 2] No such file or directory:
> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/targets/ppc64abi32-linux-user.mak'
> 
> where line 1941 is
>    config_target += keyval.load('configs/targets' / target + '.mak')
> 
> Rerunning make doesn't help; you have to manually re-run
> configure.
> 
> Something here should figure out that "config file deleted" means
> it needs to rerun configure, I think.

That's weird, since the patch that removed that target actually change the 
configure script, too, so it should have re-run configure afterwards... or 
is that broken, too?

  Thomas


