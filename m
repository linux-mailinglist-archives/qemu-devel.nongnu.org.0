Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446333F8EE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:15:56 +0100 (CET)
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbe7-0000wa-Fu
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMbQF-0003RN-2T
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:01:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMbQ9-0003zq-GB
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616007687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahOn/l85M3c3KP/ofNHl3zjbmCuvYamSt+TAuHTi4T4=;
 b=QtZM/T2qS9nPViuzjIVZl+ceDeZLzKK7Ll17mrmO1OrPJKoMxIA8AssKhQ9am4DRMi0Ppu
 mHbW9WYeFecz+VlzRMNWbz0T2o8vuYZ40mBJ41hUk3046ltQ9aUP52tZ7aB9hL6B7sacDa
 KYJweQNmoyDGke636glMWN7wJgfuSMA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-vx00XzdHOCGQz8egNGrK9w-1; Wed, 17 Mar 2021 15:01:26 -0400
X-MC-Unique: vx00XzdHOCGQz8egNGrK9w-1
Received: by mail-wr1-f72.google.com with SMTP id p15so18645564wre.13
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 12:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ahOn/l85M3c3KP/ofNHl3zjbmCuvYamSt+TAuHTi4T4=;
 b=jy9SQjTANrLKs0X9Rxu3yQ86f4lA+0AH5H0Njw5Bb+hFlAXXBC5ellgQbN0OfkLbBR
 Ch0nj/hdmwBktK1dqSn0ESpNJWFfskyvB6rZU7K9n6G0MQV/6zuaTxMhlzOXKIf2Y0yY
 Ev9E7Q2cN+0qqKO+0YRANoyVvotB716kGQxBR7fhcEaaSntr1a+aS6wnLLdjFgJBNTTk
 8SONhXB5eAIWNs4bSR+nkDzpZVLMQH9QLP5vd5rBzmh8kxEBZaJppOtE1lx7+so7/5gw
 kJWlJNt53sXN+FSh44abshNmplGjegBaZ9yVWwmjt5fvOT0Z7oUrDtIOgpb6OP1VGaTh
 bBDw==
X-Gm-Message-State: AOAM531YU5Lek9ewMhw/MDMa5Ss95X80t04uav2PEGqt3plB68bjxez1
 oyCLMxNA+2CjMp1rJXUaqD282IJd7eiXMFAyOV4vfsdUPtHDOrbAL3cS5FM7GfU3VpWSbTFqs4n
 +AFW37poVk7JdTBs=
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr6013681wrf.4.1616007685027;
 Wed, 17 Mar 2021 12:01:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv7h9x5kYqofYxS+IDRQ3w2XHbSOvXe86031sk9OyGDwUVW98wfyoK/FKp8xlxOz+pFs6h2Q==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr6013663wrf.4.1616007684821;
 Wed, 17 Mar 2021 12:01:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v18sm28303113wrf.41.2021.03.17.12.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 12:01:24 -0700 (PDT)
Subject: Re: [RFC v9 29/50] target/arm: cleanup cpu includes
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210317183013.25772-1-cfontana@suse.de>
 <20210317183013.25772-30-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3bcc1889-8479-7c00-b799-829938702515@redhat.com>
Date: Wed, 17 Mar 2021 20:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317183013.25772-30-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 7:29 PM, Claudio Fontana wrote:
> cpu.c,
> cpu32.c,
> cpu64.c,
> tcg/sysemu/tcg-cpu.c,
> 
> all need a good cleanup when it comes to included header files.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu.c                |  8 ++------
>  target/arm/cpu32.c              | 14 --------------
>  target/arm/cpu64.c              |  6 ------
>  target/arm/tcg/sysemu/tcg-cpu.c | 22 +---------------------
>  roms/SLOF                       |  2 +-
>  5 files changed, 4 insertions(+), 48 deletions(-)

> diff --git a/roms/SLOF b/roms/SLOF
> index 33a7322de1..e18ddad851 160000
> --- a/roms/SLOF
> +++ b/roms/SLOF
> @@ -1 +1 @@
> -Subproject commit 33a7322de13e9dca4b38851a345a58d37e7a441d
> +Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c

Besides this dubious change, the rest LGTM :)


