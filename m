Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A720E524972
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:52:57 +0200 (CEST)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5VA-0006gS-49
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np5N4-0000Nj-KJ
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np5N1-0000mj-SJ
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652348670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCUzYeH4uaFrH1+xtCZRHjn1cUUXYfwfD1xQq7L9rvI=;
 b=Ox8KzWlQF2lO5Oe36wkdJn51oTsmPchsWI5S+X3OFDx+a/Tw8v5g5O+kZ/Y23ZLXG09alL
 6v98nbSAdWID3CTtJePbpKDy7AQofs/7PboSA6MeLG08ap45GaEB4XsVsj1Ec0B6xKdZ7F
 6LBsnQK3pk0Ga4CQCK8rNq8YJr4i7Gk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-Dtw_7pDXNHiZFxkBjhIJxw-1; Thu, 12 May 2022 05:44:29 -0400
X-MC-Unique: Dtw_7pDXNHiZFxkBjhIJxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AC5629324A0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:44:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED7F7C27E8E;
 Thu, 12 May 2022 09:44:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B810221E6880; Thu, 12 May 2022 11:44:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qapi: make machine type deprecation a warning
References: <20220511175043.27327-1-pbonzini@redhat.com>
 <871qwzdi3r.fsf@pond.sub.org>
 <a1d20baf-03de-d567-50d9-3c58080699a2@redhat.com>
Date: Thu, 12 May 2022 11:44:27 +0200
In-Reply-To: <a1d20baf-03de-d567-50d9-3c58080699a2@redhat.com> (Paolo
 Bonzini's message of "Thu, 12 May 2022 10:26:08 +0200")
Message-ID: <87o8039jb8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/11/22 20:44, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   softmmu/vl.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>> index c2919579fd..fbef0f5c5f 100644
>>> --- a/softmmu/vl.c
>>> +++ b/softmmu/vl.c
>>> @@ -3723,7 +3723,7 @@ void qemu_init(int argc, char **argv, char **envp)
>>>         machine_class = MACHINE_GET_CLASS(current_machine);
>>>       if (!qtest_enabled() && machine_class->deprecation_reason) {
>>> -        error_report("Machine type '%s' is deprecated: %s",
>>> +        warn_report("Machine type '%s' is deprecated: %s",
>>>                        machine_class->name, machine_class->deprecation_reason);
>>>       }
>>
>> Anti-pattern: error_report() not followed by "fail function".
>
> Good point, thanks for writing it down... That's what I couldn't put
> my fingers on (hence the scant commit message).  I'll augment the
> commit message with the following:
>
> error_report should generally be followed by a failure; if we can
> proceed anyway, that is just a warning and should be communicated
> properly to the user with warn_report.

Good!

[...]


