Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F01420934
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:15:53 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXL0i-0005nX-D2
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXKxh-0002va-I3
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXKxf-0002wg-QA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633342361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hw7RMRnS34Ncr8ykyhOnTLjuy8lu1yVenpbZ/ndbXNQ=;
 b=M2dmxLx6/TLRbd2mNkSRcQFeUk7+NGznrdPZ37R5aT0YtJS7HGljJt7ZOHEa+n9IMSsZBv
 Vak7cqXWYZsyJPTifDA8e1To0b+14HhY2zf4ERvSZ5d3Az/jXyeuYqxSkq+7zMAG5vvQB6
 /xXW3IcyHnJPOsTSJ3NVjEnQtxfR5pQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-RCmsCT7GM3eyy-DwlXtgGA-1; Mon, 04 Oct 2021 06:12:40 -0400
X-MC-Unique: RCmsCT7GM3eyy-DwlXtgGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so4466025wrv.12
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 03:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Hw7RMRnS34Ncr8ykyhOnTLjuy8lu1yVenpbZ/ndbXNQ=;
 b=D0md7XkGVY+ItUV7ZqhfWYOgG0oH19JqO0RkLtSCf75ucrWGU1Drq2a2PSmBIjWMO8
 Low1XrP5/USD9jfOxjECwNzyJ7ibA9gpA8xytBy5b/2qjzvH0+ZnRLz6UMmIFEKyCQFw
 by+tpHLc9BO6Zmz/zycUQ5vNILxvr7LZDvvk086yAHNwZ1X4S18J+90W6lt56SUaMfKf
 562eRAzClINMhjM2kuxQnKuzGCJmWdKHgslDCD4d4CDYn9cIZH8ELPST1ZaglABh0PfY
 R2irRc0TtQKPTPdk0yZzn+TIQAUV4cqm50y35zA4D5kp8EW6Jokhdxb+qWp6tHy9gCpI
 Gk/Q==
X-Gm-Message-State: AOAM5318r30VJfLOBL3eiX3TYarRmTYYZPgRNhYg7w9cQ+h3z5SC+s89
 e92D44PRXtg+ImUYst+KicLOb7FncXBKZVURYhACeB/mYS+5a6Hg1XqV/T7bNxspMTW7ldKsIH3
 /qvfY+Z8or+lwsIw=
X-Received: by 2002:adf:b304:: with SMTP id j4mr13433236wrd.160.1633342359284; 
 Mon, 04 Oct 2021 03:12:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx61T5iIsONN/icIfYULAFFg/XHwnhPutVg6yIgyd+p2tiVOdtKFfIAu57N3W49/JV5OUdlEg==
X-Received: by 2002:adf:b304:: with SMTP id j4mr13433209wrd.160.1633342359051; 
 Mon, 04 Oct 2021 03:12:39 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id g25sm13763949wrc.88.2021.10.04.03.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 03:12:38 -0700 (PDT)
Subject: Re: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
To: John Snow <jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-13-jsnow@redhat.com>
 <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
 <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
 <CAFn=p-bTtRWdLhMuaQdH=pSy26KytrfXcidO4RePBunXxwUbSA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <372c86ac-0061-2d9a-b366-72260d91bd75@redhat.com>
Date: Mon, 4 Oct 2021 12:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bTtRWdLhMuaQdH=pSy26KytrfXcidO4RePBunXxwUbSA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.09.21 04:14, John Snow wrote:
>
>
> On Fri, Sep 17, 2021 at 8:58 PM John Snow <jsnow@redhat.com 
> <mailto:jsnow@redhat.com>> wrote:
>
>
>
>     On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz <hreitz@redhat.com
>     <mailto:hreitz@redhat.com>> wrote:
>
>         On 17.09.21 07:40, John Snow wrote:
>         > Disable the aqmp logger, which likes to (at the moment)
>         print out
>         > intermediate warnings and errors that cause session
>         termination; disable
>         > them so they don't interfere with the job output.
>         >
>         > Leave any "CRITICAL" warnings enabled though, those are ones
>         that we
>         > should never see, no matter what.
>
>         I mean, looks OK to me, but from what I understand (i.e. little),
>         qmp_client doesn’t log CRITICAL messages, at least I can’t see
>         any. Only
>         ERRORs.
>
>
>     There's *one* critical message in protocol.py, used for a
>     circumstance that I *think* should be impossible. I do not think I
>     currently use any WARNING level statements.
>
>         I guess I’m missing some CRITICAL messages in external
>         functions called
>         from qmp_client.py, but shouldn’t we still keep ERRORs?
>
>
>     ...Mayyyyyybe?
>
>     The errors logged by AQMP are *almost always* raised as Exceptions
>     somewhere else, eventually. Sometimes when we encounter them in
>     one context, we need to save them and then re-raise them in a
>     different execution context. There's one good exception to this:
>     My pal, EOFError.
>
>     If the reader context encounters EOF, it raises EOFError and this
>     causes a disconnect to be scheduled asynchronously. *Any*
>     Exception that causes a disconnect to be scheduled asynchronously
>     is dutifully logged as an ERROR. At this point in the code, we
>     don't really know if the user of the library considers this an
>     "error" yet or not. I've waffled a lot on how exactly to treat
>     this circumstance. ...Hm, I guess that's really the only case
>     where I have an error that really ought to be suppressed. I
>     suppose what I will do here is: if the exception happens to be an
>     EOFError I will drop the severity of the log message down to INFO.
>     I don't know why it takes being challenged on this stuff to start
>     thinking clearly about it, but here we are. Thank you for your
>     feedback :~)
>
>     --js
>
>
> Oh, CI testing reminds me of why I am a liar here.
>
> the mirror-top-perms test intentionally expects not to be able to 
> connect, but we're treated to these two additional lines of output:
>
> +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Negotiation failed: EOFError
> +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Failed to establish session: 
> EOFError
>
> Uh. I guess a temporary suppression in mirror-top-perms, then ...?

Sounds right to me, if that’s simple enough.

(By the way, I understand it right that you want to lower the severity 
of EOFErrors to INFO only on disconnect, right?  Which is why they’re 
still logged as ERRORs here, because they aren’t occurring on disconnects?)

> In most other cases I rather imagine we do want to see this kind of 
> output to help give more information about how things have failed -- 
> they ARE errors. We just happen to not care about them right here.

Well, in fact we do expect them here, so we could even log them, but 
first I don’t know whether they’re stable enough for that, and second 
this would break the “choose the AQMP or legacy QMP back-end via an 
environment variable” thing.

> The only thing I don't exactly like about this is that it requires 
> some knowledge by the caller to know to disable it. It makes writing 
> negative tests a bit more annoying because the library leans so 
> heavily on yelling loudly when it encounters problems.

Yeah.  I’m afraid I don’t have a good idea on how to convey test writers 
how to suppress these errors, even if it were a simple one-liner (like 
`self.vm_b.set_log_threshold(logging.CRITICAL)`)...

We could start an “iotests tips and tricks” document, but do we want to?

Hanna


