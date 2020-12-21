Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A460C2DF8D3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 06:29:56 +0100 (CET)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krDlb-0007Gk-7j
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 00:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krDjs-0006Gt-GW
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 00:28:08 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:32975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krDjq-0005SO-Of
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 00:28:08 -0500
Received: by mail-ot1-x32f.google.com with SMTP id b24so7901598otj.0
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 21:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:from:subject:autocrypt:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=atDErk2sraOmTAF/iqbsAIlbJfZh4hL9lX8ApLYeDEA=;
 b=Gd9dpJP12IQxacv3ouu47Zu4B08/2UwyFmlJ9x0hPNIWBw+3EHV+e6rGSylLGu4DAc
 +80qnVH2Tfc1ax8NMJiDzPheZ124pjnAFwEiPhwcS8lPFWFtPJMDY3j+obQQXqjtvl5f
 gQjqFz4trZ9RWHHOuTOgCVtNYQe0eJr6Njlss5Dtx5sYQtPe7amLabT5XYd9YY79HQA7
 OF6W8jRdOYktXhgmqRSUzD31o1zIEzjCzhFkrwgFwPegU/a/iAwj4OtSuSFN5qw8VoOL
 MaNMbfmGmoR9+WyIcqbocGp2MJp9QkJ0hIBoVLxA545n703RniDiitYKhJvhoh2bGzjL
 CewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:from:subject:autocrypt:cc:message-id
 :date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=atDErk2sraOmTAF/iqbsAIlbJfZh4hL9lX8ApLYeDEA=;
 b=pDRRaIYNvGfbhjMaAF5WEawD05dKgSqzvbIGyhUkCEHfS34MYLpu0AjFW+QGf+1gJS
 sGKCjnnt3Ao/zvVXCfOCMZ5c6Af55NjEoqv991AAq7EpTw7m8x5s0h+BuhTVv4mh9SHZ
 vhRfSXK0yoPU+u39ICM/BGYXFPerOT715CaPXlMuR+2GSXGpdxktCqtDkjXx+yKo2Vkt
 WsShICZhbR3SvXbuvjAkYZNUxAbOxqgd4iroH28GYLw/T6CSkkL7d9fJMH73J+u8g0qV
 dvBA3X3EtYSQ2QtwAhJy4b5RBZhcg2RM3SgmL3B9AfuthNMJkUCnQzlQumY5wswyp/GO
 L2TQ==
X-Gm-Message-State: AOAM5313NDTSPk5DeHhqikJwkZsB6j9Fx3BacJtNDTzu5ut12wl4Ml4T
 D3fwaydQugR5lYVkK9dN5ws=
X-Google-Smtp-Source: ABdhPJzQ/vfumJ63fRCBsUhp5DTA8Q6aURy1bvuQkRfJ8DNkzE7k7eGeEtRYKROLrVLHlfyjF5mvvQ==
X-Received: by 2002:a9d:69c1:: with SMTP id v1mr11392014oto.128.1608528485497; 
 Sun, 20 Dec 2020 21:28:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 5sm3594989ota.62.2020.12.20.21.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 21:28:05 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: pxa crashes with qemu v5.2 when executing xscale operations
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <aa0a0bcc-bd00-37dd-1012-cd71d32f1f9b@roeck-us.net>
Date: Sun, 20 Dec 2020 21:28:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I noticed that booting Linux on PXA emulations no longer works with qemu v5.2.
When trying to boot akita, borzoi, or similar emulations, I get the following crash.

[    0.965279] Internal error: Oops - undefined instruction: 0 [#1] PREEMPT ARM
[    0.967273] Modules linked in:
[    0.967875] CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.2-rc1-00017-gc96cfd687a3f #1
[    0.968101] Hardware name: SHARP Akita
[    0.968676] PC is at xscale_cp0_init+0x84/0x114
[    0.968815] LR is at do_one_initcall+0x60/0x290
[    0.968997] pc : [<c08ce068>]    lr : [<c000a2dc>]    psr: 60000013
[    0.969186] sp : c0bdfec8  ip : c0bdfee0  fp : c0bdfedc
[    0.969332] r10: c08fe834  r9 : c09f2000  r8 : c08c6a9c
[    0.969498] r7 : c09e0c00  r6 : 00000000  r5 : 00002041  r4 : 00002040
[    0.969679] r3 : 00000100  r2 : 00000000  r1 : 69052000  r0 : 00000000
[    0.969892] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    0.970123] Control: 00007977  Table: a22e0000  DAC: 00000071
[    0.970349] Process swapper (pid: 1, stack limit = 0x(ptrval))
[    0.970564] Stack: (0xc0bdfec8 to 0xc0be0000)
[    0.970818] fec0:                   c08cdfe4 ffffe000 c0bdff4c c0bdfee0 c000a2dc c08cdff0
[    0.971144] fee0: c004b8a0 c08c9458 c0bdfee4 00000000 00000dc0 00000000 00000007 00000007
[    0.971438] ff00: 00000000 c07fc180 c08c944c c08c6a9c c017213c c0c07c4c c0c07c54 c092d028
[    0.971728] ff20: 00000000 000000a0 c0c07c20 c092d028 c09293fc c0c07c20 00000008 c08fe854
[    0.972026] ff40: c0bdff94 c0bdff50 c08ca220 c000a288 00000007 00000007 00000000 c08c944c
[    0.972315] ff60: ffffe000 000000a0 c0bdff8c 00000000 c0671de8 00000000 00000000 00000000
[    0.972603] ff80: 00000000 00000000 c0bdffac c0bdff98 c0671e00 c08ca0d8 00000000 c0671de8
[    0.972891] ffa0: 00000000 c0bdffb0 c0008360 c0671df4 00000000 00000000 00000000 00000000
[    0.973199] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.973488] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    0.973763] Backtrace:
[    0.974001] [<c08cdfe4>] (xscale_cp0_init) from [<c000a2dc>] (do_one_initcall+0x60/0x290)
[    0.974282]  r5:ffffe000 r4:c08cdfe4
[    0.974564] [<c000a27c>] (do_one_initcall) from [<c08ca220>] (kernel_init_freeable+0x154/0x1dc)
[    0.974791]  r7:c08fe854 r6:00000008 r5:c0c07c20 r4:c09293fc
[    0.974948] [<c08ca0cc>] (kernel_init_freeable) from [<c0671e00>] (kernel_init+0x18/0x110)
[    0.975191]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0671de8
[    0.975394]  r4:00000000
[    0.975476] [<c0671de8>] (kernel_init) from [<c0008360>] (ret_from_fork+0x14/0x34)
[    0.975695] Exception stack(0xc0bdffb0 to 0xc0bdfff8)
[    0.975885] ffa0:                                     00000000 00000000 00000000 00000000
[    0.976184] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.976458] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.976657]  r5:c0671de8 r4:00000000
[    0.976961] Code: e1a03003 e24ff004 e3a02000 e3a03c01 (ec432000)

The code is:

  70:	ee1f3f11 	mrc	15, 0, r3, cr15, cr1, {0}
  74:	e1a03003 	mov	r3, r3
  78:	e24ff004 	sub	pc, pc, #4
  7c:	e3a02000 	mov	r2, #0
  80:	e3a03c01 	mov	r3, #256	; 0x100
  84:	ec432000 	mar	acc0, r2, r3
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is supposed to be a DSP or iWMMXt coprocessor instruction.
I did notice that the code to support xscale instructions has changed significantly
in qemu v5.2.
Does this mean that there is a bug, that the affected emulations are no longer
supported, that I now have to specify some new option on the qemu command line,
or something else ?

Thanks,
Guenter

