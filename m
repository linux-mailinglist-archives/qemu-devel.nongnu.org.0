Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE9D2C0BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:57:24 +0100 (CET)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCLL-0006qg-Pl
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1khCJJ-0005Gg-Ka
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:55:17 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1khCJI-0000dX-8r
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:55:17 -0500
Received: by mail-ej1-x62d.google.com with SMTP id gj5so23404798ejb.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 05:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kp3mZYGzU8kxpRriMYseW1BNlGdRfXHHWB0eM4+zjMU=;
 b=kUZ5Oww0xDHi36ufVAyddx6Im4xptkJyzmpdNReGBG325Bggy+mVdU8LHPvI4MWTSW
 KAbHHHkRoUDYpWoywjvEXLbkqpHYH9fZdGz+1ykR67fmkkxMy5KRFM3R4v2ltT2qDba6
 nlEO9MSf3MtKqpwbka6VG5tTnr8ymZ7Un625bXsXu/0PdT99ldrVnzbQI8i5M6zUdFRu
 W06OrI9/5uvfzV5ASAPHWKj+9hYPRDmsFlXaD3UnTtpABAE3r4bqxUX+oeGTOE0tWkdT
 7oK1d+IGto1aDlU6TB++oFfzj4BXKdRLc0IXBoXogDqz8hE6RnBWIOiJ0W3eKEmZrNMJ
 Tedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kp3mZYGzU8kxpRriMYseW1BNlGdRfXHHWB0eM4+zjMU=;
 b=JIIhnjN1aNOThjlcgY4FpX6CsexbiW/62tIRQR4V1R3uaVm497F/LFT6YPrJcXYcfi
 YM9p9JrK4IQ+w0tvcF9djJXDrW91Kg7v0JEp0lv11c7VN7B+BdRSYuznR5dNHcpgP0Ue
 FPpN29MPGB1rOZZ2hcUEbUR33Km0Fgg7a8YX6qDPzmYQ8I3iV3E3xpDZg1h8yqgyca0Z
 TrhU403x2TqXEzTGq53RDPDe/qJuDUDtqqm7MRfjH4qhTXWhHlyWPoOTdkZ7IUvous2T
 H3dN7uDw1lUhGEgur7HF79whYnHFHKcrFz+DpRbg1OAY4VvHmYsLyPFX20c9vjFXjVc8
 2YNw==
X-Gm-Message-State: AOAM532YkyemlLoCwgSY84ITTaWGFN7nvYyf6/IDGrqb9BWi1L0YnLxE
 tayY+PPAs6pm/VrNYyI2Oy+ZrerSRpc=
X-Google-Smtp-Source: ABdhPJxupvJXtfJwv3NMJYT6Wh21p4TtTzZy1HlbkatT5e8jV2hD9N6ZN0ajd1a+hmh6isUlP4mhoA==
X-Received: by 2002:a17:906:c312:: with SMTP id
 s18mr44005274ejz.185.1606139713171; 
 Mon, 23 Nov 2020 05:55:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id x23sm5008997ejs.16.2020.11.23.05.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 05:55:12 -0800 (PST)
Subject: Re: Regressions in build process introduced since August
To: Stefan Weil <sw@weilnetz.de>, Stefano Garzarella <sgarzare@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
 <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <53da03f4-f044-fb1d-9a1a-a793077cccc3@redhat.com>
Date: Mon, 23 Nov 2020 14:55:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/11/20 12:09, Stefan Weil wrote:
> --- a/meson.build
> +++ b/meson.build
> @@ -649,9 +649,8 @@ if get_option('vnc').enabled()
>     vnc = declare_dependency() # dummy dependency
>     png = dependency('libpng', required: get_option('vnc_png'),
>                      method: 'pkg-config', static: enable_static)
> -  jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
> -                         required: get_option('vnc_jpeg'),
> -                         static: enable_static)

Does it work if you just remove "static: enable_static"?  That asks 
Meson to look explicitly for a ".a" file instead of just adding a 
"-ljpeg" flag.  However it is not what configure used to do so it 
shouldn't be necessary.

Paolo

