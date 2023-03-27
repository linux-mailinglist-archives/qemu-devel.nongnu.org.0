Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BAC6C9B75
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 08:43:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pggY1-0002ub-WB; Mon, 27 Mar 2023 02:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pggXx-0002uM-FI
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 02:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pggXv-000741-IT
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 02:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679899294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPaC8UfPyNW41XjogvOhIc96UIeSKKEi8vMmTFE6XB4=;
 b=BQ4CpmN3BZjKO0Z/OSqUQtMrzl5+qEwz9PyLFmO8plaGs1diTvGaNZiY8utqCpFYXtfMRp
 toKaLO9pIJzj4Bve3Sl149ZXtjxDNBdPJg9h0grr5j0l7fdro0m0cVE5KdBJt4rDPy8F+L
 F5WxIXYx1kX7MaDD02Bt4Q930mxoA/I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-6UTtD4OaO9Cgfr0CJxK47A-1; Mon, 27 Mar 2023 02:41:30 -0400
X-MC-Unique: 6UTtD4OaO9Cgfr0CJxK47A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F87F1C06901;
 Mon, 27 Mar 2023 06:41:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D60492B0A;
 Mon, 27 Mar 2023 06:41:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 509E721E6926; Mon, 27 Mar 2023 08:41:28 +0200 (CEST)
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
 <87ttyamd8j.fsf@pond.sub.org>
 <333f094e-c009-4e61-22b4-3433d1291af4@chinatelecom.cn>
Date: Mon, 27 Mar 2023 08:41:28 +0200
In-Reply-To: <333f094e-c009-4e61-22b4-3433d1291af4@chinatelecom.cn> (Hyman
 Huang's message of "Sun, 26 Mar 2023 15:29:28 +0800")
Message-ID: <87lejihf1j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

> =E5=9C=A8 2023/3/24 22:32, Markus Armbruster =E5=86=99=E9=81=93:
>> Hyman Huang <huangy81@chinatelecom.cn> writes:
>>=20
>>> =E5=9C=A8 2023/3/24 20:11, Markus Armbruster =E5=86=99=E9=81=93:
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
>>>>> migrate-set-capabilities, and set the parameters
>>>>> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
>>>>> to speed up convergence.
>>>>>
>>>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom=
.cn>
>>>>> Acked-by: Peter Xu <peterx@redhat.com>
>>>> [...]
>>>>
>>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>>> index d33cc2d582..b7a92be055 100644
>>>>> --- a/qapi/migration.json
>>>>> +++ b/qapi/migration.json
>>>>> @@ -477,6 +477,8 @@
>>>>>    #                    will be handled faster.  This is a performanc=
e feature and
>>>>>    #                    should not affect the correctness of postcopy=
 migration.
>>>>>    #                    (since 7.1)
>>>>> +# @dirty-limit: Use dirty-limit to throttle down guest if enabled.
>>>>> +#               (since 8.0)
>>>>
>>>> Feels too terse.  What exactly is used and how?  It's not the capabili=
ty
>>>> itself (although the text sure sounds like it).  I guess it's the thing
>>>> you set with command set-vcpu-dirty-limit.
>>>>
>>>> Is that used only when the capability is set?
>>>
>>> Yes, live migration set "dirty-limit" value when that capability is set,
>>> the comment changes to "Apply the algorithm of dirty page rate limit to=
 throttle down guest if capability is set, rather than auto-converge".
>>>
>>> Please continue to polish the doc if needed. Thanks.
>>
>> Let's see whether I understand.
>>
>> Throttling happens only during migration.
>>
>> There are two throttling algorithms: "auto-converge" (default) and
>> "dirty page rate limit".
>>
>> The latter can be tuned with set-vcpu-dirty-limit.
>> Correct?
>
> Yes
>
>> What happens when migration capability dirty-limit is enabled, but the
>> user hasn't set a limit with set-vcpu-dirty-limit, or canceled it with
>> cancel-vcpu-dirty-limit?
>
> dirty-limit capability use the default value if user hasn't set.

What is the default value?  I can't find it in the doc comments.

> In the path of cancel-vcpu-dirty-limit, canceling should be check and not=
 be allowed if migration is in process.

Can you change the dirty limit with set-vcpu-dirty-limit while migration
is in progress?  Let's see...

Has the dirty limit any effect while migration is not in progress?

> see the following code in commit:
> [PATCH v4 08/10] migration: Implement dirty-limit convergence algo
>
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -438,6 +438,8 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
>                                   int64_t cpu_index,
>                                   Error **errp)
>  {
> +    MigrationState *ms =3D migrate_get_current();
> +
>      if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>          return;
>      }
> @@ -451,6 +453,15 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
>          return;
>      }
>
> +    if (migration_is_running(ms->state) &&
> +        (!qemu_thread_is_self(&ms->thread)) &&
> +        migrate_dirty_limit() &&
> +        dirtylimit_in_service()) {
> +        error_setg(errp, "can't cancel dirty page limit while"
> +                   " migration is running");
> +        return;
> +    }

We can get here even when migration_is_running() is true.  Seems to
contradict your claim "no cancel while migration is in progress".  Am I
confused?

Please drop the superfluous parenthesis around !qemu_thread_is_self().

> +
>      dirtylimit_state_lock();
>
>      if (has_cpu_index) {
> @@ -486,6 +497,8 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
>                                uint64_t dirty_rate,
>                                Error **errp)
>  {
> +    MigrationState *ms =3D migrate_get_current();
> +
>      if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>          error_setg(errp, "dirty page limit feature requires KVM with"
>                     " accelerator property 'dirty-ring-size' set'");
> @@ -502,6 +515,15 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
>          return;
>      }
>
> +    if (migration_is_running(ms->state) &&
> +        (!qemu_thread_is_self(&ms->thread)) &&
> +        migrate_dirty_limit() &&
> +        dirtylimit_in_service()) {
> +        error_setg(errp, "can't cancel dirty page limit while"
> +                   " migration is running");

Same condition, i.e. we dirty limit change is possible exactly when
cancel is.  Correct?

> +        return;
> +    }
> +
>      dirtylimit_state_lock();
>
>      if (!dirtylimit_in_service()) {

Maybe it's just me still not understanding things, but the entire
interface feels overly complicated.

Here's my current mental model of what you're trying to provide.

There are two throttling algorithms: "auto-converge" (default) and
"dirty page rate limit".  The user can select one.

The latter works with a user-configurable dirty limit.

Changing these configuration bits is only possible in certain states.
Which ones is not clear to me, yet.

Is this accurate and complete?

Are commands set-vcpu-dirty-limit, cancel-vcpu-dirty-limit,
query-vcpu-dirty-limit useful without this series?

If not, then committing them as stable interfaces was clearly premature.


