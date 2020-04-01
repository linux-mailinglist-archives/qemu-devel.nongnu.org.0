Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42F19AF1D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 17:53:12 +0200 (CEST)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJffz-0000By-NQ
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 11:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jJfce-0004Ys-KW
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jJfcd-0000u2-Cq
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:49:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48231
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jJfcd-0000tI-9n
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585756182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcn08/UCasPsw7c1jdL5vTQfG4C4ssttNKKNQl0T8Bc=;
 b=E889oOdwDw0Aao9S70OYwnmuLCrnuajvQ+090zrthbbQA0+vmIo+VwH1iSWbth5RIgX2To
 IT5bMIT9keWbqfNeLqXaSejbiOS7hmSKOhHpvSbAGGdPxk5rvaCSQl3Xfx7xcgOw+FKSOb
 9xlvghGxX39aoJK5cT6OZj+iKQKKr2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-PQ3qX5VRMgePJ4EMkxM_0A-1; Wed, 01 Apr 2020 11:49:40 -0400
X-MC-Unique: PQ3qX5VRMgePJ4EMkxM_0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90EAC18C8C03;
 Wed,  1 Apr 2020 15:49:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F0BE96F83;
 Wed,  1 Apr 2020 15:49:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D401411385E2; Wed,  1 Apr 2020 17:49:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Questionable aspects of QEMU Error's design
References: <87o8sblgto.fsf@dusky.pond.sub.org>
 <e980477d-3951-2a2b-fa38-dee8e1895019@virtuozzo.com>
 <87v9mje24d.fsf@linaro.org>
Date: Wed, 01 Apr 2020 17:49:37 +0200
In-Reply-To: <87v9mje24d.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 01 Apr 2020 15:01:38 +0100")
Message-ID: <87wo6zcijy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>
>> Side question:
>>
>> Can we somehow implement a possibility to reliably identify file and lin=
e number
>> where error is set by error message?
>>
>> It's where debug of error-bugs always starts: try to imagine which parts=
 of the error
>> message are "%s", and how to grep for it in the code, keeping in mind al=
so,
>> that error massage may be split into several lines..
>>
>> Put file:line into each error? Seems too noisy for users.. A lot of erro=
rs are not
>> bugs: use do something wrong and see the error, and understands what he =
is doing
>> wrong.. It's not usual practice to print file:line into each message
>> for user.
>
> I tend to use __func__ for these things as the result is usually easily
> grep-able.

Putting __func__ in error messages makes them both greppable and ugly.


