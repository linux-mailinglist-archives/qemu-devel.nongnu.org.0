Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729493E35E7
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 16:30:45 +0200 (CEST)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCNLY-0004VU-HW
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 10:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCNKV-0003on-Om
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 10:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCNKU-000894-By
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 10:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628346576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADIGwTo0mpiDuBU1ZzYMnFDskzUKQV9DowqDPSXreOg=;
 b=JKbjUnkxC2MCeRkvAkQAbuGEQNNeKqe5egt2Uk+QtUqdg151eEQ6+MZBFgbr/leFpbaNKF
 RY/kwJBZ+GRJI0ut6vv++2HzyL4NcSqxQwt//6GtNX+i06MST/YTNfafaLQRkVdP4tf57d
 J0fmym9H8Twu8cXvS5JFs2ofKIgJxIo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-5uUJox4AMmCPn5omC2um4Q-1; Sat, 07 Aug 2021 10:29:35 -0400
X-MC-Unique: 5uUJox4AMmCPn5omC2um4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 a18-20020a05600c2252b02902531dcdc68fso4876110wmm.6
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 07:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ADIGwTo0mpiDuBU1ZzYMnFDskzUKQV9DowqDPSXreOg=;
 b=MzF0p2/PiKcuOrwWu/Y0KabcZccjI4bHgCygekxk6wggNlyaEyV8sPLc3v8rLECtuU
 CApXVZ1H1GwzjnKo/lw1ftGEeZN42JvkXF0cTFPNiyEb5el11ta5MMmHJ1HEvmOT4lRj
 5ZrNwBAzW03NP3xvi281JcW888yY8wDbCYcpKWABty0w8rytGJwINSXeRj7XnkjthzJu
 d/o3ob0S9359rkpFIZxoPQksbRDymWDJEpzmTT6V9d/0qWcU4jH+S49e+EAp9kLbRhP9
 vGYpVBeFBPPyiH/z9b9PouWpTHFka5Js/dLIfse5rvs+4teilz3119mBsDoodrzrShwF
 0R0w==
X-Gm-Message-State: AOAM5300iBkkzHHdgPapTuvuqp+YDT1ddOEjWLsi+YQ9Ro13bnujSTPR
 P3mRUqD82IDgQG5xX5v/vM2oKTJkQH1BN0uZY+zZ38052Y+2LNvMnbngVI1aKjzEPJy1y3UVWJb
 qNfDt6B2ERwe34M4=
X-Received: by 2002:a05:6000:1149:: with SMTP id
 d9mr16476013wrx.26.1628346574328; 
 Sat, 07 Aug 2021 07:29:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPiY3f4bhKmZb7V2Ud/loCf86khyWWUR5sy2jbap+4b09DN/g9PgDffmaopGj3R9hCjGECdA==
X-Received: by 2002:a05:6000:1149:: with SMTP id
 d9mr16476001wrx.26.1628346574148; 
 Sat, 07 Aug 2021 07:29:34 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t23sm15864902wmi.32.2021.08.07.07.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 07:29:33 -0700 (PDT)
Subject: [PATCH-for-6.1? 0/3] ps2: Fix issue #501 and #502
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <df850743-8e86-dc7b-1006-d63b86b7ee36@redhat.com>
Date: Sat, 7 Aug 2021 16:29:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 2:10 PM, Volker Rümelin wrote:
> Since commit ff6e1624b3 (pckbd: don't update OBF flags if
> KBD_STAT_OBF is set) the OSes Minoca OS and Visopsys no longer
> have a working PS/2 keyboard and mouse. This is caused by a
> PS/2 queue stall due to a lost interrupt in the guest OS. This
> already happened before commit ff6e1624b3, but no one noticed
> because up to that point QEMU sent gratuitous keyboard and mouse
> interrupts and the queue restarted with keyboard input or mouse
> movement.
> 
> The lost interrupt is a guest bug. The fact that it's always
> lost is due to an inexact PS/2 keyboard emulation. The way in
> which the two operating systems e.g. set the keyboard LEDs,
> leaves a keyboard ACK reply in the keyboard queue that is
> unexpected for the guests.
> 
> This patch series improves the PS/2 keyboard emulation.
> 
> There's a workaround for issue #501 and #502 so I don't think
> this is rc3 material. But that decision is up to the maintainers.

Meanwhile, what about reverting ff6e1624b3 for 6.1?

> To verify patch 2/3 I plugged in an additional PS/2 keyboard
> into the host and started Linux with the command line option
> initcall_blacklist=i8042_init. Here is an example of the sequence
> to set the keyboard LEDs.
> 
> # #regular sequence to set the keyboard LEDs
> # inb --hex 0x64
> 1c
> # #PS/2 queue is empty
> # outb 0x60 0xed
> # inb --hex 0x64
> 15
> # inb --hex 0x60
> fa
> # inb --hex 0x64
> 14
> # outb 0x60 0x01
> # inb --hex 0x64
> 15
> # inb --hex 0x60
> fa
> # inb --hex 0x64
> 14
> 
> # #alternative sequence to set the keyboard LEDs
> # inb --hex 0x64
> 14
> # outb 0x60 0xed
> # outb 0x60 0x01
> # inb --hex 0x64
> 15
> # inb --hex 0x60
> fa
> # inb --hex 0x64
> 14
> 
> Volker Rümelin (3):
>   ps2: use the whole ps2 buffer but keep queue size
>   ps2: use a separate keyboard command reply queue
>   ps2: migration support for command reply queue
> 
>  hw/input/ps2.c | 214 ++++++++++++++++++++++++++++++-------------------
>  1 file changed, 133 insertions(+), 81 deletions(-)
> 


