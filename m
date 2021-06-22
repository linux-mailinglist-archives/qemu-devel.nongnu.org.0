Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A83B000E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:18:09 +0200 (CEST)
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcXo-0007v8-D2
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvcVo-0006Sb-38
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:16:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvcVm-0007sS-9E
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:16:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so617083wms.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v3w8XVTMLdk3V2xmJ2d9ipUQdVCeSq1Q0Wv4qlIx6TU=;
 b=s2qOIKu/zMt00ZcsWw+51HKK/H7Am12hK9u718vQbTpmuQpwkOPSXzGDOpnE5hoWPo
 kkghkub40iDxKKQuitw7E5OX272uAaB+UGla+UvkMCl1zC5Hw6bWDzJxM+InQYunrRaC
 Pc3wJOJiktXTVdAQGsk5jLsDDV4m5UbmsshKGRbAYotUjhebZDa7iN3clDS8ht0+8lee
 THb7K54zPUhn6p8I6rbK/3u6IXNwOPXMljVfCwh9llxGRbyKmxFx+CMuhXpDnrCWa62c
 D+4XypJA6WRJ84SwQtwEoQEXzmkPVXs9WRQ25D5b2CBtC6EMRwzBqHnMRLjI469r9Hlz
 iMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v3w8XVTMLdk3V2xmJ2d9ipUQdVCeSq1Q0Wv4qlIx6TU=;
 b=hur+A85aY50gaWLqs4q7tMGB7mCoD7MUi50g/1zQz3GYj/p14kEPG3F5yKqqYCyeJh
 yUJVtw11S4PsKnT+qKpU9ALeA9f4QHpRIUieZvXkospmUnsKPUiwL4pp4kt5h3+ADKS/
 yCoCPu23caIDo91f5gVYBtwZRN4sO8Py+cD6mfxj4Smrngm1Yf3njSMK0mpi0bMaq9kq
 9VfsQHFy/9tf5CtojfjxlT1v/ocCQ9vhPFMo2mw7+6Yl90BhptZKizntGVXbiLwkWJbD
 CICxvUsgQ+NOkQSM4wHejgXleFJRlYPQmjId45u1JYKziaSO0lwUChyNdfzQda7gdLvG
 g1bg==
X-Gm-Message-State: AOAM531NIJXPnmcAcuuAO8MEecDsKiJWNy//u607pWYRr2MHKSC4Nkp8
 LNzv24iwCtVL9o0Vx1y1jU8=
X-Google-Smtp-Source: ABdhPJy7JP+UYC/uENvCnvG7e4Y6OmEFIIr9t5PikI+3ZstRjNPl16WR8ylq+IISpcrflLpbIAyaTQ==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr3374793wmb.80.1624353359885; 
 Tue, 22 Jun 2021 02:15:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s21sm1985084wmh.9.2021.06.22.02.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:15:59 -0700 (PDT)
Subject: Re: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
To: Qiang Liu <cyruscyliu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210616104349.2398060-1-f4bug@amsat.org>
 <20210617095614.jh5vkrzc65d5xrui@sirius.home.kraxel.org>
 <CAAKa2jk6gfWbMsfB3uZ4HqgS5Z_BqxhUN-dYK51OC2NwYad49Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a9bf226f-5a42-8cc7-3f45-33b5aea046d3@amsat.org>
Date: Tue, 22 Jun 2021 11:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAKa2jk6gfWbMsfB3uZ4HqgS5Z_BqxhUN-dYK51OC2NwYad49Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 10:54 AM, Qiang Liu wrote:
> Hi folks,
> 
> With this patch, having tested more, I find another way to trigger the
> assertion.
> I found it just now such that I did a quick investigation and reported
> it to you. I
> hope this would prevent merging this patch.

No need to prevent merging this patch as it already fixes problems.

> Brief analysis:
> This existing patch limits s->freq in dma_cmd8 before continue_dma8 followed
> by AUD_open_out. It's good to prevent the flow by this path. However, we can
> directly call continue_dma8 via command 0xd4 but there is no limit check there.
> 
> To trigger this assertion, we can manipulate s->freq in the following way.
> 1. dsp_write, offset=0xc, val=0x41
> Because s->needed_bytes = 0, command() is called.
> ```
> case 0x41:
>     s->freq = -1;
>     s->time_const = -1;
>     s->needed_bytes = 2; // look at here
> ...
> s->cmd = cmd; // 0x41, and here
> ```
> 
> 2. dsp_write, offset=0xc, val=0x14
> Because s->needed_bytes = 2, complete() is called.
> ```
> s->in2_data[s->in_index++] = 0x14; // remembere this
> s->needed_bytes = 0
> ```
> Because s->cmd = 0x41, s->freq will be reset.
> ```
> case 0x41:
> case 0x42:
>     s->freq = dsp_get_hilo (s);
>                     // return s->in2_data[--s->in_index]
>                     // s->freq will be 0x14, there is no check ...
> ```
> 
> 3. dsp_write, offset=0xc, val=0xd4
> Call continue_dma8 directly then we can trigger this assertion because
> s->freq is too small.
> 
> Maybe we can fix this flaw by adding s->freq check after s->freq =
> dsp_get_hilo (s) in the second step?

Do you mind sending a new patch with reproducer and your fix?

> Best,
> Qiang

