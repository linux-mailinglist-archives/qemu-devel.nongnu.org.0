Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E73B76BD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:54:25 +0200 (CEST)
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyH0C-0006kk-8t
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGrw-0007nr-30
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGrt-0007xG-VR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OlrGwdI7goMVfwmMiRYGxdNAZCWFj35yJpOfoKKO4MU=;
 b=CkSsfa3/sE9n/Wz7o5OEAQuEeeFGjBzWxtEQiR0q6/eukg9CAWfjsZDVQToTjGkKPlX+0H
 9AyhNd7RwDNHZSV1ciSPF1T/uQYduoZFNzCMuChFSCMxosfj/OUfBnACqP27LPqRJcMOlZ
 vFtRzZDJJH00OSzDM07dBIw8u/wZ7ug=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-a0u38Fr_OPWB2UJVLHDIxg-1; Tue, 29 Jun 2021 12:45:43 -0400
X-MC-Unique: a0u38Fr_OPWB2UJVLHDIxg-1
Received: by mail-pj1-f69.google.com with SMTP id
 o11-20020a17090a420bb029016eed2aa304so13594058pjg.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 09:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=OlrGwdI7goMVfwmMiRYGxdNAZCWFj35yJpOfoKKO4MU=;
 b=cK8zSX01iwouvXMeE7YPBqKk2IQ2CyyFMuFc2jBprFAUR+SWla3auJnQYAnS5dkGbb
 dHbI4WlNuX0RES+UHbLG0s/mTFPJa5YTUru59f9AuwpnS+X2qIVQLBYDNhfCEu79V44D
 EJZjoLlVN/FTX55xDPkjNsc1DSYAGmhJKcmeeR/yrOJTCticQYyfJ3UwkSJtKDhS4mqm
 XfAEo5JmOiaP0WlZDnEih9Np60CZd2Dq533HW/ml+TzsLUAtEgZBYBri90Aciey1N0js
 9nmJRMVCVW+Ayy+Wl/B1eWOVeanBfmNun+rFogF7c6fn6ynPqV7oAgccvYH3N8OJf3PV
 pxkA==
X-Gm-Message-State: AOAM533ibxYyru7q+KvIiMcXL0A+JcoDXRD/vwBDVa1miACBgDLYePA2
 ejMJZYPNtysM0I8799Qoswd6/JG5DXLIszJGHdQJdMxfr5cWOHJMojZnmg4hkQU4GKSVjzPxD8Z
 Jbwbnw+EHb1v26js=
X-Received: by 2002:a17:90a:380b:: with SMTP id
 w11mr45170619pjb.19.1624985142640; 
 Tue, 29 Jun 2021 09:45:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwa/pdDNMvHLq0lrMHn1DRlIVbN9W4bexeVThMQXOweZnNvuUUP6MxrSXmDs9+WJktogMqeA==
X-Received: by 2002:a17:90a:380b:: with SMTP id
 w11mr45170604pjb.19.1624985142481; 
 Tue, 29 Jun 2021 09:45:42 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id f6sm12257225pfj.28.2021.06.29.09.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 09:45:41 -0700 (PDT)
Subject: Re: [PATCH 07/11] python: update help text for check-tox
To: John Snow <jsnow@redhat.com>
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-8-jsnow@redhat.com>
 <76b9d2ac-75f8-faa7-6198-16f5294004e9@redhat.com>
 <CAFn=p-ZLRSGjS4Gbd7iYqwo66umegwWEHR0o0a4UksqMrinEPA@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e5a23682-a833-cf9f-43a8-c7918f9e5c20@redhat.com>
Date: Tue, 29 Jun 2021 13:45:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFn=p-ZLRSGjS4Gbd7iYqwo66umegwWEHR0o0a4UksqMrinEPA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------6C9E1F2FED73EA7731BF09F6"
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
--------------6C9E1F2FED73EA7731BF09F6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/29/21 12:40 PM, John Snow wrote:
>
>
> On Mon, Jun 28, 2021 at 5:16 PM Wainer dos Santos Moschetta 
> <wainersm@redhat.com <mailto:wainersm@redhat.com>> wrote:
>
>     Hi,
>
>     On 6/25/21 12:45 PM, John Snow wrote:
>     > Move it up near the check-pipenv help text, and update it to
>     suggest parity.
>     >
>     > (At the time I first added it, I wasn't sure if I would be
>     keeping it,
>     > but I've come to appreciate it as it has actually helped uncover
>     bugs I
>     > would not have noticed without it. It should stay.)
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     > ---
>     >   python/Makefile | 8 ++++++--
>     >   1 file changed, 6 insertions(+), 2 deletions(-)
>     >
>     > diff --git a/python/Makefile b/python/Makefile
>     > index 07ad73ccd0..5cb8378b81 100644
>     > --- a/python/Makefile
>     > +++ b/python/Makefile
>     > @@ -9,13 +9,17 @@ help:
>     >       @echo "    Requires: Python 3.6 and pipenv."
>     >       @echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
>     >       @echo ""
>     > +     @echo "make check-tox:"
>     > +     @echo "    Run tests against multiple python versions."
>     > +     @echo "    These tests use the newest dependencies."
>     > +     @echo "    Requires: Python 3.6-3.10 and tox."
>
>     Nit: I'm not sure it is clear '3.6-3.10' is a range rather than a
>     specific version.
>
>
> It was meant to be a range. Would you prefer "3.6 - 3.10" instead, then?

I think it's better.

- Wainer

>
>     - Wainer
>

--------------6C9E1F2FED73EA7731BF09F6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/21 12:40 PM, John Snow wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFn=p-ZLRSGjS4Gbd7iYqwo66umegwWEHR0o0a4UksqMrinEPA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Jun 28, 2021 at 5:16
            PM Wainer dos Santos Moschetta &lt;<a
              href="mailto:wainersm@redhat.com" moz-do-not-send="true">wainersm@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi,<br>
            <br>
            On 6/25/21 12:45 PM, John Snow wrote:<br>
            &gt; Move it up near the check-pipenv help text, and update
            it to suggest parity.<br>
            &gt;<br>
            &gt; (At the time I first added it, I wasn't sure if I would
            be keeping it,<br>
            &gt; but I've come to appreciate it as it has actually
            helped uncover bugs I<br>
            &gt; would not have noticed without it. It should stay.)<br>
            &gt; Signed-off-by: John Snow &lt;<a
              href="mailto:jsnow@redhat.com" target="_blank"
              moz-do-not-send="true">jsnow@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;   python/Makefile | 8 ++++++--<br>
            &gt;   1 file changed, 6 insertions(+), 2 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/python/Makefile b/python/Makefile<br>
            &gt; index 07ad73ccd0..5cb8378b81 100644<br>
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
            &gt; +     @echo "    Requires: Python 3.6-3.10 and tox."<br>
            <br>
            Nit: I'm not sure it is clear '3.6-3.10' is a range rather
            than a <br>
            specific version.<br>
          </blockquote>
          <div><br>
          </div>
          <div>It was meant to be a range. Would you prefer "3.6 - 3.10"
            instead, then?<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I think it's better.</p>
    <p>- Wainer<br>
    </p>
    <blockquote type="cite"
cite="mid:CAFn=p-ZLRSGjS4Gbd7iYqwo66umegwWEHR0o0a4UksqMrinEPA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">  <br>
          </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            - Wainer<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------6C9E1F2FED73EA7731BF09F6--


