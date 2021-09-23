Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C806415F5A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:18:20 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOcF-00078u-3c
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOZU-0004oe-U4
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:15:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOZS-0006Wo-3H
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:15:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t8so17145255wrq.4
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xjji1kXpZggLGs09kwCgKimL46h9GO6P+Iv0nOC7fxs=;
 b=sVIqFy18ym34fvvSOT6Zdm3V3xI2eEh+FEoXtNcCedkNQthopvcE5EsEsFRw+Gb6dk
 I/pKCtQ+30Hc9eDBU31Hp1dPMyyV9NKwlITaQAUfO3vdp66BchHU4GvpoiZjwe9O3DMD
 cTA/cM7Mh0QT7rBbJpk9yoFYALP9PrToFm1xS5Nzrq5hR7WKTBlwvZuHqe93FqvBvsLV
 xCU8bphoxorcu2+SzljB+9sTBGdMcqbHsYzjaVPAUbju8zJTLsAgVf8v+Fsfn+42n95W
 y4/TryLwULwN+PuKTi7sjDlUqr6bQCqt+8qKwSUGwJgod5Sjy65zb1gO7+w6dXbwEMRO
 n15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xjji1kXpZggLGs09kwCgKimL46h9GO6P+Iv0nOC7fxs=;
 b=PT/UphHZNVByem+nKgwePvqpSKTwCkxseY3E+IMKloKYNyvFSz+S3LwrWnd7knxSH6
 ZDhOokrxODskMN0fi3ebWyEh19GH2buRr4fJ0r93FNltBFJ6c41kT6TEKEC7Ej89cPcP
 BjW4va1fxz5kfxCju+pNtrLZ5m5ZCg74LBLkYZx+pmQBZJ0hKK5wkPv4VlL77a/lyBYf
 RtBCBSEYvLsES1zB/MREa5rJ8esnVcV0IqZ5tI/ry+eM5sPQKCGF/ORDAP6uNTaobD9w
 Bfj4vcsAm0MKRJ5WTMtV4W1pii4okdh80NLhTcTEsl7b6n2wwpp5YnbO++zcUKUDvc4b
 QGCg==
X-Gm-Message-State: AOAM532c4hPNU0mq0qA65PaFbYcqVPfaMIDMG1dX+Tm3GPExRM/3dnke
 hRPu+sMVCD+r9v7qnitdHam/iNf3zsQ/K1+0VjSexQ==
X-Google-Smtp-Source: ABdhPJwg3mBNH1hXf7M09xqVdX+r5VwPhA6wBgqWHiKQEjpLZ5lGQWGCVpc9TqHK1CCBCR11q0ejQtkp5v59dmpEo9Q=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr5143397wrr.149.1632402924096; 
 Thu, 23 Sep 2021 06:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
In-Reply-To: <20190218140607.31998-19-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 14:14:31 +0100
Message-ID: <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Feb 2019 at 14:19, Markus Armbruster <armbru@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> A few targets don't emit RTC_CHANGE, we could restrict the event to
> the tagets that do emit it.
>
> Note: There is a lot more of events & commands that we could restrict
> to capable targets, with the cost of some additional complexity, but
> the benefit of added correctness and better introspection.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20190214152251.2073-19-armbru@redhat.com>

Hi; I've just run into this starting from Eric's patch to add
RTC_CHANGE event support to the pl031 RTC. It seems kind of
awkward to me:

> diff --git a/qapi/target.json b/qapi/target.json
> index 5c41a0aee7..da7b4be51e 100644
> --- a/qapi/target.json
> +++ b/qapi/target.json
> @@ -7,6 +7,29 @@
>
>  { 'include': 'misc.json' }
>
> +##
> +# @RTC_CHANGE:
> +#
> +# Emitted when the guest changes the RTC time.
> +#
> +# @offset: offset between base RTC clock (as specified by -rtc base), an=
d
> +#          new RTC clock value
> +#
> +# Note: This event is rate-limited.
> +#
> +# Since: 0.13.0
> +#
> +# Example:
> +#
> +# <-   { "event": "RTC_CHANGE",
> +#        "data": { "offset": 78 },
> +#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } =
}
> +#
> +##
> +{ 'event': 'RTC_CHANGE',
> +  'data': { 'offset': 'int' },
> +  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET_=
HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MIP=
S64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) || defined(TARGET_PPC6=
4) || defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)=
' }
> +

Now we have a massive list of TARGET if conditions. As a general
principle if we can avoid long TARGET if-lists we should, because
it is yet another thing that needs updating when a new target
is added. In this case any new architecture that can handle an
ISA device would need to update this list. I pretty much guarantee
nobody is going to remember to do that.

It also doesn't actually usefully tell the thing on the other
end whether it can expect to see RTC_CHANGE events, because
whether it will actually get them depends not on the target
architecture but on the specific combination of machine type
and plugged-in devices. If there's a need for the other end of
the QMP connection to tell in advance whether it's going to get
RTC_CHANGE events then we should probably have an event or
something for that, and make all rtc-change aware RTC devices
cause QMP to send that event on startup (or otherwise register
themselves as being present).

It also means that now rtc devices that emit this event need to
change in meson.build from softmmu_ss to specific_ss, because the
qapi_event_send_rtc_change() prototype is in the generated
qapi/qapi-events-misc-target.h header, and that header uses
TARGET_* defines which are poisoned for softmmu compiles.
So instead of being able to build the RTC device once for
all targets, we need to build it over and over again for
each target.

Could we reconsider this change? It seems to me to be adding
complexity and build time and I don't really see the advantage
that compensates for that.

-- PMM

