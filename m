Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BF4C1AE0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:23:19 +0100 (CET)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwII-0008Jr-Na
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:23:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMwGI-0006wU-Bu
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMwGG-0004WP-0b
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645640469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82cPc1JufU+VGSx5CCAZ5GbBd48V3KockAQB6EA9lWU=;
 b=A+Tk7QD14xPgnm4ASDmMWlvy4sNHE8xTDDf7QrZFLlEOyIHwmr7cMOY7k7pDA10lKnC0W6
 EG8b4Zh0xTFIHnmwWCuQXDGgd1rU2LXPlYAL4rR0MIix28MPeFpxDJzzn0h9xFaL7prRBV
 kjOd3BBUxOvPmO+yPOTvuKdABob0kwU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-zVbeeeejM-OrFu518it3uw-1; Wed, 23 Feb 2022 13:21:08 -0500
X-MC-Unique: zVbeeeejM-OrFu518it3uw-1
Received: by mail-ua1-f71.google.com with SMTP id
 n1-20020ab07481000000b0033bd83da484so1881513uap.20
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 10:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=82cPc1JufU+VGSx5CCAZ5GbBd48V3KockAQB6EA9lWU=;
 b=P+jf9xJRAVmkAkh6gDnyAgJsMeZkJyg/uDuVD8yzJLC3ghRoXbhevbjNacdkQcm/Lz
 rmVk6RJ40Iw/1uBL24lSCTsmxmLhPeaNhaTpvesVh77iY2GNNa36hhqkkK/vL1OLHLKZ
 kX9fr3re+HWPuf+DBLW2wScNsUg72JoboTf/NN9FPqBA6Wk5zWhI5CkmfrXoAJZLCO8I
 yC45uWM3EevP5LdpCLT0FgiirtF20bchP6uR4VBOPeax5x7UaJmdRq1Dfqnx/oTza3F2
 Mq6kBlGWNw63/rVPkopiw4P0ogwRwJcRWs2Dm9Lai0Q/7h/ZEs96AV1wcMirJ3ujHPAd
 WOoQ==
X-Gm-Message-State: AOAM5326xqPxKmRDt8lzNvO0D90FvVmq12DTX2kJ9s4XTtnFtS/pgCyI
 lbV/WK4fLyjm2Hu4WRoMO4ue8VyitEpf7PW8AS3eJ+wOMGMS9738ivFGou59FCCpYuPIVfxgCNr
 1XN2URtfrrXprhoNojZS+GFBAcwMl1N4=
X-Received: by 2002:ab0:48b2:0:b0:30b:883e:d88a with SMTP id
 x47-20020ab048b2000000b0030b883ed88amr390786uac.87.1645640467361; 
 Wed, 23 Feb 2022 10:21:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgYb+D3lwUN+8S8JFI+zbhY/g2BNTFqDm2ZnLRb4Ob5A3DOPN8kqnBI/NWw07hHHRZZKCySQOEeweCES31ZQU=
X-Received: by 2002:ab0:48b2:0:b0:30b:883e:d88a with SMTP id
 x47-20020ab048b2000000b0030b883ed88amr390778uac.87.1645640466984; Wed, 23 Feb
 2022 10:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
 <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
 <YhZST1fCU54OgoP2@redhat.com>
 <CAFn=p-bo39LEvQhKBZZ6ZcEfhaaZ7eQDgDFMOEZtDkCV_XH54w@mail.gmail.com>
 <YhZWcFY1sGSV/OX8@redhat.com>
 <CAFn=p-aSbkdzqZQAZYKX2mPo9BVmX0U5s+huXQH-JcD5N6+WCA@mail.gmail.com>
 <4d5d4192-2e60-af23-dcfa-2e76e9b5f71d@greensocs.com>
In-Reply-To: <4d5d4192-2e60-af23-dcfa-2e76e9b5f71d@greensocs.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Feb 2022 13:20:56 -0500
Message-ID: <CAFn=p-ZKe4AN7g9fSbJVaP6iG1kikkkeAa5nHvT-cXdGdEqEnw@mail.gmail.com>
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
To: Damien Hedde <damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 12:09 PM Damien Hedde
<damien.hedde@greensocs.com> wrote:
>
>
>
> On 2/23/22 17:18, John Snow wrote:
> > On Wed, Feb 23, 2022 at 10:44 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> >>
> >> On Wed, Feb 23, 2022 at 10:41:11AM -0500, John Snow wrote:
> >>> On Wed, Feb 23, 2022 at 10:27 AM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
> >>>>
> >>>> On Wed, Feb 23, 2022 at 10:22:11AM -0500, John Snow wrote:
> >>>>> On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
> >>>>> <damien.hedde@greensocs.com> wrote:
> >>>>>>
> >>>>>> This option makes qmp_shell exit (with error code 1)
> >>>>>> as soon as one of the following error occurs:
> >>>>>> + command parsing error
> >>>>>> + disconnection
> >>>>>> + command failure (response is an error)
> >>>>>>
> >>>>>> _execute_cmd() method now returns None or the response
> >>>>>> so that read_exec_command() can do the last check.
> >>>>>>
> >>>>>> This is meant to be used in combination with an input file
> >>>>>> redirection. It allows to store a list of commands
> >>>>>> into a file and try to run them by qmp_shell and easily
> >>>>>> see if it failed or not.
> >>>>>>
> >>>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >>>>>
> >>>>> Based on this patch, it looks like you really want something
> >>>>> scriptable, so I think the qemu-send idea that Dan has suggested mi=
ght
> >>>>> be the best way to go. Are you still hoping to use the interactive
> >>>>> "short" QMP command format? That might be a bad idea, given how fla=
ky
> >>>>> the parsing is -- and how we don't actually have a published standa=
rd
> >>>>> for that format. We've *never* liked the bad parsing here, so I hav=
e a
> >>>>> reluctance to use it in more places.
> >>>>>
> >>>>> I'm having the naive idea that a script file could be as simple as =
a
> >>>>> list of QMP commands to send:
> >>>>>
> >>>>> [
> >>>>>      {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
> >>>>>      ...
> >>>>> ]
> >>>>
> >>>> I'd really recommend against creating a new format for the script
> >>>> file, especially one needing opening & closing  [] like this, as
> >>>> that isn't so amenable to dynamic usage/creation. ie you can't
> >>>> just append an extcra command to an existing file.
> >>>>
> >>>> IMHO, the "file" format should be identical to the result of
> >>>> capturing the socket data off the wire. ie just a concatenation
> >>>> of QMP commands, with no extra wrapping / change in format.
> >>>>
> >>>
> >>> Eugh. That's just so hard to parse, because there's no off-the-shelf
> >>> tooling for "load a sequence of JSON documents". Nothing in Python
> >>> does it. :\
> >>
> >> It isn't that hard if you require each JSON doc to be followed by
> >> a newline.
> >>
> >> Feed one line at a time to the JSON parser, until you get a complete
> >> JSON doc, process that, then re-init the parser and carry on feeding
> >> it lines until it emits the next JSON doc, and so on.
> >>
> >
> > There's two interfaces in Python:
> >
> > (1) json.load(), which takes a file pointer and either returns a
> > single, complete JSON document or it raises an Exception. It's not
> > useful here at all.
> > (2) json.JSONDecoder().raw_decode(strbuf), which takes a string buffer
> > and returns a 2-tuple of a JSON Document and the position at which it
> > stopped decoding.
> >
> > The second is what we need here, but it does require buffering the
> > entire file into a string first, and then iteratively calling it. It
> > feels like working against the grain a little bit. We also can't use
> > the QAPI parser, as that parser has intentionally removed support for
> > constructs we don't use in the qapi schema language. Boo. (Not that I
> > want more non-standard configuration files like that propagating,
> > either.)
> >
> > It would be possible to generate a JSON-Schema document to describe a
> > script file that used a containing list construct, but impossible for
> > a concatenation of JSON documents. This is one of the reasons I
> > instinctively shy away from non-standard file formats, they tend to
> > cut off support for this sort of thing.
> >
> > Wanting to keep the script easy to append to is legitimate. I'm keen
> > to hear a bit more about the use case here before I press extremely
> > hard in any given direction, but those are my impulses here.
> >
>
> The use case is to be able to feed qemu with a bunch of commands we
> expect to succeed and let qemu continue (unlike Daniel's wrap use case,
> we don't want to quit qemu after the last command).
>
> Typically it's the use case I present in the following cover-letter:
> https://lore.kernel.org/qemu-devel/20220223090706.4888-1-damien.hedde@gre=
ensocs.com/
>

OK (Sorry for blowing this out into a bigger ordeal than you had maybe
hoped for. I want to get you happy and on your way ASAP, I promise)

So, I see comments and simple QMP commands using the short-hand
format. If I understand correctly, you want this script upstream so
that you don't have to re-engineer the hack every time I shift
something around in qmp-shell, and so that examples can be easily
shared and reproduced between parties. Good reasons, so I want to help
you out and get something merged. (An aside: In the past I have just
copy-pasted stuff into my qmp-shell terminal. It's less reproducible
for people who aren't used to using the tool, but it's been just
enough juice for me in the past. I empathize with wanting to give
someone a single-shot command they can copy-paste and have it Just
Work.)

Some observations:

(1) Comments we don't have in JSON, but we could use YAML instead, I'm
fine with that personally. It does mean a new format (We don't have
QMP-as-YAML anywhere in-tree), but it's one that maps so directly to
JSON that I don't really consider it a problem. We might need to add a
YAML dependency to the Python tools, but we can make the feature
optional based on the presence of the yaml parser package. We can make
it print a nice error explaining why it's not supported when pyyaml
isn't found. It's an extremely common library. However, using YAML
*requires* you to use a parsing tool (qmp-shell, qmp-send, whichever)
to translate it to the wire format. Slight downside, but then again:
It seems likely that we'll have different design priorities that
separate a human-readable script file from the actual wire protocol
format.

We could also use JSON5, although that doesn't have native support in
Python, so I am somewhat against it for that reason.
We could also use the same "custom" format we use in qapi-gen for the
QAPI schema, since at least we already use it in the tree. I'm not a
big fan, but hey, there's precedent. (The custom QAPI parser would
need to be expanded to allow the full spectrum of JSON value types and
split out from the QAPI generator. It's possible to do, and I've
thought about doing it before.)

Using Dan's suggestion and storing commands as a sequence of JSON
documents works (And avoids irritating anyone over a new format), but
doesn't allow us the chance to use comments. That's slightly less
useful for sharing little examples that are also human-readable on the
ML. A plus side is that it's easy to just copy-paste the commands and
toss them into socat if you're used to testing QMP that way, which a
lot of QEMU devs seem to be. A downside is that anything that exceeds
the complexity of just "pasting QMP straight into the socket" is not
possible with this format, see point #3 below.

(2) The short-hand format qmp-shell uses is problematic because it's
non-standard and doesn't handle nested data very well. block device
commands in particular are a bit fragile -- again because we don't
have a parser in Python that is capable of starting from '{' and
reading until the closing '}', so we require that embedded JSON
arguments have no spaces at all. It's not the best, but we've never
come up with anything better. A saving grace has been that at least
this syntax was limited to the interactive interface. This is probably
the main reason people wince when extending this format to a script
we'll need to maintain backwards compatibility for.

(3) The main benefit to using a script file like this is to be able to
stop at the first error. Valid. Do you anticipate needing more
advanced "waiting" constructs, though? For instance, calling a block
formatting command and waiting until the formatting is complete before
continuing; calling any block job, etc. I am wondering if we need to
consider event-waits as part of this design space or not. Obviously
including them will complicate things a bit, but I might want to leave
open the option for future inclusion if we want to expand in that
direction.

Basically, we just don't have a good syntax for "human readable QMP"
and we've never agreed on one. The one we have in qmp-shell is fairly
widely disliked, but at least confined to human usage.

So, ways out of the swamp:

(A) I'm completely fine with adding an interactive command to
qmp-shell ("/play file.txt") or even --play-script file.txt to the
command line so long as the qmp-shell doesn't actually exit
automatically. I.e., it stays interactive. Then I don't really care
what the file format is, because it's not a scripting interface. It's
just a neat little feature for convenience.

(B) qemu-send is a good idea, but we need to decide on the storage
format. Dan's idea involves the absolute least amount of design work.
You could possibly add comments by pre-filtering the input and then
passing it off to json.loads(), but it does preclude any more advanced
constructs like timed waits, event waits, etc. Even so, this approach
is *really* easy for me to accept into the tree.

(C) qemu-send, but with a "custom" script format. YAML, JSON5, the
QAPI JSON dialect. Opens Pandora's Box, but has merit.


As an FYI, I am likely to embark on option (C) myself for separate
reasons for the aqmp-tui tool that I am still working on. I want to
add some advanced features to that tool:
- Save command history as a playback file
- Load playback files and re-play them at the server
- Generate an iotest stub based on the current history / a playback file

That's a bigger design problem and I have no intention of burdening
you with it, but it does make me wonder if we choose the simplest
option right now that I'll have another problem dealing with obsoleted
script files in the future when I want to deprecate qmp-shell. Eh, I
can always augment a theoretical qmp-send tool to "upgrade" in the
future to be able to read either "v1" or "v2" formats based on what it
sees. Making that kind of behavior very easy to perform in the future
somehow would be greatly appreciated.

*exhale*

Alright, so which way should we head?

--js


