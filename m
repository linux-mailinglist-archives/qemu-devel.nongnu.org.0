Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74894C2AE0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:26:46 +0100 (CET)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCGj-0002CZ-Qq
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nNCAW-0008FG-BQ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:20:20 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:59998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nNCAS-00022R-Hy
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:20:19 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B4AB82077F;
 Thu, 24 Feb 2022 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645701612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RQIb8gZ1knfKKkQetIN8LOYwBrpgwExjFxpWFD7Hfg=;
 b=O3N8xIGOPTl9TMOhLPNYnB2md1t73EEYt4SIUYO1fXAEaW1aZT14aoyht5iWe6xYElnqAg
 s2Mx8LXs0Ap9LhGzpDWt8/6K/9kezKhgNX6TAHeuYTdlyLBLt8caZR0iH1Yypkna1mf5Pp
 bA9qrxHuFSR1ON4nVhpSsTCMcx9t1UY=
Message-ID: <2195f0ac-8ac4-8046-e77f-6150d7bdbe49@greensocs.com>
Date: Thu, 24 Feb 2022 12:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
Content-Language: en-US-large
To: John Snow <jsnow@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
 <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
 <YhZST1fCU54OgoP2@redhat.com>
 <CAFn=p-bo39LEvQhKBZZ6ZcEfhaaZ7eQDgDFMOEZtDkCV_XH54w@mail.gmail.com>
 <YhZWcFY1sGSV/OX8@redhat.com>
 <CAFn=p-aSbkdzqZQAZYKX2mPo9BVmX0U5s+huXQH-JcD5N6+WCA@mail.gmail.com>
 <4d5d4192-2e60-af23-dcfa-2e76e9b5f71d@greensocs.com>
 <CAFn=p-ZKe4AN7g9fSbJVaP6iG1kikkkeAa5nHvT-cXdGdEqEnw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFn=p-ZKe4AN7g9fSbJVaP6iG1kikkkeAa5nHvT-cXdGdEqEnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/23/22 19:20, John Snow wrote:
> On Wed, Feb 23, 2022 at 12:09 PM Damien Hedde
> <damien.hedde@greensocs.com> wrote:
>>
>>
>>
>> On 2/23/22 17:18, John Snow wrote:
>>> On Wed, Feb 23, 2022 at 10:44 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>
>>>> On Wed, Feb 23, 2022 at 10:41:11AM -0500, John Snow wrote:
>>>>> On Wed, Feb 23, 2022 at 10:27 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>>
>>>>>> On Wed, Feb 23, 2022 at 10:22:11AM -0500, John Snow wrote:
>>>>>>> On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
>>>>>>> <damien.hedde@greensocs.com> wrote:
>>>>>>>>
>>>>>>>> This option makes qmp_shell exit (with error code 1)
>>>>>>>> as soon as one of the following error occurs:
>>>>>>>> + command parsing error
>>>>>>>> + disconnection
>>>>>>>> + command failure (response is an error)
>>>>>>>>
>>>>>>>> _execute_cmd() method now returns None or the response
>>>>>>>> so that read_exec_command() can do the last check.
>>>>>>>>
>>>>>>>> This is meant to be used in combination with an input file
>>>>>>>> redirection. It allows to store a list of commands
>>>>>>>> into a file and try to run them by qmp_shell and easily
>>>>>>>> see if it failed or not.
>>>>>>>>
>>>>>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>>>>>
>>>>>>> Based on this patch, it looks like you really want something
>>>>>>> scriptable, so I think the qemu-send idea that Dan has suggested might
>>>>>>> be the best way to go. Are you still hoping to use the interactive
>>>>>>> "short" QMP command format? That might be a bad idea, given how flaky
>>>>>>> the parsing is -- and how we don't actually have a published standard
>>>>>>> for that format. We've *never* liked the bad parsing here, so I have a
>>>>>>> reluctance to use it in more places.
>>>>>>>
>>>>>>> I'm having the naive idea that a script file could be as simple as a
>>>>>>> list of QMP commands to send:
>>>>>>>
>>>>>>> [
>>>>>>>       {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
>>>>>>>       ...
>>>>>>> ]
>>>>>>
>>>>>> I'd really recommend against creating a new format for the script
>>>>>> file, especially one needing opening & closing  [] like this, as
>>>>>> that isn't so amenable to dynamic usage/creation. ie you can't
>>>>>> just append an extcra command to an existing file.
>>>>>>
>>>>>> IMHO, the "file" format should be identical to the result of
>>>>>> capturing the socket data off the wire. ie just a concatenation
>>>>>> of QMP commands, with no extra wrapping / change in format.
>>>>>>
>>>>>
>>>>> Eugh. That's just so hard to parse, because there's no off-the-shelf
>>>>> tooling for "load a sequence of JSON documents". Nothing in Python
>>>>> does it. :\
>>>>
>>>> It isn't that hard if you require each JSON doc to be followed by
>>>> a newline.
>>>>
>>>> Feed one line at a time to the JSON parser, until you get a complete
>>>> JSON doc, process that, then re-init the parser and carry on feeding
>>>> it lines until it emits the next JSON doc, and so on.
>>>>
>>>
>>> There's two interfaces in Python:
>>>
>>> (1) json.load(), which takes a file pointer and either returns a
>>> single, complete JSON document or it raises an Exception. It's not
>>> useful here at all.
>>> (2) json.JSONDecoder().raw_decode(strbuf), which takes a string buffer
>>> and returns a 2-tuple of a JSON Document and the position at which it
>>> stopped decoding.
>>>
>>> The second is what we need here, but it does require buffering the
>>> entire file into a string first, and then iteratively calling it. It
>>> feels like working against the grain a little bit. We also can't use
>>> the QAPI parser, as that parser has intentionally removed support for
>>> constructs we don't use in the qapi schema language. Boo. (Not that I
>>> want more non-standard configuration files like that propagating,
>>> either.)
>>>
>>> It would be possible to generate a JSON-Schema document to describe a
>>> script file that used a containing list construct, but impossible for
>>> a concatenation of JSON documents. This is one of the reasons I
>>> instinctively shy away from non-standard file formats, they tend to
>>> cut off support for this sort of thing.
>>>
>>> Wanting to keep the script easy to append to is legitimate. I'm keen
>>> to hear a bit more about the use case here before I press extremely
>>> hard in any given direction, but those are my impulses here.
>>>
>>
>> The use case is to be able to feed qemu with a bunch of commands we
>> expect to succeed and let qemu continue (unlike Daniel's wrap use case,
>> we don't want to quit qemu after the last command).
>>
>> Typically it's the use case I present in the following cover-letter:
>> https://lore.kernel.org/qemu-devel/20220223090706.4888-1-damien.hedde@greensocs.com/
>>
> 
> OK (Sorry for blowing this out into a bigger ordeal than you had maybe
> hoped for. I want to get you happy and on your way ASAP, I promise)
> 
> So, I see comments and simple QMP commands using the short-hand
> format. If I understand correctly, you want this script upstream so
> that you don't have to re-engineer the hack every time I shift
> something around in qmp-shell, and so that examples can be easily
> shared and reproduced between parties. Good reasons, so I want to help
> you out and get something merged. (An aside: In the past I have just
> copy-pasted stuff into my qmp-shell terminal. It's less reproducible
> for people who aren't used to using the tool, but it's been just
> enough juice for me in the past. I empathize with wanting to give
> someone a single-shot command they can copy-paste and have it Just
> Work.)
> 
> Some observations:
> 
> (1) Comments we don't have in JSON, but we could use YAML instead, I'm
> fine with that personally. It does mean a new format (We don't have
> QMP-as-YAML anywhere in-tree), but it's one that maps so directly to
> JSON that I don't really consider it a problem. We might need to add a
> YAML dependency to the Python tools, but we can make the feature
> optional based on the presence of the yaml parser package. We can make
> it print a nice error explaining why it's not supported when pyyaml
> isn't found. It's an extremely common library. However, using YAML
> *requires* you to use a parsing tool (qmp-shell, qmp-send, whichever)
> to translate it to the wire format. Slight downside, but then again:
> It seems likely that we'll have different design priorities that
> separate a human-readable script file from the actual wire protocol
> format.
> 
> We could also use JSON5, although that doesn't have native support in
> Python, so I am somewhat against it for that reason.
> We could also use the same "custom" format we use in qapi-gen for the
> QAPI schema, since at least we already use it in the tree. I'm not a
> big fan, but hey, there's precedent. (The custom QAPI parser would
> need to be expanded to allow the full spectrum of JSON value types and
> split out from the QAPI generator. It's possible to do, and I've
> thought about doing it before.)
> 
> Using Dan's suggestion and storing commands as a sequence of JSON
> documents works (And avoids irritating anyone over a new format), but
> doesn't allow us the chance to use comments. That's slightly less
> useful for sharing little examples that are also human-readable on the
> ML. A plus side is that it's easy to just copy-paste the commands and
> toss them into socat if you're used to testing QMP that way, which a
> lot of QEMU devs seem to be. A downside is that anything that exceeds
> the complexity of just "pasting QMP straight into the socket" is not
> possible with this format, see point #3 below.
> 
> (2) The short-hand format qmp-shell uses is problematic because it's
> non-standard and doesn't handle nested data very well. block device
> commands in particular are a bit fragile -- again because we don't
> have a parser in Python that is capable of starting from '{' and
> reading until the closing '}', so we require that embedded JSON
> arguments have no spaces at all. It's not the best, but we've never
> come up with anything better. A saving grace has been that at least
> this syntax was limited to the interactive interface. This is probably
> the main reason people wince when extending this format to a script
> we'll need to maintain backwards compatibility for.
> 
> (3) The main benefit to using a script file like this is to be able to
> stop at the first error. Valid. Do you anticipate needing more
> advanced "waiting" constructs, though? For instance, calling a block
> formatting command and waiting until the formatting is complete before
> continuing; calling any block job, etc. I am wondering if we need to
> consider event-waits as part of this design space or not. Obviously
> including them will complicate things a bit, but I might want to leave
> open the option for future inclusion if we want to expand in that
> direction.
> 
> Basically, we just don't have a good syntax for "human readable QMP"
> and we've never agreed on one. The one we have in qmp-shell is fairly
> widely disliked, but at least confined to human usage.
> 
> So, ways out of the swamp:
> 
> (A) I'm completely fine with adding an interactive command to
> qmp-shell ("/play file.txt") or even --play-script file.txt to the
> command line so long as the qmp-shell doesn't actually exit
> automatically. I.e., it stays interactive. Then I don't really care
> what the file format is, because it's not a scripting interface. It's
> just a neat little feature for convenience.
> 
> (B) qemu-send is a good idea, but we need to decide on the storage
> format. Dan's idea involves the absolute least amount of design work.
> You could possibly add comments by pre-filtering the input and then
> passing it off to json.loads(), but it does preclude any more advanced
> constructs like timed waits, event waits, etc. Even so, this approach
> is *really* easy for me to accept into the tree.
For comment we could even consider adding them under the key "comment" 
and filter them after json.loads().

> 
> (C) qemu-send, but with a "custom" script format. YAML, JSON5, the
> QAPI JSON dialect. Opens Pandora's Box, but has merit.
> 
> 
> As an FYI, I am likely to embark on option (C) myself for separate
> reasons for the aqmp-tui tool that I am still working on. I want to
> add some advanced features to that tool:
> - Save command history as a playback file
> - Load playback files and re-play them at the server
> - Generate an iotest stub based on the current history / a playback file
> 
> That's a bigger design problem and I have no intention of burdening
> you with it, but it does make me wonder if we choose the simplest
> option right now that I'll have another problem dealing with obsoleted
> script files in the future when I want to deprecate qmp-shell. Eh, I
> can always augment a theoretical qmp-send tool to "upgrade" in the
> future to be able to read either "v1" or "v2" formats based on what it
> sees. Making that kind of behavior very easy to perform in the future
> somehow would be greatly appreciated.
> 
> *exhale*
> 
> Alright, so which way should we head?
> 
> --js
> 

My initial idea was to keep it simple. And in our case, I think we have 
to handle only 'deterministic' commands: we deal almost exclusively with 
commands creating an object, a device, or setting a property.
I mean we know what the commands produce, so we don't need to parse the 
result. We just expect created objects to be there. Checking if the 
command failed is the only relevant test.

Comments/eol are the icing on the cake, there are numerous ways to get 
rid of them before giving a file to the script.

I don't think introducing a new format is worth-it for our use case. Our 
work is still at the beginning and I don't have clear-enough view of the 
future to give a list a features.

So any option would do.

Another feature I didn't think to integrate before seeing Daniel's 
patches is the wrap to avoid requiring 2 terminals.

So maybe if going for option (A) that need to go in the qmp-shell-wrap 
or maybe both ? I suppose we want to keep them aligned.

Regarding the wrap, most of my use cases imply that I can for example 
interact with qemu stdin (for guest interaction). So I suppose this 
eliminate (A) because having an interactive qmp-shell and an interactive 
qemu would be really messy.

So having a:
$qmp-something --file commands.txt --start-qemu [qemu command line]
would be my preference.

--
Damien



