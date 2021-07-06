Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE43BC6B5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 08:36:36 +0200 (CEST)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0eh8-0004W6-QJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 02:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0eg3-0003lH-Q8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 02:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0efz-00024W-FH
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 02:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625553321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKdkDs6fD4qYU1KtPNcJyRTU2IuNuu61mb8jxStlMyM=;
 b=Y9CMXyYHww5r7M6u87tKq/Rs+j9Kd65gswm2KP5fhgxCFrFS83p4Vl16MGMkBVsNfUT6xf
 y9GRQ0viZVCo33PhI4hLO3FTxN+iGXJYKM5wI3HdxW/zO9aC9XM325P/y5FeU/GEttifyb
 D7/UXlfAIT7QdQrbZet46amw58+kmAM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-wQpSXM0DM5WYXGkl-m9_gw-1; Tue, 06 Jul 2021 02:35:18 -0400
X-MC-Unique: wQpSXM0DM5WYXGkl-m9_gw-1
Received: by mail-wr1-f70.google.com with SMTP id
 z2-20020a5d4d020000b0290130e19b0ddbso3189537wrt.17
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 23:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SKdkDs6fD4qYU1KtPNcJyRTU2IuNuu61mb8jxStlMyM=;
 b=Zv0Fm1xK25QnBj3OULONl7eXENw2+fT5Hy1W8ipMigxzc/kEBrgnR1TcbEt4rFW224
 n2oVoaLTwLhHzHDIe6m220bgLJrK4r6QB7kQXV8DLiDV5WxlAszufykdLuQFwQ5KwhtY
 kEMMpolKgd0e2wIqTZZJmLBupVq0L36LFrZoL4h+DOCUL9Mczy+eqKqzh8n8LTnXlvMP
 5nB8vKBtw2HEDyl/8a12s4HAIY8Xr2NI6aEo/XHeGZ2r8Aa9qOcWfFe3KLxfb/7BCgue
 OUHmMXHTW6tIonV5RWKBvo+xriyZLzXQWYHUANNqJVmGlDCh3hVr500DyR7U78BokeG8
 X0/g==
X-Gm-Message-State: AOAM532KXKGFMzrR2MymvChiBrcKQMjkVB8pm6rSAAuL+tTGUkVkOO5a
 0NP/FVmkcTXt0zuun+bf/XWdGx6Ry6ncStwGlggQUqJIVswpyZHcDYtyqmHWyFoyoUUJps/V1Aa
 sL6DEemdix1XToHldhUPAbjK/DgdmuPOEibCUq1kT5VMtl288W6AsoiJdTsh8z8g=
X-Received: by 2002:a5d:6050:: with SMTP id j16mr12651605wrt.46.1625553317397; 
 Mon, 05 Jul 2021 23:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIR4ScwS0ums4UBP8vE36+/yurl7qtTkaBJr3HDdVs58KQPqD2t6TOVD4jqAR9cqOxhLGOfA==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr12651586wrt.46.1625553317178; 
 Mon, 05 Jul 2021 23:35:17 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id k15sm1598996wms.21.2021.07.05.23.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 23:35:16 -0700 (PDT)
Subject: Re: [PATCH 1/2 v3] Configure script for Haiku
To: Richard Zak <richard.j.zak@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAOakUfO=C+pgcwopdTCrsH3vtFuFWo8QQBU8kEjnE=_3q-mMYg@mail.gmail.com>
 <CAFEAcA9rAAuzCh3MVSnfrBWZSvHVrmMqgqJ8OX0=nQKDXoVPpg@mail.gmail.com>
 <CAOakUfMYsaPCWdTWodJX2c1oSV-z3+A7cQ_TAJ1a0OLSXt5nAg@mail.gmail.com>
 <CAOakUfP01E38VfL-ZHtxn+iAurRnBda+_v8r=X6aQt_4uGEq=A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7ae08029-44fb-8277-fe7c-350fe9a5bd99@redhat.com>
Date: Tue, 6 Jul 2021 08:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfP01E38VfL-ZHtxn+iAurRnBda+_v8r=X6aQt_4uGEq=A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2021 21.21, Richard Zak wrote:
> The configure script doesn't test for presence of TPM device or support. It 
> activates TPM support if not explicitly disabled, and disables TPM support 
> if explicitly enabled on Windows. With TPM support compiled in, it causes an 
> assertion failure on launch of qemu at util/async.c:669 
> qemu_set_current_aio_context() !my_aiocontext. I haven't yet figured out why 
> though, but disabling TPM might be best, and there's precedent for it as 
> it's disabled if compiling for Windows.

Ok, then please add this information (about the assertion failure) to the 
patch description. And please handle the tpm disablement for Haiku in the 
same spot as the disablement for Windows, so that people still get a sane 
error message in case they try to configure with --enable-tpm on Haiku.

  Thanks,
   Thomas


> În dum., 4 iul. 2021 la 14:29, Richard Zak <richard.j.zak@gmail.com 
> <mailto:richard.j.zak@gmail.com>> a scris:
> 
> 
>     În dum., 4 iul. 2021 la 13:11, Peter Maydell <peter.maydell@linaro.org
>     <mailto:peter.maydell@linaro.org>> a scris:
> 
>         On Sun, 4 Jul 2021 at 17:44, Richard Zak <richard.j.zak@gmail.com
>         <mailto:richard.j.zak@gmail.com>> wrote:
>          >
>          > Use system capstone, for which a port is maintained by Haiku.
>         Disable TPM which isn't supported.
>          >
>          > Signed-off-by: Richard Zak <richard.j.zak@gmail.com
>         <mailto:richard.j.zak@gmail.com>>
>          > ---
>          >  configure | 3 +++
>          >  1 file changed, 3 insertions(+)
>          >
>          > diff --git a/configure b/configure
>          > index e799d908a3..c928071f69 100755
>          > --- a/configure
>          > +++ b/configure
>          > @@ -358,6 +358,7 @@ oss_lib=""
>          >  bsd="no"
>          >  linux="no"
>          >  solaris="no"
>          > +haiku="no"
>          >  profiler="no"
>          >  cocoa="auto"
>          >  softmmu="yes"
>          > @@ -769,6 +770,8 @@ SunOS)
>          >  ;;
>          >  Haiku)
>          >    haiku="yes"
>          > +  tpm="no"
> 
>         If the autodetect for tpm doesn't get this right, we should fix
>         the autodetect.
> 
>         As a general principle we prefer to avoid "do this specific thing
>         for this specific host OS" whenever we can, in favour of "test
>         whether we have whatever feature/function/library is required".
> 
>         thanks
>         -- PMM
> 
> 
>     Totally makes sense, and I'll be mindful of that. In this case, the
>     configure script is enabling TPM support on Haiku, but I don't think it
>     breaks anything, but I haven't tested it yet.
> 
>     -- 
>     Regards,
> 
>     Richard J. Zak
>     Professional Genius
>     PGP Key: https://keybase.io/rjzak/key.asc <https://keybase.io/rjzak/key.asc>
> 
> 
> 
> -- 
> Regards,
> 
> Richard J. Zak
> Professional Genius
> PGP Key: https://keybase.io/rjzak/key.asc <https://keybase.io/rjzak/key.asc>


