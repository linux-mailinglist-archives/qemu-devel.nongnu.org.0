Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACEE6BD2C2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:53:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcoxA-00036C-UV; Thu, 16 Mar 2023 10:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcox8-00034m-6f
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:51:38 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcox6-0001mm-9I
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:51:37 -0400
Received: by mail-pg1-x536.google.com with SMTP id z18so1063399pgj.13
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678978295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NFjAdU8tHiD0H7mrmwcHX6+IUvYtGGgoYtjkl1kK+wA=;
 b=Di+p3wOkwfrtBnfLlgGLJsyn5I7BkFCOWhCfSOr9zK3dcDGmBiY3obNjQbb5IhzH+2
 Rh0EIHT2XThnGVVXdLPPY8rvt6l782MCGSgmD0XYA6Nf+FW1aRVWESAsJ6sLiy0Ww3k+
 tRSvYueFrpYH/zCJ8pIi7LUylzlBWJ93ucqTPn73vnXzgvZAZGq22kjgf16Yqy+bmrLP
 GKsoNqHIP8XPZtUYuWSWVZDAY1vUT/4yZMK5rfWGVeUIPieRUQ63z+Vq4wAfJU8pZTTZ
 W5ntgKyNlnuRdc1JDTZD8KXKeBLQXGc6BcDC0SW1A3V3l+OKaabPWAyRtPIqTBhs/pM8
 AxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678978295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NFjAdU8tHiD0H7mrmwcHX6+IUvYtGGgoYtjkl1kK+wA=;
 b=dzqV8YG5js+1JVOKWjQ/jkU4q2v60K2bKIUrL1qRlROlUA8qhE2s6a+7Xc4RgOerl8
 RZuZIC/OCBeRPE/B2fkAq6qecdWPcn5YCqVOFiEI12YZfcGapW2KZOFEjIU/ZTPikWt2
 YlwYL+4xzA2fzRzhJs15l6OH7EUZ9PU5FSDdyBmvGBXgoS7lTtyplJvCL/w+zkQD3qdg
 t1aVxb43SqnxRYOIVs7+WU9q3b8m4xA3nr/W22VkPcMJGGp+BTFIiu5WHIbN7bFb4Kb3
 7pxoo7kJm9RA1pVI0If41vsQyURP6ey6pbHyxzwvhLuuZLBK/6wvNRK+zA1AiE0oYLdC
 YpYg==
X-Gm-Message-State: AO0yUKVZPR//U3sXiKw4SHvz2XFCsT9vwTYsQdbnLnuYK7BCaqYwMOHM
 EjgKTMFLHdWELwzW2v6M/P+KPqO3YaceRhdgDJe+pA==
X-Google-Smtp-Source: AK7set9opi5jGIMXfv4poFZ/SPzmFKw6pDFQtMcBi7k3Kip/90JXHIKYyzkDxpGpY7OsPnWNF/Fr95jEgphD1KVy090=
X-Received: by 2002:a65:4104:0:b0:50a:c06f:4186 with SMTP id
 w4-20020a654104000000b0050ac06f4186mr959161pgp.6.1678978294811; Thu, 16 Mar
 2023 07:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200313014551.12554-1-linux@roeck-us.net>
 <20200313014551.12554-2-linux@roeck-us.net>
 <CAFEAcA_PT9kD1WCn9RWVem3uEY4AvmyA5T=-ouVsq9sbvDymKg@mail.gmail.com>
 <590fdf77-5478-1d94-162b-b543873b0299@roeck-us.net>
In-Reply-To: <590fdf77-5478-1d94-162b-b543873b0299@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 14:51:23 +0000
Message-ID: <CAFEAcA_yZu+w2htUbXDTr_8rAZMPW9HqqFOW-fJKM_LxGm_8zA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/usb: Add basic i.MX USB Phy support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 16 Mar 2023 at 14:12, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Peter,
>
> On 3/16/23 06:41, Peter Maydell wrote:
> > On Fri, 13 Mar 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
> >> and i.MX7 SoCs.
> >>
> >> The only support really needed - at least to boot Linux - is support
> >> for soft reset, which needs to reset various registers to their initial
> >> value. Otherwise, just record register values.
> >>
> >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Hi Guenter; we've had a fuzzer report that this device model
> > accesses off the end of the usbphy[] array:
> > https://gitlab.com/qemu-project/qemu/-/issues/1408
> >
>
> Good catch. And an obvious bug, sorry.


>
> > Do you know what the device is supposed to do with these
> > off-the-end acceses? We could either reduce the memory region
> > size or bounds check and RAZ/WI the out-of-range accesses.
> >
>
> I have no idea what the real hardware would do. The datasheets (at
> least the ones I checked) don't say, only that the region size is 4k.
> I would suggest a bounds check, ignore out-of-bounds writes (maybe
> with a log message), and return 0 for reads (which I think is what
> you suggest with RAZ/WI).
>
> Want me to send a patch ?

If you have the time, that would be great. I expect you're
better set up to test it than I am...

thanks
-- PMM

