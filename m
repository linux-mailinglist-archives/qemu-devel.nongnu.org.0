Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5425AE206
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:11:04 +0200 (CEST)
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTfh-0003cw-4e
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVTY9-0001GY-9S
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVTY5-0007uH-1n
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662451385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pV/edXmhyIj2uUhAVhPjqGaY913SGbpfbYqzYmmsiCw=;
 b=S7040NhTl9H5m3oXMPbKC9hBOJckFdxkZcReyW3AkgW0Z4mna1dAPTwP+Aecg9Kf4UKikM
 pB4OGM4X86MRlqJHwpM/aZKroUePVRS6JIyXvEg7SrnwXBKrEpPfJTNRD9V91T/DQiVCW2
 pguO+8T0IQwQAMqFLWonCIjX5LRWk5Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-LRZHJaSdNqKWsPEwVLjwdg-1; Tue, 06 Sep 2022 04:03:02 -0400
X-MC-Unique: LRZHJaSdNqKWsPEwVLjwdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9E9A1C01B37;
 Tue,  6 Sep 2022 08:03:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85AF32166B26;
 Tue,  6 Sep 2022 08:03:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E90F421E6900; Tue,  6 Sep 2022 10:02:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel
 <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan Quintela
 <quintela@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 3/8] migration: Introduce dirty-limit capability
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <fb2a51fcf30d927a2512b397cd2dc6f34c3936c4.1662052189.git.huangy81@chinatelecom.cn>
 <87y1v2w65q.fsf@pond.sub.org>
 <ba9baa48-a82b-16cc-a902-2dd63194420a@chinatelecom.cn>
 <87y1uykvyu.fsf@pond.sub.org>
 <4797d938-4638-b12b-c75b-47d291efb6d6@chinatelecom.cn>
Date: Tue, 06 Sep 2022 10:02:59 +0200
In-Reply-To: <4797d938-4638-b12b-c75b-47d291efb6d6@chinatelecom.cn> (Hyman
 Huang's message of "Mon, 5 Sep 2022 21:13:23 +0800")
Message-ID: <87pmg93p70.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyman Huang <huangy81@chinatelecom.cn> writes:

> =E5=9C=A8 2022/9/5 17:32, Markus Armbruster =E5=86=99=E9=81=93:
>> Hyman Huang <huangy81@chinatelecom.cn> writes:
>>=20
>>> =E5=9C=A8 2022/9/2 16:07, Markus Armbruster =E5=86=99=E9=81=93:
>>>> huangy81@chinatelecom.cn writes:
>>>>
>>>>> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>>>>>
>>>>> Introduce migration dirty-limit capability, which can
>>>>> be turned on before live migration and limit dirty
>>>>> page rate durty live migration.
>>>>>
>>>>> Introduce migrate_dirty_limit function to help check
>>>>> if dirty-limit capability enabled during live migration.
>>>>>
>>>>> Meanwhile, refactor vcpu_dirty_rate_stat_collect
>>>>> so that period can be configured instead of hardcoded.
>>>>>
>>>>> dirty-limit capability is kind of like auto-converge
>>>>> but using dirty limit instead of traditional cpu-throttle
>>>>> to throttle guest down. To enable this feature, turn on
>>>>> the dirty-limit capability before live migration using
>>>>> migratioin-set-capabilities, and set the parameters
>>>>
>>>> migrate-set-capabilities
>>>>
>>>>> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
>>>>
>>>> "x-vcpu-dirty-limit"
>>>>
>>>>> to speed up convergence.
>>>>>
>>>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom=
.cn>
>>>>
>>>> Hmm.  You make dirty-limiting as a whole a stable interface (evidence:
>>>> capability "dirty-limit" is stable), but keep its two parameters
>>>> unstable.  Rationale behind that?
>>>>
>>> Thanks Markus's comments. :)
>>>
>>> x-vcpu-dirty-limit-period is an experimental parameter indeed, as to x-=
vcpu-dirty-limit, i think it's resonable to be a stable parameter.
>>> These 2 parameters are introduced first time and none of them suffer he=
avily tests, so i also made vcpu-dirty-limit experimental last version.
>>>
>>> For dirty-limit interface, it improves the vCPU computational performan=
ce during migration indeed(see the test results in cover
>>> letter), so it sounds ok to be an stable interface.
>>>
>>> The 'x-vcpu-dirty-limit-period' parameter can be dropped, IMHO, after b=
eing proved insignificant for migration in the future, and meanwhile,
>>> x-vcpu-dirty-limit be made stable.
>>>
>>> Since I don't have much experience to introducing fresh new interface,
>>> any suggestions are welcome.
>> Is the new interface fit for purpose without use of any experimental
>> parameter?
>>  > If the answer is something like "command dirty-limit improves things
>> even without use of experimental parameters, but using them may well
>> improve things more (but we need more testing to know for sure)", then
>> your current use of 'unstable' may make sense.
>>=20
> Yes, with the default value of parameter=EF=BC=8Cthe new interface works =
ok and improve performance.
>
> For x-vcpu-dirty-limit, we provide it because user may not want virtual C=
PU throttle heavily, x-vcpu-dirty-limit is kind of like=20
> cpu-throttle-percentage, which is used to setup the threshold when making=
 guest down.
>
> For x-vcpu-dirty-limit-period, it is just as you said: "command dirty-lim=
it improves things even without use of experimental parameters,=20
> but using them may wellimprove things more (but we need more testing to k=
now for sure)"
>
> So, should i make x-vcpu-dirty-limit non-experimental next version?

I think this depends on what exactly you want to signal to users.

Your current patch has command dirty-limit stable and the parameters
unstable.  This signals "go ahead and use dirty-limit, don't worry about
the parameters; even if they become stable later, using just dirty-limit
will remain okay."

If you keep the command unstable as well, you signal the entire
interface isn't quite baked, yet.  That's a much weaker proposition.
So weak in fact that you cannot go wrong :)

In short, it boils down to whether you want to encourage use of a part
of the evolving interface *now*.  Make that part stable.  Requires
confidence in that part, obviously.


