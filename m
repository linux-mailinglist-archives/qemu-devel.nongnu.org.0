Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86264439452
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:56:52 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexet-0006GX-L5
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexaO-0001Bl-KC
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexaL-0008SI-KO
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635159127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlolW14N7xLzFqi1Qgud260T45n4OFnKtouNQv+3rjY=;
 b=OUycBaui6HMz3RXIgw7dc5Z76D24nW942HDCI4TzV6s8LMYfvEtH26Ck7yioP72jxDkfDG
 WDAQDt9dnvFmZXUOsATS4ib1si0nRU7BAQzRyOzF/uzzH3x9ILrh5djXQYVkO/wxr4xhbA
 BalAIIV+PUzVtwrfA+A1Bupx6+j0J7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-caEcmLQbOnSkRlzA1q7RhA-1; Mon, 25 Oct 2021 06:52:06 -0400
X-MC-Unique: caEcmLQbOnSkRlzA1q7RhA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso3360085wme.5
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 03:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BlolW14N7xLzFqi1Qgud260T45n4OFnKtouNQv+3rjY=;
 b=KYD/W5OVPwOQH5Z0/NSDtcvzikHyKyhmaT79Z1IxFv1UYIWMYxHoLIFn8Eh7bpjtrF
 p4fmCO5hXRqffsDk06xdwAcnBnodRfCxkZuPzOYBsf8FbNVN5KUqwJiGL68LhseFVWbt
 2VCVHQ/qaUlXYm5d2RK6d5ubmJXb8/6Xg+bwA1svcmLaIksNHnZWR72tYMyya4K6SP4f
 jkrTkpyWh0vQNw8ay23HjIeT+ugrF34EFbsqm9qob3UcSuCZMU0YRMSYaHleOM9nQxKf
 TVAaMkHbifLbja5vWXjZ0WgUZkM4YMtSKuxlk0XjO27SyU4XPUp3x09tin0sxEEKNup8
 6+xg==
X-Gm-Message-State: AOAM533UguIYzjkuPw3XSI8x8CMvSgPggktpK3AfA6bGB74ys4obZ05q
 CuvsVyTj1vS66URYvLmQ8X0ppwCmLLFvfNt9Mlfx7NiPV9Fxmo/23/dl7iTGCg/NDIomCgMHqm6
 GpPF3+41WgHrm1k8=
X-Received: by 2002:a05:6000:54e:: with SMTP id
 b14mr18871092wrf.308.1635159125106; 
 Mon, 25 Oct 2021 03:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo5RpJoWg/OaGYL7OI5bajkXad5I//UyBPj0GBIikjpVnj2XckvyR7YsTBuFAUVoYpJbSULQ==
X-Received: by 2002:a05:6000:54e:: with SMTP id
 b14mr18871067wrf.308.1635159124908; 
 Mon, 25 Oct 2021 03:52:04 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o194sm9368136wme.40.2021.10.25.03.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 03:52:04 -0700 (PDT)
Message-ID: <9535743f-5cc0-f756-2a3f-cebd2e1401d6@redhat.com>
Date: Mon, 25 Oct 2021 12:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] configure: do not duplicate CPU_CFLAGS into QEMU_LDFLAGS
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211025082000.629088-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025082000.629088-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 10/25/21 10:20, Paolo Bonzini wrote:

Can we prefix with this?

  Since commit 4dba2789084 ("configure, meson: move CPU_CFLAGS
  out of QEMU_CFLAGS"),

> CPU_CFLAGS is included in the link commands both during configure
> and (via config-meson.cross) during meson.  It need not be added
> separately to QEMU_LDFLAGS.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 53 ++++++++++++++---------------------------------------
>  1 file changed, 14 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


