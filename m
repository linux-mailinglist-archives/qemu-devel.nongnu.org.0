Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1E4DC9A2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:10:47 +0100 (CET)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrm2-0001Dj-2q
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:10:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUrTR-0007N2-Pn
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUrTP-0004Pm-D9
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647528690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/QdTe1wWjtvUBYIMxgFyGKi6U5aXAbdsH4+QdctGR4=;
 b=Qo6SG0I5HGvAaLYc1jM92hIN9j7drgb1+Hifp2dN4tyjpmWbA7YFGRGF6jOgM7RGfyYKre
 oV8F82h2UtUUVvtIXqldq5Qf7c/2apvtj60LjRZCTkx20uGb1iknfXtzlt79xrFgxBOLcD
 JLkVUs7pYMAgtqeAfq7zJzDso6sHh9A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-HHRUSkytPXmjVkl9gUVw2g-1; Thu, 17 Mar 2022 10:51:29 -0400
X-MC-Unique: HHRUSkytPXmjVkl9gUVw2g-1
Received: by mail-ej1-f69.google.com with SMTP id
 d7-20020a1709061f4700b006bbf73a7becso3039940ejk.17
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 07:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w/QdTe1wWjtvUBYIMxgFyGKi6U5aXAbdsH4+QdctGR4=;
 b=QusKtqrigGFFyXUnj5MiLwjIQEDNIdc7VCW2vB/TPRGZr5D6fpoha7AlrXQg1Yqdg7
 nIQfC27TM5SJTSsmWFQyl/GR9CUTsO0bqEL5d3uXiCoGmINhxywJGdo/rEQpa607rubM
 nilFpGu9Lp2AKbXQ2vIdb/f7a56BED238x1tfqtJB2JUtleWG/jcQKsOxs1oN2WizJL/
 H/nFC2kYfDHHokzgjQkv+Ge0IEHeekW8M03lnEghP0O8G+WKJx92QU2xLjjR4BcM5/tM
 Ra+/C+nXak/qNKKwIxdaaKEH8azg4XmVInOV0/lsoQHrqRONN93wptl+MKHZ1sc/xQHh
 b7jg==
X-Gm-Message-State: AOAM530P9irSSpDafxcNUsEot54A9Ro7Gu4osqA/BKYSpsGfra8ZIUL4
 /0BdFBeoGOw5QgGtcUGmSgcBvnHBZBz0bFQ5a5P2N66Wo8PCrqhsjD19nYZFzO/dF8FNUb/9ASa
 4AYSMyfydfKRjilA=
X-Received: by 2002:a17:906:9c81:b0:6df:78a0:fb37 with SMTP id
 fj1-20020a1709069c8100b006df78a0fb37mr4950118ejc.703.1647528688048; 
 Thu, 17 Mar 2022 07:51:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaFhw1uNeMLWR41Ip3pkggKwqEZApGi87pGd7NTABGnFtPTTrhM67Yw+NOBlOEVOZbP/Rtow==
X-Received: by 2002:a17:906:9c81:b0:6df:78a0:fb37 with SMTP id
 fj1-20020a1709069c8100b006df78a0fb37mr4950076ejc.703.1647528687605; 
 Thu, 17 Mar 2022 07:51:27 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056402440e00b00416046b623csm3012843eda.2.2022.03.17.07.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 07:51:27 -0700 (PDT)
Message-ID: <887d60f2-7c5c-5d79-8cc7-8b21fd3b8373@redhat.com>
Date: Thu, 17 Mar 2022 15:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] iotests: add qemu_img_json()
To: John Snow <jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-2-jsnow@redhat.com>
 <813e9265-1920-1caf-0d07-39b20c7bb944@redhat.com>
 <CAFn=p-Z-jLo8XEZFuXHMYfEx+rRp7=3XDL08gBxXPuzAtp6yuA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Z-jLo8XEZFuXHMYfEx+rRp7=3XDL08gBxXPuzAtp6yuA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 15:42, John Snow wrote:
>
>
> On Thu, Mar 17, 2022, 6:53 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 09.03.22 04:53, John Snow wrote:
>     > qemu_img_json() is a new helper built on top of qemu_img() that
>     tries to
>     > pull a valid JSON document out of the stdout stream.
>     >
>     > In the event that the return code is negative (the program
>     crashed), or
>     > the code is greater than zero and did not produce valid JSON
>     output, the
>     > VerboseProcessError raised by qemu_img() is re-raised.
>     >
>     > In the event that the return code is zero but we can't parse
>     valid JSON,
>     > allow the JSON deserialization error to be raised.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com>
>     > ---
>     >   tests/qemu-iotests/iotests.py | 38
>     +++++++++++++++++++++++++++++++++++
>     >   1 file changed, 38 insertions(+)
>     >
>     > diff --git a/tests/qemu-iotests/iotests.py
>     b/tests/qemu-iotests/iotests.py
>     > index 7057db0686..546b142a6c 100644
>     > --- a/tests/qemu-iotests/iotests.py
>     > +++ b/tests/qemu-iotests/iotests.py
>     > @@ -276,6 +276,44 @@ def ordered_qmp(qmsg, conv_keys=True):
>     >   def qemu_img_create(*args: str) ->
>     subprocess.CompletedProcess[str]:
>     >       return qemu_img('create', *args)
>     >
>     > +def qemu_img_json(*args: str) -> Any:
>     > +    """
>     > +    Run qemu-img and return its output as deserialized JSON.
>     > +
>     > +    :raise CalledProcessError:
>     > +        When qemu-img crashes, or returns a non-zero exit code
>     without
>     > +        producing a valid JSON document to stdout.
>     > +    :raise JSONDecoderError:
>     > +        When qemu-img returns 0, but failed to produce a valid
>     JSON document.
>     > +
>     > +    :return: A deserialized JSON object; probably a dict[str, Any].
>     > +    """
>     > +    json_data = ...  # json.loads can legitimately return 'None'.
>
>     What kind of arcane sigil is this?
>
>
> I may genuinely start referring to it as the Arcane Sigil.

Be my guest.  Perhaps one should identify the most arcane sigil for 
every language.  (My C vote goes to the ternary operator.)

>
>     I’m trying to read into it, but it seems like...  Well, I won’t
>     swear on
>     a public list.  As far as I understand, it’s just a special singleton
>     object that you can use for whatever you think is an appropriate
>     use for
>     an ellipsis?  And so in this case you use it as a special singleton
>     object that would never legitimately appear, to be separate from None?
>
>     You’re really, really good at making me hate Python a bit more with
>     every series.
>
>
> I aim to please.
>
> Yes, it's just Another Singleton That Isn't None, because technically 
> a JSON document can be just "null". Will qemu_img() ever, ever print 
> that single string all by itself?

Is there even any case where qemu returns anything but a JSON object?

> Well, I hope not, but. I felt guilty not addressing that technicality 
> somehow.
>
>
>     It also just doesn’t seem very useful to me in this case. I’m not
>     sure
>     whether this notation is widely known in the Python world, but I have
>     only myself to go off of, and I was just very confused, so I would
>     prefer not to have this in the code.
>
>
> You're right, it's a bit too clever. I judged the 
> cleverness:usefulness ratio poorly.
>
> (I think it's a trick that a lot of long time python people know, 
> because sooner or later one wants to distinguish between an explicitly 
> provided "None" and a default value that signifies "No argument 
> provided". It's definitely a hack. It's not something most users would 
> know.)

I hope similarly to how א‎₀ and its companions exist[1], there are also 
multiple instances of `...`, so one can succeed at handling cases where 
a `...` is a valid return type.  I suggest just more dots.

[1] hope I got that “HEBREW LETTER ALEF” “LEFT-TO-RIGHT MARK” sequence 
right...


