Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E64DC459
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:56:26 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnnt-0001YY-Ip
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:56:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnlY-0008Oh-NK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnlV-0002ZF-T3
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647514436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T49pX6A98vqxHPA5iK2eDdBI6V3MdtzL1yeATCL28j0=;
 b=Uk6FspCQyldM+5L1fTHl21P60B5SkBltpd5pVJqRwbq7QCMk/LQihbCLNww47cUkOTGAlc
 ugOeLDSdGWJ1eGN1MIVQT0nljv0tPQhwsr4htq59vpVhozQQOUP/hJvTIRw8tv6LGyV6dQ
 6T6kb5t7RmYigWS5dcR8/gC3g3OU3KE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-yM8H3hYtNsuJODkWOlYlwg-1; Thu, 17 Mar 2022 06:53:55 -0400
X-MC-Unique: yM8H3hYtNsuJODkWOlYlwg-1
Received: by mail-ej1-f70.google.com with SMTP id
 jy20-20020a170907763400b006db62b6f4e0so2710988ejc.11
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T49pX6A98vqxHPA5iK2eDdBI6V3MdtzL1yeATCL28j0=;
 b=lcmQrs+X2frlqf420uJQVenuCzovR+HGkwjddt+9HzOUH4O8oCe3SJ/TfEEsp7B4gi
 714c/uaS2r2d2ck2iJcOcuzpRlyWVL1Q+Dc+lMkKDQUy5DYLcvshMwohTICWfMTOqwJF
 ccG8muSq9yKsLOs546Z91zwPfUl+kTazWQclsu7qRrNJXxO3Sr1vjHVw4lkUyL0oAhSL
 BfvwJ6gEbLFs+jX2ASzjbYIwWX8GCsFc9g1PNpe3QuDNDsiCvs+8UgOv2a0trMHONkMm
 0PT8mT2XxGtajPlJKwdvFVRZ1EafRu3irxXVvFI6079xUceORYA4cw6F4oTWGxmIKoWd
 IToA==
X-Gm-Message-State: AOAM533Q7taMAN7xo2c447HZ6mH6UnhDvpPZaDzGdysC8kbJx2bro8Ro
 QUt69P4Id3Jl5A+v7FySUCvVQ3+oYkM0BTKW4rtEDF+SSt2vxdi7tlRCOx0E0iS4wxV7vch7G3N
 m9c7Dv955XDHxHrA=
X-Received: by 2002:a17:906:6a24:b0:6db:ad7b:9066 with SMTP id
 qw36-20020a1709066a2400b006dbad7b9066mr3761256ejc.697.1647514434414; 
 Thu, 17 Mar 2022 03:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6cuQPX7EZUa5HnD5I2GOTemhmC6F+gapzb9oudIa6pTDTzyJQR0DMhFkgt8Blfjpy1UPLJA==
X-Received: by 2002:a17:906:6a24:b0:6db:ad7b:9066 with SMTP id
 qw36-20020a1709066a2400b006dbad7b9066mr3761238ejc.697.1647514434157; 
 Thu, 17 Mar 2022 03:53:54 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 qa30-20020a170907869e00b006df9ff41154sm450688ejc.141.2022.03.17.03.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:53:53 -0700 (PDT)
Message-ID: <813e9265-1920-1caf-0d07-39b20c7bb944@redhat.com>
Date: Thu, 17 Mar 2022 11:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] iotests: add qemu_img_json()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-2-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:53, John Snow wrote:
> qemu_img_json() is a new helper built on top of qemu_img() that tries to
> pull a valid JSON document out of the stdout stream.
>
> In the event that the return code is negative (the program crashed), or
> the code is greater than zero and did not produce valid JSON output, the
> VerboseProcessError raised by qemu_img() is re-raised.
>
> In the event that the return code is zero but we can't parse valid JSON,
> allow the JSON deserialization error to be raised.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 38 +++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 7057db0686..546b142a6c 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -276,6 +276,44 @@ def ordered_qmp(qmsg, conv_keys=True):
>   def qemu_img_create(*args: str) -> subprocess.CompletedProcess[str]:
>       return qemu_img('create', *args)
>   
> +def qemu_img_json(*args: str) -> Any:
> +    """
> +    Run qemu-img and return its output as deserialized JSON.
> +
> +    :raise CalledProcessError:
> +        When qemu-img crashes, or returns a non-zero exit code without
> +        producing a valid JSON document to stdout.
> +    :raise JSONDecoderError:
> +        When qemu-img returns 0, but failed to produce a valid JSON document.
> +
> +    :return: A deserialized JSON object; probably a dict[str, Any].
> +    """
> +    json_data = ...  # json.loads can legitimately return 'None'.

What kind of arcane sigil is this?

I’m trying to read into it, but it seems like...  Well, I won’t swear on 
a public list.  As far as I understand, it’s just a special singleton 
object that you can use for whatever you think is an appropriate use for 
an ellipsis?  And so in this case you use it as a special singleton 
object that would never legitimately appear, to be separate from None?

You’re really, really good at making me hate Python a bit more with 
every series.

It also just doesn’t seem very useful to me in this case.  I’m not sure 
whether this notation is widely known in the Python world, but I have 
only myself to go off of, and I was just very confused, so I would 
prefer not to have this in the code.

> +
> +    try:
> +        res = qemu_img(*args, combine_stdio=False)
> +    except subprocess.CalledProcessError as exc:
> +        # Terminated due to signal. Don't bother.
> +        if exc.returncode < 0:
> +            raise
> +
> +        # Commands like 'check' can return failure (exit codes 2 and 3)
> +        # to indicate command completion, but with errors found. For
> +        # multi-command flexibility, ignore the exact error codes and
> +        # *try* to load JSON.
> +        try:
> +            json_data = json.loads(exc.stdout)

Why not `return json.loads(exc.stdout)`?

> +        except json.JSONDecodeError:
> +            # Nope. This thing is toast. Raise the process error.
> +            pass
> +
> +        if json_data is ...:
> +            raise

And just unconditionally `raise` here.

> +
> +    if json_data is ...:
> +        json_data = json.loads(res.stdout)
> +    return json_data

And just `return json.loads(res.stdout)` here, without any condition.

Hanna

> +
>   def qemu_img_measure(*args):
>       return json.loads(qemu_img_pipe("measure", "--output", "json", *args))
>   


