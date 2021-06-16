Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E03AA419
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:16:52 +0200 (CEST)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltb1v-0005YA-Ae
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb0D-0004HI-FL
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:15:05 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:43581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb0A-0008P3-8e
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:15:04 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 z14-20020a4a984e0000b029024a8c622149so955303ooi.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ATh12DGf3i1forOs8VBMp5LPyeOz4NLGeOwRoZijAJE=;
 b=ae+E7ycSsAH0O33MaGhUO84Yb2FTDdAjgOzsrMxHvbskBln5gYNjLNgYx1uTBcSR/y
 S6WQApQKKVOoImwbseBo/h5W/59yJoGhuXvXi+Pyw2fuRk1yYF5K39natSp3bmgkO4bN
 4W0mxU862x8MxYbG+O60bngZJrAC4Sy1qKmjK2iJg+mxkvAuno88IdPgzEdmCANqsgCu
 7IQPa00Dx7t417PYkSQIMDMkU6OOexkvDxGvgbpjAW5yKYYSxoJ7dvpX2AC/vEmDGCr4
 zFDKnsvDzSg1f/fMppg2n9aVI8+rJvIdP0l/m7BGE+/7FwG9Bc4wJQTshgCFK5YYCECW
 icmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ATh12DGf3i1forOs8VBMp5LPyeOz4NLGeOwRoZijAJE=;
 b=r4C5PXA5jgDGZg/YOSJbukFfnAQdOrWxsgIx69CAVfrBsmHZFkvXKvrOJFrFo55b6Q
 lItJIjlos4RlCM7KnYPdxxekjtrfzJGcL5eHYfxvSTJPH1T3kf+Lp3DVVLxy152n2Kcy
 E9if8cPc3YnTQJc+cWex+FLdiUpWWb33QgtYPdjKIdUAzWDhdGtnDGS1VlX8TpKnM12N
 Fu0A3xGTg1FwjoHDMdgE3i6mufUsY9AipNfD8ULPEAMTE+kIFEUUBtlqHMdBNDMuGwoC
 0kLOgZhT6yNynFfwlsd1jT3DEfUIN32U+fyGj7Ci6th+I6gI89FCqhMEZFbnFVP7KQKU
 9RHA==
X-Gm-Message-State: AOAM5324MI3KRBzQ6jU+dMgQiv19OXWY2rvKdMkQ+B09YVNzvygym9wu
 3vhZRkWNPw5RYNSZrqCXQPpe7g==
X-Google-Smtp-Source: ABdhPJyPDhpCJiPpxveh3dEqPg+SYx/PooBnmPoYIOwdKLM+JUtrt+6trrWfiCrJdatZbSNG1IiEGg==
X-Received: by 2002:a4a:952b:: with SMTP id m40mr1253460ooi.69.1623870898725; 
 Wed, 16 Jun 2021 12:14:58 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ede8:ade8:da1:e1cc])
 by smtp.gmail.com with ESMTPSA id l7sm702502otu.76.2021.06.16.12.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:14:58 -0700 (PDT)
Date: Wed, 16 Jun 2021 14:14:56 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 04/13] hw/display/sm501: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Message-ID: <20210616191456.GE11196@minyard.net>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616161418.2514095-5-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=cminyard@mvista.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 06:14:09PM +0200, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easire to review.
                                                  ^easier



> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/sm501.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index f276276f7f1..569661a0746 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1033,17 +1033,18 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
>      case SM501_I2C_CONTROL:
>          if (value & SM501_I2C_CONTROL_ENABLE) {
>              if (value & SM501_I2C_CONTROL_START) {
> +                bool is_recv = s->i2c_addr & 1;
>                  int res = i2c_start_transfer(s->i2c_bus,
>                                               s->i2c_addr >> 1,
> -                                             s->i2c_addr & 1);
> +                                             is_recv);
>                  if (res) {
>                      s->i2c_status |= SM501_I2C_STATUS_ERROR;
>                  } else {
>                      int i;
>                      for (i = 0; i <= s->i2c_byte_count; i++) {
> -                        res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
> -                                            !(s->i2c_addr & 1));
> -                        if (res) {
> +                        if (is_recv) {
> +                            s->i2c_data[i] = i2c_recv(s->i2c_bus);
> +                        } else if (i2c_send(s->i2c_bus, s->i2c_data[i]) < 0) {
>                              s->i2c_status |= SM501_I2C_STATUS_ERROR;
>                              return;
>                          }
> -- 
> 2.31.1
> 

