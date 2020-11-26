Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6BD2C5309
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:33:48 +0100 (CET)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFX1-0005SR-K5
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kiFPP-0006y3-PN
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kiFPN-0004n8-3X
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606389951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDA96HwWNz6w8GywEFyElRuAws78Bd1zu2RtCs/t0IE=;
 b=d7RrFmW8ZEU8FA245nQ88s/IWyWGPNLeI0YySaEOJZXCtzUX7ZdobeOZ2ZPJsgYhb4DLAf
 Qk21gN4UAZiChNJA2s52x26B9pDadRCzYwmuiJ4USjiXUio6O8aFVm7IKjkWDwca4O9dct
 EexXBOuw5RRKx202ZBeuS780Nh4BYdY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-GA0lg_DsNvSLCpuK4yVq1Q-1; Thu, 26 Nov 2020 06:25:50 -0500
X-MC-Unique: GA0lg_DsNvSLCpuK4yVq1Q-1
Received: by mail-wm1-f72.google.com with SMTP id g72so1206187wme.6
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DDA96HwWNz6w8GywEFyElRuAws78Bd1zu2RtCs/t0IE=;
 b=Q7bQDsY2DNOa7AUBpGcLG5sWMpjrkNvS2Ydx6GGY5xordYMkkpApqqG/9CAv4pR01Y
 NbSY1BTU3As2D8xDaI9TtAyYMyNvCgLidMpXNB4nGFYsZVaIpxslTakrs9AVQbvIUjYT
 y5VcVCF/s5g5CUq8J+N9q3RdcegopaR9JJl5x6riJALmeqBlkOTcjpcpiuEcCGOWS9Cp
 KnGgpRTSGVLGpQ1i9+3FuBajjoom+W0xe2iCu3N1h8J39//yKJ5W9O3XToKy/aoKGwSi
 oi6TYdhEJ5vh6zqDE5lymWKm7jyp9H83iUhtbF5pu7gEPaemA/RG7yv/GxMn1HHkVLBh
 j3AA==
X-Gm-Message-State: AOAM530j+g/vSuqHl2ajC4Bg9KZaRNxF3UHGXrZiwqrL5nj+/xbnZiFn
 KOSd5w5abJwx+Kg5fVKkc2YWeqDOqMAlf02G9mZfL3aOzk/X6+udmjeiA5fW+FCbMoD0XJbI1oM
 EsABGGLK24GISd5M=
X-Received: by 2002:a1c:3b07:: with SMTP id i7mr2864713wma.118.1606389949133; 
 Thu, 26 Nov 2020 03:25:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCwc6d/Heo6iMS1BalRS6spuGN2O+galKB30vDj4L/XQjqQTSdwUyNK/o8w9vl+LWZ4322kw==
X-Received: by 2002:a1c:3b07:: with SMTP id i7mr2864399wma.118.1606389945632; 
 Thu, 26 Nov 2020 03:25:45 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b73sm8003661wmb.0.2020.11.26.03.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 03:25:44 -0800 (PST)
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, "Emilio G . Cota" <cota@braap.org>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1f747e73-87d1-37a6-123c-76033e538b5f@redhat.com>
Date: Thu, 26 Nov 2020 12:25:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124162210.8796-10-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 5:22 PM, Claudio Fontana wrote:
> apply this to the registration of the cpus accel interfaces,
> 
> but this will be also in preparation for later use of this
> new module init step to also register per-accel x86 cpu type
> interfaces.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/kvm/kvm-all.c         | 11 +++++++++--
>  accel/qtest/qtest.c         | 10 +++++++++-
>  accel/tcg/tcg-all.c         |  8 --------
>  accel/tcg/tcg-cpus.c        | 15 +++++++++++++++
>  accel/xen/xen-all.c         | 12 +++++++++---
>  include/qemu/module.h       |  2 ++
>  roms/qboot                  |  2 +-
>  softmmu/vl.c                |  6 ++++++
>  target/i386/hax/hax-all.c   | 12 +++++++++---
>  target/i386/hvf/hvf.c       | 10 +++++++++-
>  target/i386/whpx/whpx-all.c | 11 +++++++++--
>  11 files changed, 78 insertions(+), 21 deletions(-)
...
> diff --git a/roms/qboot b/roms/qboot
> index a5300c4949..cb1c49e0cf 160000
> --- a/roms/qboot
> +++ b/roms/qboot
> @@ -1 +1 @@
> -Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948
> +Subproject commit cb1c49e0cfac99b9961d136ac0194da62c28cf64

Hmmm unrelated change I presume.


