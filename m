Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31DF690E06
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9Ve-0006Uq-I5; Thu, 09 Feb 2023 11:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ9VZ-0006To-Sb
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ9VX-0001AA-Qc
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675959046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6ZbuHMLSRX16HKNFJWZ5Zjgqh4/L8aS5dYZUyyZJEM=;
 b=MIY+UAKG1NaDUvDoSQiixrK+7ZkhnjzhAWngvCC7uY8d1/Gjy+esJ88SiH6RersaM/H9Ie
 53wYqqeh3jsiyT55Mh36VqfDOZC8bJqnWxPnPsY4Kl1iWmm39AfT+fo3g6IGySkbB3/umO
 dSOpECA5hbn2KYMVqOo0l0dVge7st1c=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-cwA7hy5wPrS-OxuXANLKEA-1; Thu, 09 Feb 2023 11:10:38 -0500
X-MC-Unique: cwA7hy5wPrS-OxuXANLKEA-1
Received: by mail-pg1-f200.google.com with SMTP id
 s76-20020a632c4f000000b0049ceb0f185eso1274140pgs.7
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 08:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j6ZbuHMLSRX16HKNFJWZ5Zjgqh4/L8aS5dYZUyyZJEM=;
 b=Otcf0A54b5YW10J7tZ/NvGEgyntFKIidDSEhENBtUDWjkx7tKOPOhmKMAOmRVPxUWU
 jzlkNotZBy47cHz6Y2d0Hltuq1jt3ku/A4gLjeMVPzO7FAs9YaTI9VfLxJ259X+eRRIo
 3Bb1FELY41O0GpwwJ6rzz2ul/KsGu7G8VfcHkepeKaV/vLFQ94sEGO2I032mrquPxEsD
 frxG7qAgfOQ0kgG4suQVRQ1Ka/7nzkCjZZQDxNYIJxPO8b3mBQZrzyeDzqQltFpbtn0Z
 Gd+TT1AaLgR8ZQdaFPQnF/KixVAyFY9gb0ekaV5RsDqsuxu4bdencqCYr+DvyfK4/V14
 W29w==
X-Gm-Message-State: AO0yUKUwOQEweT35uJ6n5EvmsqhYoK70PP8RUnfmcuX83pMQUypffIVQ
 700YxniuKoxxpHR3om+P3mzeHfzS2hRVA/bcFBl99c0AEOI848KBFy3saPhhKK3QWcquRWt7mkK
 zljmODJna/H3P+Vb+I3H67Xo43Us/VGM=
X-Received: by 2002:a17:90a:bd92:b0:22b:aa69:ccc3 with SMTP id
 z18-20020a17090abd9200b0022baa69ccc3mr1643098pjr.35.1675959036926; 
 Thu, 09 Feb 2023 08:10:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9h/WmsV59TNLXI4WTiTq2HNq4tfVNuMI5DRvRh82CLXKQgs+K7Lk2fT9rbjaeez5V63yvlDlHQyIAR2Nrl8M8=
X-Received: by 2002:a17:90a:bd92:b0:22b:aa69:ccc3 with SMTP id
 z18-20020a17090abd9200b0022baa69ccc3mr1643083pjr.35.1675959036588; Thu, 09
 Feb 2023 08:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-6-jsnow@redhat.com>
 <273ab983-338b-1aa2-6317-ed5a9099b574@redhat.com>
In-Reply-To: <273ab983-338b-1aa2-6317-ed5a9099b574@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 9 Feb 2023 11:10:25 -0500
Message-ID: <CAFn=p-aT8r4qMo6s3e=oPkubVCU3gDf5Zq=qfjQ0p8_UsYxfiw@mail.gmail.com>
Subject: Re: [PATCH 5/7] testing: Add Python >= 3.7 to Centos, OpenSuSE
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Feb 9, 2023 at 10:56 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 09/02/2023 16.40, John Snow wrote:
> > This is just a proof-of-concept patch, as these files are lcitool
> > generated. The real fix will involve updating the lcitool configuration
> > and updating these files that way.
>
> I think it would be good to have a RFC or DONOTMERGE in the patch title, so
> that it is clear right from the start that this should not get merged.

Apologies. I just assumed there'd be no risk of this passing review :)
If there's any point in me respinning this with the proof-of-concept
again, I'll add a DO-NOT-MERGE tag.

>
> > Note that this requires OpenSuSE Leap 15.3; 15.2 won't cut it.
>
> Looking at https://en.wikipedia.org/wiki/OpenSUSE#Version_history it seems
> like even 15.3 is EOL already, so I think we can switch to 15.4 immediately.
>

Noted. Some of the patches in this series are a bit old, admittedly,
so I'll re-review these requirements.

I'm hoping to hear from Dan/Alex on the subject of coverage, because I
don't really know what our current strategy is or what our coverage
ought to be. If CI minutes were infinitely free, I'd suggest we test
both CentOS 8 and 9 simultaneously, alongside with every currently
supported OpenSuSE version, but I imagine that's not really truly on
the table.

I imagine we want to have a mixture of "cutting edge" with "oldest we
still support" to try and cover the spread of likely scenarios, but I
am not sure what the strategies for which to keep at which versions
are.

>   Thomas
>


