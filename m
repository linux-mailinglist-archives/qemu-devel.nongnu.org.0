Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81143B85BF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:06:18 +0200 (CEST)
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybn7-0001pY-VU
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybjz-0008Km-HN
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybjt-0002Q2-5H
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625065376;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QqP9LJFJT8d+jk9ExyxP5c6o6sQTP7oFdPC3MAszGKc=;
 b=GxriBRlllPWDVbdO3yPBFLx/sqJUXyoQUIHV3Z/z/7cG0i26IboQarP9Kz7FBxjBGxZaFx
 Yhmmx0l9+eYQToogNOGKdqM16sR8KjbPIt+JAXc3jDafja2LmmWSfpyALI55/T5RS2e2o9
 S2IS7P06Y5QOz/6OOXhnvNU4PsHoW/4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-hA1A1r-lP0-enfrposywNg-1; Wed, 30 Jun 2021 11:02:54 -0400
X-MC-Unique: hA1A1r-lP0-enfrposywNg-1
Received: by mail-pl1-f200.google.com with SMTP id
 t10-20020a170902b20ab029011b9ceafaafso1119559plr.11
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=QqP9LJFJT8d+jk9ExyxP5c6o6sQTP7oFdPC3MAszGKc=;
 b=oEn9SZfdVCzKUdxcR0Cx7knDNcpgID7Ot2+MM2/rviKc0+aF/SBstm8RTClLzVA3Q6
 GCvROF/21bMIpx95K3wCRm4CNYbATNsuoQlMWKaH9A7du3C167mkOGwxjooimDwZJkmL
 C8O+2k3PQAValkOqZ48eRknVStBZH7H6/dSgRyIjL0meORKLkrKAVVktaIZB6AheNwms
 B+BfZWYGfyK+hjdcaAJuiDdAIo4nc/C8i2oX1oQZEptk5+8v0X6igUqqTyiSNgI7E1vT
 jds+YYqTOulzD7qPlKIDaFzSvHXr7GNXurbNdAqHuLsVk/isy5qvuj8Mz4+z5kCjtSQc
 ObNg==
X-Gm-Message-State: AOAM532AxuGRldUzPmu1YTFgn1Jxco5iJ8v7VF3J3xGBvFxd4Wpx1kBa
 +K3nGXTKHjxo1TG/QQ25kBfqcvJoand1+tIlQmK6jClVAR7wjvdamMwQLIYPmTRj1ajme3a7d1A
 votzOqHhngdS0EAU=
X-Received: by 2002:aa7:8e19:0:b029:30c:3dbc:8d0f with SMTP id
 c25-20020aa78e190000b029030c3dbc8d0fmr17205941pfr.27.1625065373581; 
 Wed, 30 Jun 2021 08:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMDUV/oltlhncVcaS48/t1oCmKVR/0kiITsXIcWLSSpwFi94J+anSFi+BNmrVY+fLbAgwn2A==
X-Received: by 2002:aa7:8e19:0:b029:30c:3dbc:8d0f with SMTP id
 c25-20020aa78e190000b029030c3dbc8d0fmr17205885pfr.27.1625065373191; 
 Wed, 30 Jun 2021 08:02:53 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id h18sm23387423pgl.87.2021.06.30.08.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 08:02:52 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] python: add 'make check-dev' invocation
To: John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-12-jsnow@redhat.com>
 <CAKJDGDYrqaQpj+NH7p7WvnW1zzo3R3DQHhev33=ddcPAkga0NA@mail.gmail.com>
 <CAFn=p-aTMNMfcT_i57ZHoiG+TNEmXWME2KKnJvKPQQZ5F3H69g@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <874dc387-8b59-57dc-4d3f-00eef857eccc@redhat.com>
Date: Wed, 30 Jun 2021 12:02:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aTMNMfcT_i57ZHoiG+TNEmXWME2KKnJvKPQQZ5F3H69g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------16237AA36E79C0D0644B5EE8"
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
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------16237AA36E79C0D0644B5EE8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/30/21 11:58 AM, John Snow wrote:
>
>
> On Wed, Jun 30, 2021 at 10:41 AM Willian Rampazzo <wrampazz@redhat.com 
> <mailto:wrampazz@redhat.com>> wrote:
>
>     On Tue, Jun 29, 2021 at 6:43 PM John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>> wrote:
>     >
>     > This is a *third* way to run the Python tests. Unlike the first two
>     > (check-pipenv, check-tox), this version does not require any
>     specific
>     > interpreter version -- making it a lot easier to tell people to
>     run it
>     > as a quick smoketest prior to submission to GitLab CI.
>     >
>     > Summary:
>     >
>     >   Checked via GitLab CI:
>     >     - check-pipenv: tests our oldest python & dependencies
>     >     - check-tox: tests newest dependencies on all non-EOL python
>     versions
>     >   Executed only incidentally:
>     >     - check-dev: tests newest dependencies on whichever python
>     version
>     >
>     > ('make check' does not set up any environment at all, it just
>     runs the
>     > tests in your current environment. All four invocations perform the
>     > exact same tests, just in different execution environments.)
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     > ---
>     >  python/Makefile | 35 +++++++++++++++++++++++++++++++++--
>     >  1 file changed, 33 insertions(+), 2 deletions(-)
>     >
>
>     Reviewed-by: Willian Rampazzo <willianr@redhat.com
>     <mailto:willianr@redhat.com>>
>
>
> Thanks. I am squashing in a hotfix here to add .dev-venv to 
> .gitignore, too. Not worth an entire respin for that.
> (Assuming that's gonna be A-OK with both of you.)

Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


--------------16237AA36E79C0D0644B5EE8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/21 11:58 AM, John Snow wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFn=p-aTMNMfcT_i57ZHoiG+TNEmXWME2KKnJvKPQQZ5F3H69g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jun 30, 2021 at
            10:41 AM Willian Rampazzo &lt;<a
              href="mailto:wrampazz@redhat.com" moz-do-not-send="true">wrampazz@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Tue, Jun 29, 2021 at
            6:43 PM John Snow &lt;<a href="mailto:jsnow@redhat.com"
              target="_blank" moz-do-not-send="true">jsnow@redhat.com</a>&gt;
            wrote:<br>
            &gt;<br>
            &gt; This is a *third* way to run the Python tests. Unlike
            the first two<br>
            &gt; (check-pipenv, check-tox), this version does not
            require any specific<br>
            &gt; interpreter version -- making it a lot easier to tell
            people to run it<br>
            &gt; as a quick smoketest prior to submission to GitLab CI.<br>
            &gt;<br>
            &gt; Summary:<br>
            &gt;<br>
            &gt;   Checked via GitLab CI:<br>
            &gt;     - check-pipenv: tests our oldest python &amp;
            dependencies<br>
            &gt;     - check-tox: tests newest dependencies on all
            non-EOL python versions<br>
            &gt;   Executed only incidentally:<br>
            &gt;     - check-dev: tests newest dependencies on whichever
            python version<br>
            &gt;<br>
            &gt; ('make check' does not set up any environment at all,
            it just runs the<br>
            &gt; tests in your current environment. All four invocations
            perform the<br>
            &gt; exact same tests, just in different execution
            environments.)<br>
            &gt;<br>
            &gt; Signed-off-by: John Snow &lt;<a
              href="mailto:jsnow@redhat.com" target="_blank"
              moz-do-not-send="true">jsnow@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;  python/Makefile | 35
            +++++++++++++++++++++++++++++++++--<br>
            &gt;  1 file changed, 33 insertions(+), 2 deletions(-)<br>
            &gt;<br>
            <br>
            Reviewed-by: Willian Rampazzo &lt;<a
              href="mailto:willianr@redhat.com" target="_blank"
              moz-do-not-send="true">willianr@redhat.com</a>&gt;<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Thanks. I am squashing in a hotfix here to add .dev-venv
            to .gitignore, too. Not worth an entire respin for that.<br>
          </div>
          <div>(Assuming that's gonna be A-OK with both of you.)<br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <p>Acked-by: Wainer dos Santos Moschetta <a class="moz-txt-link-rfc2396E" href="mailto:wainersm@redhat.com">&lt;wainersm@redhat.com&gt;</a><br>
    </p>
  </body>
</html>

--------------16237AA36E79C0D0644B5EE8--


