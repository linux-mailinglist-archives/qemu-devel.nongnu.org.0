Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2D3B6993
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:16:12 +0200 (CEST)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxxfv-0004zk-Ey
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxxeN-00046V-Nv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxxeH-0003Hm-E4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624911268;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8KxK/2iB0wskZoS+pl3SZGwOohYuZx0C76JKBIo8e0=;
 b=BGiXUK2BrUN0qkWHRtHPkpGnklAULTtTpLw8485svK2MGKJRD8rbb7idKVCJC8UkCecn2J
 IfrTP0nL+Bhl7sGxfZldrBnWGXxpmspyAT9rF8GqNgZArr5RSRNfaUxVd4mnDVoFdh7YAM
 gu9Ph2naHj4Z97AwkBkqDQNmR7Imn+Y=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-5wVgs2HZNbeeMhKHxBA9AQ-1; Mon, 28 Jun 2021 16:14:26 -0400
X-MC-Unique: 5wVgs2HZNbeeMhKHxBA9AQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 q2-20020a170902e302b0290128ec775274so953163plc.20
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=g8KxK/2iB0wskZoS+pl3SZGwOohYuZx0C76JKBIo8e0=;
 b=rsLiV4EBScK7YFAk0CqemcBgbOTgBgWZuEq5D+ZuYS8mzklCz5B5xRGZ4Q94PJVppX
 CjR4a/C+o1EnpBWeR18X3ui0qmsy/So3+4q51QoohZWIL3FH9R7N1vTqjHNYmmeHkdb9
 ixepbQ9ey6vrWb5IrGZO1Be1q6NkQdSH2I72R2UBE0U8V9LAldxra3mf19x9QOLSHy4t
 a344a0GaxXr6fbRz1maKwaKIl+velYBnA6BxEv2N7Pz1rV3ht1uLewuINp8MAQIJvwKF
 0mOkHO0Gl/RAuZTNxJSlcTuetdkeVtFYna/m6SMryLss+pG4e0zDgSjXAsp74Lu6CbW6
 FPqA==
X-Gm-Message-State: AOAM5310SToztMYV/hwIWhZQ69JzA8F/zKq+2+NhpOg1S+7Xw0zq6sXN
 A5URcs6A9KRuRw8l6fTFqXszOCGkGgY0FU3MsmjxeHTqJjSD5fZYij52DQlFSTo5QRqwWdqLDnV
 8gmilIH+N8UMj+cY=
X-Received: by 2002:a63:f54f:: with SMTP id e15mr25064797pgk.64.1624911264650; 
 Mon, 28 Jun 2021 13:14:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYeVYyaMZ9nHR2cuWFXr7iduRdPKoH9NPJntzjnLgVxNEUxAn2noNh04aGsclO78p1pornoA==
X-Received: by 2002:a63:f54f:: with SMTP id e15mr25064788pgk.64.1624911264462; 
 Mon, 28 Jun 2021 13:14:24 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id j2sm14997061pfi.111.2021.06.28.13.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 13:14:23 -0700 (PDT)
Subject: Re: [PATCH 02/11] python: Remove global pylint suppressions
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-3-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <5c828d11-f5de-ffc6-e8e9-5b97be9bdb97@redhat.com>
Date: Mon, 28 Jun 2021 17:14:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 12:45 PM, John Snow wrote:
> These suppressions only apply to a small handful of places. Instead of
> disabling them globally, disable them just in the cases where we
> need. The design of the machine class grew quite organically with tons
> of constructor and class instance variables -- there's little chance of
> meaningfully refactoring it in the near term, so just suppress the
> warnings for that class.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 3 +++
>   python/qemu/machine/qtest.py   | 2 ++
>   python/setup.cfg               | 4 +---
>   3 files changed, 6 insertions(+), 3 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index b62435528e..e3345dfa1b 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -84,6 +84,7 @@ class QEMUMachine:
>               ...
>           # vm is guaranteed to be shut down here
>       """
> +    # pylint: disable=too-many-instance-attributes, too-many-public-methods
>   
>       def __init__(self,
>                    binary: str,
> @@ -111,6 +112,8 @@ def __init__(self,
>           @param console_log: (optional) path to console log file
>           @note: Qemu process is not started until launch() is used.
>           '''
> +        # pylint: disable=too-many-arguments
> +
>           # Direct user configuration
>   
>           self._binary = binary
> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
> index 93700684d1..d6d9c6a34a 100644
> --- a/python/qemu/machine/qtest.py
> +++ b/python/qemu/machine/qtest.py
> @@ -116,6 +116,8 @@ def __init__(self,
>                    base_temp_dir: str = "/var/tmp",
>                    socket_scm_helper: Optional[str] = None,
>                    sock_dir: Optional[str] = None):
> +        # pylint: disable=too-many-arguments
> +
>           if name is None:
>               name = "qemu-%d" % os.getpid()
>           if sock_dir is None:
> diff --git a/python/setup.cfg b/python/setup.cfg
> index db1639c1f2..524789d6e0 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -87,9 +87,7 @@ ignore_missing_imports = True
>   # --enable=similarities". If you want to run only the classes checker, but have
>   # no Warning level messages displayed, use "--disable=all --enable=classes
>   # --disable=W".
> -disable=too-many-arguments,
> -        too-many-instance-attributes,
> -        too-many-public-methods,
> +disable=
>   
>   [pylint.basic]
>   # Good variable names which should always be accepted, separated by a comma.


