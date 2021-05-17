Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016E383BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:06:19 +0200 (CEST)
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihdB-0004lK-QW
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1lihRi-00086V-Dc
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:54:26 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:40656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1lihRg-0004i7-L2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:54:26 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id e8so297430qvp.7
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iCdBGFtXsbMCQlT9EXnMyoD9HU/1ZTP0N3vWA2rRvh4=;
 b=J64cUIV/Lx4iyyRrJfWg8m1iJcenHhuXuHIjaXCaYYPoG9vaxglXzvE2tH4gTTTve9
 WQ9t6cC5TCQcDg12KD9HKrT+JJI5EeQ8rwZkS2kyR/0X1xkPwVsxLxTHmZJ1b/O/YlUz
 9c97y3BOki2M33IqJyoK4fhibUNRoHATpCjT2ifMpO788J0hH6GZO1TzzVnCeiFMMiG0
 xX8DXdtL4wEvta1LZKqf6XP4gkoP8wQWm+HLz+mS4Z5urFvvK5e5EqU0aI9aqRF2CYlz
 aeeOokzVTRBFo4kFeGMBpMqCWGKp65nc3LP+e7jWi+wCwiITBgottF08If0jQW9qYw2x
 kA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iCdBGFtXsbMCQlT9EXnMyoD9HU/1ZTP0N3vWA2rRvh4=;
 b=uoF+4CTlzu8Yu/aSoNXYufsBEx/oMYELmVd0i5kyZTwA4gbhAzWJenx348WcfqN2a5
 Oo2vGsw2AcHoHB3e4etEpXpbThzKq9EYqyLA1LmXWF25AbWQYFcvZaC1iNYbOI013zS5
 u2v6MTPT9o6E0HLcOtwGzSk8dcol6UGIDwpGAgq8pwmLn3DyjReTpmMqPl7UT+S12Bn9
 m6MF60JvY+RKij04uMJ+nIIJUfjErPlxSiEV/MV39z15NHp1WpA1UxbQiYxqtsmO7q+I
 gk2Q9N+ZWN/M5SANlI69l1YNT90WoapdguxzZK0pamkmBdS3iwbEy18VRYcLqAHMwdsC
 HMSQ==
X-Gm-Message-State: AOAM532uRXUaySxNruZn3E63Xq7aPPL/joaT+oKNQ1OAsvu0iwj012Qe
 dQfqb4LPau1dXPbhbE4mfHO3hQ==
X-Google-Smtp-Source: ABdhPJwUSD15Oi99BOVCx122jT0JmTEAK72WO3buPn+yowxBpf+xGOiNwPUT5173HMGHnrx8FqetuQ==
X-Received: by 2002:a05:6214:a43:: with SMTP id
 ee3mr1165927qvb.61.1621274058829; 
 Mon, 17 May 2021 10:54:18 -0700 (PDT)
Received: from ?IPv6:2804:7f0:4841:40ad:6091:b08d:7dd2:84b1?
 ([2804:7f0:4841:40ad:6091:b08d:7dd2:84b1])
 by smtp.gmail.com with ESMTPSA id 25sm976299qtd.51.2021.05.17.10.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 10:54:18 -0700 (PDT)
Subject: Re: Best approach for supporting snapshots for QEMU's gdbstub?
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <87y2chjmsf.fsf@linaro.org>
 <6c8845b7-cc60-c8ba-3ada-6d0c6e65d8a5@linaro.org> <87bl99e03j.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <ef3a9b58-6ecf-d4c1-b501-2b4d390304ec@linaro.org>
Date: Mon, 17 May 2021 14:54:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87bl99e03j.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=luis.machado@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, gdb@gnu.org,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 2:27 PM, Alex Bennée wrote:
> 
> Luis Machado <luis.machado@linaro.org> writes:
> 
>> Hi,
>>
>> On 5/14/21 1:06 PM, Alex Bennée wrote:
>>> Hi,
>>> I've been playing around with QEMU's reverse debugging support which
>>> I have working with Pavel's latest patches for supporting virtio with
>>> record/replay. Once you get the right command line it works well enough
>>> although currently each step backwards requires replaying the entire
>>> execution history until you get to the right point.
>>> QEMU can quite easily snapshot the entire VM state so I was looking
>>> to
>>> see what the best way to integrate this would be. As far as I can tell
>>> there are two interfaces gdb supports: bookmarks and checkpoints.
>>> As far as I can tell bookmarks where added as part of GDB's reverse
>>> debugging support but attempting to use them from the gdbstub reports:
>>>     (gdb) bookmark
>>>     You can't do that when your target is `remote'
>>> so I guess that would need an extension to the stub protocol to
>>> support?
>>>
>>
>> Right. We don't support reverse step/next/continue for remote targets.
>> I think this would be the most appropriate way to implement this
>> feature in GDB. But it is not trivial.
> 
> You do because ";ReverseStep+;ReverseContinue+" is part of the gdbstub
> negotiation handshake.

Interesting... I was looking at the vCont; packets for inferior 
movement. The regular c/C/s/S packet are deprecated and vCont; 
equivalents should be used instead.

It seems the reverse continue (bc) and reverse step (bs) packets can be 
used, but they are not vCont packets.

That's confusing. I suppose nobody took the time to implement bc/bs 
equivalents for vCont.

> 
> Out of interest how is rr implemented? It presents a gdb interface so I
> thought it was some implemented using some remote magic.

I don't know. I have never used rr.

> 
> <snip>
> 
>>> We could of course just add a custom monitor command like the
>>> qemu.sstep= command which could be used manually. However that would be
>>> a QEMU gdbstub specific approach.
>>
>> That would be an easy and quick way to allow GDB to control things in
>> QEMU, but I wouldn't say it is the best. Monitor commands are
>> basically a bypass of the RSP where GDB sends/receives commands
>> to/from the remote target.
> 
> We have some underlying commands we can set via the monitor including:
> 
>    monitor info replay
>    monitor replay_seek <N>
>    monitor replay_break <N>
> 
>>
>>> The other thing would be to be more intelligent on QEMU's side and
>>> save
>>> snapshots each time we hit an event, for example each time we hit a
>>> given breakpoint. However I do worry that might lead to snapshots
>>> growing quite quickly.
>>
>> GDB would need to be aware of such snapshots for them to be useful.
>> Otherwise GDB wouldn't be able to use them to restore state.
> 
> What does GDB need to know about them? Does it include something like
> the icount at a particular point.

GDB needs to know they exist so the user can choose to go back to such 
snapshots. I haven't dealt with remote reverse execution 
implementations, but if this information can be exposed to

> 
> I'm curious at how a break and reverse-continue is meant to work if that
> breakpoint is hit multiple times from the start of a run. You need to
> know if the last time you hit a particular breakpoint was in fact the
> last time before where the user was when they hit reverse-continue.

When you have record/replay on, there is no real "continue". GDB will 
instruction-step everything and will record register values and memory 
changes.

When you reverse instruction-step, GDB will restore the state for the 
previous snapshot. When you reverse continue, GDB will do the same and 
will move the state backwards snapshot by snapshot.

It is not very efficient.

So, in that sense, GDB will hit all of the breakpoints again. It doesn't 
keep track of how many times the breakpoint was hit. It only keeps track 
of how many instructions were recorded and what register/memory changes 
happened.

If you hit an instruction that GDB doesn't know how to calculate 
register/memory changes for, it will stop dead on its tracks. In that 
sense, it is also not very easy to maintain and takes a lot of 
instruction-parsing to work correctly.

No wonder there are more performatic solutions out there. :-)

> 
>>
>>> Any thoughts/suggestions?
>>>
> 
> 

