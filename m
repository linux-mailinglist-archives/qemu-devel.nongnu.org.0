Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DB3B88D6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:58:54 +0200 (CEST)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfQD-00073W-Om
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyfN1-0000ix-E6
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyfMs-0006MZ-JM
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625079325;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YkhbS+b8YlXtwPDYG7J/rzEBZMIvHBLcES/TkwVQbKw=;
 b=iDh410VZ2Jl4Mif3TuAjOytJhhvYflX2DfLxxyzqFSyAb4DgTYXIw6RT9YFACbM6PdubPO
 Dbwu59whwrT/3tjGRq0NFWjjXHmfHOEpXLS/nuNyUDOjnPAOw4YUoldpBtoXbiPnq7Ou5Q
 RlS4s3nVqQ6gUd3imrztGuapNN4e65E=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-JYrjBAoGMlK8CIbVhuQAqA-1; Wed, 30 Jun 2021 14:55:23 -0400
X-MC-Unique: JYrjBAoGMlK8CIbVhuQAqA-1
Received: by mail-pf1-f200.google.com with SMTP id
 k196-20020a6284cd0000b0290301abd2c063so2326626pfd.14
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=YkhbS+b8YlXtwPDYG7J/rzEBZMIvHBLcES/TkwVQbKw=;
 b=P8FYcFkp4DEVLhUY1x+HtwBg1tqsiqq2mj00Q8p6gdGefc99o8M2yvY6Bis/puK17v
 bmVKwk51xLZ4jwG07NS+kppdL+VypSguXrcrruobelT3/6hHAPxmVsB9S7fA6ELH9Qw5
 3GHekJNV08n4Pa+ZnYNRMSz8lcj0sohl2zS2Yy1HJQ5pf+lSBWGtq2gqIf4++k7R8Hxr
 gApwODyRnGAFLAuSch4C0TY97gRdfU0DxV5kX1ODstXble9SEYAYVSIThw+3OGy12JLu
 qnGtSXoaSeAsDpPZCkb6xznFwNdqgw/nHMvAI/pkaKP9dWTvc7/unDKr6ifCJUE2vnuh
 FlaQ==
X-Gm-Message-State: AOAM533zVohBS0VXo97bAuf1JwM+qa9WGo+EmhEIviAPNPmrbYXUK3oT
 CZkN93sqrkX09/B80TErmDxpyW7VdirXs1UjfVYfjCZwn06LP1hrGapsAOx7nKNfOPnKSCHFUr8
 ImD6rbDJhVquKeIo=
X-Received: by 2002:a63:4e42:: with SMTP id o2mr35606078pgl.49.1625079322841; 
 Wed, 30 Jun 2021 11:55:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2rvBo7iqZji5IhbhVk2zFZkPuNjrV7oKNRu9gszrlj9Wfr7olJx6VQLHIfwyp5vKIuGDoag==
X-Received: by 2002:a63:4e42:: with SMTP id o2mr35606057pgl.49.1625079322620; 
 Wed, 30 Jun 2021 11:55:22 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id c3sm2495458pfv.56.2021.06.30.11.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 11:55:22 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] python: update help text for check-tox
To: John Snow <jsnow@redhat.com>
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-8-jsnow@redhat.com>
 <e8531bbc-aa56-784e-1fe7-f4c4ce5fdd62@redhat.com>
 <CAFn=p-YNQE-t=KmY8kkVGxsfF6RYy2Ph42kHYOgf3TJ0u-Bcvg@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <76f6f606-66f8-c25c-4d2a-1f71f88b2232@redhat.com>
Date: Wed, 30 Jun 2021 15:55:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFn=p-YNQE-t=KmY8kkVGxsfF6RYy2Ph42kHYOgf3TJ0u-Bcvg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------0FBE579D9E7540832201230D"
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
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
--------------0FBE579D9E7540832201230D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/29/21 6:27 PM, John Snow wrote:
>
>
> On Tue, Jun 29, 2021 at 4:25 PM Wainer dos Santos Moschetta 
> <wainersm@redhat.com <mailto:wainersm@redhat.com>> wrote:
>
>     Hi John,
>
>     On 6/29/21 1:42 PM, John Snow wrote:
>     > Move it up near the check-pipenv help text, and update it to
>     suggest parity.
>     >
>     > (At the time I first added it, I wasn't sure if I would be
>     keeping it,
>     > but I've come to appreciate it as it has actually helped uncover
>     bugs I
>     > would not have noticed without it. It should stay.)
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     > Reviewed-by: Willian Rampazzo <willianr@redhat.com
>     <mailto:willianr@redhat.com>>
>     > ---
>     >   python/Makefile | 8 ++++++--
>     >   1 file changed, 6 insertions(+), 2 deletions(-)
>     >
>     > diff --git a/python/Makefile b/python/Makefile
>     > index 07ad73ccd0..d2cfa6ad8f 100644
>     > --- a/python/Makefile
>     > +++ b/python/Makefile
>     > @@ -9,13 +9,17 @@ help:
>     >       @echo "    Requires: Python 3.6 and pipenv."
>     >       @echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
>     >       @echo ""
>     > +     @echo "make check-tox:"
>     > +     @echo "    Run tests against multiple python versions."
>     > +     @echo "    These tests use the newest dependencies."
>     > +     @echo "    Requires: Python 3.6 - 3.10, and tox."
>     > +     @echo "    Hint (Fedora): 'sudo dnf install python3-tox
>     python3.10'"
>     > +     @echo ""
>
>     Somewhat related... in my system I don't have all supported python
>     versions installed, thus check-tox fails.
>
>     Instead, maybe, you could configure tox (as below) to test to
>     whatever
>     supported versions the developer have installed in the system; and on
>     absence of some versions it won't fail the tests entirely.
>
>     diff --git a/python/setup.cfg b/python/setup.cfg
>     index e730f208d3..1db8aaf340 100644
>     --- a/python/setup.cfg
>     +++ b/python/setup.cfg
>     @@ -123,6 +123,7 @@ multi_line_output=3
>
>       [tox:tox]
>       envlist = py36, py37, py38, py39, py310
>     +skip_missing_interpreters=true
>
>
> Didn't know this was an option, to be honest ... I wonder if it can be 
> toggled on/off easily? I like the idea that it will fail if we don't 
> set up the CI environment correctly instead of succeeding quietly.
>
> Though, you're right, some is better than none. Send a patch if you want?


I just sent a patch. Message-Id: 
<20210630184546.456582-1-wainersm@redhat.com>

- Wainer

>
> --js

--------------0FBE579D9E7540832201230D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/21 6:27 PM, John Snow wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFn=p-YNQE-t=KmY8kkVGxsfF6RYy2Ph42kHYOgf3TJ0u-Bcvg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Jun 29, 2021 at 4:25
            PM Wainer dos Santos Moschetta &lt;<a
              href="mailto:wainersm@redhat.com" moz-do-not-send="true">wainersm@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi John,<br>
            <br>
            On 6/29/21 1:42 PM, John Snow wrote:<br>
            &gt; Move it up near the check-pipenv help text, and update
            it to suggest parity.<br>
            &gt;<br>
            &gt; (At the time I first added it, I wasn't sure if I would
            be keeping it,<br>
            &gt; but I've come to appreciate it as it has actually
            helped uncover bugs I<br>
            &gt; would not have noticed without it. It should stay.)<br>
            &gt;<br>
            &gt; Signed-off-by: John Snow &lt;<a
              href="mailto:jsnow@redhat.com" target="_blank"
              moz-do-not-send="true">jsnow@redhat.com</a>&gt;<br>
            &gt; Reviewed-by: Willian Rampazzo &lt;<a
              href="mailto:willianr@redhat.com" target="_blank"
              moz-do-not-send="true">willianr@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;   python/Makefile | 8 ++++++--<br>
            &gt;   1 file changed, 6 insertions(+), 2 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/python/Makefile b/python/Makefile<br>
            &gt; index 07ad73ccd0..d2cfa6ad8f 100644<br>
            &gt; --- a/python/Makefile<br>
            &gt; +++ b/python/Makefile<br>
            &gt; @@ -9,13 +9,17 @@ help:<br>
            &gt;       @echo "    Requires: Python 3.6 and pipenv."<br>
            &gt;       @echo "    Hint (Fedora): 'sudo dnf install
            python3.6 pipenv'"<br>
            &gt;       @echo ""<br>
            &gt; +     @echo "make check-tox:"<br>
            &gt; +     @echo "    Run tests against multiple python
            versions."<br>
            &gt; +     @echo "    These tests use the newest
            dependencies."<br>
            &gt; +     @echo "    Requires: Python 3.6 - 3.10, and tox."<br>
            &gt; +     @echo "    Hint (Fedora): 'sudo dnf install
            python3-tox python3.10'"<br>
            &gt; +     @echo ""<br>
            <br>
            Somewhat related... in my system I don't have all supported
            python <br>
            versions installed, thus check-tox fails.<br>
            <br>
            Instead, maybe, you could configure tox (as below) to test
            to whatever <br>
            supported versions the developer have installed in the
            system; and on <br>
            absence of some versions it won't fail the tests entirely.<br>
            <br>
            diff --git a/python/setup.cfg b/python/setup.cfg<br>
            index e730f208d3..1db8aaf340 100644<br>
            --- a/python/setup.cfg<br>
            +++ b/python/setup.cfg<br>
            @@ -123,6 +123,7 @@ multi_line_output=3<br>
            <br>
              [tox:tox]<br>
              envlist = py36, py37, py38, py39, py310<br>
            +skip_missing_interpreters=true<br>
          </blockquote>
          <div><br>
          </div>
          <div>Didn't know this was an option, to be honest ... I wonder
            if it can be toggled on/off easily? I like the idea that it
            will fail if we don't set up the CI environment correctly
            instead of succeeding quietly.<br>
          </div>
          <div><br>
          </div>
          <div>Though, you're right, some is better than none. Send a
            patch if you want?</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I just sent a patch. Message-Id:
      <a class="moz-txt-link-rfc2396E" href="mailto:20210630184546.456582-1-wainersm@redhat.com">&lt;20210630184546.456582-1-wainersm@redhat.com&gt;</a></p>
    <p>- Wainer<br>
    </p>
    <blockquote type="cite"
cite="mid:CAFn=p-YNQE-t=KmY8kkVGxsfF6RYy2Ph42kHYOgf3TJ0u-Bcvg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>--js<br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0FBE579D9E7540832201230D--


