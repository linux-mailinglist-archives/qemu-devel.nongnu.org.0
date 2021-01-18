Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D832F9BF0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:42:57 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1R3o-00056Q-1r
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R2P-0004F5-Of
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:41:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R2N-0006WX-2R
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:41:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610962884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS4KzKOJ0cVVXMB6IwF7klX32A2gREYdrqbMEnGdHOs=;
 b=MfrEAzc2mKU7nWI3+G404u5oGOQipNxpuuc2xRJeXJ3vpYynKW+2H+uQWcuBnftBPgP9ZK
 2ytu0ff0fNBNeY7tAZj0V6eRCM1lH4vtkDWjAWz9Oz7okViBrb9Ymhw9HvF4HK6nG5R/Xr
 wm8pwm7vPLi29m9cSnvWVCYJv7w9QMw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-HQAhnphqOkCuj6kSGINJJQ-1; Mon, 18 Jan 2021 04:41:22 -0500
X-MC-Unique: HQAhnphqOkCuj6kSGINJJQ-1
Received: by mail-wm1-f70.google.com with SMTP id n17so97825wmk.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AS4KzKOJ0cVVXMB6IwF7klX32A2gREYdrqbMEnGdHOs=;
 b=l55Dvca9cMk8Z5fPaFhni/VuTqhNCAybZWJ95fuIw7saQ4BX9Iq+/XX96lOdy5GGtl
 Y5xGh6IGyjAgfyWcQ/klHq1XbAG654AlAlOexbsiHhrpRgSf8wxZUD1yhCWFTcVEZzte
 eyrO9qJh05DVjmsL9cJeoQlDTxSKan+/bIo9XNf78T7/4vmGsdybm2HJhE4vM6GXYk+l
 wEaFgCSYxUyqzZcgvDF0hGRzk40IWPU1oANuCBgqPkdO3u1skgNV9mF0SdEOAhj1Tcna
 uRKL93S7l/KrB73wPi8Yg3ymFOU157hhQ6Nvk4jc+nhbnOwi222c5OoqPe9TguAOXUAh
 CqJA==
X-Gm-Message-State: AOAM533xCTB/iHdzrLa9Cb8e7fG7Vomax/kBDogxVD31K1X7ti5oHQXb
 xU+HUX8+WgiLU2Of75rlQcGDDJX3gtLmpUzFuQdQFbQHXvYyt26vBaI5L/z4wuLfhMvAa8l99se
 yCV64Lq/UrNQXOhg=
X-Received: by 2002:adf:b781:: with SMTP id s1mr21050179wre.290.1610962881770; 
 Mon, 18 Jan 2021 01:41:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2Oo2/AneHcPKIpu5/8J8qKp39igwQWmLm5ZZWFuFtdvlChiLOzc/BPuDuIGUfn1ZqbB+RSA==
X-Received: by 2002:adf:b781:: with SMTP id s1mr21050157wre.290.1610962881664; 
 Mon, 18 Jan 2021 01:41:21 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 62sm5847482wmd.34.2021.01.18.01.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:41:21 -0800 (PST)
Subject: Re: [PATCH v2 2/9] libvhost-user: Include poll.h instead of sys/poll.h
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eae88670-9f5b-09ef-dcfb-6e4f00d0011a@redhat.com>
Date: Mon, 18 Jan 2021 10:41:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118063808.12471-3-jiaxun.yang@flygoat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 7:38 AM, Jiaxun Yang wrote:
> Musl libc complains about it's wrong usage.
> 
> In file included from ../subprojects/libvhost-user/libvhost-user.h:20,
>                  from ../subprojects/libvhost-user/libvhost-user-glib.h:19,
>                  from ../subprojects/libvhost-user/libvhost-user-glib.c:15:
> /usr/include/sys/poll.h:1:2: error: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Werror=cpp]
>     1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
>       |  ^~~~~~~
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


