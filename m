Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9A6648B0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:14:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFJ0b-0007qc-0Y; Tue, 10 Jan 2023 13:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFJ0Z-0007qF-6Y
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFJ0W-0001jE-US
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673373956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2+qSTWtPmF4NIotVNo6bln+uWlgod6YHRDuyFn6n6zM=;
 b=dc1MeDOhgqUt4inqhmS+3Kn+idUXP0kUCckaWHDhLf/9k6aDgWhCUf+ZGo2vgK26wAeLzH
 mqQNOHTdRI8TWNmfP8bg0Q1XRmZqIwz6CVlX370tih+F+YZGA7WPLWNCPqTHn0lhJWZ3bO
 KwUtMCH0eYA6iA9YgiMNC6pEmYrfjXg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-TP9x107xOKyhQiMMApSHkg-1; Tue, 10 Jan 2023 13:05:55 -0500
X-MC-Unique: TP9x107xOKyhQiMMApSHkg-1
Received: by mail-lf1-f71.google.com with SMTP id
 g28-20020a0565123b9c00b004cc8a085997so1211265lfv.13
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 10:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+qSTWtPmF4NIotVNo6bln+uWlgod6YHRDuyFn6n6zM=;
 b=D6M4OpKbvMlbsX0TfXcJNChrLCnaug/37RCoYla2whsw++FwC/CdSGU0xbVXNs6Hoj
 2ZNM9zOYkHL7luthACHKSLYRc5Ja/NKdI4bxYP68wuFX8o7K29ilwEXiwfoxmm1Olqgp
 wZNnBL/SSp9o8TbjMWO6SjAwQYAepBNb7RQpRYuv9cuyKXieYB2F3QyF7DsrO0Z9m2Ak
 BbQ/zg1YkEPJ9S4ijvg5Oya1NhAXVGYjDez1JMWwsvEnXf3PktXV8f7lV44h7w884eX3
 nnNT/zyNzpSc9Hh3B15tNCiKFuu1weHXPnWER72ss56PWsByVjPTl3LEWdRCIFMjWm53
 orPw==
X-Gm-Message-State: AFqh2kq6A0yFE12YxdGMizI+/+3s6IFowA1y1/u+zUB2No23lIv3XSyw
 0TpzSjC4BVNXcnb3aNtReiI6yHl/TjRUmBwUwCBQCFmbPzK54lyubPd7FcsHyaVeAOSeoVUIaRf
 yYs5jXKZ4Bs8jphUR8Q1U8iecxuGdn5I=
X-Received: by 2002:a05:6512:1cd:b0:4b5:b10b:6822 with SMTP id
 f13-20020a05651201cd00b004b5b10b6822mr3059680lfp.621.1673373953211; 
 Tue, 10 Jan 2023 10:05:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdZOHjAlPr/JgLnWiB3Sf+e/XdM4Rm1gxQCXCtxerBz2lYms0FqVYajiG9iz842E4LLjHQtlj/3WWwWRZfDEY=
X-Received: by 2002:a05:6512:1cd:b0:4b5:b10b:6822 with SMTP id
 f13-20020a05651201cd00b004b5b10b6822mr3059673lfp.621.1673373952843; Tue, 10
 Jan 2023 10:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20220624195252.175249-1-vsementsov@yandex-team.ru>
 <CAFn=p-bzPUmF4YZ-461Tzr9MO_ReotL+wuot2egKW7jQgvaHOw@mail.gmail.com>
 <CAFn=p-bwAXCJnWPj7JwSmN2N52hv7R0p1Fn2GxPpHPpDaDaDHQ@mail.gmail.com>
 <9b5a291e-d8a2-e789-0a87-b923240a3e3a@yandex-team.ru>
 <CAFn=p-bhDkvrQfYNRyuyx2bu6jKhhfTa85AUw1Ab2xavYh3wXw@mail.gmail.com>
In-Reply-To: <CAFn=p-bhDkvrQfYNRyuyx2bu6jKhhfTa85AUw1Ab2xavYh3wXw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 10 Jan 2023 13:05:41 -0500
Message-ID: <CAFn=p-YqBysCqPr9qiGts+bdu+UL=2qbfizXNc9AA6zE4exgbQ@mail.gmail.com>
Subject: Re: [PATCH] python: QEMUMachine: enable qmp accept timeout by default
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 12:06 PM John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Tue, Jan 10, 2023, 3:53 AM Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>>
>> On 7/12/22 00:21, John Snow wrote:
>> > On Mon, Jul 11, 2022 at 5:16 PM John Snow <jsnow@redhat.com> wrote:
>> >>
>> >> On Fri, Jun 24, 2022 at 3:53 PM Vladimir Sementsov-Ogievskiy
>> >> <vsementsov@yandex-team.ru> wrote:
>> >>>
>> >>> I've spent much time trying to debug hanging pipeline in gitlab. I
>> >>> started from and idea that I have problem in code in my series (which
>> >>> has some timeouts). Finally I found that the problem is that I've used
>> >>> QEMUMachine class directly to avoid qtest, and didn't add necessary
>> >>> arguments. Qemu fails and we wait for qmp accept endlessly. In gitlab
>> >>> it's just stopped by timeout (one hour) with no sign of what's going
>> >>> wrong.
>> >>>
>> >>> With timeout enabled, gitlab don't wait for an hour and prints all
>> >>> needed information.
>> >>>
>> >>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> >>> ---
>> >>>
>> >>> Hi all!
>> >>>
>> >>> Just compare this
>> >>>    https://gitlab.com/vsementsov/qemu/-/pipelines/572232557
>> >>> and this
>> >>>    https://gitlab.com/vsementsov/qemu/-/pipelines/572526252
>> >>>
>> >>> and you'll see that the latter is much better.
>> >>>
>> >>>   python/qemu/machine/machine.py | 2 +-
>> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >>>
>> >>> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
>> >>> index 37191f433b..01a12f6f73 100644
>> >>> --- a/python/qemu/machine/machine.py
>> >>> +++ b/python/qemu/machine/machine.py
>> >>> @@ -131,7 +131,7 @@ def __init__(self,
>> >>>                    drain_console: bool = False,
>> >>>                    console_log: Optional[str] = None,
>> >>>                    log_dir: Optional[str] = None,
>> >>> -                 qmp_timer: Optional[float] = None):
>> >>> +                 qmp_timer: float = 30):
>> >>>           '''
>> >>>           Initialize a QEMUMachine
>> >>>
>> >>> --
>> >>> 2.25.1
>> >>>
>> >>
>> >> Oh, this is because machine.py uses the qmp_timer for *all* timeouts,
>> >> and not just the QMP commands themselves, and this relates to the work
>> >> Marc Andre is doing with regards to changing the launch mechanism to
>> >> handle the race condition when the QEMU launch fails, but the QMP
>> >> connection just sits waiting.
>> >>
>> >> I'm quite of the mind that it's really time to rewrite machine.py to
>> >> use the native asyncio interfaces I've been writing to help manage
>> >> this, but in the meantime I think this is probably a reasonable
>> >> concession and a more useful default.
>> >>
>> >> ...I think. Willing to take it for now and re-investigate when the
>> >> other fixes make it to the tree.
>> >>
>> >> Reviewed-by: John Snow <jsnow@redhat.com>
>> >
>> > Oh, keep the type as Optional[float], though, so the timeout can be
>> > disabled again, and keeps the type consistent with the qtest
>> > derivative class. I've staged your patch with that change made, let me
>> > know if that's not OK. Modified patch is on my python branch:
>> >
>> > Thanks, merged.
>> >
>>
>> Hmm, seems that's lost.. I don't see it neither in master nor in your python branch..
>>
>> --
>> Best regards,
>> Vladimir
>
>
> :(
>
> I'll fix it. Thanks for resending the iotests series, too - the old version was at the very top of my inbox :)

Re-edited and Re-staged:

https://gitlab.com/jsnow/qemu/-/commits/python

--js


