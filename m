Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C972F268529
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 08:55:00 +0200 (CEST)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHiOB-0004KO-Tu
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 02:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kHiNI-0003nj-Sx
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:54:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54908
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kHiNG-0007ay-8w
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600066440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=phA8Ph1KmuGW2DJpK5jIeK2ENPap7pE3eC12INbNqc8=;
 b=dqM47iCxmiytrh2NkVteKYjxrRqdUA6T9RTEeJTBmuc6W1M0eDd4nHS4WFNNGHRzTK1VBj
 a2g1b12jLh/DqHj1zlTNmtorqsMm2UpizowYm2/xxGCl9KIOFl8BQNIJFAUDQ6wVedXZwn
 bdtRza6NVMtlCZRKB3qiVx8EYjaftus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-q3jV14wBNniLqCog9_ADFw-1; Mon, 14 Sep 2020 02:53:59 -0400
X-MC-Unique: q3jV14wBNniLqCog9_ADFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0637B427FB;
 Mon, 14 Sep 2020 06:53:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B004D81C44;
 Mon, 14 Sep 2020 06:53:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F3E16113865F; Mon, 14 Sep 2020 08:53:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 11/14] block/qcow2-bitmap: return startus from
 qcow2_store_persistent_dirty_bitmaps
References: <20200909185930.26524-1-vsementsov@virtuozzo.com>
 <20200909185930.26524-12-vsementsov@virtuozzo.com>
 <20200911113838.482b062e@bahia.lan>
 <2d8099d0-c04c-8b91-fd1e-f988cbba14ce@virtuozzo.com>
 <20200911132152.01855289@bahia.lan>
 <12a7ab93-6545-a221-e9ff-4328c781fbb3@virtuozzo.com>
 <87r1r8cp8e.fsf@dusky.pond.sub.org>
 <7863ba25-250e-a562-4925-6c5f992e587c@virtuozzo.com>
Date: Mon, 14 Sep 2020 08:53:50 +0200
In-Reply-To: <7863ba25-250e-a562-4925-6c5f992e587c@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 11 Sep 2020 20:20:18 +0300")
Message-ID: <87v9gg4znl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:39:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, berto@igalia.com, pavel.dovgaluk@ispras.ru,
 qemu-block@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 11.09.2020 18:22, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> 11.09.2020 14:21, Greg Kurz wrote:
>>>> On Fri, 11 Sep 2020 13:18:32 +0300
>>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
[...]
>>>>> Hmm.. With this series I understand the following:
>>>>>
>>>>> 1. It's no sense in simple applying scripts/coccinelle/errp-guard.cocci to the whole code-base, because:
>>>>>
>>>>>      - it produces a lot of "if (*errp)" in places where it is really simple to avoid error propagation at all, like in this series
>>>>>      - reviewing is the hardest part of the process
>>>>>
>>>>> So, if we have to review these changes anyway, it's better to invest a bit more time into patch creation, and make code correspond to our modern error API recommendations.
>>
>> Yes, going the extra mile is better.
>>
>> I recommend it for code that is actively maintained.  Making the code
>> simpler and thus easier to maintain is an investment that'll pay off.
>>
>> We may have code where it won't pay off.  Do you think a blind
>> application of errp-guard.cocci might be better than nothing there?
>
> I think, careful review is needed anyway. And it may be too large effort for dead (or almost dead) code.
> So, let's start from popular subsystems. And make a decision for the rest later.

Makes sense.

[...]


