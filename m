Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71003B2B74
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:31:41 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLi0-0002xX-QO
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLgQ-0002CD-Hk
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:30:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLgO-0007At-Lm
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:30:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id j10so3496543wms.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T8RtcTJNc4sjjXaIpRxQKtjX+D54Jg70BD5BrR/ge7Q=;
 b=dLkaPRisEuBE2AQxuvPpZV6C+t3fWbO1rxLTKGUIKomS76xtYvCPmSVy4rv7hm5kjd
 T1baRA/8QEuH7iKJcJTt6TPK4NRYgvLqS4m8rFTczFmue3g+ZgQA8jq+ROh8ZJ0UbnwQ
 4hfSeFxkNZp+cjxXeGUzHcdNEXa/9P/KTK9ON5K//FwoKZ6Hy2XQODmFFttKM6LPEajY
 k48vBrRC60OigQ+9E9Z5SoS5jvSHCVwkfqoBs2aSecZ6kGrm0zx5F8QNGN0EfN5MocRT
 lFYsO7HzjV6xAK1kjpuPvnGoYgBZJnWb6hulohRJ3C5+o7/DRm3kYRIub8tM5sxkh63c
 clFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T8RtcTJNc4sjjXaIpRxQKtjX+D54Jg70BD5BrR/ge7Q=;
 b=uYCiOF0uqjEIxy9TCb6Zh9e7YQXFaE4Y1+DBrmp5p118cwl1GFDkmKAzcBOdvVx8Uz
 tdSNYVLjdrQZURzQUCkLL9eTLt42FYWaMHEN8/RC08DQlQ7rJc4+VZS6MB9FmJki0JSe
 DlNBB/Ae1kc7zmLmketwOGri717v/TgcvQBcDfafp1J4T3jJVx/ljXq4ovHkPyDhyJpu
 1cTmqK+fx+0bqS8Z5Cm6z1dXrVlmBbCo25IP4lG0hLDPSVHq/q16U261pJTD33HRlGRN
 KK4N6EYMfS4Y6VsH6ipBC0WhcqBIHWh7kkHpZ09QUYdHY8lP9e7RjmHJkuhaACzgz3+Z
 7eYw==
X-Gm-Message-State: AOAM5324SXqaByj9Q0TBC6m0tu5HCKbpn3xDeXepQIgyK9LtluSU96YZ
 Vcy+cIo/96ixRRPTK/ghM0k=
X-Google-Smtp-Source: ABdhPJwhF+ALNDrx0ka5dV8lkSDSTFhXfKKgIA0GbnCIcqFdpBpQR75/Mq4UMudqD5vhLrNtbxvK0w==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr3183678wmq.100.1624526999379; 
 Thu, 24 Jun 2021 02:29:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f13sm2638062wrt.86.2021.06.24.02.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 02:29:58 -0700 (PDT)
Subject: Re: [PATCH v2] hw/audio/sb16: Restrict I/O sampling rate range for
 command 41h/42h
To: Qiang Liu <cyruscyliu@gmail.com>
References: <1624502687-5214-1-git-send-email-cyruscyliu@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <77f8cdae-27af-8bb3-de95-667aca28599c@amsat.org>
Date: Thu, 24 Jun 2021 11:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624502687-5214-1-git-send-email-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 4:44 AM, Qiang Liu wrote:
> The I/O sampling rate range is enforced to 5000 to 45000HZ according to
> commit a2cd86a9. Setting I/O sampling rate with command 41h/42h, a guest
> user can break this assumption and trigger an assertion in audio_calloc
> via command 0xd4. This patch restricts the I/O sampling rate range for
> command 41h/42h.
> 
> Fixes: 85571bc7415 ("audio merge (malc)")
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/audio/sb16.c              | 31 +++++++++++++++++++------------
>  tests/qtest/fuzz-sb16-test.c | 17 +++++++++++++++++
>  2 files changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
> index 5cf121f..60f1f75 100644
> --- a/hw/audio/sb16.c
> +++ b/hw/audio/sb16.c
> @@ -229,6 +229,23 @@ static void continue_dma8 (SB16State *s)
>      control (s, 1);
>  }
>  
> +static inline int restrict_sampling_rate(int freq)

No need to 'inline', 1/ this is not performance critical code
path, and 2/ we expect the compiler to be clever enough to figure
that by itself.

> +{
> +    if (freq < SAMPLE_RATE_MIN) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sampling range too low: %d, increasing to %u\n",
> +                      freq, SAMPLE_RATE_MIN);
> +        return SAMPLE_RATE_MIN;
> +    } else if (freq > SAMPLE_RATE_MAX) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sampling range too high: %d, decreasing to %u\n",
> +                      freq, SAMPLE_RATE_MAX);
> +        return SAMPLE_RATE_MAX;
> +    } else {
> +        return freq;
> +    }
> +}
> +
>  static void dma_cmd8 (SB16State *s, int mask, int dma_len)
>  {
>      s->fmt = AUDIO_FORMAT_U8;
> @@ -244,17 +261,7 @@ static void dma_cmd8 (SB16State *s, int mask, int dma_len)
>          int tmp = (256 - s->time_const);
>          s->freq = (1000000 + (tmp / 2)) / tmp;
>      }
> -    if (s->freq < SAMPLE_RATE_MIN) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "sampling range too low: %d, increasing to %u\n",
> -                      s->freq, SAMPLE_RATE_MIN);
> -        s->freq = SAMPLE_RATE_MIN;
> -    } else if (s->freq > SAMPLE_RATE_MAX) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "sampling range too high: %d, decreasing to %u\n",
> -                      s->freq, SAMPLE_RATE_MAX);
> -        s->freq = SAMPLE_RATE_MAX;
> -    }
> +    s->freq = restrict_sampling_rate(s->freq);
>  
>      if (dma_len != -1) {
>          s->block_size = dma_len << s->fmt_stereo;
> @@ -768,7 +775,7 @@ static void complete (SB16State *s)
>               * and FT2 sets output freq with this (go figure).  Compare:
>               * http://homepages.cae.wisc.edu/~brodskye/sb16doc/sb16doc.html#SamplingRate
>               */
> -            s->freq = dsp_get_hilo (s);
> +            s->freq = restrict_sampling_rate(dsp_get_hilo(s));

It seems the best we can do here...

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>              ldebug ("set freq %d\n", s->freq);
>              break;

Thanks for the fix,

Phil.

