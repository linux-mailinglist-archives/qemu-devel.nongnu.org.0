Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B4422C78
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:26:24 +0200 (CEST)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmKl-0000OH-Ah
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXm75-0005gj-19
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXm70-0008GZ-Sn
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8nhYvKyU1199BDmTa/76bA7o2jnguEBXBwxmQk3Yr8=;
 b=hbo1e9BZAMF8fopVrvU3K6XYQglvFTvlWQriDWV4M6T4lbeolcGFTZ6SsZbOhxyKx0UNDd
 doxlsPhVUDc/d62d1JBbPJec/1JN6MUyCmIlV53yZtC68mMMbM2NwTNrPC++kUGI8lE5nq
 ACyC0UAlx89Mpnqvyx0siPBpZxOA/Ak=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-GlDdrWF6OKiNO1iemAwtew-1; Tue, 05 Oct 2021 11:12:05 -0400
X-MC-Unique: GlDdrWF6OKiNO1iemAwtew-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso5818261wrb.20
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=h8nhYvKyU1199BDmTa/76bA7o2jnguEBXBwxmQk3Yr8=;
 b=nAQNe/PYl15zoaeEzpq5OLlRxojvnpmZw6dx0kKoJYknaZLaQ9g9lyICQG80LqXXV3
 KZdAdXSoGJY8qaG1w1YXZq6fErj+fj5Y1Cnb29V4Rgy+jsgTxLmD+I4Kw30Dxq4FTtSO
 RUDlEPah4FYYvBLtt7UH8N6K8nQiq1k27cNgOqpU5p/0wgkodr1FqFDJ1Dv/MXNHxA9d
 i+oP7WUARVC9e77N8hdGr7YPMKGVCpcmhZC/GSEknkNIzcqYe6/mIrKuucIuN6Kz7nuj
 eA1GTOz0RjLJ6RPnk7vD7YXKVv7hsHMX4jBamgHBz7v+0JBa++dexiKDbDTJnCpNJ4NO
 Gg8g==
X-Gm-Message-State: AOAM532TRvftv3HF+YJTNyWOxrHPccUqExB20wsPECVGz/a1HUZH6Mr2
 aLR1iZjEeyLjmYMiL/dXG2S+kxLSY+5Q5ZsEHZdDxiyor9CKugvowVon/QN2s4TxAd/Vc118E7M
 IusJkSl2YC4M7Kzk=
X-Received: by 2002:adf:8b17:: with SMTP id n23mr20636221wra.290.1633446724496; 
 Tue, 05 Oct 2021 08:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0EEI6rFDDtKXrQNSwoPGu3TR+Nqz0EgmPBgV7hgwyVe3/sE/ZETH0WIb2Fbx2vQNwthPoAA==
X-Received: by 2002:adf:8b17:: with SMTP id n23mr20636194wra.290.1633446724264; 
 Tue, 05 Oct 2021 08:12:04 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id z133sm2570510wmc.45.2021.10.05.08.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 08:12:03 -0700 (PDT)
Subject: Re: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
To: John Snow <jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-13-jsnow@redhat.com>
 <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
 <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
 <CAFn=p-bTtRWdLhMuaQdH=pSy26KytrfXcidO4RePBunXxwUbSA@mail.gmail.com>
 <372c86ac-0061-2d9a-b366-72260d91bd75@redhat.com>
 <CAFn=p-bLmHQRK9UT6H2F4C46tjZe6HnO=cYJJdB7z-j1uChk-Q@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <b97f1ad0-5eaf-7732-4dd2-043a04cb0455@redhat.com>
Date: Tue, 5 Oct 2021 17:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bLmHQRK9UT6H2F4C46tjZe6HnO=cYJJdB7z-j1uChk-Q@mail.gmail.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04.10.21 20:32, John Snow wrote:
>
>
> On Mon, Oct 4, 2021 at 6:12 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:
>
>     On 18.09.21 04:14, John Snow wrote:
>     >
>     >
>     > On Fri, Sep 17, 2021 at 8:58 PM John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>
>     > <mailto:jsnow@redhat.com <mailto:jsnow@redhat.com>>> wrote:
>     >
>     >
>     >
>     >     On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz
>     <hreitz@redhat.com <mailto:hreitz@redhat.com>
>     >     <mailto:hreitz@redhat.com <mailto:hreitz@redhat.com>>> wrote:
>     >
>     >         On 17.09.21 07:40, John Snow wrote:
>     >         > Disable the aqmp logger, which likes to (at the moment)
>     >         print out
>     >         > intermediate warnings and errors that cause session
>     >         termination; disable
>     >         > them so they don't interfere with the job output.
>     >         >
>     >         > Leave any "CRITICAL" warnings enabled though, those
>     are ones
>     >         that we
>     >         > should never see, no matter what.
>     >
>     >         I mean, looks OK to me, but from what I understand (i.e.
>     little),
>     >         qmp_client doesn’t log CRITICAL messages, at least I
>     can’t see
>     >         any. Only
>     >         ERRORs.
>     >
>     >
>     >     There's *one* critical message in protocol.py, used for a
>     >     circumstance that I *think* should be impossible. I do not
>     think I
>     >     currently use any WARNING level statements.
>     >
>     >         I guess I’m missing some CRITICAL messages in external
>     >         functions called
>     >         from qmp_client.py, but shouldn’t we still keep ERRORs?
>     >
>     >
>     >     ...Mayyyyyybe?
>     >
>     >     The errors logged by AQMP are *almost always* raised as
>     Exceptions
>     >     somewhere else, eventually. Sometimes when we encounter them in
>     >     one context, we need to save them and then re-raise them in a
>     >     different execution context. There's one good exception to this:
>     >     My pal, EOFError.
>     >
>     >     If the reader context encounters EOF, it raises EOFError and
>     this
>     >     causes a disconnect to be scheduled asynchronously. *Any*
>     >     Exception that causes a disconnect to be scheduled
>     asynchronously
>     >     is dutifully logged as an ERROR. At this point in the code, we
>     >     don't really know if the user of the library considers this an
>     >     "error" yet or not. I've waffled a lot on how exactly to treat
>     >     this circumstance. ...Hm, I guess that's really the only case
>     >     where I have an error that really ought to be suppressed. I
>     >     suppose what I will do here is: if the exception happens to
>     be an
>     >     EOFError I will drop the severity of the log message down to
>     INFO.
>     >     I don't know why it takes being challenged on this stuff to
>     start
>     >     thinking clearly about it, but here we are. Thank you for your
>     >     feedback :~)
>     >
>     >     --js
>     >
>     >
>     > Oh, CI testing reminds me of why I am a liar here.
>     >
>     > the mirror-top-perms test intentionally expects not to be able to
>     > connect, but we're treated to these two additional lines of output:
>     >
>     > +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Negotiation failed:
>     EOFError
>     > +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Failed to establish
>     session:
>     > EOFError
>     >
>     > Uh. I guess a temporary suppression in mirror-top-perms, then ...?
>
>     Sounds right to me, if that’s simple enough.
>
>     (By the way, I understand it right that you want to lower the
>     severity
>     of EOFErrors to INFO only on disconnect, right?  Which is why they’re
>     still logged as ERRORs here, because they aren’t occurring on
>     disconnects?)
>
>
> More or less, yeah.
>
> When an EOFError causes the reader coroutine to halt (because it can't 
> read the next message), I decided (in v2) to drop that one particular 
> logging message down to "INFO", because it might -- or might not be -- 
> an expected occurrence from the point of view of whoever is managing 
> the QMP connection. Maybe it was expected (The test used 
> qemu-guest-agent or something else to make the guest shutdown, taking 
> QEMU down with it without the knowledge of the QMP library layer) or 
> maybe it was unexpected (the QMP remote really just disappeared from 
> us on a whim). There's no way to know, so it probably isn't right to 
> consider it an error.
>
> In the connection case, I left it as an ERROR because the caller asked 
> us to connect to an endpoint and we were unable to, which feels 
> unambiguous. It will be ultimately reported via Exceptions as 
> qemu.aqmp.ConnectError, with additional information available in 
> fields of that exception object. Even though the exception is reported 
> to the caller, I decided to log the occurrence anyway, because I felt 
> like it should be the job of the library to make a good log and not 
> the caller's responsibility to catch the exception and then log it 
> themselves.
>
> That does leave us with this atypical case though: the caller is 
> intentionally causing problems :)
>
> (Well, atypical for a user of the library who is using it to make a 
> tool they expect to work. Quite a typical case for tests in the 
> abstract, though we only seem to have precisely one usage of this 
> pattern in iotests so far.)
>
>     > In most other cases I rather imagine we do want to see this kind of
>     > output to help give more information about how things have
>     failed --
>     > they ARE errors. We just happen to not care about them right here.
>
>     Well, in fact we do expect them here, so we could even log them, but
>     first I don’t know whether they’re stable enough for that, and second
>     this would break the “choose the AQMP or legacy QMP back-end via an
>     environment variable” thing.
>
>
> Yeah, that's the other half of it, I came to realize. Just logging the 
> expected failure feels the most idiomatic, but it requires a new 
> logging filter (I have to filter out the PID from the logger name to 
> make it work consistently) and breaks the ability to switch.
>
> So I suppose "for now" just disabling the logger output for a critical 
> section and leaving a comment that states that once we're feeling 
> confident about the new library (maybe after the next release when 
> everything has really gone through the testing wash cycle) we can 
> remove the suppression and just log the errors the normal way.
>
>     > The only thing I don't exactly like about this is that it requires
>     > some knowledge by the caller to know to disable it. It makes
>     writing
>     > negative tests a bit more annoying because the library leans so
>     > heavily on yelling loudly when it encounters problems.
>
>     Yeah.  I’m afraid I don’t have a good idea on how to convey test
>     writers
>     how to suppress these errors, even if it were a simple one-liner
>     (like
>     `self.vm_b.set_log_threshold(logging.CRITICAL)`)...
>
>     We could start an “iotests tips and tricks” document, but do we
>     want to?
>
>     Hanna
>
>
> Hm, not just yet. More chances for un-checked stuff to bitrot. There's 
> only this one caller that poses a problem here, so it's probably not 
> going to be too difficult to just update tests to expect the error logs.

OK.

> V2 soon. I already respun it, but it's been a week, so I will need to 
> scrub it down with a good proof-reading pass. Thanks for your 
> patience, and I hope you enjoyed your PTO :~)

You know how it is.  Some of it was spent enjoying it, the rest was 
spent lamenting that I’m not enjoying it enough.

Hanna


