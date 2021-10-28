Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95043DF8B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:54:46 +0200 (CEST)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg33V-0003bT-K6
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mg2ll-0003E0-C6
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mg2lj-0004RD-80
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635417382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usLIF5d//usagb1ggSffy4b5UHt+oXepfyekjt37p50=;
 b=iJ8IylUjleWQYMoveMYdLkLbbz4/nwXBwpL5/gV9nMoUn17D9Xy6hxyIKFNXdpPLR7wrTR
 7Fkrv3s8CpqZWhSfek8OmL8khb5AvhA5VxONXB821uRgfStp8d8dbIim6XMHWo4ligQU/0
 2AgenMj58hY/zGDOF9C6qqOYOSOr5zM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-4hXpPMh0P52jSdkKjbLuqg-1; Thu, 28 Oct 2021 06:36:21 -0400
X-MC-Unique: 4hXpPMh0P52jSdkKjbLuqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso2605891wmq.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 03:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=usLIF5d//usagb1ggSffy4b5UHt+oXepfyekjt37p50=;
 b=ezQ1vvA0ihHP1SfDoYHle49bJTjZLY2m72DCaSYZQ5s13gklaYzfNHo/6JKI2dX9G2
 5c1nx04onX0XhTWSyVZWNOKHqhb/aR54xfSYcyFhP2J85kkAeRsSFE3PiMRTx4rV/K0R
 1gxI5JL6FI85gU2YfhePea3KgxXIsLYbogp/IshbTD3dQm1bw2V0Qol6n0Z7nD4aD8Nz
 01mEUG2DVd46P8jduVYlKwVeuyr1kFjKW4FwBBLymE4+oz4bomUeJCCHTJVxb6TSEk1k
 3ZpZrSMaraH5SQz/q8Ew8tK6cCG0So1RrMcslyFBwuV1Svxwgft9wKF2O9C+J0M/C5/G
 A91g==
X-Gm-Message-State: AOAM530pfa4KjB3hHHY8ZXPD+hDCQbTcfLraZkzxsz5JxUb7QrYKxR2Z
 FfRtzrZohMB8iI3wC6F79pqEfnGrM+zARRkzvwj6PUe85R5h5+PKaBkLvioTRJlh7ry2gdosHBo
 Ys0cMl3WehZNOMxk=
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr3517227wmc.75.1635417379551; 
 Thu, 28 Oct 2021 03:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT19q53ZvutqKDE22xZa37vCshaolFGADzYqsmRz5HsKrf1Csc/8DbFeoFjlBFpakDbxQryA==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr3517209wmc.75.1635417379312; 
 Thu, 28 Oct 2021 03:36:19 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id c17sm2639789wrv.22.2021.10.28.03.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 03:36:19 -0700 (PDT)
Message-ID: <b7e07e35-fccb-4662-5528-fbf91368ba56@redhat.com>
Date: Thu, 28 Oct 2021 12:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 12/15] iotests/linters: Add entry point for linting via
 Python CI
To: John Snow <jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-13-jsnow@redhat.com>
 <df8bd300-1d04-7df8-7916-8b004766d173@redhat.com>
 <CAFn=p-ZrKaxnefmOJZRxt718jcSAe3TqeJAUch3DOaEne92cwg@mail.gmail.com>
 <CAFn=p-Z-4UYQJ+fLpwYUkLQoPwJGGuwS3tszs=6x2tCy0NgkoA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Z-4UYQJ+fLpwYUkLQoPwJGGuwS3tszs=6x2tCy0NgkoA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.21 21:45, John Snow wrote:
>
>
> On Tue, Oct 26, 2021 at 2:36 PM John Snow <jsnow@redhat.com> wrote:
>
>
>
>     On Tue, Oct 26, 2021 at 6:57 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>         On 19.10.21 16:49, John Snow wrote:
>         > We need at least a tiny little shim here to join test file
>         discovery
>         > with test invocation. This logic could conceivably be hosted
>         somewhere
>         > in python/, but I felt it was strictly the least-rude thing
>         to keep the
>         > test logic here in iotests/, even if this small function
>         isn't itself an
>         > iotest.
>         >
>         > Note that we don't actually even need the executable bit
>         here, we'll be
>         > relying on the ability to run this module as a script using
>         Python CLI
>         > arguments. No chance it gets misunderstood as an actual
>         iotest that way.
>         >
>         > (It's named, not in tests/, doesn't have the execute bit,
>         and doesn't
>         > have an execution shebang.)
>         >
>         > Signed-off-by: John Snow <jsnow@redhat.com>
>         > ---
>         >   tests/qemu-iotests/linters.py | 27 +++++++++++++++++++++++++++
>         >   1 file changed, 27 insertions(+)
>
>         Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
>     Thanks! I'll endeavor to try and clean up the list of exempted
>     files to continue cleaning up this mess, but it's not a top
>     priority right now. I'll put it on the backburner after I finish
>     typing the QAPI generator. A lot of the weird compatibility goop
>     will go away over time as I consolidate more of the venv logic.
>
>     (I think this series is good to go, now? I think it could be
>     applied in any order vs my other series. If you want, if/when you
>     give the go-ahead for the other series, I could just stage them
>     both myself and make sure they work well together and save you the
>     headache.)
>
>
> Update: I pre-emptively staged both series (the iotests one first, 
> followed by the AQMP one) to jsnow/python and verified that all of the 
> python tests pass for each commit between:
>
> [14] python-add-iotest-linters-to   # python: Add iotest linters to 
> test suite
> ...
> [22] python-iotests-replace-qmp     # python, iotests: replace qmp 
> with aqmp
>
> and I'm running the CI on all of that now at 
> https://gitlab.com/jsnow/qemu/-/pipelines/396002744
>
> (I just wanted to double-check they didn't conflict with each other in 
> any unanticipated ways. Let me know if I should send the PR or if 
> that'll just create hassle for you.)

No, I’m all good with you taking (the blame for) them. :)

Hanna


