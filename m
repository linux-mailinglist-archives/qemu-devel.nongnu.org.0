Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361E439CC0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:03:57 +0200 (CEST)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf3O7-0008DB-73
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3MG-0006sm-Ne
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3MD-0004MQ-VA
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635181315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1OhYFmWZD2nVfXoHgLXq1rtdwZaudtFMZuHl2wFRDo=;
 b=NLbX8rywE3UQ7WMVAgyI9hl3nVl8NO5GJpbtcUT9wmrqTgWorcRI4ZG8Mavs2U6GXjd/CM
 MD9lOjvYPc6+TN9JreF/edsAtHdwzXmPQrEThb0bBDzsyuD1EIzPVVVqnnq4RL9RzXA04l
 1KUW/JNUuxurIC23BvDmCbugCMs2yCw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-P5J9tuEQNIC9pm5YXYneuA-1; Mon, 25 Oct 2021 13:01:52 -0400
X-MC-Unique: P5J9tuEQNIC9pm5YXYneuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso3387518wrg.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g1OhYFmWZD2nVfXoHgLXq1rtdwZaudtFMZuHl2wFRDo=;
 b=TOYLGd2ca43AyvlnBz9ms+nxRTOYupALMn3oBqaLp0d6UUbSYflswlO22axtrtplW9
 JryfLTsWEn2qdSKBkMeih2EotX5l7k0U+GBwUg9uS1P0WmjhT68ZuNIPAWTrYNhVFr75
 jsqVzCdTX5B/dnfA1MAtSKsQfqx/n1CtYtVChbddDr40gv7GsTh0XypTQjKvr8mxx9u7
 uqhUCZB8Y5hnOWqlhhuGDQFVUaoz7ciVYRPeyOXSjNypZohqX3XZcOe2yLmULWC7axfK
 /vf1X3aaT9xHirvgn6efPCzoNs6m4MKzp1J+rr0nUabj4xVKpvSBz4zsC/eZic8i7RZ2
 NpVw==
X-Gm-Message-State: AOAM531KHnfqZtlx+07VhVF84NvFfD1ECgGZVFp7jstXNxbFsRZ4s+AL
 4FScU/Rz8AkwUK9qR58lNwCRH8tWGmqKXiN8zjRME/lZVUVLxEL6C5fIVVQT722aKu+gxK25LTp
 M9sDdR/QDnorAlFA=
X-Received: by 2002:a05:6000:156e:: with SMTP id
 14mr24705797wrz.358.1635181311143; 
 Mon, 25 Oct 2021 10:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8cbJ0WyW8PPxuztcnmO7RMTRpirvQBgZcC5ysqLkzQs5xPglBa+TEQ9GEY6r1ly8FO6gvIQ==
X-Received: by 2002:a05:6000:156e:: with SMTP id
 14mr24705754wrz.358.1635181310858; 
 Mon, 25 Oct 2021 10:01:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r1sm11827547wmr.36.2021.10.25.10.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:01:50 -0700 (PDT)
Message-ID: <7f54174b-4f90-13bf-6905-6febb6203575@redhat.com>
Date: Mon, 25 Oct 2021 19:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87bl3dfg9v.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/10/21 14:19, Markus Armbruster wrote:
> Michal Privoznik <mprivozn@redhat.com> writes:
> 
>> The -preconfig option and exit-preconfig command are around for
>> quite some time now. However, they are still marked as unstable.
>> This is suboptimal because it may block some upper layer in
>> consuming it. In this specific case - Libvirt avoids using
>> experimental features.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> 
> If I remember correctly, the motivation for -preconfig was NUMA
> configuration via QMP.  More uses may have appeared since.
> 
> Back then, I questioned the need for yet another option and yet another
> state: why not -S?
> 
> The answer boiled down to
> 
> 0. Yes, having just one would be a simpler and cleaner interface, but
> 
> 1. the godawful mess QEMU startup has become makes -S unsuitable for
>     some things we want to do, so we need -preconfig,
> 
> 2. which is in turn unsuitable for other things we want to do, so we
>     still need -S".
> 
> 3. Cleaning up the mess to the point where "simpler and cleaner" becomes
>     viable again is not in the cards right now.

Some things have changed since then:

* The preconfig implementation is much, much better than it used to be. 
  There's no preconfig runstate anymore and QEMU effectively always 
starts in preconfig mode; it simply invokes x-exit-preconfig if 
preconfig is not specified.  This also made it sensible to add a lot 
make more commands to allow_preconfig.

* On the other hand, preconfig still does not support all machine 
initialization, and especially it does not support device-add (so 
libvirt could not, for example, remove all of its 
-blockdev/-netdev/-device code in favor of QMP).  And -machine supports 
compound options (albeit not JSON yet; see commit d8fb7d0969, "vl: 
switch -M parsing to keyval", 2021-07-06) which those could be used for 
NUMA.  This makes preconfig mode much less interesting compared to a 
QMP-only QEMU executable.

If we decide that preconfig is the way to go, I would still not 
stabilize it in its current form, and would do a couple aesthetic 
adjustments before: 1) make loadvm, cont and migrate-incoming exit 
preconfig, 2) add a new command finish-machine-init be the equivalent of 
"exit preconfig and stay paused", 3) make -S implicit if -preconfig is 
specified.

As an aside, I agree with the original decision not to expose 
allow-preconfig in query-qmp-schema.  Originally only a couple commands 
were exposed in preconfig mode; these days, a command should simply be 
allowed in preconfig mode if it makes sense, and the only ones that are 
missing are block device commands[1].  That patch should be a 
precondition for stabilizing preconfig.

>     The implementation is a bit of a hack: it splices in an additional
>     main loop before machine creation, in special runstate preconfig.  New
>     command exit-preconfig exits that main loop.  QEMU continues
>     initializing, creates the machine, and runs the good old main loop.
>     The replacement of the main loop is transparent to monitors.

Quite an understatement. :)

> Before we make it a stable interface, we should ponder:
> 
> * Is cleaning up the mess to the point where "simpler and cleaner"
>    becomes viable again still impractical?
> 
> * If yes, what are the chances of it becoming practical?

To sum up: it's been cleaned up, and preconfig has benefited from it. 
The question is whether to keep cleaning up (and then the obvious 
direction is the QMP-only QEMU executable), or decide that we've gotten 
to the point of diminishing returns.

Paolo

[1] https://patchew.org/QEMU/20210511153949.506200-1-pbonzini@redhat.com/


