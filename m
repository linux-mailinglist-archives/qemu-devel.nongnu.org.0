Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35D3086CE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:08:50 +0100 (CET)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Opl-0003D5-VI
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Ong-0002gK-57
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5One-0007Re-HP
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611907596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJPc0Y58N5XewgwqS4McLo+CrWr5cFtTjGibl1WQR/c=;
 b=QWiNfna1vcQFlBObFqTsjy/xkQPknE9VkQOrSMig2yvZgw1Qbw572DexLBtz4HzMsnnb46
 BwwpSB35m+DxxDF73KqcGfHHuxpfuFaQQJVWcjq5xFNSuJ54NYn3i2ihfF2VovwkU1ro+O
 FHxxyKok7q6NA/jwz053UKhOFAvtRkE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-Sxv5SaixNoqbzdnlHPCTAg-1; Fri, 29 Jan 2021 03:06:32 -0500
X-MC-Unique: Sxv5SaixNoqbzdnlHPCTAg-1
Received: by mail-wr1-f72.google.com with SMTP id e15so4592854wrm.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 00:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VJPc0Y58N5XewgwqS4McLo+CrWr5cFtTjGibl1WQR/c=;
 b=qoDQuzL3ABasrHd00iSLGQpeViC75UupaBV19C0xt5uWDQihk6b/7Qi3fZjhQs/JL9
 lCEZd9B4pcra8NzO1bjhRjyKgI9uwIVHl8jydTu1MvyHvSOBslpCL+Qx6Jtbv9pdpXPz
 nlwHZ8vPyo86ZpRjTREJyJunZ9PqCBKPFLzJhAf+qXV4v3xAqzQNsdNeIVujteh6rsI6
 6LJ4eUE/8yFJc5idApyhDJ03xb7dQfID2KGMu65PJs2twt6OGdlDh6yLlqOPJriUkEKR
 5NccJwf3KlUO05KNbKM5cK8F6DzF14julbmAZTnCkKZjvpywwb7Avnj/n6wx96xrZSKQ
 B4Dw==
X-Gm-Message-State: AOAM533W0znHDNq9eLsJyIHa+AY4u1dk1xEsKzLOaPGo29GWcf7aJy1u
 zaK5ZnWohz0IY+aIikFZsAmEfTPRA6Zr84TU2NagyfjRqD7iHibTJFehoE+2GiFjWbXKVVJnb+I
 sjBF35OPYUvnS8KY=
X-Received: by 2002:a1c:e2d7:: with SMTP id z206mr2659944wmg.168.1611907591486; 
 Fri, 29 Jan 2021 00:06:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy5rixk2dxxtYtAg37jGdoEejz0nhc/g7Xl1167zs8mj00LfVm4xAynJ3M9ZAEEGF1MoPd9g==
X-Received: by 2002:a1c:e2d7:: with SMTP id z206mr2659924wmg.168.1611907591321; 
 Fri, 29 Jan 2021 00:06:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y24sm8611309wmi.47.2021.01.29.00.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 00:06:30 -0800 (PST)
Subject: Re: [PATCH v4 0/4] meson: Try to clarify TCG / TCI options for new
 users
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210125144530.2837481-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <42b1f7b7-ee7e-060c-483e-fd7f6c4a7323@redhat.com>
Date: Fri, 29 Jan 2021 09:06:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125144530.2837481-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 15:45, Philippe Mathieu-Daudé wrote:
> Since v3:
> - Rebased
> - Include fix for 23a77b2d18b ("build-system: clean up TCG/TCI configury")
> - Use get_option() (Claudio)
> - Use warning message suggested by Daniel
> - Drop 'Reword --enable-tcg-interpreter as --disable-native-tcg' (Paolo)
> 
> Some new users get confused between 'TCG' and 'TCI' and enable
> TCI when TCG is better for they needs. Try to clarify it is
> better to not use TCI when native backend is available.
> 
> Note, before Meson, warnings were summarized at the end of
> ./configure. Now they are displayed earlier, and likely
> missed IMHO. No clue how to improve that :/
> 
> Philippe Mathieu-Daudé (3):
>    configure: Improve TCI feature description
>    meson: Explicit TCG backend used
>    meson: Warn when TCI is selected but TCG backend is available
> 
> Richard Henderson (1):
>    configure: Fix --enable-tcg-interpreter
> 
>   configure   |  7 ++++---
>   meson.build | 15 +++++++++++++--
>   2 files changed, 17 insertions(+), 5 deletions(-)
> 

Queued, thanks.  In pattch 2 I made the corresponding changes at 
meson_options.txt too.

Paolo


