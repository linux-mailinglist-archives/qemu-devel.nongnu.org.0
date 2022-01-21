Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E169495E76
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:39:46 +0100 (CET)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsGd-0007ti-Cm
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAru5-0007wU-QZ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAru1-0005jg-Uo
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642763780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVq0XP/I9uo83Ozn6jmX4TsNpNte6YdiO4V5mthu7vo=;
 b=cDH5gy1nz+RFLsAOSuNePDap27i8Gt0cTzgKZMux9UA7BU5glvRZdMg8ZX52BUOipv9D2r
 /IR2xR6TXhhBO8BEqTbOGqEeYDVjrZkTOoTVaFufCi22+BFDoSXYZXcM5z5RnQo3pm06Eu
 9u+IeJnXsFoWLTzKYxlEa+vCcTKqYdw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-f9PBd_1BPR-7ylHPjDgkEw-1; Fri, 21 Jan 2022 06:16:17 -0500
X-MC-Unique: f9PBd_1BPR-7ylHPjDgkEw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n19-20020a05600c501300b0034d7b01ae4dso3669994wmr.1
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lVq0XP/I9uo83Ozn6jmX4TsNpNte6YdiO4V5mthu7vo=;
 b=vQIiRgolttWqra/jDn/gHpcPf4SThiGN7mXLB88T1nULmBVOsXQnItR0r5PT5xOlL0
 m/qfQA6jAqDR9t4WLoKfK7+Dp/blXqGC7WBLN64mVXSjfw8e25rCzgj8UTTqVCw1Yh4+
 S3OFCrsDXU+ueZuIY5SchFD4CUiBWlc0PO8j5H/WAUdgzWJK4XoKI3U6cEePzNxXhto3
 5XYRfD/wzK1bdnv341P6RQs9/yVpNTEPJLAnQ+7suA5T0c2VjZaj5yiO2Nlo54HSKNNU
 IWz/C10c5i9suUB4BegNIUpEesBxpHnLMgmcprNCaLHSOsTLrXmzbJLJeykJTqLRltvD
 lLxQ==
X-Gm-Message-State: AOAM533m4fdY66xHzIPOj+Xm5J+bJ1L7dbvTxGRxNglAfEJG3oDENjex
 HUauAjOffNcmXzE0OFdA5Zq36bHeOcOfRHPEMQu4tipM3V9rv7OB7anDUV+cx2J8LKKOwAD1Egm
 1ZSF9joH3XOueODM=
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr3269761wrr.559.1642763776237; 
 Fri, 21 Jan 2022 03:16:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhMG0J0zla7JOsdE+MNhY7DLuoZb2tkkLFdvqGkiR8IMkfnJ0dtTN90bsYznEJPkZHRUdbSA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr3269723wrr.559.1642763775774; 
 Fri, 21 Jan 2022 03:16:15 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id f13sm5883160wri.49.2022.01.21.03.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:16:15 -0800 (PST)
Message-ID: <b2e955f3-2696-5ee3-e8fb-be336e0811c6@redhat.com>
Date: Fri, 21 Jan 2022 12:16:14 +0100
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
 <f7b6d0e0-ee5f-f7ed-795b-27b13ff816c7@redhat.com>
 <87tudx4c4p.fsf@dusky.pond.sub.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <87tudx4c4p.fsf@dusky.pond.sub.org>
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

On 21.01.22 11:27, Markus Armbruster wrote:
> Hanna Reitz <hreitz@redhat.com> writes:
>
>> On 21.01.22 07:10, Markus Armbruster wrote:
>>> Hanna Reitz <hreitz@redhat.com> writes:
>>>
>>>> On 20.01.22 17:00, Markus Armbruster wrote:
>>>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>>>
>>>>>> Am 19.01.2022 um 14:44 hat Hanna Reitz geschrieben:
>>>>>>> On 19.01.22 13:58, Markus Armbruster wrote:
>>>>>>>> Hanna Reitz <hreitz@redhat.com> writes:
>>>>>>>>
>>>>>>>>> We want to add a --daemonize argument to QSD's command line.
>>>>>>>> Why?
>>>>>>> OK, s/we/I/.  I find it useful, because without such an option, I need to
>>>>>>> have whoever invokes QSD loop until the PID file exists, before I can be
>>>>>>> sure that all exports are set up.  I make use of it in the test cases added
>>>>>>> in patch 3.
>>>>>>>
>>>>>>> I suppose this could be worked around with a special character device, like
>>>>>>> so:
>>>>>>>
>>>>>>> ```
>>>>>>> ncat --listen -U /tmp/qsd-done.sock </dev/null &
>>>>>>> ncat_pid=$!
>>>>>>>
>>>>>>> qemu-storage-daemon \
>>>>>>>        ... \
>>>>>>>        --chardev socket,id=signal_done,path=/tmp/qsd-done.sock \
>>>>>>>        --monitor signal_done \
>>>>>>>        --pidfile /tmp/qsd.pid &
>>>>>>>
>>>>>>> wait $ncat_pid
>>>>>>> ```
>>>>>>>
>>>>>>> But having to use an extra tool for this is unergonomic.  I mean, if there’s
>>>>>>> no other way...
>>>>> I know duplicating this into every program that could server as a daemon
>>>>> is the Unix tradition.  Doesn't make it good.  Systemd[*] has tried to
>>>>> make it superfluous.
>>>> Well.  I have absolutely nothing against systemd.  Still, I will not
>>>> use it in an iotest, that’s for sure.
>>> My point isn't "use systemd in iotests".  It's "consider doing it like
>>> systemd", i.e. do the daemonization work in a utility program.  For what
>>> it's worth, Linux has daemonize(1).
>> The problem I face is that currently there is no ergonomic way to wait
>> until the QSD is up and running (besides looping until the PID file
>> exists), and I don’t think a utility program that doesn’t know the QSD
>> could provide this.  (For example, it looks like daemonize(1) will
>> have the parent exit immediately, regardless of whether the child is
>> set up or not.)
> Why do you need to wait for QSD to be ready?
>
> I'm asking because with common daemons, I don't wait, I just connect to
> their socket and start talking.  They'll reply only when ready.

That only applies when you want to talk to a socket, which I often don’t 
do.  Most of the time I use the storage daemon, I pass all --blockdev 
and --export options through the command line and don’t create any 
socket at all.  When I use the QSD just to export some block device, I 
generally don’t need QMP.

Of course, I could just not do that, and instead only set up QMP and 
then do all the configuration through that (where, as you say, QSD will 
only reply once it can); but that’s much more complicated than running a 
single command.

(Or I could do a mix of both, which I described above, where I’d create 
and have the QSD connect to a Unix socket just to see that configuration 
is done and all exports are up.  I’d prefer not to, because it still 
means using an extra tool (ncat) to create the socket.)


