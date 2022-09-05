Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F05ACEEE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 11:36:18 +0200 (CEST)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV8We-0000kG-HR
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 05:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oV8T4-0007Ie-Oz
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oV8T2-000634-9I
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662370350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kItp6AnTLmTOU4t5DPDukHr+Or1RMvw49ntHoLdQjt4=;
 b=RM8PPFaw8b7DsPEJ/Xj40DqRTd3OgI6mMOj1ga6cUGtgQwh+RhWZGEt67GrszQNl5bHPVd
 iXA6N+b4hQ1gE8Q1AlUUYhXO1LjoZxyGhFchbIOrpIurWuoQF3waxhHlfBM4i2ErAaf+xz
 pAK83Kap7/ZIQYcQZd5z4MgSlX1td2E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Knz2GRxaOb24-MfhE9lvqQ-1; Mon, 05 Sep 2022 05:32:27 -0400
X-MC-Unique: Knz2GRxaOb24-MfhE9lvqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 235441C006A2;
 Mon,  5 Sep 2022 09:32:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E6940149B6;
 Mon,  5 Sep 2022 09:32:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C861B21E6900; Mon,  5 Sep 2022 11:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 3/8] migration: Introduce dirty-limit capability
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <fb2a51fcf30d927a2512b397cd2dc6f34c3936c4.1662052189.git.huangy81@chinatelecom.cn>
 <87y1v2w65q.fsf@pond.sub.org>
 <ba9baa48-a82b-16cc-a902-2dd63194420a@chinatelecom.cn>
Date: Mon, 05 Sep 2022 11:32:25 +0200
In-Reply-To: <ba9baa48-a82b-16cc-a902-2dd63194420a@chinatelecom.cn> (Hyman
 Huang's message of "Fri, 2 Sep 2022 22:15:53 +0800")
Message-ID: <87y1uykvyu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

> =E5=9C=A8 2022/9/2 16:07, Markus Armbruster =E5=86=99=E9=81=93:
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
>>> migratioin-set-capabilities, and set the parameters
>>=20
>> migrate-set-capabilities
>>=20
>>> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
>>=20
>> "x-vcpu-dirty-limit"
>>=20
>>> to speed up convergence.
>>>
>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.c=
n>
>>=20
>> Hmm.  You make dirty-limiting as a whole a stable interface (evidence:
>> capability "dirty-limit" is stable), but keep its two parameters
>> unstable.  Rationale behind that?
>>=20
> Thanks Markus's comments. :)
>
> x-vcpu-dirty-limit-period is an experimental parameter indeed, as to x-vc=
pu-dirty-limit, i think it's resonable to be a stable parameter.
> These 2 parameters are introduced first time and none of them suffer heav=
ily tests, so i also made vcpu-dirty-limit experimental last version.
>
> For dirty-limit interface, it improves the vCPU computational performance=
 during migration indeed(see the test results in cover=20
> letter), so it sounds ok to be an stable interface.
>
> The 'x-vcpu-dirty-limit-period' parameter can be dropped, IMHO, after bei=
ng proved insignificant for migration in the future, and meanwhile,=20
> x-vcpu-dirty-limit be made stable.
>
> Since I don't have much experience to introducing fresh new interface,
> any suggestions are welcome.

Is the new interface fit for purpose without use of any experimental
parameter?

If the answer is something like "command dirty-limit improves things
even without use of experimental parameters, but using them may well
improve things more (but we need more testing to know for sure)", then
your current use of 'unstable' may make sense.


