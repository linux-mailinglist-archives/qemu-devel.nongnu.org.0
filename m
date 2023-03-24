Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87076C81A2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:43:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pficl-00075S-OC; Fri, 24 Mar 2023 10:42:36 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfici-00074Y-22
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pficf-0001nn-Uo
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679668949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIsEADNHy/tHejPpYRCJm0gN+A4OBq8ebw+apHpT83o=;
 b=hN9dkJp3Qzsqh/JwzVJtiC6d3yM4dV1+5BbYRBJIk+ajSPOkP1epjjVpyLzn7Iva8MuBxc
 3wD8+wsiwLPtZoSyhEDl17nG1CBX4cIovPTQTd+9C33MfL7Xuc9IzqFUpImreoXE6U8Vjk
 sI0zA40JW3/ZlqtHQsnGnsJTvtqzZCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-zYjErsdNN1yYRHZrd0Su8g-1; Fri, 24 Mar 2023 10:42:27 -0400
X-MC-Unique: zYjErsdNN1yYRHZrd0Su8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1C6100DEAC
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 14:42:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ACC02166B29
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 14:42:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B06121E692C; Fri, 24 Mar 2023 15:32:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Juan Quintela
 <quintela@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 06/10] migration: Introduce dirty-limit capability
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <cover.1676563222.git.huangy81@chinatelecom.cn>
 <a9952eaa2bf3c8066b0e8dee066b57395ffa37b1.1676563222.git.huangy81@chinatelecom.cn>
 <871qlepcw7.fsf@pond.sub.org>
 <f70dbc9b-e722-ad77-e22d-12c339f5ff4d@chinatelecom.cn>
Date: Fri, 24 Mar 2023 15:32:28 +0100
In-Reply-To: <f70dbc9b-e722-ad77-e22d-12c339f5ff4d@chinatelecom.cn> (Hyman
 Huang's message of "Fri, 24 Mar 2023 20:47:50 +0800")
Message-ID: <87ttyamd8j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Hyman Huang <huangy81@chinatelecom.cn> writes:

> =E5=9C=A8 2023/3/24 20:11, Markus Armbruster =E5=86=99=E9=81=93:
>> huangy81@chinatelecom.cn writes:
>>=20
>>> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>>>
>>> Introduce migration dirty-limit capability, which can
>>> be turned on before live migration and limit dirty
>>> page rate durty live migration.
>>>
>>> Introduce migrate_dirty_limit function to help check
>>> if dirty-limit capability enabled during live migration.
>>>
>>> Meanwhile, refactor vcpu_dirty_rate_stat_collect
>>> so that period can be configured instead of hardcoded.
>>>
>>> dirty-limit capability is kind of like auto-converge
>>> but using dirty limit instead of traditional cpu-throttle
>>> to throttle guest down. To enable this feature, turn on
>>> the dirty-limit capability before live migration using
>>> migrate-set-capabilities, and set the parameters
>>> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
>>> to speed up convergence.
>>>
>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.c=
n>
>>> Acked-by: Peter Xu <peterx@redhat.com>
>> [...]
>>=20
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index d33cc2d582..b7a92be055 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -477,6 +477,8 @@
>>>   #                    will be handled faster.  This is a performance f=
eature and
>>>   #                    should not affect the correctness of postcopy mi=
gration.
>>>   #                    (since 7.1)
>>> +# @dirty-limit: Use dirty-limit to throttle down guest if enabled.
>>> +#               (since 8.0)
>>
>> Feels too terse.  What exactly is used and how?  It's not the capability
>> itself (although the text sure sounds like it).  I guess it's the thing
>> you set with command set-vcpu-dirty-limit.
>>
>> Is that used only when the capability is set?
>
> Yes, live migration set "dirty-limit" value when that capability is set,
> the comment changes to "Apply the algorithm of dirty page rate limit to t=
hrottle down guest if capability is set, rather than auto-converge".
>
> Please continue to polish the doc if needed. Thanks.

Let's see whether I understand.

Throttling happens only during migration.

There are two throttling algorithms: "auto-converge" (default) and
"dirty page rate limit".

The latter can be tuned with set-vcpu-dirty-limit.

Correct?

What happens when migration capability dirty-limit is enabled, but the
user hasn't set a limit with set-vcpu-dirty-limit, or canceled it with
cancel-vcpu-dirty-limit?

>>>   #
>>>   # Features:
>>>   # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>>> @@ -492,7 +494,7 @@
>>>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activat=
e',
>>>              { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>>>              'validate-uuid', 'background-snapshot',
>>> -           'zero-copy-send', 'postcopy-preempt'] }
>>> +           'zero-copy-send', 'postcopy-preempt', 'dirty-limit'] }
>>>     ##
>>>   # @MigrationCapabilityStatus:
>> [...]
>>=20


