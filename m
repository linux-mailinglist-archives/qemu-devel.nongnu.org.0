Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D16098F3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:42:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiWx-0003CQ-Lb
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHdI-0006n7-Fv
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHdG-0002IR-Vh
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666457158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYAVR1jHUtPi57tx7CG2T6Apb7CMk2tm9qSjgGCuHpA=;
 b=ct4uppAuuDyiMXM4rn5c10J4xdISdd4X56EmAvQwmzfb42R2/ynUpJu8Kr0VmlDUTUr3JI
 FiHGPzqSw0ZQSwt/ihmqvgXmoT44hBT2GBjejFL7yHbq2nNKyYuhq8W/9sMyu9kx2tBl1/
 yrDaUqRxme0ZPy6TLnmEmH0wGvCvc6Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-tuhdQpzZPoanhy4DhXF2kw-1; Sat, 22 Oct 2022 12:45:57 -0400
X-MC-Unique: tuhdQpzZPoanhy4DhXF2kw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso222512wrb.18
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 09:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYAVR1jHUtPi57tx7CG2T6Apb7CMk2tm9qSjgGCuHpA=;
 b=Ch75ABd3n8jIAGjg2SmFmlpYdpfUsaMgghxwEdQKVSGmCREuzSLtuPyLPhljUvYNZi
 8677XXAhH5t84KpAVHd2PgffAITDDbz1G3/6M8yIeMlWP0gw3M0OoOJVhSUIIEnEPWkX
 /5WmQr1wL4OUqH0P/AJp9Zu03hOvkbcME5w9WTcZJoZVg5udwK0jScfN/0M9SyAmyU9+
 cOjO88j3Gf7Y70Hme93JVrcACxiyNwpl4QFM9yM3tZ19urW3cqTtqyOXz20JyYxhj7hN
 xnneNbnopsNsfK/jtgbryBIHRvLFIVG9EvtBew+rtU2hoE8R+IFPY93LoOKWAQfM77N2
 XmjQ==
X-Gm-Message-State: ACrzQf2dJW0tNbooG0RfUci+ZwhvqA6/DYh/9hdZPM8oDldUX+GgHPZQ
 rlKrh+c2m81ykBTEudcY54jdXbghSmzlVJ1uyK/r+BmFwdOKfMJR+RCFORvjUeFAXPZszNTuwp6
 fB0tHcKH44lLBvuQ=
X-Received: by 2002:a05:600c:1c1e:b0:3c6:e39f:e62f with SMTP id
 j30-20020a05600c1c1e00b003c6e39fe62fmr17406905wms.69.1666457155762; 
 Sat, 22 Oct 2022 09:45:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6HoNSjmKkZ7qS+MUesWaXskXSEjpymWZyMnNje3jhGcFg943eSCoy1ntupX9XwpZPIP2VRWw==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:e39f:e62f with SMTP id
 j30-20020a05600c1c1e00b003c6e39fe62fmr17406878wms.69.1666457155390; 
 Sat, 22 Oct 2022 09:45:55 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7435:2100:975b:ee03:5e6d:6634])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d5190000000b00236488f62d6sm6441419wrv.79.2022.10.22.09.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 09:45:54 -0700 (PDT)
Date: Sat, 22 Oct 2022 12:45:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221022124113-mutt-send-email-mst@kernel.org>
References: <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org>
 <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <87lep95ffx.fsf@linaro.org>
 <CAARzgwyEWCNbs5HG07Dnv_pkzmHwB++Pr47enZ_uFupXZSH09g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwyEWCNbs5HG07Dnv_pkzmHwB++Pr47enZ_uFupXZSH09g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 21, 2022 at 09:47:04PM +0530, Ani Sinha wrote:
> 
> 
> On Fri, Oct 21, 2022 at 21:36 Alex Bennée <alex.bennee@linaro.org> wrote:
> 
> 
>     Ani Sinha <ani@anisinha.ca> writes:
> 
>     <snip>
>     >
>     >  We have added a mirror of biosbits to the QEMU project so there is no
>     >  reason why we can't track changes and modifications there (we do this
>     >  for TestFloat which is forked from the upstream SoftFloat code).
>     >
>     > The whole idea was that say an acpi developer added support for a new
>     table in QEMU, he should write a corresponding
>     > test for bits so that the same table is exercised during run time. Making
>     those changes from a single repo (either directly
>     > or through a submodule)  makes things lit simpler and also keeps things
>     in sync with each other. If we use separate
>     > repos for acpi bits test, it will be another mess when comes to
>     developers adding changes and keeping things in sync.
>     >
>     > Anyways these things should have been brought up earlier. I'm out of the
>     debate.
>     >
>     > I've sent v7 , incremental work over the last 6 months in my spare time
>     without getting any pay. So take it or scrap it.
>     >
>     > 😊
> 
>     I'm sorry you feel that way but you asked for people to spend their time
>     reviewing your code and giving feedback.
> 
> 
> 
> I’m sorry but you don’t understand. Giving feedback is one thing. Asking people
> to make major changes to their design late in the game is completely not
> acceptable imho and outright rude. . I’ve been sending out the patch series
> with cc to anyone who should remotely care about this stuff. So if major rework
> is needed it should be pointed out earlier and not later. I’ve begged people on
> irc even to take look at this stuff including Igor and others. What else do you
> expect me to do? 
> 
> 
>     If you don't have time to take
>     it forward then fine
> 
> 
> I’m extremely discouraged by this and have lost all motivation. It’s not that I
> have no time. I squeeze all my spare time to work on this beyond my paid
> responsibilities. Please be respectful of that.
> 


Woa I hope you'll get the motivation back.

I feel more testing for acpi can only help, even if it is
limited to specific hosts at the moment.

Let's start small, and build out.

So IMHO major changes aren't strictly necessary to get this merged.
Alex sent a bunch of code review comments - do you think you can
address them?
The limitations and TODO should just IMHO be mentioned in the
cover letter and probably in comments in the code.

Thanks!


> 
>     but I'm afraid a "take it or leave it" attitude
>     will just result in it not getting merged.
> 
>     Hopefully someone else who has the time to look into it will be able to
>     pick it up later.
> 
>     --
>     Alex Bennée
> 


