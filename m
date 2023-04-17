Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732826E4186
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:43:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJVX-0007rY-O6; Mon, 17 Apr 2023 03:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1poJVN-0007rJ-CU
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:42:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1poJVK-00024R-Jz
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:42:28 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h24-20020a17090a9c1800b002404be7920aso25172119pjp.5
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 00:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681717333; x=1684309333;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U065Hf4Yw8Bly5LV8jdLPWTByBCf5orbBqBsgtU7geI=;
 b=cAnpXshlW+ywc2Or0ydWZZUXg+JB10oIcVjXv8f7svgHpgnE41UPb1MjLfEvJYu8rD
 i7eDu7Snkm7jc1aulnWoQYWP+tT7fbNF/whokDq1OGW/5JU1CC4f+hFXjkKxIRo8tiKH
 teJFrC8HM/LdGx3Q9KJWo9IMObQt0qZjoAoAGJHsnhVhVmpdj1SLwQegfOJR993KpzVJ
 qPGSG5eTmCiH/YsJdblXOaO5cIlLvzcdRFiBoT/YqrG+sBGXZYh0QNtBCXs++AokpzvM
 rItaKbvS5orXWPSCw2XTNWfobwdEM7ydyj4SDY93Hq719+Mp4WgrWUOIkOeLgyQhV9wf
 lpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681717333; x=1684309333;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U065Hf4Yw8Bly5LV8jdLPWTByBCf5orbBqBsgtU7geI=;
 b=FcqOCeMwCV0NBy9/j/SoND0fgoWxzDA2LVd884mXs0F7R2xMT2A7lSBb51kiOpZwDQ
 zux7+vE0RbkWrATeNWC+ynDrGXyqaHN/YHWUNSz1x1KWP3mjTNx/Oiic/fmRE4w5KVDw
 bdBIZSovfJZCjAQA3n8TG83aSTlzJWGQgTvrK/SmWxeijZLh+3cKm0mjcGnU/83xxilc
 LCDZoWWdgz/6q6f9rQ2xIGxGyFFA4S/1Qj32ZxrRGQ+8yRHynyZ+auGi1GHwdarEWPTA
 BHJqmWhqXBU7ti9pmRqQ3JqTJ6kjFmr6sXn6vJRF6iqpfH2OpYoBlBJ99A6XdbV1UKHK
 02NA==
X-Gm-Message-State: AAQBX9cm0Yb01JSvPFlPts7lU5fQRscpsDqn6UXPItRmXUM3J5V+OADB
 qF7f7BAK2KjY6Kfru9sCjh8DHA==
X-Google-Smtp-Source: AKy350bS0Y1itwA3EvKe59Si0jpDbuX0+dybHxwD9vKQmqJ3eXi1sNGobHmuRDw0Hj9KjYoCp03UGw==
X-Received: by 2002:a17:902:d4ca:b0:1a1:defc:30d8 with SMTP id
 o10-20020a170902d4ca00b001a1defc30d8mr14303453plg.32.1681717333075; 
 Mon, 17 Apr 2023 00:42:13 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1709026b8100b001a281063ab4sm7002039plk.233.2023.04.17.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 00:42:12 -0700 (PDT)
Date: Mon, 17 Apr 2023 13:12:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH] virtio: i2c: Check notifier helpers for
 VIRTIO_CONFIG_IRQ_IDX
Message-ID: <20230417074210.p2gjbxcqgokzc5ob@vireshk-i7>
References: <89d47285e882a99a0513411edcc96aa575512f13.1681710993.git.viresh.kumar@linaro.org>
 <cd1e974b-2bbf-4b9a-c538-95268de9f449@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd1e974b-2bbf-4b9a-c538-95268de9f449@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17-04-23, 09:36, Philippe Mathieu-Daudé wrote:
> On 17/4/23 08:02, Viresh Kumar wrote:
> > Since the driver doesn't support interrupts, we must return early when
> > index is set to VIRTIO_CONFIG_IRQ_IDX.
> > 
> > Fixes: 544f0278afca ("virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX")
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >   hw/virtio/vhost-user-i2c.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> > 
> > diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> > index 60eaf0d95be0..45100a24953c 100644
> > --- a/hw/virtio/vhost-user-i2c.c
> > +++ b/hw/virtio/vhost-user-i2c.c
> > @@ -128,6 +128,16 @@ static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
> >   {
> >       VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
> > +    /*
> > +     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> > +     * as the Marco of configure interrupt's IDX, If this driver does not
> 
> Copy/paste of pre-existing comment, still I wonder who is "the Marco of
> configure" :P
> 
> > +     * support, the function will return
> > +     */

Yeah the comment could be improved, I didn't touch it as it was
written this way for many drivers :)

Maybe a simple comment like is all we need:

/*
 * We don't support interrupts, return early if index is set to
 * VIRTIO_CONFIG_IRQ_IDX.
 */

-- 
viresh

