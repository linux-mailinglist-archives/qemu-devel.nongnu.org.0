Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170736D0AF9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:26:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phv5y-0007Ub-Cg; Thu, 30 Mar 2023 12:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv5v-0007RZ-QV; Thu, 30 Mar 2023 12:25:47 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv5u-0002fV-C4; Thu, 30 Mar 2023 12:25:47 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id kr22so436887qvb.5;
 Thu, 30 Mar 2023 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680193545; x=1682785545;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24LuHnUsvSYuDU+fRR8uyxzS1V63x39/yaVQ9gnkpsQ=;
 b=j933wUch8fXlSE6CYWebI9sOmtKEGSb081pgYs4enxRAj3fhxMV5xXm4r1ZgDQv6fE
 dYKSVhAM9tzSQjhD9KLWowj2EfXHqcO3lXiXsnVGnqVx5El4QEFKfRmZk8m1581r8FID
 V08nmtN7PMn1nAhF5o/Mi+SZd6UeFNpFoMLRgSA+/Xh3X4fO8zh8ILh36XxPyabEFQ+m
 rVKrP3cc1/8KtoVkHG04TbSSlr/QYol1blpbo26hS1pZXv+lAELeKD5LDxNYI69tSW7V
 IhtDbbCUIxXopaFJL+5kZ+J9sJeSIqof70iHIc/34v1E520VZkhkcHR5iUR9vHlwG7DH
 72Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193545; x=1682785545;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:to:from:date:sender:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=24LuHnUsvSYuDU+fRR8uyxzS1V63x39/yaVQ9gnkpsQ=;
 b=BTVucEn1Mt9UlhOn+9f7MDl+zUMwLNvJqTnJtrqG3VqeR2fOz11jXje0d0OkMUY/rK
 DyrD6kS1CRTTioe/in8+w278D/SBmahLY2dxAPiKwpvT/eApqRC7QB4fxmtxXcURQ11w
 HFQ8rKShwMplaD4/tIJUthiojmeKFPBS5LL2KXIwlXawQ3YujOaOiY+uS8S7w4sMcz6b
 yX0En8XWh7qd0lGx6R31x1W4T8VBPPuAwQmqdtvcOrdvsvp7D2lAzFdT3+RUJGC5mwhf
 lrU7yEEEeDJhB5CDFyPnVFAxt/EbKJnHPBSCtRenJNKxIcp7oYL9kDErT0mli7F/nUff
 hFCw==
X-Gm-Message-State: AAQBX9fhhYnvIQhIL025GV/0y3aq89hcqHMsr7N5zgIU743M22V6gpUT
 e2vVmFshajXVsnrUn9thXw==
X-Google-Smtp-Source: AKy350YZKB9TtxQa89bAqj8OenBwj1fYFq/L+3++OkpU3WtAkg6qxAxQkWTf5day/8jXOVIUyUQ05w==
X-Received: by 2002:a05:6214:761:b0:5ce:7b40:89bd with SMTP id
 f1-20020a056214076100b005ce7b4089bdmr37129181qvz.18.1680193544645; 
 Thu, 30 Mar 2023 09:25:44 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a0cf806000000b005dd8b93457asm5593590qvn.18.2023.03.30.09.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:25:44 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:92e9:7a86:2720:254b])
 by serve.minyard.net (Postfix) with ESMTPSA id 3433C1800BB;
 Thu, 30 Mar 2023 16:25:43 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:25:42 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 2/5] hw/i2c: pmbus: add vout mode bitfields
Message-ID: <ZCW4BgKKSYnOi8jW@minyard.net>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-3-titusr@google.com>
 <ZCW2ukFFNenXQzY2@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCW2ukFFNenXQzY2@minyard.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 30, 2023 at 11:20:11AM -0500, Corey Minyard wrote:
> I almost never say this, as patches are usually too large :), but it
> would be nice if you combined this with the patch that uses the
> structure so we can see what it's used for.  Especially since that patch
> is several patches down the line.

Actually, in re-reviewing, I don't see this used at all.  Is there
something I'm missing?

> 
> -corey
> 
> On Wed, Mar 22, 2023 at 05:55:10PM +0000, Titus Rwantare wrote:
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  include/hw/i2c/pmbus_device.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> > index 7dc00cc4d9..2e95164aa1 100644
> > --- a/include/hw/i2c/pmbus_device.h
> > +++ b/include/hw/i2c/pmbus_device.h
> > @@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
> >      int32_t R;     /* exponent */
> >  } PMBusCoefficients;
> >  
> > +/**
> > + * VOUT_Mode bit fields
> > + */
> > +typedef struct PMBusVoutMode {
> > +    uint8_t  mode:3;
> > +    int8_t   exp:5;
> > +} PMBusVoutMode;
> > +
> >  /**
> >   * Convert sensor values to direct mode format
> >   *
> > -- 
> > 2.40.0.rc1.284.g88254d51c5-goog
> > 

