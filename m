Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2945C4DF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:49:44 +0100 (CET)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsed-0000jw-8I
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpsOY-00033g-2L
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:33:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpsOU-00011z-CZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637760781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxOpWE4LPwuXaLqpkPLmvJ4NrXNsZIPog+TN8WO+JJg=;
 b=L6gfn55SwmlOJrQUn92n+WbzXhCyZYKtalo8mrbRQtROthBqpKOlyv5VWcXy4WibFRNK49
 MkV7nC+XAwwBxxiCZin7jySKQFV/ft/1ljn6GT3RCprwNAwpgcCURH/3LcwlAzSmsf1zYt
 aflR4tiKPf0TMz9MbFaV2wljEQSEZhU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-SymbSoB5MvCSWpKYq-K6nw-1; Wed, 24 Nov 2021 08:32:59 -0500
X-MC-Unique: SymbSoB5MvCSWpKYq-K6nw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so500804wrb.11
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bxOpWE4LPwuXaLqpkPLmvJ4NrXNsZIPog+TN8WO+JJg=;
 b=jSpPW1mhi9FLuYKmqUQJb9Ls2nuq1uDl8AVRkliFQnm7os95p6sHV9rjvc4lmgZyz7
 GC5Vg+yizHlAsrbg5t+6V9GW6vUd1faWwuhRaep9XMGmagJQItwtxpXN2ITzCBsVU+IJ
 sZfsbHJLfOtkIi5jBul4W6VgbONamtwK/QerPePt0yaWewP33ToTw+56MwdJPHfrMwKS
 gg9BFWScEraZnpx+R2zgXxnzik3cwxD6u7ADZAmDe+DceKqUr9FW6zoY7j6ARJVLb4tG
 QI8/NxTVUJN6COkpgWyWRwx77NQfa0RwplC2TOjR7IXS8nF30wfVV8W+SmTfy/FoWrzU
 /zRQ==
X-Gm-Message-State: AOAM531CKUE9NT/dZW7sZVmMEndFS9HaDutInQWh0RNUusVr3oH7EiSP
 r8YOJRin8wkvBT4Glmgf5WDMSXy7lvfeqUkdDs4HpGS3ZH+kHHH02wzpiE8Qz1m6DLXGy9jP4vG
 Mw81KxBMWAtKIo5o=
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr18302574wrs.46.1637760778608; 
 Wed, 24 Nov 2021 05:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmopWKJqX1/RwZrHPDtuFXcpsyzF7EKMtxznQQiMFZMc77cWCgjv9uQQLIZrL+s3dlvTCN+A==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr18302535wrs.46.1637760778392; 
 Wed, 24 Nov 2021 05:32:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id l7sm18925122wry.86.2021.11.24.05.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:32:57 -0800 (PST)
Message-ID: <b1babd61-02f9-8083-cda0-99d69839b10e@redhat.com>
Date: Wed, 24 Nov 2021 14:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 04/18] ui: avoid warnings about directdb on Alpine /
 musl libc
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211124130150.268230-5-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/2021 14.01, Daniel P. Berrangé wrote:
> On Alpine, SDL is built with directfb support and this triggers warnings
> during QEMU build
> 
> In file included from /usr/include/directfb/direct/thread.h:38,
>                   from /usr/include/directfb/direct/debug.h:43,
>                   from /usr/include/directfb/direct/interface.h:36,
>                   from /usr/include/directfb/directfb.h:49,
>                   from /usr/include/SDL2/SDL_syswm.h:80,
>                   from /builds/berrange/qemu/include/ui/sdl2.h:8,
>                   from ../ui/sdl2-gl.c:31:
> /usr/include/directfb/direct/os/waitqueue.h:41:25: error: redundant redeclaration of 'direct_waitqueue_init' [-Werror=redundant-decls]
>     41 | DirectResult DIRECT_API direct_waitqueue_init        ( DirectWaitQueue *queue );
>        |                         ^~~~~~~~~~~~~~~~~~~~~

I think that's a bug in the SDL2 package of Alpine. I've had trouble with 
that one in the past already ... so not sure whether it's our job now to 
work around bugs in that crappy Alpine package... I'd prefer if we simply do 
not compile-test SDL on Alpine instead.

  Thomas


