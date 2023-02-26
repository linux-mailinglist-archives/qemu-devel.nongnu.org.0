Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107946A2EED
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 09:52:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWCkU-000714-3I; Sun, 26 Feb 2023 03:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWCkR-00070q-UY
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 03:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWCkP-0000uI-1s
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 03:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677401467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q86XXTNPyKzZGDBIDdKVDgNGL0gllKR9V3sSYioqwdQ=;
 b=GzdArKcbmFWhjDUOt2MngkVhC6QWrLTUhsf67wgkGQWcUSfEejop8K+WJEMvQDG7AsHAoe
 NMp0dTyRG/EwWYs1sffIQVWzYOqvsedpJSA3lS4JNr18uLBMSqME0A4+awD4I7jmuY3KhW
 V+Ym7jwHsdMKTUdq2gLk2guCYM8zKjU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-aoDy0MxXOO-tEsk6qqQWYw-1; Sun, 26 Feb 2023 03:51:05 -0500
X-MC-Unique: aoDy0MxXOO-tEsk6qqQWYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so3646261wms.8
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 00:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q86XXTNPyKzZGDBIDdKVDgNGL0gllKR9V3sSYioqwdQ=;
 b=Mv2AYOgQzDDFswu8IsCT9MJFzaXrnzEYr0y4ImzrkEzOlnQg/V5w4uT7x3A2RqgF0V
 CSq+IO/Q1c/8b5djrGk+tHLeKFaYDwHMK99NAg7Hbvebs8FDON3GcdRVs7buKcCNZ5wx
 ToBe8mvFAxtbz/gDTmgJ7QYSUOt0S9Y8bhDK84DjSmVCI5UP+CjtynbGjVTXVJQEfsLf
 C5u3io+/dboHH3SKxlkqL4FP3EjrKkJVHNRciKCaR+mnmMXNr/4ikpYP4buuYOCacs7D
 Hb/Qvo6RZEIkzL4rOhYbz+8a2e5Nunb0Drnz7ktlJYecPw/pIaBDINulAlMVpIoA7jMe
 N5aw==
X-Gm-Message-State: AO0yUKW+ATKawbpQIwr2ctsxRmnBow9HenmthBDsuqpGgzMtWBbrP8kS
 vBX1oRtGOeGNPr0N1APnpvYIm3xMm0sJpDYwbSefyeT2VK0FAlzEzCuQmK5wdDqZGvykTFeec3o
 KmmxPbuU2l+xAJS8=
X-Received: by 2002:a05:600c:755:b0:3eb:3945:d3f9 with SMTP id
 j21-20020a05600c075500b003eb3945d3f9mr2325244wmn.4.1677401464801; 
 Sun, 26 Feb 2023 00:51:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8nSK3CMZJpiB6/bGTkkqnkBqL+4P7VT2v+nhaElGrGoZyXVfRQRGbQBhSuzXR8Q2WpQE4zCA==
X-Received: by 2002:a05:600c:755:b0:3eb:3945:d3f9 with SMTP id
 j21-20020a05600c075500b003eb3945d3f9mr2325235wmn.4.1677401464519; 
 Sun, 26 Feb 2023 00:51:04 -0800 (PST)
Received: from redhat.com ([2.52.24.119]) by smtp.gmail.com with ESMTPSA id
 v20-20020a1cf714000000b003db03725e86sm5109478wmh.8.2023.02.26.00.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 00:51:03 -0800 (PST)
Date: Sun, 26 Feb 2023 03:51:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Damien Zammit <damien@zamaudio.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH qemu] timer/i8254: Fix one shot PIT mode
Message-ID: <20230226035018-mutt-send-email-mst@kernel.org>
References: <20230226015755.52624-1-damien@zamaudio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230226015755.52624-1-damien@zamaudio.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sun, Feb 26, 2023 at 01:58:10AM +0000, Damien Zammit wrote:
> Currently, the one-shot (mode 1) PIT expires far too quickly,
> due to the output being set under the wrong logic.
> This change fixes the one-shot PIT mode to behave similarly to mode 0.
> 
> TESTED: using the one-shot PIT mode to calibrate a local apic timer.
> 
> Signed-off-by: Damien Zammit <damien@zamaudio.com>
> 
> ---
>  hw/timer/i8254_common.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
> index 050875b497..9164576ca9 100644
> --- a/hw/timer/i8254_common.c
> +++ b/hw/timer/i8254_common.c
> @@ -52,10 +52,8 @@ int pit_get_out(PITChannelState *s, int64_t current_time)
>      switch (s->mode) {
>      default:
>      case 0:
> -        out = (d >= s->count);
> -        break;


I think you need something like
	/* FALLTHRU */
here otherwise some gcc versions will warn.

>      case 1:
> -        out = (d < s->count);
> +        out = (d >= s->count);
>          break;
>      case 2:
>          if ((d % s->count) == 0 && d != 0) {
> --
> 2.39.0
> 


