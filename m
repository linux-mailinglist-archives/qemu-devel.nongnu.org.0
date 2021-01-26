Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD8303E64
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:17:21 +0100 (CET)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ODg-0006t6-Dl
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4O9z-0005u9-Ju
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4O9w-0006jc-Eh
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611666806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQpb57ydao0n5AB34yC6huKkKscCXFKdTCbIslMSUIU=;
 b=cE1OoLp6PXsROAm1SEXP7n9NX+WJ2yWdAoVmh4BX4kaM9PCBXdsBIZ4+BDfxd9MeFZ8KyQ
 UT0EXrHc9qiMGUs+K4z/SRajURaFLDikjE2/w+puQWz228eCWRqaerJku1TADz6UP3RtZi
 Tcz+ePOGSPBc8RE8Yykep3sLmuZdEC8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-9YkGeQEfO--9nuFKnL9_Mw-1; Tue, 26 Jan 2021 08:13:23 -0500
X-MC-Unique: 9YkGeQEfO--9nuFKnL9_Mw-1
Received: by mail-ed1-f69.google.com with SMTP id w4so9334681edu.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vQpb57ydao0n5AB34yC6huKkKscCXFKdTCbIslMSUIU=;
 b=dcw9whBb+Ih45zQYXUWUdBuSeN7XcnWnN8jt30paxdo/fVjPCwUJQe7PvzlQ0sP7qQ
 rO0tGVCH66AR3W8Jq3DIcK2CWr4Sk14rL3TDJr8AvFAl6sKUjFQ1jbG9CQqnVeEC0tMy
 +/EAVp1H5XDopzFt9ZzLnjUTJAP55ie5hdARhc5a1sCor0QBQpHWkztQIFCIV7esPCZk
 CbFGswsRZlDGk/vC4CzKz9XfDwpTncvByW1lju7bd50jT61D24KeDDPs4bv31jJ1LCV3
 7mcfVW5qC5SCIMvIlCnfiixIbWw5uEtMQsmn8WMvPIa60W0bQin60aEzgP4cl0bM/kP8
 CKOA==
X-Gm-Message-State: AOAM531cSN4EPfejZm4ckZsZBZiBXvapBe3sqTjboNc7O+25iOs3RCOb
 cgT9OOTOGu7sC47flA9hAybgqusQguxaCHmlkqFOsBcQGznVO7/tO1xrNj2pjFp4s8WDPJb6Qwd
 iTLT/JtI5rHbdCvc=
X-Received: by 2002:a05:6402:22b7:: with SMTP id
 cx23mr4557472edb.313.1611666802217; 
 Tue, 26 Jan 2021 05:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6YAXgkmQ2wG/IsXTSMkMKjfBL8dF4zgbnrSi8s/4S29jCCJ6O5JhO3Bl+IIg22ZkVCI8cIA==
X-Received: by 2002:a05:6402:22b7:: with SMTP id
 cx23mr4557465edb.313.1611666802118; 
 Tue, 26 Jan 2021 05:13:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w12sm12404965edr.29.2021.01.26.05.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 05:13:21 -0800 (PST)
Subject: Re: [PATCH] meson: accept either shared or static libraries if
 --disable-static
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210126102748.341403-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eb5a7b38-e18a-7305-9334-eba5a824b268@redhat.com>
Date: Tue, 26 Jan 2021 14:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126102748.341403-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pl@kamp.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 11:27 AM, Paolo Bonzini wrote:
> Meson's "static" argument to cc.find_library is a tri-state.  By default
> Meson *prefers* a shared library, which basically means using -l to
> look for it; instead, "static: false" *requires* a shared library.  Of
> course, "static: true" requires a static library, which is all good
> for --enable-static builds.
> 
> For --disable-static, "static: false" is rarely desirable; it does not
> match what the configure script used to do and the test is more complex
> (and harder to debug if it fails, which was reported by Peter Lieven
> for librbd).
> 
> Reported-by: Peter Lieven <pl@kamp.de>
> Tested-by: Peter Lieven <pl@kamp.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/build-system.rst |  2 +-
>  meson.build                 | 79 +++++++++++++++++++------------------
>  2 files changed, 42 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


