Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5CB58FBA9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 13:53:53 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM6l6-0006Kc-9K
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 07:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM6e5-00023a-PH
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 07:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM6dy-0003lZ-5P
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 07:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660218387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3YuB6S0rYrd5IcccaV2Bg+DXRx4iSTT+r5RkY+VXJk=;
 b=AMCFa2LYKIcMdM2PIsFr64pnnhsmJaH+EMqds79eqlt3Jb8AlbEBCrC7wPiLmZ80xzO3gj
 3ecpQGm5ec7JUMaI2qAJjduQcx7el0lOp9ZM5e4NF46CmS6EQTGRxn3dJDRufKZFpw/FS7
 qju/chMCio7qey7RHMutdwz31EdwCTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-A58uw-ZGO6KZqM5vpPAaPg-1; Thu, 11 Aug 2022 07:46:24 -0400
X-MC-Unique: A58uw-ZGO6KZqM5vpPAaPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD5D804191;
 Thu, 11 Aug 2022 11:46:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B6D40CF8E7;
 Thu, 11 Aug 2022 11:46:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D80721E693E; Thu, 11 Aug 2022 13:46:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,  Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Xie Yongji
 <xieyongji@bytedance.com>,  Kyle Evans <kevans@freebsd.org>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Warner Losh
 <imp@bsdimp.com>,  Kevin Wolf <kwolf@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Laurent Vivier <laurent@vivier.eu>,  Fam
 Zheng <fam@euphon.net>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
 <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
 <87o7wr5ew9.fsf@pond.sub.org>
 <CAJ+F1CKbkTOX7Fh9RvkBvuW_gZqZjYSta=7nEKbzm-OefPE_GQ@mail.gmail.com>
 <CAFEAcA8E7uTSHh+BdnU2ZHiaquaQDqpYMurUwpjvVmK-Ks522w@mail.gmail.com>
Date: Thu, 11 Aug 2022 13:46:21 +0200
In-Reply-To: <CAFEAcA8E7uTSHh+BdnU2ZHiaquaQDqpYMurUwpjvVmK-Ks522w@mail.gmail.com>
 (Peter Maydell's message of "Thu, 11 Aug 2022 11:22:40 +0100")
Message-ID: <87pmh73svm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 11 Aug 2022 at 11:09, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
>> On Thu, Aug 11, 2022 at 1:05 PM Markus Armbruster <armbru@redhat.com> wr=
ote:
>>> Your moves tear closely related code apart.  This is going to be a drag
>>> for developers in general and maintainers in particular.
>>>
>>> Ergonomics suffer when related code is in multiple places.  Having to
>>> switch between directories and remember where is what will a constant
>>> low-level pain.  Things that used to be simple & quick, like git-grep
>>> qapi/*.c, become more involved.
>>>
>>
>> It's inevitable when a project grows. QEMU is already a very large proje=
ct. Over the years, we have structured the project, by moving things and sp=
litting in subdirectories. Imho, this is actually helpful in many ways, and=
 we got used to it easily hopefully.
>
> I agree with this. But generally we've tried to do that by
> having the subdirectory splitting and naming match the
> structure of the codebase.

Good: move a bunch of closely related files from . (tree root) and
include/ to new ./whatever/ and include/whatever/.  The improvement in
organization outweighs the pain of moving.

Not so good: split some files off ./whatever into ./else/where/, even
though they are closely related.

[...]


