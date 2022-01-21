Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C089495D02
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:42:43 +0100 (CET)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqRO-000095-MS
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:42:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nApVv-00044U-Nb
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:43:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nApVr-0004LF-Vb
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642754594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tin/VM9cWPVOxmnIJBqKDVgikeDiRgwVJ8TNXFFMhg0=;
 b=fip+ElzP8R8rV4G6FfxGrWqgrbNXmu9iKxr9qsTxTa+lyAz1DSVH8H7/I/3BdZYRpC75yt
 fDHVu+TCXxPTppwL9FTxEyZF4mCtS9jpKaacHH2w1J/hR/HKg9hwURzyH0fyL9NDK3ZfTR
 EyKdZS+6/FpZ7Wz8YLxoVug4RGEc/Ns=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-x43SUh5JN5SVny2lszMEMA-1; Fri, 21 Jan 2022 03:43:13 -0500
X-MC-Unique: x43SUh5JN5SVny2lszMEMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o193-20020a1ca5ca000000b0034d78423625so7672005wme.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 00:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tin/VM9cWPVOxmnIJBqKDVgikeDiRgwVJ8TNXFFMhg0=;
 b=iCzTgGk+PWgSxPfL1bNkiKJK/5u0HgYHzS79lRDv9SnLJD59h04J/o69Z5os1NH4i+
 TwtuxW5XhYC8sD28w+KsMfaGDKbFixNQP1384BkBozXHs123IWV9iU82OBTa4uCGMCQm
 JD1wm44VmImGgDIjYr13An/cCop7DbIeb3/8PY/6Lr7OGlGefhVHro5f8XiewMYbvwtK
 bS3BlWMP5rm+orkhZYZmLhHCrOo8J1p4i5ejCpiAWTtNMXVxtQ4aLeRWfvZ/CVj2ynBl
 n5P2nh2N18RY91A3+C8ef7KpairQIE46tauIhi9pJ2h287nVI+QAFo6rMaIv0trBDAyx
 W0dg==
X-Gm-Message-State: AOAM530A6lchfGJPWmb+TVNv0YXQHPpVw+pUdtBRp59aylO4Z41Vi5zx
 x3tr3dTp9RU5eA8T38nSIIsRj8i/1QO7Dx/trhkVcQbZJvvQRRm5mntUvdfOi00xiUGYI3fpTek
 hAR0T55CYuUFlyaQ=
X-Received: by 2002:a5d:4404:: with SMTP id z4mr2896005wrq.227.1642754591901; 
 Fri, 21 Jan 2022 00:43:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgRRoYq72R/+sDj83+/xJ/CObmnsdNuRh3O6pCJ6MHGC0Hc4soT6shP13vOMXvGixtAv90UQ==
X-Received: by 2002:a5d:4404:: with SMTP id z4mr2895991wrq.227.1642754591581; 
 Fri, 21 Jan 2022 00:43:11 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id z1sm9919388wmk.32.2022.01.21.00.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 00:43:11 -0800 (PST)
Message-ID: <f7b6d0e0-ee5f-f7ed-795b-27b13ff816c7@redhat.com>
Date: Fri, 21 Jan 2022 09:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
To: Markus Armbruster <armbru@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
 <YehIosxuXCqsGBSW@redhat.com> <87ee5275ya.fsf@dusky.pond.sub.org>
 <ffaf9aee-56e9-c332-09ad-158a3e28758b@redhat.com>
 <87pmol62kv.fsf@dusky.pond.sub.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <87pmol62kv.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 07:10, Markus Armbruster wrote:
> Hanna Reitz <hreitz@redhat.com> writes:
>
>> On 20.01.22 17:00, Markus Armbruster wrote:
>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>
>>>> Am 19.01.2022 um 14:44 hat Hanna Reitz geschrieben:
>>>>> On 19.01.22 13:58, Markus Armbruster wrote:
>>>>>> Hanna Reitz <hreitz@redhat.com> writes:
>>>>>>
>>>>>>> We want to add a --daemonize argument to QSD's command line.
>>>>>> Why?
>>>>> OK, s/we/I/.  I find it useful, because without such an option, I need to
>>>>> have whoever invokes QSD loop until the PID file exists, before I can be
>>>>> sure that all exports are set up.  I make use of it in the test cases added
>>>>> in patch 3.
>>>>>
>>>>> I suppose this could be worked around with a special character device, like
>>>>> so:
>>>>>
>>>>> ```
>>>>> ncat --listen -U /tmp/qsd-done.sock </dev/null &
>>>>> ncat_pid=$!
>>>>>
>>>>> qemu-storage-daemon \
>>>>>       ... \
>>>>>       --chardev socket,id=signal_done,path=/tmp/qsd-done.sock \
>>>>>       --monitor signal_done \
>>>>>       --pidfile /tmp/qsd.pid &
>>>>>
>>>>> wait $ncat_pid
>>>>> ```
>>>>>
>>>>> But having to use an extra tool for this is unergonomic.  I mean, if there’s
>>>>> no other way...
>>> I know duplicating this into every program that could server as a daemon
>>> is the Unix tradition.  Doesn't make it good.  Systemd[*] has tried to
>>> make it superfluous.
>> Well.  I have absolutely nothing against systemd.  Still, I will not
>> use it in an iotest, that’s for sure.
> My point isn't "use systemd in iotests".  It's "consider doing it like
> systemd", i.e. do the daemonization work in a utility program.  For what
> it's worth, Linux has daemonize(1).

The problem I face is that currently there is no ergonomic way to wait 
until the QSD is up and running (besides looping until the PID file 
exists), and I don’t think a utility program that doesn’t know the QSD 
could provide this.  (For example, it looks like daemonize(1) will have 
the parent exit immediately, regardless of whether the child is set up 
or not.)

> [...]
>
>>> Care to put a brief version of the rationale for --daemonize and for
>>> forking early in the commit message?
>> Well, my rationale for adding the feature doesn’t really extend beyond
>> “I want it, I find it useful, and so I assume others will, too”.
> Don't pretend to be obtuse, it's not credible :)  You mentioned iotests,
> which makes me guess your rationale is "I want this for iotests, and
> there may well be other uses."

Oh, I also want it for other things, like the script I have to use the 
QSD to make disk images accessible as raw files.  Thing is, the stress 
is on “want” in contrast to “need”.  I can do without --daemonize, I 
have already done so, even before there was --pidfile (I just queried 
the block exports through QMP until they were all there).  It’s just 
that it’s kind of a pain.

Same with the iotests, it’s absolutely possible to get away without 
--daemonize.  It’s just that I wrote the test, wanted to use some form 
of --daemonize option, noticed there wasn’t any yet, and thought “Oh, 
that’d be nice to have”.

I would love a --daemonize option, but I can’t say it’s necessary. If 
the way it’d need to be implemented isn’t acceptable, then I won’t force 
it into the code.

>> I don’t really like putting “qemu-nbd has it” there, because... it was
>> again me who implemented it for qemu-nbd.  Because I found it useful.
>> But I can of course do that, if it counts as a reason.
> Useful *what for*, and we have rationale.
>
>> I can certainly (and understand the need to, and will) elaborate on
>> the “This will require forking the process before we do any complex
>> initialization steps” part.
> Thanks!
>


