Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7069C60A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:32:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0e1-0001bP-T9; Mon, 20 Feb 2023 02:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU0dt-0001aN-VK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:31:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU0dr-0002N8-Kt
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:31:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id p8so203878wrt.12
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 23:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CuXcOz8vk+vQ8FxXnYLWND/TQOzqLO/fL8qBtq+noh8=;
 b=oqcHgagyn7FaiCd6BiK5a1Hz43dB/cqezYEXAyWFcKaT+IzujGW1QDJ5+OHA/0Vbx9
 1sSVa2AEQBlH/hnEgcEbM2ENZiEPqZkpSjMXKCg5XfHnjVhJbDPNzZ+IZrGl0S35Bw42
 t4JTeh+SHvH8zgtwxU0Q7B5QFDtbWjRkP2QWMrDh2yiIs4Gpa7cAkTxjsGRM4QyYJOf/
 BtP9rPHHNdAyX0yylEmzF9N4vtRBqS8P0Rb5v5Sl0L4lIPOV+3ANjzlN8L85Ypb87qSs
 d/GCfC0EGVpanCjryF94eO1ClKWBcphKO6FDb9xhwcvlBbOkjtFH8hAMnXF2c+A8HJzS
 jYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CuXcOz8vk+vQ8FxXnYLWND/TQOzqLO/fL8qBtq+noh8=;
 b=zDuu+SN0DD7rrMgc3PJUp0Bqz19NF1FwZB3fv6gByM2G4GRWVKP0+2dL6eKr7mCEca
 zqsbZfpAvvHH9PGmk0E+YVUPK2iGNDhpYRP0xcPS1Z3tcWWlOxg6YeO3WWJHs1GpFUk1
 TRNmkdSUIumobOX/J93fIOYGgcyQOLxI/SD+Xy939Llzdr/JhDiEarCI3uwPRLMVwv/U
 t3WRTYYwFvGaeWwfH7pAHo9pawPa1Dqff0YEwLQEPRgQg2tL+SibqsqfX1XQLmC7cliO
 BO72M1cvLGObV8xktUgXKI3sA/CY3pTsdia0HnCS3rE2qggzS3EyeX4E9FetrXCfzIhz
 THYA==
X-Gm-Message-State: AO0yUKUZiXkatTlUg3nBicm9R7qBMisw2eYQI4KmDTFufADpLi2zYKs5
 5WuJ5mSn4gVk9ziTxl+tVT3/pQ==
X-Google-Smtp-Source: AK7set8+t8Zu+sRJTTLit1LJ0CF9Ugb228qPB5unuhWaHaY/DuXM5rAzR0mSgLBw2+CwldrloX9crQ==
X-Received: by 2002:a5d:6f1a:0:b0:2c5:55c3:d18d with SMTP id
 ay26-20020a5d6f1a000000b002c555c3d18dmr1117530wrb.9.1676878277801; 
 Sun, 19 Feb 2023 23:31:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v20-20020a5d5914000000b002c552c6c8c2sm1834874wrd.87.2023.02.19.23.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 23:31:17 -0800 (PST)
Message-ID: <316e2dfa-1551-6277-1a61-fe0f4d9c231f@linaro.org>
Date: Mon, 20 Feb 2023 08:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] ui: fix crash on serial reset, during init
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <20230220072251.3385878-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220072251.3385878-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/2/23 08:22, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> For ex, when resetting the xlnx-zcu102 machine:
> 
> (lldb) bt
> * thread #1, queue = 'com.apple.main-thread', stop reason =
> EXC_BAD_ACCESS (code=1, address=0x50)
>     * frame #0: 0x10020a740 gd_vc_send_chars(vc=0x000000000) at
> gtk.c:1759:41 [opt]
>       frame #1: 0x100636264 qemu_chr_fe_accept_input(be=<unavailable>) at
> char-fe.c:159:9 [opt]
>       frame #2: 0x1000608e0 cadence_uart_reset_hold [inlined]
> uart_rx_reset(s=0x10810a960) at cadence_uart.c:158:5 [opt]
>       frame #3: 0x1000608d4 cadence_uart_reset_hold(obj=0x10810a960) at
> cadence_uart.c:530:5 [opt]
>       frame #4: 0x100580ab4 resettable_phase_hold(obj=0x10810a960,
> opaque=0x000000000, type=<unavailable>) at resettable.c:0 [opt]
>       frame #5: 0x10057d1b0 bus_reset_child_foreach(obj=<unavailable>,
> cb=(resettable_phase_hold at resettable.c:162), opaque=0x000000000,
> type=RESET_TYPE_COLD) at bus.c:97:13 [opt]
>       frame #6: 0x1005809f8 resettable_phase_hold [inlined]
> resettable_child_foreach(rc=0x000060000332d2c0, obj=0x0000600002c1c180,
> cb=<unavailable>, opaque=0x000000000, type=RESET_TYPE_COLD) at
> resettable.c:96:9 [opt]
>       frame #7: 0x1005809d8 resettable_phase_hold(obj=0x0000600002c1c180,
> opaque=0x000000000, type=RESET_TYPE_COLD) at resettable.c:173:5 [opt]
>       frame #8: 0x1005803a0
> resettable_assert_reset(obj=0x0000600002c1c180, type=<unavailable>) at
> resettable.c:60:5 [opt]
>       frame #9: 0x10058027c resettable_reset(obj=0x0000600002c1c180,
> type=RESET_TYPE_COLD) at resettable.c:45:5 [opt]
> 
> While the chardev is created early, the VirtualConsole is associated
> after, during qemu_init_displays().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   ui/gtk.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



