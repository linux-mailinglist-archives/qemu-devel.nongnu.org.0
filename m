Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CAA52230C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 19:44:56 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noTup-00066H-JN
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 13:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1noTqg-0004xm-Dp
 for qemu-devel@nongnu.org; Tue, 10 May 2022 13:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1noTqd-0005Ox-HA
 for qemu-devel@nongnu.org; Tue, 10 May 2022 13:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652204434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=437OZqj81Jo0zlMk69mLnD9M55+Cna1lZokVsTjwi5Q=;
 b=hNjLiQIJU2rt6+A6jw7wvMQpDMgZ5ok7vk5rHwS6hpSorCHI6BL/OZzuNLuh9iEVzeNOJq
 ahFm9/f0agnQC5/daPma8ami6NKPXRnZZwNtQLyb3+eyaM5gswMVmHmUiGxzIyBR0M2vMs
 +7RPq/0sdOzCwC+dJeXJ5mT7LgW8eFo=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-ytewYajXMDG35aqhSui1ug-1; Tue, 10 May 2022 13:40:33 -0400
X-MC-Unique: ytewYajXMDG35aqhSui1ug-1
Received: by mail-vk1-f198.google.com with SMTP id
 y187-20020a1f7dc4000000b003523a47f39fso1750406vkc.19
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=437OZqj81Jo0zlMk69mLnD9M55+Cna1lZokVsTjwi5Q=;
 b=ffD+W30GBzVrbHOOnzBgm+D5LnPo4LM77NFd1m8cb5B3LgUesaK+VT7l/Zk1iMOpiE
 Qs49PuV8YOk5PTmB1GaWj1WgUF/qPII6cyuXMyFvNmHcDuyDJJQnyyDUP6Wk9QkEoks5
 0BuKc4i/N1Z7h3c/b63QJGZESNW1JDNTwKFYlBnU8GXU71SN+QOm5g4Wma/QuwuZpWsX
 x5AZAPxK8uOsECWHl1P6SmYxuGOn6liJgVw0Ghxu0vXvr2BJenADbO/ivqGletiG9TE2
 ayCynAHhTHD0AyB81UT7XqBdCioMHaZC8DznMLienjTaj2EXOzKmN/3ztxBdyYUcgnaR
 O36A==
X-Gm-Message-State: AOAM533fohs6HqPJx1cH81BkZjDsim4MmfnpPQq8VeG6eyQ0R5XPKkmM
 TXguXGcoLHrDaeCTl9DLiP/NhPrLRLqcDpdfm8VD9pQmSVZ+iQesuTvGi8ECRz9juRtiYhjceL7
 kLcld1RvZ1YJuVfOQKETMU7q4Mv8f2FQ=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr12387496vsr.11.1652204432691; 
 Tue, 10 May 2022 10:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNCzlDZkg+eWhbg+vGmboiSc2qiu2COZAy2kHTzYi9xpETgZSK2CiDZWPcXrePBBXCXH6AMYxMppWt88hIx9c=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr12387483vsr.11.1652204432479; Tue, 10
 May 2022 10:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOQAP1J94zH1pEK@redhat.com>
 <6f3c3414-f837-85c9-b401-d856f091ddf4@redhat.com>
In-Reply-To: <6f3c3414-f837-85c9-b401-d856f091ddf4@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 10 May 2022 13:40:20 -0400
Message-ID: <CAFn=p-adaBqmBu1dUqZk6xYR1jXAum8kw+TqKfsnDo8741QDNg@mail.gmail.com>
Subject: Re: iotests and python dependencies
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 5, 2022 at 5:28 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/5/22 10:51, Kevin Wolf wrote:
> > If not, I guess it would be enough if iotests just checks that the venv
> > exists and all of the dependencies are there in the right version and
> > error out if not, telling the user to run 'make check-venv'.
> >
> > Or actually, it could just unconditionally run 'make check-venv' by
> > itself, which is probably easier to implement than checking the
> > dependencies and more convenient for the user, too.
>
> Note that you would still have to add a 'check-block: check-venv'
> dependency in the Makefile, otherwise two "instances" of check-venv
> could run in parallel.
>
> One small complication is that on BSD systems the binary is actually
> called "gmake", so you'd have to pass the variable somehow
>
> Paolo
>

Dumb question: where would I express this dependency? I don't know
where the top-level "check-block" recipe gets defined.

--js


