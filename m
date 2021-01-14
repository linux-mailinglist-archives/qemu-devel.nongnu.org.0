Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912A2F6999
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:34:20 +0100 (CET)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07Rr-0003au-8C
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06id-0001or-Ld
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:47:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06iY-0006Sr-Ko
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GaKIQZ8VZUz6JzIQSpZceppktdSe11Ti4fWEiUYOHLA=;
 b=EogNzbA47OGTKe3KOIv6BQL84JIFblnf5axTncro+5cx8LZlx0/LIDdgy44vDtuZ7d5AsQ
 Mi8LSJshtBAkSfOvYI6Xp6qH45bglGFyn+88R5/pp5Njf8B2BBRUMVS0KOOmTcrmNKz0i8
 JNYQWpCMeM/DGV7bmAymBq2115JgKsk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-Cd3gSMx7MO6kg920RDVyvg-1; Thu, 14 Jan 2021 12:47:22 -0500
X-MC-Unique: Cd3gSMx7MO6kg920RDVyvg-1
Received: by mail-wr1-f72.google.com with SMTP id u29so2933760wru.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GaKIQZ8VZUz6JzIQSpZceppktdSe11Ti4fWEiUYOHLA=;
 b=YAsobynrloEbDimykeMoMEO0wS8oV+OccjyeV0/gMmkvHC55IF2E8UXfQPK8h66Nrl
 9KrwLN5tfJtUsHqrnqB8BsdbWkadLa1unw1rYwexVOjfR+o0YbemMo2px3AP8yznAthq
 8rMg2LmfUe+gpYwzm9s4ALYpHgjBDzkg/Ak+AxQZYWQLFVY14q8MoMYXKfgMg2wbxzIl
 HahskAjanHR77FNjg2xSfjWJY3hqu0SP81dI9nfsrLLR2kRz5zQbI6XY6kZ3vcSr/U4h
 9SK3EQAeaKRbu4pJaBRQlWk2BImCJ2kbVxKpBjFmT8iFRf9gpxGMX9KTQtnMu7ME4ydW
 H3Tg==
X-Gm-Message-State: AOAM533h4RdH4lJaIYXYY6TzSMLjUdNNO/hnnI5YahCn+rtCeflkbrzi
 rKX125jUSfY6qdg4/A1+UjoETY1VJWo/A3rQ/t1WGwdeO6T0tU1JtWPVJjkaRL9cUuXEi1Io547
 FSvsdvj3Du+msg2s=
X-Received: by 2002:adf:fb52:: with SMTP id c18mr8978050wrs.186.1610646441043; 
 Thu, 14 Jan 2021 09:47:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLnG7csuguu32wi7ZJ+wRwOtrxLbSKyovFe6bnraM7G1Wtt9YWdNNfKt8GVzwbPX1QZvACQA==
X-Received: by 2002:adf:fb52:: with SMTP id c18mr8978039wrs.186.1610646440921; 
 Thu, 14 Jan 2021 09:47:20 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a24sm3379604wmj.17.2021.01.14.09.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 09:47:20 -0800 (PST)
Subject: Re: [PATCH v2 10/12] Fix build with new yank feature by adding stubs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <88ed23a1-06b2-ce13-842d-9aa1acb381a3@redhat.com>
Date: Thu, 14 Jan 2021 18:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-11-alex.bennee@linaro.org>
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
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 5:57 PM, Alex Bennée wrote:
> From: Lukas Straub <lukasstraub2@web.de>
> 

Again:

Fixes: 50186051f42 ("Introduce yank feature")

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> [AJB: tweak MAINTAINERS]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210114141918.5201cc9c@gecko.fritz.box>
> ---
>  stubs/yank.c      | 29 +++++++++++++++++++++++++++++
>  MAINTAINERS       |  1 +
>  stubs/meson.build |  1 +
>  3 files changed, 31 insertions(+)
>  create mode 100644 stubs/yank.c
> 
> diff --git a/stubs/yank.c b/stubs/yank.c
> new file mode 100644
> index 0000000000..6090416065
> --- /dev/null
> +++ b/stubs/yank.c
> @@ -0,0 +1,29 @@
> +#include "qemu/osdep.h"
> +#include "qemu/yank.h"
> +
> +bool yank_register_instance(const YankInstance *instance, Error **errp)
> +{
> +    return true;
> +}
> +
> +void yank_unregister_instance(const YankInstance *instance)
> +{
> +}
> +
> +void yank_register_function(const YankInstance *instance,
> +                            YankFn *func,
> +                            void *opaque)
> +{
> +}
> +
> +void yank_unregister_function(const YankInstance *instance,
> +                              YankFn *func,
> +                              void *opaque)
> +{
> +}
> +
> +void yank_generic_iochannel(void *opaque)
> +{
> +}
> +
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb0656aec3..07e4851aa4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2736,6 +2736,7 @@ Yank feature
>  M: Lukas Straub <lukasstraub2@web.de>
>  S: Odd fixes
>  F: util/yank.c
> +F: stubs/yank.c
>  F: include/qemu/yank.h
>  F: qapi/yank.json
>  
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 80b1d81a31..1a656cd070 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -47,6 +47,7 @@ stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
>  stub_ss.add(files('cpu-synchronize-state.c'))
>  if have_block
> +  stub_ss.add(files('yank.c'))
>    stub_ss.add(files('replay-tools.c'))
>  endif
>  if have_system
> 


