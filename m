Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B438332F40
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:46:18 +0100 (CET)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiJ7-00051q-6a
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJglG-00020d-EG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:07:14 -0500
Received: from mail-il1-f181.google.com ([209.85.166.181]:33892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJglC-0001j7-Sd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:07:13 -0500
Received: by mail-il1-f181.google.com with SMTP id z9so13034938iln.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yO6QRTpcedw0yS00T4+CryFtM2L5dU0Csq7zRk6phoE=;
 b=YK+86Sb26bJMlpwHMyTeQojPvPxC5Yr7ipve/gMZuary7Nc4djcxmaVfSkzgMORCCT
 V7CZWyh+J+aly2k49G3HweltVmKpif3dhIedNA9+cLZjsG2Nn6GGQoFn6Sl/6wvuipb9
 iW02B4iPD2qntdwC60qM0c292qEbAD4k+gLITTvQg/S98yYRPd0c+5y8/QRs37CRlYWs
 MgZhjQ0cBMaSgF8t/5Ff9epfq4N3KC9r68Bpq0+ATkVJcOOMl0ROAb0fAb0mEt4j6yBg
 EeDO6YWfwtoXYNdoyEDO78ZYdhKDn1NlbBMeKuilrD2pcfJrvpYHmD4FmDgVqgvQqSM5
 mnKg==
X-Gm-Message-State: AOAM530DCuC3mXknefD6sB2TR4ILnwfn26xQYPOJjOsJnYmR28qK/TTQ
 0ej5dDFKGoE+NAq/ndsIYkhfEa4bN7I=
X-Google-Smtp-Source: ABdhPJxWC3PXc5be+cbmsNkMszqXK13+z2/SoNJ25w18eZNAWrWRUxTehsUY2pmyHZkw/ylmvebfKQ==
X-Received: by 2002:a92:d18e:: with SMTP id z14mr26138825ilz.130.1615313228517; 
 Tue, 09 Mar 2021 10:07:08 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id l12sm7868331ilv.51.2021.03.09.10.07.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 10:07:08 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id f20so14895680ioo.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:07:07 -0800 (PST)
X-Received: by 2002:a05:6638:91:: with SMTP id
 v17mr25922686jao.69.1615313227724; 
 Tue, 09 Mar 2021 10:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20210210105527.74943-1-r.bolshakov@yadro.com>
 <CA+E+eSDG74cL5kCvHmzk8RR17NGGb-_TA+DpXcqd1owuMvk1xw@mail.gmail.com>
 <YEd4wAwfts0Oma+W@SPB-NB-133.local>
In-Reply-To: <YEd4wAwfts0Oma+W@SPB-NB-133.local>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 9 Mar 2021 10:06:57 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDozGbT4iJQekjPhKfW-=VFoBYW=+TpArEf8FT3x5qYXw@mail.gmail.com>
Message-ID: <CA+E+eSDozGbT4iJQekjPhKfW-=VFoBYW=+TpArEf8FT3x5qYXw@mail.gmail.com>
Subject: Re: [PATCH] util/osdep: Avoid mprotect() RWX->NONE on Big Sur 11.2
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.181; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 5:31 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> On Sun, Mar 07, 2021 at 10:47:06PM -0800, Joelle van Dyne wrote:
> > On Wed, Feb 10, 2021 at 2:55 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> > >
> > > There's a change in mprotect() behaviour [1] in the latest macOS on M1
> > > and it's not yet clear if it's going to be fixed by Apple. For now we
> > > can avoid unsupported mprotect() calls. QEMU and qtests work fine
> > > without it.
> > >
> > > 1. https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
> > >
> > > Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
> > > Apple-Feedback: FB8994773
> > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> >
> > Reviewed-by: Joelle van Dyne <j@getutm.app>
> >
>
> Thanks!
>
> > FYI the "macOS 11.2, *" means it applies to all versions of iOS. I
> > think it only broke in iOS 14.2 but making it return on other versions
> > seems to be fine from my tests.
> >
>
> Hm... do you know how to say "for macOS 11.2 and above only"?
>
> Regards,
> Roman

What you have is fine for "macOS 11.2 and above" but the "*" means "OR
any version of any platform not macOS". If you have
"__builtin_available(macOS 11.2, iOS 14.4, *)" would mean macOS 11.2
and above OR iOS 14.4 and above (which is the release aligned with
macOS 11.2, not iOS 14.2 as I originally mistyped) OR any version of
any platform not macOS. However, I think it's fine here as making this
change doesn't break anything on older versions of iOS (or macOS as
well). Btw, there's also tvOS and watchOS which I'm not sure if this
bug applies (I assume yes) but QEMU doesn't run on those platforms
(yet).

-j

