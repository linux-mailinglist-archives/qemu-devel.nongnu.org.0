Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503F6A169B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 07:29:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVRZa-0008Pp-QW; Fri, 24 Feb 2023 01:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVRZY-0008Pc-Rz
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:28:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVRZX-0007rT-GQ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677220126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7pl2BtrC5PUOzOs2PHa1qtj9M7IuWelH2zXaYyObUOI=;
 b=f5McJGU2f/wVuP12/eaoOGzf9vBoY+Jbb0YDDJrzZsUbMRj4IbWWrQpmPHaQ7KLNjEjto/
 QuJtFyLzGNrXIOePZze5OqJ6l4RmD/RemFd0PKF6eMU8uQLUHBoRsqtnJn0LnrST7Pj5nr
 Y/cbspqUEIqpY29APKDtb+NuKRTsPaU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-k6Vc5K7tMYyovIf0AqUU7w-1; Fri, 24 Feb 2023 01:28:42 -0500
X-MC-Unique: k6Vc5K7tMYyovIf0AqUU7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64D2C1C04B7B;
 Fri, 24 Feb 2023 06:28:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44C7A1121314;
 Fri, 24 Feb 2023 06:28:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2393E21E6A1F; Fri, 24 Feb 2023 07:28:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Juan Quintela <quintela@redhat.com>,  kvm-devel <kvm@vger.kernel.org>,
 qemu-devel@nongnu.org,  Paul Moore <pmoore@redhat.com>,
 peter.maydell@linaro.org
Subject: Re: Fortnightly KVM call for 2023-02-07
References: <87o7qof00m.fsf@secure.mitica> <Y/fi95ksLZSVc9/T@google.com>
Date: Fri, 24 Feb 2023 07:28:41 +0100
In-Reply-To: <Y/fi95ksLZSVc9/T@google.com> (Sean Christopherson's message of
 "Thu, 23 Feb 2023 14:04:39 -0800")
Message-ID: <87356v4lwm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Jan 24, 2023, Juan Quintela wrote:
>> Please, send any topic that you are interested in covering in the next
>> call in 2 weeks.
>> 
>> We have already topics:
>> - single qemu binary
>>   People on previous call (today) asked if Markus, Paolo and Peter could
>>   be there on next one to further discuss the topic.
>> 
>> - Huge Memory guests
>> 
>>   Will send a separate email with the questions that we want to discuss
>>   later during the week.
>> 
>> After discussions on the QEMU Summit, we are going to have always open a
>> KVM call where you can add topics.
>
> Hi Juan!
>
> I have a somewhat odd request: can I convince you to rename "KVM call" to something
> like "QEMU+KVM call"?
>
> I would like to kickstart a recurring public meeting/forum that (almost) exclusively
> targets internal KVM development, but I don't to cause confusion and definitely don't
> want to usurp your meeting.  The goal/purpose of the KVM-specific meeting would be to
> do design reviews, syncs, etc. on KVM internals and things like KVM selftests, while,
> IIUC, the current "KVM call" is aimed at at the entire KVM+QEMU+VFIO ecosystem.
>
> Thanks!

Sounds fair to me.


