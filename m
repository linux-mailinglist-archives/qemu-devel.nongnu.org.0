Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A231B7D4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:13:44 +0100 (CET)
Received: from localhost ([::1]:43636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbp2-0002UI-0c
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBbo0-0001wg-SL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:12:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBbny-0002KN-I4
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613387557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cb5BI2n3I5Q4I24ZAu77zOQhFrmv8JokvKKsdJi0ySI=;
 b=ABGySyJpn10+YSxYUauhG2ekbOz8NyvyjUCL5TyV3JZux2qzDdulHWfd/v+rncp4D7C2kW
 itiIeZPceQoFGlKJIjTX3UBa0TvSd176cNZmmAxNBsuUuyPERekxTTbviVENI4Io+TVV82
 SdYy9fIurhZ1XDHwHkswRfBLeHlrXfA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-6U3mK3BVOlqrWr3bjw1g0Q-1; Mon, 15 Feb 2021 06:12:34 -0500
X-MC-Unique: 6U3mK3BVOlqrWr3bjw1g0Q-1
Received: by mail-wm1-f70.google.com with SMTP id u15so6600590wmm.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cb5BI2n3I5Q4I24ZAu77zOQhFrmv8JokvKKsdJi0ySI=;
 b=ZIAnF4Wt6EWU5jDVN0wLRJK2KX1oERwjeeNyOx1OUq/m9qmtBdiqdG7Pf0UOgUw6le
 jitljresp/PFoZyd4I3ZfqhVFt78p5LR8IHPpheb2cRsaIJ9/JLc3NtT4AWcWfp5ZokH
 AHLM7+qLc+bWaZc/pU/Al/CGrxSKs8QVoTxQ/YtAlY3lG4qyDBVePA48MnSRqdR1QleO
 TtypaSqzK5p9u2vESTzlc8XWASeQWUBRLx7R9Ts/SzInc0wpb7jr03zJ9fve8Qjwe2uk
 96OC7JOYI7OnsLv24MD52TQMlMp8M/BLUD/b2Kq4o09eLCs59DAP+n0NViCtWM6dhYpR
 xRPA==
X-Gm-Message-State: AOAM533VCwPUEyuRVBldknwkHRlOMypbW2J5GRpC+r3NMWvd1v0UULNN
 Ri7wOW6nw/C2ju4EC53RUapNPkhPcmBWTTZyxEX99RgoXl2y1c4sfVgdrb/4/yXSHws71noBOZb
 i5i1K5j8RlRic4X4=
X-Received: by 2002:a1c:1bc7:: with SMTP id
 b190mr14111212wmb.115.1613387553535; 
 Mon, 15 Feb 2021 03:12:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDZBRpJLZ0pMgpUmMu/GWGzhI7JzPseZZCQVrfLUXFNRhkLg91ViffHnpimjPn+4FJMCvlRQ==
X-Received: by 2002:a1c:1bc7:: with SMTP id
 b190mr14111201wmb.115.1613387553382; 
 Mon, 15 Feb 2021 03:12:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q2sm16928383wrx.79.2021.02.15.03.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 03:12:33 -0800 (PST)
Subject: Re: [PATCH] spice-app: avoid crash when core spice module doesn't
 loaded
To: Bruce Rogers <brogers@suse.com>, qemu-devel@nongnu.org
References: <20210213032318.346093-1-brogers@suse.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <00f53bc8-1ddc-94ad-bb85-f0b7b70f1029@redhat.com>
Date: Mon, 15 Feb 2021 12:12:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210213032318.346093-1-brogers@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 4:23 AM, Bruce Rogers wrote:
> When qemu is built with modules, but a given module doesn't load
> qemu should handle that gracefully. When ui-spice-core.so isn't
> able to be loaded and qemu is invoked with -display spice-app or
> -spice, qemu will dereference a null pointer. With this change we
> check the pointer before dereferencing and error out in a normal
> way.
> 
> Signed-off-by: Bruce Rogers <brogers@suse.com>
> ---
>  ui/spice-app.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


