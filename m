Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9823344975F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:03:52 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6Bb-00062n-9d
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:03:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk66r-0001t7-FS
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:58:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk66n-0008J4-Tx
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:58:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636383532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cc+q1aaRzix1yB+knCn/R+fDT9a98f8gG3KqnePQ/MI=;
 b=HvcEzJsYMqCwDRF1zYxTrkkXjFRx+9C4mIu9dNBtl7y5txVFLehbYBb18djF6eB28YzNJX
 qyaavrcgwvJd7Ecd1XauPhYJ2rhF05qWRz7EVtPHs1MFb1LX6wpsw23knm9+Lg2CG5Qr/t
 EaDySf7lvjeVdm2mirHGjqSuznlr+YU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-UrrdUcotMEW2PHmBz0w9mw-1; Mon, 08 Nov 2021 09:58:51 -0500
X-MC-Unique: UrrdUcotMEW2PHmBz0w9mw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so6302646wmj.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cc+q1aaRzix1yB+knCn/R+fDT9a98f8gG3KqnePQ/MI=;
 b=Bf10ZJvCuS/+zEIS0UNGhZndtHSUbfX2ikv/7KzTXd9OKjCGzgCAQLHrB62jbMneDQ
 wiMWt146UgE/mHov5w4YX70vBBME9JkHwztH04uL48MTV8Sz8bt5VmT2b+C7z3YU79hu
 lCyo35MOgqyyXKCmt6HkBIyUwptzBm8Q32AMppHsXx5PIRGr+khlHHu1gLCyyVcPIANa
 3lSHcM7o+FT9CZAGSMDbj5+5bsQKiibEt1mmg1gPMPBq8Y6gL8upMnBykZQV1osfDu88
 A6ejX57RPUcKAN8rLWKTzgk08anMTjARqz10lcFEfTb0M4KCjaiZPu2T0jHpAMd8TSwo
 xzQA==
X-Gm-Message-State: AOAM531902mKWCJCzqJOPb8caov6qEvqztUY05ycDl4YIpe7WL04fE6U
 nukgXpsGHhCnjcLKvD8i359V8/Ajdj/eGRjJnRL222Ckqd7FqAYmXxzkN5Pfzww4EdCSxe/wJhp
 B2/4IuZ/KTa2cymU=
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr27705808wmq.70.1636383529776; 
 Mon, 08 Nov 2021 06:58:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMaK1fwEAGQ31l8/Mq8wI9vr4LWmx8t7treE8DKW6mdjxdU8oTeI6dZHOPXBbffij+z6ITqw==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr27705778wmq.70.1636383529519; 
 Mon, 08 Nov 2021 06:58:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 9sm21988502wry.0.2021.11.08.06.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 06:58:48 -0800 (PST)
Message-ID: <53345e90-747e-85f9-cfb4-f5e90da526f7@redhat.com>
Date: Mon, 8 Nov 2021 15:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] audio: Add sndio backend
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/7/21 06:19, Brad Smith wrote:
>   if not get_option('spice_protocol').auto() or have_system
> @@ -1301,6 +1306,7 @@ if have_system
>       'oss': oss.found(),
>       'pa': pulse.found(),
>       'sdl': sdl.found(),
> +    'sndio': sndio.found(),
>     }
>     foreach k, v: audio_drivers_available
>       config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), v)

Maybe you want to add sndio to the audio_drivers_priority array if 
targetos == 'openbsd'?

Paolo


