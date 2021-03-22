Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2834483A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:55:00 +0100 (CET)
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLxG-00006S-I1
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOLE3-0002xK-Ev
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOLE0-0008N1-63
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616422085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNNQRehqsge71hiRT8hojv3o9bfYrIVGcQr/Je6XgKw=;
 b=VgeMCgxyCS/9Pod6CSdfQ04E0zAsYvLMIzb+E+3Nl0ilspqAAfIWbczgH1VpH9KUIwaP6t
 9f1gYDJxCpJJu0uu/wafXF1nJ8XP7h+5SwWgCuYAxKR+DLbBziev1PZShrdlv7aDhwIbU5
 5Epg0nWBlnFwSUb4fWvpjDnBPm2tEzg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-lxgsV5InPu2WSMGlEYTOkg-1; Mon, 22 Mar 2021 10:08:00 -0400
X-MC-Unique: lxgsV5InPu2WSMGlEYTOkg-1
Received: by mail-wr1-f70.google.com with SMTP id z6so26062466wrh.11
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hNNQRehqsge71hiRT8hojv3o9bfYrIVGcQr/Je6XgKw=;
 b=uDYT8sg62/jDgy2IAKXKCo+41REBVmCFX45KoQ9lnmp5aaqcU8o1zt1MAS0Od7KCmn
 eteIWivBjhsefawMvODJzeQu3YrNVkuD/OqJIHyvbgv0C+CHQ9aLYBHSCmryFMwYqXZE
 l4XjzVJUQSmtqg4G9IbXDlos9LSNJUrYKoWkKbF/H02BG9ryouE3B++ILLSbbCUVhn15
 hS5el1sAHhS1S4X0IIR1Qwx2kOhCr0HRG+r7LLXGQWqsOx8BHCbnaFB4UyBsWPYmaXQb
 8JrfdWtwhmIvQux/blVcbNmgds5XOtO5JCgSGDp7erTWM7BoDdJ5R8DTnWy5Qh3SB9OY
 REZA==
X-Gm-Message-State: AOAM530edckrebOvet6ibVZOtPXTwuAh8ZZg41IA/sH+EyK9iiYtXQo5
 Zt35uTN7gddw0NYlZdPIxfuggVceAB5d4LTAzlLsfLxz+eDvxNXg8uaxqylMFgbbWPCiZp2pnxa
 RZEzyG+k4vmXAIis=
X-Received: by 2002:adf:ee0a:: with SMTP id y10mr9648796wrn.177.1616422078904; 
 Mon, 22 Mar 2021 07:07:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw9H2jgWC7rO3Ynm5mk5B30A+/q4i/j3N2mgg6Wp0drhhoaB5NrP1aJ/Vig7rNq2ZyG/PdkQ==
X-Received: by 2002:adf:ee0a:: with SMTP id y10mr9648777wrn.177.1616422078674; 
 Mon, 22 Mar 2021 07:07:58 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id l9sm15684047wmq.2.2021.03.22.07.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:07:58 -0700 (PDT)
Date: Mon, 22 Mar 2021 10:07:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH for 6.0 v4] hw/intc/i8259: Refactor pic_read_irq() to
 avoid uninitialized variable
Message-ID: <20210322100741-mutt-send-email-mst@kernel.org>
References: <20210319142308.3980259-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319142308.3980259-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 03:23:08PM +0100, Philippe Mathieu-Daudé wrote:
> Some compiler versions are smart enough to detect a potentially
> uninitialized variable, but are not smart enough to detect that this
> cannot happen due to the code flow:
> 
> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    203 |         irq = irq2 + 8;
>        |         ~~~~^~~~~~~~~~
> 
> Restrict irq2 variable use to the inner statement.
> 
> Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Looks ok.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Paolo, you merging this?

> ---
> Since v3:
> - Declare irq2 really local (Richard)
> Since v2:
> - Remove pic_intack() call (Zoltan)
> ---
>  hw/intc/i8259.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 344fd04db14..d67c4710f15 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -176,12 +176,13 @@ static void pic_intack(PICCommonState *s, int irq)
>  int pic_read_irq(DeviceState *d)
>  {
>      PICCommonState *s = PIC_COMMON(d);
> -    int irq, irq2, intno;
> +    int irq, intno;
>  
>      irq = pic_get_irq(s);
>      if (irq >= 0) {
>          if (irq == 2) {
> -            irq2 = pic_get_irq(slave_pic);
> +            int irq2 = pic_get_irq(slave_pic);
> +
>              if (irq2 >= 0) {
>                  pic_intack(slave_pic, irq2);
>              } else {
> @@ -189,20 +190,18 @@ int pic_read_irq(DeviceState *d)
>                  irq2 = 7;
>              }
>              intno = slave_pic->irq_base + irq2;
> +            pic_intack(s, irq);
> +            irq = irq2 + 8;
>          } else {
>              intno = s->irq_base + irq;
> +            pic_intack(s, irq);
>          }
> -        pic_intack(s, irq);
>      } else {
>          /* spurious IRQ on host controller */
>          irq = 7;
>          intno = s->irq_base + irq;
>      }
>  
> -    if (irq == 2) {
> -        irq = irq2 + 8;
> -    }
> -
>  #ifdef DEBUG_IRQ_LATENCY
>      printf("IRQ%d latency=%0.3fus\n",
>             irq,
> -- 
> 2.26.2


