Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B23B76AF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:51:22 +0200 (CEST)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGxF-0006O7-5D
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGqk-00064Y-VO
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGqi-0006yZ-Jc
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985075;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PbKnJU+fBEhELThFoVMvNi9SS+cr0AtQ32UiVuzWuf4=;
 b=Qxzdqas/t2TkV9GIHKFMbKAlCz5Q/o0ypIdAIffzOPMAa8oBmoP5t3RYQDcpGXpvzI9vdq
 CGcH4tZhgTjhk52Irb4RzZBKuZCQNz9DvgZtWAcyU2StvCAYudoCfiZXRGLrr6cWiGgV5g
 1QlHJi9QLyEMYR5uG01eV2ibT1o/gUs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-zkQunpF0PSy7s4eiIbZhrw-1; Tue, 29 Jun 2021 12:44:33 -0400
X-MC-Unique: zkQunpF0PSy7s4eiIbZhrw-1
Received: by mail-pl1-f199.google.com with SMTP id
 d1-20020a1709027281b0290112c70b86f1so7441548pll.12
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 09:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=PbKnJU+fBEhELThFoVMvNi9SS+cr0AtQ32UiVuzWuf4=;
 b=sstqzOz4hA479nocxF04LAtYJXSkk/zvdLn7L4ZKs61y2O3nrIcgRG7ZhoKsp0mAiX
 yGcgPZCaDPYudUJcuSd6hP3lW2fy3UAzTaW4nEPyWk/SSSbVtr6hAkiuXYboXwWB8hZp
 P9or3N0xlmVV06UG8QTlgV3LnX4o5BASqtsWjCd0XMZG1MkNC65eE1zDUOs3H/fjYZ29
 VEMueUsK5OVQTmgTF2lMUu8mrWsTsbe8KqNUiU1dLhSoxQfy0eLXdNaS3evaTzsf/0X2
 uVMuiJS/2QO/ab/+Mgfyuo0VIrF8872v2YGzEdbye9JOe26NLeJLUoIWVTuG00hOQIMN
 7Ynw==
X-Gm-Message-State: AOAM533Faa9J1wYjIn0PFA0eb3KHoSAMtd7V4/uK+VX+jg1QOGIhu+Bc
 tNxzjAANh6JpCrYeDKGcIbdl/QAxtLgTKyDdADyhNc8d/2lEnE9G48OKoORDxHU1Z2GhF+hz4JQ
 6ej6F9v6RcB+xVVo=
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr45038490pjg.218.1624985072875; 
 Tue, 29 Jun 2021 09:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznvn3y+4M4IWEYf2NtonVwdQW2rkN1THSnC/+GIJyVDSKPUCCRkkgcR2DzeVBQzSsu07MU2g==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr45038467pjg.218.1624985072629; 
 Tue, 29 Jun 2021 09:44:32 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id c5sm18784904pfi.81.2021.06.29.09.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 09:44:32 -0700 (PDT)
Subject: Re: [PATCH 03/11] python: Re-lock pipenv at *oldest* supported
 versions
To: John Snow <jsnow@redhat.com>
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-4-jsnow@redhat.com>
 <bb313f2b-fc35-96b4-417e-cd3a996ea4a2@redhat.com>
 <CAFn=p-bsKFmGiSACV-fTSG7F=wx3s0yLRgakP7fJEgtMOtLHgw@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <3d65d976-903c-4730-e58c-c66884e1539f@redhat.com>
Date: Tue, 29 Jun 2021 13:44:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bsKFmGiSACV-fTSG7F=wx3s0yLRgakP7fJEgtMOtLHgw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------9BD6424BAA5E0EA6092014A0"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9BD6424BAA5E0EA6092014A0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/28/21 5:38 PM, John Snow wrote:
>
>
> On Mon, Jun 28, 2021 at 4:31 PM Wainer dos Santos Moschetta 
> <wainersm@redhat.com <mailto:wainersm@redhat.com>> wrote:
>
>
>     On 6/25/21 12:45 PM, John Snow wrote:
>     > tox is already testing the most recent versions. Let's use pipenv to
>     > test the oldest versions we claim to support. This matches the
>     stylistic
>     > choice to have pipenv always test our oldest supported Python
>     version, 3.6.
>     Currently tox is testing with 3.6 too. Should we remove that version
>     from the test matrix?
>
>
> Tox will test with 3.6, but against the very latest pylint/mypy. This 
> test will also use 3.6, but against the oldest pylint/mypy we claim to 
> support in the package metadata. I think they are both useful.
>
> The pipenv test will make sure we don't accidentally increase our 
> dependency requirements without noticing. This has some value for 
> other QEMU developers that are used to running and managing their own 
> linters, such as we did for a long time. I don't want to break their 
> environments by accident. (It also makes sure that no 3.7+ isms sneak 
> into the code by accident, too. This has historically been, and I 
> anticipate it will continue to be, a prominent problem in the Python 
> library.)
>
> The tox test gives us a heads up if there are incompatible changes 
> arriving in the bleeding edge for pylint/mypy et al that I will need 
> to be aware of before they are rolled out and wind up on random 
> developer's systems and start causing 'make check' to fail.
>
> I think it's worth keeping both for now, provided the run cost isn't 
> too great. At the moment it seems rather minimal.


While I was reviewing the next patches I started to understand the tox 
and pipenv testing strategies. I also think they are useful.

Thanks for the details explanation above.

- Wainer

>     >
>     > The effect of this is that the python-check-pipenv CI job on
>     gitlab will
>     > now test against much older versions of these linters, which
>     will help
>     > highlight incompatible changes that might otherwise go unnoticed.
>     >
>     > Update instructions for adding and bumping versions in
>     setup.cfg. The
>     > reason for deleting the line that gets added to Pipfile is
>     largely just
>     > to avoid having the version minimums specified in multiple places in
>     > config checked into the tree.
>     >
>     > (This patch was written by deleting Pipfile and Pipfile.lock, then
>     > explicitly installing each dependency manually at a specific
>     > version. Then, I restored the prior Pipfile and re-ran `pipenv lock
>     > --dev --keep-outdated` to re-add the qemu dependency back to the
>     pipenv
>     > environment while keeping the "old" packages. It's annoying,
>     yes, but I
>     > think the improvement to test coverage is worthwhile.)
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     > ---
>     >   python/Pipfile.lock | 113
>     +++++++++++++++++++++-----------------------
>     >   python/setup.cfg    |   4 +-
>     >   2 files changed, 56 insertions(+), 61 deletions(-)
>
>     Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com
>     <mailto:wainersm@redhat.com>>
>
>
> Thanks!

--------------9BD6424BAA5E0EA6092014A0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/28/21 5:38 PM, John Snow wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFn=p-bsKFmGiSACV-fTSG7F=wx3s0yLRgakP7fJEgtMOtLHgw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Jun 28, 2021 at 4:31
            PM Wainer dos Santos Moschetta &lt;<a
              href="mailto:wainersm@redhat.com" moz-do-not-send="true">wainersm@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            On 6/25/21 12:45 PM, John Snow wrote:<br>
            &gt; tox is already testing the most recent versions. Let's
            use pipenv to<br>
            &gt; test the oldest versions we claim to support. This
            matches the stylistic<br>
            &gt; choice to have pipenv always test our oldest supported
            Python version, 3.6.<br>
            Currently tox is testing with 3.6 too. Should we remove that
            version <br>
            from the test matrix?<br>
          </blockquote>
          <div><br>
          </div>
          <div>Tox will test with 3.6, but against the very latest
            pylint/mypy. This test will also use 3.6, but against the
            oldest pylint/mypy we claim to support in the package
            metadata. I think they are both useful.</div>
          <div><br>
          </div>
          <div>The pipenv test will make sure we don't accidentally
            increase our dependency requirements without noticing. This
            has some value for other QEMU developers that are used to
            running and managing their own linters, such as we did for a
            long time. I don't want to break their environments by
            accident. (It also makes sure that no 3.7+ isms sneak into
            the code by accident, too. This has historically been, and I
            anticipate it will continue to be, a prominent problem in
            the Python library.)<br>
          </div>
          <div><br>
          </div>
          <div>The tox test gives us a heads up if there are
            incompatible changes arriving in the bleeding edge for
            pylint/mypy et al that I will need to be aware of before
            they are rolled out and wind up on random developer's
            systems and start causing 'make check' to fail.</div>
          <div><br>
          </div>
          <div>I think it's worth keeping both for now, provided the run
            cost isn't too great. At the moment it seems rather minimal.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>While I was reviewing the next patches I started to understand
      the tox and pipenv testing strategies. I also think they are
      useful.</p>
    <p>Thanks for the details explanation above.</p>
    <p>- Wainer  <br>
    </p>
    <blockquote type="cite"
cite="mid:CAFn=p-bsKFmGiSACV-fTSG7F=wx3s0yLRgakP7fJEgtMOtLHgw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt;<br>
            &gt; The effect of this is that the python-check-pipenv CI
            job on gitlab will<br>
            &gt; now test against much older versions of these linters,
            which will help<br>
            &gt; highlight incompatible changes that might otherwise go
            unnoticed.<br>
            &gt;<br>
            &gt; Update instructions for adding and bumping versions in
            setup.cfg. The<br>
            &gt; reason for deleting the line that gets added to Pipfile
            is largely just<br>
            &gt; to avoid having the version minimums specified in
            multiple places in<br>
            &gt; config checked into the tree.<br>
            &gt;<br>
            &gt; (This patch was written by deleting Pipfile and
            Pipfile.lock, then<br>
            &gt; explicitly installing each dependency manually at a
            specific<br>
            &gt; version. Then, I restored the prior Pipfile and re-ran
            `pipenv lock<br>
            &gt; --dev --keep-outdated` to re-add the qemu dependency
            back to the pipenv<br>
            &gt; environment while keeping the "old" packages. It's
            annoying, yes, but I<br>
            &gt; think the improvement to test coverage is worthwhile.)<br>
            &gt;<br>
            &gt; Signed-off-by: John Snow &lt;<a
              href="mailto:jsnow@redhat.com" target="_blank"
              moz-do-not-send="true">jsnow@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;   python/Pipfile.lock | 113
            +++++++++++++++++++++-----------------------<br>
            &gt;   python/setup.cfg    |   4 +-<br>
            &gt;   2 files changed, 56 insertions(+), 61 deletions(-)<br>
            <br>
            Reviewed-by: Wainer dos Santos Moschetta &lt;<a
              href="mailto:wainersm@redhat.com" target="_blank"
              moz-do-not-send="true">wainersm@redhat.com</a>&gt;<br>
          </blockquote>
          <div><br>
          </div>
          <div>Thanks!<br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------9BD6424BAA5E0EA6092014A0--


