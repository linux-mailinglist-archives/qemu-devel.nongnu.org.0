Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4840F9DE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:01:28 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREQh-0001Dk-6f
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREOf-0000K7-6K
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREOd-0002qi-Ih
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631887159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfsZFwdikgfKBVrKEoddQeEUlxK18ttPtiM1LMPBQCg=;
 b=gLsn0PPSyGU/PSQsdSVVR1D401RI6t3km1ZIsRvKSYBDXXJc4ifnQfRr1tAKOEoMcOMAwx
 EIme1XkjV/yIwV5e/+ltkvSv+R3TlOZOFLGgtN2snnzRzd6Li8UivXHNbYux8mWufecdEa
 c8NKaGrNNs5IDPICXoxHFRufO4pfJNg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-bWRAlFcHN4CdlF4J4lWGVw-1; Fri, 17 Sep 2021 09:59:17 -0400
X-MC-Unique: bWRAlFcHN4CdlF4J4lWGVw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so3746349wrt.21
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 06:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xfsZFwdikgfKBVrKEoddQeEUlxK18ttPtiM1LMPBQCg=;
 b=CjW7SLqd1cBcBjFmau4m7xrbqt3ud5VhRF8F3N/Ks0QWyG2yC/d6Rc4HrE9unoUGS4
 QtvLSDJNmI8RIpz+XbLxBsLokTt4ZeIScFTWwo0PU46hZl/DfhZYq5e6XFWKxZ3o4M2S
 GO7EN4h3xxkRqiEjBThzbjOo8IIhrHaM1X8SZFNUn/FYoukvkK/CAwE4w8jLzPQTkTWO
 xGZxy8hXdNSF4nMhzeARsfmfsygsoO8WwGeRilZLxB0LEl2tzyJ4nfus/VH0NtDOGrov
 PHqZ1/86vx17G75nE3ct/dBPC2iUmGNxmMY3RVd3Uu5SNa1i6/gUWg5AK+Z1gNL3LmM3
 uISA==
X-Gm-Message-State: AOAM532MSZ3Fy0FoNImXWoAo1+CmiR6aBKUXFHNPRevdYdbG+w6RtPqs
 W+OJBbXL43IcQToZ5TTPpGI03jFRpZ6sWf7mto1T8693FnFytvZQ2txUlRaGOiIsW3G48vG41+n
 MGW2L6HAjfkNp/CY=
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr15301020wmr.157.1631887156781; 
 Fri, 17 Sep 2021 06:59:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw44wfyWcOHvBteDgKnFe/Pql+DdHsop8elYLKAbZ2wPsXL5FzCmEhoG7GYww5ycaJ6SuM2bw==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr15300991wmr.157.1631887156499; 
 Fri, 17 Sep 2021 06:59:16 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id f19sm6485095wmf.11.2021.09.17.06.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 06:59:16 -0700 (PDT)
Subject: Re: [PATCH 09/15] python/machine: remove has_quit argument
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-10-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <f39831de-afc1-3152-777d-ec4af76c087e@redhat.com>
Date: Fri, 17 Sep 2021 15:59:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> If we spy on the QMP commands instead, we don't need callers to remember
> to pass it. Seems like a fair trade-off.
>
> The one slightly weird bit is overloading this instance variable for
> wait(), where we use it to mean "don't issue the qmp 'quit'
> command". This means that wait() will "fail" if the QEMU process does
> not terminate of its own accord.
>
> In most cases, we probably did already actually issue quit -- some
> iotests do this -- but in some others, we may be waiting for QEMU to
> terminate for some other reason.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 35 +++++++++++++++++++---------------
>   tests/qemu-iotests/040         |  7 +------
>   tests/qemu-iotests/218         |  2 +-
>   tests/qemu-iotests/255         |  2 +-
>   4 files changed, 23 insertions(+), 23 deletions(-)

Looks good overall, some bikeshedding below.

> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 056d340e35..6e58d2f951 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -170,6 +170,7 @@ def __init__(self,
>           self._console_socket: Optional[socket.socket] = None
>           self._remove_files: List[str] = []
>           self._user_killed = False
> +        self._has_quit = False

Sounds a bit weird, because evidently it has quit.

I mean, it was always more of a has_sent_quit or quit_issued, but now it 
really seems a bit wrong.

[...]

> @@ -529,7 +526,9 @@ def wait(self, timeout: Optional[int] = 30) -> None:
>           :param timeout: Optional timeout in seconds. Default 30 seconds.
>                           A value of `None` is an infinite wait.
>           """
> -        self.shutdown(has_quit=True, timeout=timeout)
> +        # In case QEMU was stopped without issuing 'quit':

This comment confused me more than anything and only looking at the 
function’s name and doc string was I able to understand why we have 
has_quit = True here, and only by scratching my head asking myself why 
you’d write the comment did I understand the comment’s purpose.

What isn’t quite clear in the comment is that we kind of expect 
_has_quit to already be True, because the VM was probably exited with 
`quit`.  But we don’t know for sure, so we have to force _has_quit to True.

But it’s also not necessary to explain, I think.  The idea is simply 
that this function should do nothing to make the VM quit, so it’s 
absolutely natural that we’d set _has_quit to True, because the caller 
guarantees that they already made the VM quit.  No need to explain why 
this might already be True, and why it’s still OK.

So I’d just say something like “Do not send a `quit` to the VM, just 
wait for it to exit”.

Hanna

> +        self._has_quit = True
> +        self.shutdown(timeout=timeout)
>   
>       def set_qmp_monitor(self, enabled: bool = True) -> None:
>           """


