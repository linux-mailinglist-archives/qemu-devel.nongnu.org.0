Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE563A34E6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:33:20 +0200 (CEST)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRMd-0007dM-Kv
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lrRL4-0006kW-ST
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lrRL1-0001EV-5O
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623357097;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nNj3Thnjb9HODAzmOBLI+fl1fu6EDWkL+/kSfqDfKIA=;
 b=VUyH+IQmask+ortlozk8RAs44fBX0XAfb19KY8vo2RZDkquRFuz/mKkRPeTRW739PwVdx+
 Jx39oI2i1BeKoPrvOiabcFyw1QD4bPPr3cWci8p2BWS3kSswSNMfa9SqUANLUABwA2r6eP
 ZXWMpoqm6cnhY6yX9FAzKcl+HZzvKjk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-oIFqnQYhNSe-GQCSAdszgg-1; Thu, 10 Jun 2021 16:31:35 -0400
X-MC-Unique: oIFqnQYhNSe-GQCSAdszgg-1
Received: by mail-qt1-f198.google.com with SMTP id
 z9-20020a05622a0609b02901f30a4fcf9bso635652qta.4
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 13:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=nNj3Thnjb9HODAzmOBLI+fl1fu6EDWkL+/kSfqDfKIA=;
 b=E4pqq9PHuLAGCJHTY6Zmnb1bNo/nIYj8pRmB81E8bkE1b16AyrgarlRREM+KDgrseV
 7mj0Y7edQWYUlVtroQ0MCz5w/TL69z0xFpwsqP5wnKKXxAWkw2DIMakoMKVUFJA4uK7T
 E5s9MNN72sVcpV/yurh/C5VMO8q4CtwHKCpXelynu3+QK4yfzef7anPYUeI+9EnoxCij
 JuyS9ppRYPgWYwbN5rn7u5OwKXvtGZgyMV2U3znXcMAArZStm2Ey/WR6wXX6/myTf0yD
 sGh7XyB7GDhIKh2aNAKNJLHzGGZQlmcosqzmsqdnpN8Nh+b/REeNNJK1RKSUymKWZKUX
 DjSA==
X-Gm-Message-State: AOAM531m20jYyxFjHpoyvv4t5pxQboHQE7NJLl4fjPj8qla5N54/HfXS
 4OF932umKrr3uYsfAkMU5xjNuKjMIfK8o0UhVxk2fZGxaFF+/RobCVGn7jyoqpRFy6oTh+udQfq
 iyFLrAhb/fXE4RAE=
X-Received: by 2002:a05:622a:210:: with SMTP id
 b16mr650494qtx.51.1623357095167; 
 Thu, 10 Jun 2021 13:31:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqYI4dUQwYGnnRNnyAhUrFW2CoLKz84YRrH2NDpVKvceeh5l1R/eVTaUPcmhjQPH9oddmpwg==
X-Received: by 2002:a05:622a:210:: with SMTP id
 b16mr650474qtx.51.1623357094964; 
 Thu, 10 Jun 2021 13:31:34 -0700 (PDT)
Received: from wainer-laptop.localdomain ([177.69.178.131])
 by smtp.gmail.com with ESMTPSA id c68sm2936771qkd.112.2021.06.10.13.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 13:31:34 -0700 (PDT)
Subject: Re: [PATCH 2/4] Python QEMU utils: introduce a generic feature list
To: Cleber Rosa Junior <crosa@redhat.com>
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-3-crosa@redhat.com>
 <f2c7ab9f-27b4-aa04-75f5-fcb8a36a4668@redhat.com>
 <CA+bd_6J-eA_VXyJZHEe3WiS2Cged+C=Ugs5YOGv4k01aczRAZw@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d695b236-6ee1-4481-229c-3d25de8e637e@redhat.com>
Date: Thu, 10 Jun 2021 17:31:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CA+bd_6J-eA_VXyJZHEe3WiS2Cged+C=Ugs5YOGv4k01aczRAZw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------BA3D4F5B9D81BEC5C4020E6F"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------BA3D4F5B9D81BEC5C4020E6F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 6/8/21 8:55 PM, Cleber Rosa Junior wrote:
>
>
> On Tue, Jun 8, 2021 at 5:42 PM Wainer dos Santos Moschetta 
> <wainersm@redhat.com <mailto:wainersm@redhat.com>> wrote:
>
>     Hi,
>
>     On 6/8/21 11:09 AM, Cleber Rosa wrote:
>     > Which can be used to check for any "feature" that is available as a
>     > QEMU command line option, and that will return its list of available
>     > options.
>     >
>     > This is a generalization of the list_accel() utility function, which
>     > is itself re-implemented in terms of the more generic feature.
>     >
>     > Signed-off-by: Cleber Rosa <crosa@redhat.com
>     <mailto:crosa@redhat.com>>
>     > ---
>     >   python/qemu/utils/__init__.py |  2 ++
>     >   python/qemu/utils/accel.py    | 15 ++----------
>     >   python/qemu/utils/feature.py  | 44
>     +++++++++++++++++++++++++++++++++++
>     >   3 files changed, 48 insertions(+), 13 deletions(-)
>     >   create mode 100644 python/qemu/utils/feature.py
>     >
>     > diff --git a/python/qemu/utils/__init__.py
>     b/python/qemu/utils/__init__.py
>     > index 7f1a5138c4..1d0789eaa2 100644
>     > --- a/python/qemu/utils/__init__.py
>     > +++ b/python/qemu/utils/__init__.py
>     > @@ -20,12 +20,14 @@
>     >
>     >   # pylint: disable=import-error
>     >   from .accel import kvm_available, list_accel, tcg_available
>     > +from .feature import list_feature
>     >
>     >
>     >   __all__ = (
>     >       'get_info_usernet_hostfwd_port',
>     >       'kvm_available',
>     >       'list_accel',
>     > +    'list_feature',
>     >       'tcg_available',
>     >   )
>     >
>     > diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
>     > index 297933df2a..b5bb80c6d3 100644
>     > --- a/python/qemu/utils/accel.py
>     > +++ b/python/qemu/utils/accel.py
>     > @@ -14,13 +14,11 @@
>     >   # the COPYING file in the top-level directory.
>     >   #
>     >
>     > -import logging
>     >   import os
>     > -import subprocess
>     >   from typing import List, Optional
>     >
>     > +from qemu.utils.feature import list_feature
>     >
>     > -LOG = logging.getLogger(__name__)
>     >
>     >   # Mapping host architecture to any additional architectures it can
>     >   # support which often includes its 32 bit cousin.
>     > @@ -39,16 +37,7 @@ def list_accel(qemu_bin: str) -> List[str]:
>     >       @raise Exception: if failed to run `qemu -accel help`
>     >       @return a list of accelerator names.
>     >       """
>     > -    if not qemu_bin:
>     > -        return []
>     > -    try:
>     > -        out = subprocess.check_output([qemu_bin, '-accel', 'help'],
>     > - universal_newlines=True)
>     > -    except:
>     > -        LOG.debug("Failed to get the list of accelerators in
>     %s", qemu_bin)
>     > -        raise
>     > -    # Skip the first line which is the header.
>     > -    return [acc.strip() for acc in out.splitlines()[1:]]
>     > +    return list_feature(qemu_bin, 'accel')
>     >
>     >
>     >   def kvm_available(target_arch: Optional[str] = None,
>     > diff --git a/python/qemu/utils/feature.py
>     b/python/qemu/utils/feature.py
>     > new file mode 100644
>     > index 0000000000..b4a5f929ab
>     > --- /dev/null
>     > +++ b/python/qemu/utils/feature.py
>     > @@ -0,0 +1,44 @@
>     > +"""
>     > +QEMU feature module:
>     > +
>     > +This module provides a utility for discovering the availability of
>     > +generic features.
>     > +"""
>     > +# Copyright (C) 2022 Red Hat Inc.
>     Cleber, please, tell me how is the future like! :)
>
>
> I grabbed a sports almanac.  That's all I can say. :)
>
> Now seriously, thanks for spotting the typo.
>
>     > +#
>     > +# Authors:
>     > +#  Cleber Rosa <crosa@redhat.com <mailto:crosa@redhat.com>>
>     > +#
>     > +# This work is licensed under the terms of the GNU GPL, version
>     2.  See
>     > +# the COPYING file in the top-level directory.
>     > +#
>     > +
>     > +import logging
>     > +import subprocess
>     > +from typing import List
>     > +
>     > +
>     > +LOG = logging.getLogger(__name__)
>     > +
>     > +
>     > +def list_feature(qemu_bin: str, feature: str) -> List[str]:
>     > +    """
>     > +    List available options the QEMU binary for a given feature
>     type.
>     > +
>     > +    By calling a "qemu $feature -help" and parsing its output.
>
>     I understand we need a mean to easily cancel the test if given
>     feature
>     is not present. However, I'm unsure this generic list_feature() is
>     what
>     we need.
>
>     The `-accel help` returns a simple list of strings (besides the
>     header,
>     which is dismissed). Whereas `-machine help` returns what could be
>     parsed as a tuple of (name, description).
>
>     Another example is `-cpu help` which will print a similar list as
>     `-machine`, plus a section with CPUID flags.
>
>
> I made sure it worked with both "accel" and "machine", but you're 
> right about many other "-$feature help" that won't conform to the 
> mapping ("-chardev help" is probably the only other one that should 
> work).  What I thought about was to keep the same list_feature(), but 
> make its parsing of items flexible.  Then it could be reused for other 
> list_$feature() like methods.  At the same time, it could be an 
> opportunity to standardize a bit more of the "help" outputs.
>
> For instance, I think it would make sense for "cpu" to keep showing 
> the amount of information it shows, but:
>
> 1) The first item could be the name of the relevant "option" (the cpu 
> model) for that feature (cpu), instead of, say, "x86". Basically 
> reversing the order of first and second, or first and third fields.
> 2) Everything *after* an empty line would be extra information, not 
> necessarily an option available for that feature.
>
> But, this is most probably not going to be achieved in the short term.
>
> What I can do here, is to hide list_feature(), say call it 
> _list_feature() so that we don't duplicate code, and expose a 
> list_machine().

I prefer that implementation, with list_machine(), list_accel()...etc. 
Allow me another suggestion: maybe rename list_feature() to 
feature_help() (or something similar).

- Wainer

>
> Let me know what you think.
>
> Thanks,
> - Cleber.
>
>     If confess I still don't have a better idea, although I feel it will
>     require a OO design.
>
>     Thanks!
>
>     - Wainer
>
>     > +
>     > +    @param qemu_bin (str): path to the QEMU binary.
>     > +    @param feature (str): feature name, matching the command
>     line option.
>     > +    @raise Exception: if failed to run `qemu -feature help`
>     > +    @return a list of available options for the given feature.
>     > +    """
>     > +    if not qemu_bin:
>     > +        return []
>     > +    try:
>     > +        out = subprocess.check_output([qemu_bin, '-%s' %
>     feature, 'help'],
>     > + universal_newlines=True)
>     > +    except:
>     > +        LOG.debug("Failed to get the list of %s(s) in %s",
>     feature, qemu_bin)
>     > +        raise
>     > +    # Skip the first line which is the header.
>     > +    return [item.split(' ', 1)[0] for item in out.splitlines()[1:]]
>

--------------BA3D4F5B9D81BEC5C4020E6F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 6/8/21 8:55 PM, Cleber Rosa Junior
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+bd_6J-eA_VXyJZHEe3WiS2Cged+C=Ugs5YOGv4k01aczRAZw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Jun 8, 2021 at 5:42
            PM Wainer dos Santos Moschetta &lt;<a
              href="mailto:wainersm@redhat.com" moz-do-not-send="true">wainersm@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi,<br>
            <br>
            On 6/8/21 11:09 AM, Cleber Rosa wrote:<br>
            &gt; Which can be used to check for any "feature" that is
            available as a<br>
            &gt; QEMU command line option, and that will return its list
            of available<br>
            &gt; options.<br>
            &gt;<br>
            &gt; This is a generalization of the list_accel() utility
            function, which<br>
            &gt; is itself re-implemented in terms of the more generic
            feature.<br>
            &gt;<br>
            &gt; Signed-off-by: Cleber Rosa &lt;<a
              href="mailto:crosa@redhat.com" target="_blank"
              moz-do-not-send="true">crosa@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;   python/qemu/utils/__init__.py |  2 ++<br>
            &gt;   python/qemu/utils/accel.py    | 15 ++----------<br>
            &gt;   python/qemu/utils/feature.py  | 44
            +++++++++++++++++++++++++++++++++++<br>
            &gt;   3 files changed, 48 insertions(+), 13 deletions(-)<br>
            &gt;   create mode 100644 python/qemu/utils/feature.py<br>
            &gt;<br>
            &gt; diff --git a/python/qemu/utils/__init__.py
            b/python/qemu/utils/__init__.py<br>
            &gt; index 7f1a5138c4..1d0789eaa2 100644<br>
            &gt; --- a/python/qemu/utils/__init__.py<br>
            &gt; +++ b/python/qemu/utils/__init__.py<br>
            &gt; @@ -20,12 +20,14 @@<br>
            &gt;   <br>
            &gt;   # pylint: disable=import-error<br>
            &gt;   from .accel import kvm_available, list_accel,
            tcg_available<br>
            &gt; +from .feature import list_feature<br>
            &gt;   <br>
            &gt;   <br>
            &gt;   __all__ = (<br>
            &gt;       'get_info_usernet_hostfwd_port',<br>
            &gt;       'kvm_available',<br>
            &gt;       'list_accel',<br>
            &gt; +    'list_feature',<br>
            &gt;       'tcg_available',<br>
            &gt;   )<br>
            &gt;   <br>
            &gt; diff --git a/python/qemu/utils/accel.py
            b/python/qemu/utils/accel.py<br>
            &gt; index 297933df2a..b5bb80c6d3 100644<br>
            &gt; --- a/python/qemu/utils/accel.py<br>
            &gt; +++ b/python/qemu/utils/accel.py<br>
            &gt; @@ -14,13 +14,11 @@<br>
            &gt;   # the COPYING file in the top-level directory.<br>
            &gt;   #<br>
            &gt;   <br>
            &gt; -import logging<br>
            &gt;   import os<br>
            &gt; -import subprocess<br>
            &gt;   from typing import List, Optional<br>
            &gt;   <br>
            &gt; +from qemu.utils.feature import list_feature<br>
            &gt;   <br>
            &gt; -LOG = logging.getLogger(__name__)<br>
            &gt;   <br>
            &gt;   # Mapping host architecture to any additional
            architectures it can<br>
            &gt;   # support which often includes its 32 bit cousin.<br>
            &gt; @@ -39,16 +37,7 @@ def list_accel(qemu_bin: str) -&gt;
            List[str]:<br>
            &gt;       @raise Exception: if failed to run `qemu -accel
            help`<br>
            &gt;       @return a list of accelerator names.<br>
            &gt;       """<br>
            &gt; -    if not qemu_bin:<br>
            &gt; -        return []<br>
            &gt; -    try:<br>
            &gt; -        out = subprocess.check_output([qemu_bin,
            '-accel', 'help'],<br>
            &gt; -                                     
            universal_newlines=True)<br>
            &gt; -    except:<br>
            &gt; -        LOG.debug("Failed to get the list of
            accelerators in %s", qemu_bin)<br>
            &gt; -        raise<br>
            &gt; -    # Skip the first line which is the header.<br>
            &gt; -    return [acc.strip() for acc in
            out.splitlines()[1:]]<br>
            &gt; +    return list_feature(qemu_bin, 'accel')<br>
            &gt;   <br>
            &gt;   <br>
            &gt;   def kvm_available(target_arch: Optional[str] = None,<br>
            &gt; diff --git a/python/qemu/utils/feature.py
            b/python/qemu/utils/feature.py<br>
            &gt; new file mode 100644<br>
            &gt; index 0000000000..b4a5f929ab<br>
            &gt; --- /dev/null<br>
            &gt; +++ b/python/qemu/utils/feature.py<br>
            &gt; @@ -0,0 +1,44 @@<br>
            &gt; +"""<br>
            &gt; +QEMU feature module:<br>
            &gt; +<br>
            &gt; +This module provides a utility for discovering the
            availability of<br>
            &gt; +generic features.<br>
            &gt; +"""<br>
            &gt; +# Copyright (C) 2022 Red Hat Inc.<br>
            Cleber, please, tell me how is the future like! :)<br>
          </blockquote>
          <div><br>
          </div>
          <div>I grabbed a sports almanac.  That's all I can say. :)</div>
          <div><br>
          </div>
          <div>Now seriously, thanks for spotting the typo.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt; +#<br>
            &gt; +# Authors:<br>
            &gt; +#  Cleber Rosa &lt;<a href="mailto:crosa@redhat.com"
              target="_blank" moz-do-not-send="true">crosa@redhat.com</a>&gt;<br>
            &gt; +#<br>
            &gt; +# This work is licensed under the terms of the GNU
            GPL, version 2.  See<br>
            &gt; +# the COPYING file in the top-level directory.<br>
            &gt; +#<br>
            &gt; +<br>
            &gt; +import logging<br>
            &gt; +import subprocess<br>
            &gt; +from typing import List<br>
            &gt; +<br>
            &gt; +<br>
            &gt; +LOG = logging.getLogger(__name__)<br>
            &gt; +<br>
            &gt; +<br>
            &gt; +def list_feature(qemu_bin: str, feature: str) -&gt;
            List[str]:<br>
            &gt; +    """<br>
            &gt; +    List available options the QEMU binary for a given
            feature type.<br>
            &gt; +<br>
            &gt; +    By calling a "qemu $feature -help" and parsing its
            output.<br>
            <br>
            I understand we need a mean to easily cancel the test if
            given feature <br>
            is not present. However, I'm unsure this generic
            list_feature() is what <br>
            we need.<br>
            <br>
            The `-accel help` returns a simple list of strings (besides
            the header, <br>
            which is dismissed). Whereas `-machine help` returns what
            could be <br>
            parsed as a tuple of (name, description).<br>
            <br>
            Another example is `-cpu help` which will print a similar
            list as <br>
            `-machine`, plus a section with CPUID flags.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>I made sure it worked with both "accel" and "machine",
            but you're right about many other "-$feature help" that
            won't conform to the mapping ("-chardev help" is probably
            the only other one that should work).  What I thought about
            was to keep the same list_feature(), but make its parsing of
            items flexible.  Then it could be reused for other
            list_$feature() like methods.  At the same time, it could be
            an opportunity to standardize a bit more of the "help"
            outputs.</div>
          <div><br>
          </div>
          <div>For instance, I think it would make sense for "cpu" to
            keep showing the amount of information it shows, but:</div>
          <div><br>
          </div>
          <div>1) The first item could be the name of the relevant
            "option" (the cpu model) for that feature (cpu), instead of,
            say, "x86". Basically reversing the order of first and
            second, or first and third fields.</div>
          <div>2) Everything *after* an empty line would be extra
            information, not necessarily an option available for that
            feature.</div>
          <div><br>
          </div>
          <div>But, this is most probably not going to be achieved in
            the short term.</div>
          <div><br>
          </div>
          <div>What I can do here, is to hide list_feature(), say call
            it _list_feature() so that we don't duplicate code, and
            expose a list_machine().</div>
        </div>
      </div>
    </blockquote>
    <p>I prefer that implementation, with list_machine(),
      list_accel()...etc. Allow me another suggestion: maybe rename
      list_feature() to feature_help() (or something similar).</p>
    <p>- Wainer<br>
    </p>
    <blockquote type="cite"
cite="mid:CA+bd_6J-eA_VXyJZHEe3WiS2Cged+C=Ugs5YOGv4k01aczRAZw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Let me know what you think.</div>
          <div><br>
          </div>
          <div>Thanks,</div>
          <div>- Cleber.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            If confess I still don't have a better idea, although I feel
            it will <br>
            require a OO design.<br>
            <br>
            Thanks!<br>
            <br>
            - Wainer<br>
            <br>
            &gt; +<br>
            &gt; +    @param qemu_bin (str): path to the QEMU binary.<br>
            &gt; +    @param feature (str): feature name, matching the
            command line option.<br>
            &gt; +    @raise Exception: if failed to run `qemu -feature
            help`<br>
            &gt; +    @return a list of available options for the given
            feature.<br>
            &gt; +    """<br>
            &gt; +    if not qemu_bin:<br>
            &gt; +        return []<br>
            &gt; +    try:<br>
            &gt; +        out = subprocess.check_output([qemu_bin, '-%s'
            % feature, 'help'],<br>
            &gt; +                                     
            universal_newlines=True)<br>
            &gt; +    except:<br>
            &gt; +        LOG.debug("Failed to get the list of %s(s) in
            %s", feature, qemu_bin)<br>
            &gt; +        raise<br>
            &gt; +    # Skip the first line which is the header.<br>
            &gt; +    return [item.split(' ', 1)[0] for item in
            out.splitlines()[1:]]<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------BA3D4F5B9D81BEC5C4020E6F--


