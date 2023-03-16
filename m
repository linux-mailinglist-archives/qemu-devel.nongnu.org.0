Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2286BD6BB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:08:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcr4V-0003rR-JQ; Thu, 16 Mar 2023 13:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcr4T-0003rC-Q7; Thu, 16 Mar 2023 13:07:21 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcr4R-0001Wb-LU; Thu, 16 Mar 2023 13:07:21 -0400
Received: by mail-il1-x12e.google.com with SMTP id a13so1352711ilr.9;
 Thu, 16 Mar 2023 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678986437;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=05OY830z4md4FAqmMfSh2vH7ZahxmAYYBFUqba/2IB0=;
 b=DBEaNu4Lr7yyD4vnc/dCPXLc1E/YJXd6y9f3IEtsj1feAgbA4RVYxJ1WS4wmdLwFKG
 O8ZPJ0cK4UqlfOgYRL1wNRPMENOUd7BOZDLSP2Jh0/qJVFuCja4RMgAKxkiHgwCAM0SO
 C2XQjNSHsxK1qOn8f5rFcZ/EFQH6iNLsmqkvLXS19aZ63bRgihqFAj1YnWrTZPTfkLeY
 qm6AHCjnWoLwiSqmB9xPkwsp9Z2jyx/S707kQSnc17eEw3mTJC712PcVoKmDFp4E2Yoj
 xPZmUuqkDACsTBxsiW4Sfvk4ZkITAm7J2FfYDqj7KhZgv/i7YKq4x8wbXWrBtvEHJhRY
 ahRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678986437;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=05OY830z4md4FAqmMfSh2vH7ZahxmAYYBFUqba/2IB0=;
 b=FC2RGpkqMe4o2xu2p/x/f0NwOtbdzr3fDaNaF3pjZSEPKQH475KM5eNVeEmYHiAJCr
 6EJMZYkxftzelg5aVJlR24w0TRUzlFaDC9ezArFIMKSZqNQ8dzKT7q7bT3gbvQJt4FS4
 H+pCw+DIZVAMLwQ6CEB8dQ6k/rbXV7wbZ6Gfi6A9RY5pyQW7Lr25HPPP/W5mHza/ybAL
 gKwAMQE4k+QGwHvZX7gu2wHHqjvY8B3aOsdMSPJ1qpYIC7N7ozXP8e7QvYh6ogDZRNKy
 nFohMNMnaCZV8TT1+2kWVbWEhe/1bvKsHaEBnqf4wAVJNfNvi5lIZWw3BO2Se6Eikcru
 diNA==
X-Gm-Message-State: AO0yUKWLfAc8asS3OF5xnjkaxu3l+zZ9f2MavUJ2Zv0zyhtObXin8LO4
 h0hbTPibafxAcqSZDzqZqzo=
X-Google-Smtp-Source: AK7set/SvFH5keTq1CwBelTCGKoGa6uQaCseiAaEt7OAXfowtkaKYpyEuVVCrNeuCvtjLRRw7/7GhA==
X-Received: by 2002:a92:c10f:0:b0:311:13c1:abd4 with SMTP id
 p15-20020a92c10f000000b0031113c1abd4mr7043534ile.24.1678986437604; 
 Thu, 16 Mar 2023 10:07:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a92d4c2000000b00322fe7f3d8asm2516028ilm.22.2023.03.16.10.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 10:07:17 -0700 (PDT)
Date: Thu, 16 Mar 2023 10:07:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 1/5] hw/usb: Add basic i.MX USB Phy support
Message-ID: <0ce37eb6-1dcc-45a2-97d8-901f8ed9e70f@roeck-us.net>
References: <20200313014551.12554-1-linux@roeck-us.net>
 <20200313014551.12554-2-linux@roeck-us.net>
 <CAFEAcA_PT9kD1WCn9RWVem3uEY4AvmyA5T=-ouVsq9sbvDymKg@mail.gmail.com>
 <590fdf77-5478-1d94-162b-b543873b0299@roeck-us.net>
 <CAFEAcA_yZu+w2htUbXDTr_8rAZMPW9HqqFOW-fJKM_LxGm_8zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_yZu+w2htUbXDTr_8rAZMPW9HqqFOW-fJKM_LxGm_8zA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Mar 16, 2023 at 02:51:23PM +0000, Peter Maydell wrote:
> On Thu, 16 Mar 2023 at 14:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Hi Peter,
> >
> > On 3/16/23 06:41, Peter Maydell wrote:
> > > On Fri, 13 Mar 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
> > >>
> > >> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
> > >> and i.MX7 SoCs.
> > >>
> > >> The only support really needed - at least to boot Linux - is support
> > >> for soft reset, which needs to reset various registers to their initial
> > >> value. Otherwise, just record register values.
> > >>
> > >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > >
> > > Hi Guenter; we've had a fuzzer report that this device model
> > > accesses off the end of the usbphy[] array:
> > > https://gitlab.com/qemu-project/qemu/-/issues/1408
> > >
> >
> > Good catch. And an obvious bug, sorry.
> 
> 
> >
> > > Do you know what the device is supposed to do with these
> > > off-the-end acceses? We could either reduce the memory region
> > > size or bounds check and RAZ/WI the out-of-range accesses.
> > >
> >
> > I have no idea what the real hardware would do. The datasheets (at
> > least the ones I checked) don't say, only that the region size is 4k.
> > I would suggest a bounds check, ignore out-of-bounds writes (maybe
> > with a log message), and return 0 for reads (which I think is what
> > you suggest with RAZ/WI).
> >
> > Want me to send a patch ?
> 
> If you have the time, that would be great. I expect you're
> better set up to test it than I am...
> 

I prepared a patch. Currently testing.

Guenter

