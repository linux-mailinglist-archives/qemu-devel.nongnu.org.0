Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F8681453
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:12:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVp3-00009X-5z; Mon, 30 Jan 2023 10:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMVp1-00008w-IL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:11:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMVoz-0004AU-Ai
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675091508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9N2hoLioofQ2m/RFZLFSjYTC2HJLYxujT8lC548GT78=;
 b=IXiIRUATr1p3jZbW4NVxPKDTYHYH9ePXPiIoW2TcZyJMO7pACxLP/32jt4JxpFJoy2WAGF
 WuVg2W3uAHuybjcxvfxX/okvt6etYbTtll7rmQIdAVnah0tcRzcftB3bzvX93BV9DCGclh
 /YhS/fD+tlzimfoAovz8X7hlL8x/6WQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-gOZVIgr_ONufNIRoB3IzfA-1; Mon, 30 Jan 2023 10:11:46 -0500
X-MC-Unique: gOZVIgr_ONufNIRoB3IzfA-1
Received: by mail-ej1-f71.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso7636058ejb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 07:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9N2hoLioofQ2m/RFZLFSjYTC2HJLYxujT8lC548GT78=;
 b=LgHgQ3LHqZqjiypQM/9C8KLDA+feCe7ymV/Rv0eJ71v/tHb1IyyirjvgflHKrxrBy+
 tzgA5/BqL9kj3GmpbMctKeD/3bI63RW9hP4aGcbfEn1ELyzkfYVlwP0x6qjm6s0jSoYA
 OVU8QAwWG/3E0hLQ5gxwALG7IMlpuDdPCI73ZrFZEWZdg+/kMOpIpJ7ZVBpvCvjpbweL
 dAodwt+aUhiG8k4Q2Dzvx5dI3CIobS+CpGVvIe1TewRZ6VEEyeEsNOsLw+DFEwDkMT7L
 gL8+37B3nXXQtZD3bFPQHPHIcAJSHiMxN7QlIo/D5SsEBOPVcY5SNA0geIzTqX9fIpAz
 BJoA==
X-Gm-Message-State: AO0yUKWddmVNGzJTswLY9cDI1IxKQRA9NnvV/QX7LxK8ILICuoN9ZFSg
 LhBkOdMVm/6ued2NMZ3ZV7rAwI3Vb3qwU1//3hO74qlapDm2WBE1ZdrnYuTdUPHg21NlkCRX3qc
 SfaWChNbLP5XrRIk=
X-Received: by 2002:a17:907:9621:b0:87a:ee05:f7b with SMTP id
 gb33-20020a170907962100b0087aee050f7bmr14383928ejc.24.1675091505704; 
 Mon, 30 Jan 2023 07:11:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9vwy8KFq5hO/G8kSBxLf3kkXc6tSMpjL9+ypQThG6Q93C/o9HPUT/FpzWSKAtiis2NqBcZ9w==
X-Received: by 2002:a17:907:9621:b0:87a:ee05:f7b with SMTP id
 gb33-20020a170907962100b0087aee050f7bmr14383909ejc.24.1675091505489; 
 Mon, 30 Jan 2023 07:11:45 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 jt18-20020a170906ca1200b00889a9444e29sm1184610ejb.14.2023.01.30.07.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:11:44 -0800 (PST)
Date: Mon, 30 Jan 2023 10:11:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH] hw/timer/hpet: Fix expiration time overflow
Message-ID: <20230130101058-mutt-send-email-mst@kernel.org>
References: <20230130135001.76841-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130135001.76841-1-akihiko.odaki@daynix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 30, 2023 at 10:50:01PM +0900, Akihiko Odaki wrote:
> The expiration time provided for timer_mod() can overflow if a
> ridiculously large value is set to the comparator register. The
> resulting value can represent a past time after rounded, forcing the
> timer to fire immediately. If the timer is configured as periodic, it
> will rearm the timer again, and form an endless loop.
> 
> Check if the expiration value will overflow, and if it will, stop the
> timer instead of rearming the timer with the overflowed time.
> 
> This bug was found by Alexander Bulekov when fuzzing igb, a new
> network device emulation:
> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> 
> The fixed test case is:
> fuzz/crash_2d7036941dcda1ad4380bb8a9174ed0c949bcefd
> 
> Fixes: 16b29ae180 ("Add HPET emulation to qemu (Beth Kon)")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I'll tag this for merge.

> ---
>  hw/timer/hpet.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 9520471be2..3657d5f463 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -352,6 +352,16 @@ static const VMStateDescription vmstate_hpet = {
>      }
>  };
>  
> +static void arm(HPETTimer *t, uint64_t ticks)
> +{
> +    if (ticks < ns_to_ticks(INT64_MAX / 2)) {
> +        timer_mod(t->qemu_timer,
> +                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ticks_to_ns(ticks));
> +    } else {
> +        timer_del(t->qemu_timer);
> +    }
> +}
> +
>  /*
>   * timer expiration callback
>   */
> @@ -374,13 +384,11 @@ static void hpet_timer(void *opaque)
>              }
>          }
>          diff = hpet_calculate_diff(t, cur_tick);
> -        timer_mod(t->qemu_timer,
> -                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (int64_t)ticks_to_ns(diff));
> +        arm(t, diff);
>      } else if (t->config & HPET_TN_32BIT && !timer_is_periodic(t)) {
>          if (t->wrap_flag) {
>              diff = hpet_calculate_diff(t, cur_tick);
> -            timer_mod(t->qemu_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                           (int64_t)ticks_to_ns(diff));
> +            arm(t, diff);
>              t->wrap_flag = 0;
>          }
>      }
> @@ -407,8 +415,7 @@ static void hpet_set_timer(HPETTimer *t)
>              t->wrap_flag = 1;
>          }
>      }
> -    timer_mod(t->qemu_timer,
> -                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (int64_t)ticks_to_ns(diff));
> +    arm(t, diff);
>  }
>  
>  static void hpet_del_timer(HPETTimer *t)
> -- 
> 2.39.1


