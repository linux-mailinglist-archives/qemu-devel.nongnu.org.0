Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BBF66E41C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:53:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpCZ-0005VH-Qz; Tue, 17 Jan 2023 11:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pHpCX-0005V6-RB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:52:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pHpCW-0001p8-9q
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673974363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FDgixqMdZgJKYF6e0PBWXRXvTbMCho7EW2mMMQM3c70=;
 b=ZIDZqnqXxJtst9ypPmxZLTYe/0pDJYK1EMPloHpp2eK7MB7Bjzy5biH4i4m9sTBm45zT17
 Tofomq9zIB9BWm5mg09WWlY4KtKkU41xE72c5B3cjDE6NGVwPM2OOv4lwEhpjF+wI4WUIs
 niZGxpNLi/2U4pys23/f494xkbM6iss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-KRcR06ouMPCBRAQ0kDPHRw-1; Tue, 17 Jan 2023 11:52:39 -0500
X-MC-Unique: KRcR06ouMPCBRAQ0kDPHRw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E4C938173E8;
 Tue, 17 Jan 2023 16:52:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A843A492B01;
 Tue, 17 Jan 2023 16:52:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
In-Reply-To: <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 17 Jan 2023 17:52:06 +0100
Message-ID: <87a62h85op.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jan 17 2023, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> Introduce a new cpu feature flag to control MTE support. To preserve
>> backwards compatibility for tcg, MTE will continue to be enabled as
>> long as tag memory has been provided.
>>
>> If MTE has been enabled, we need to disable migration, as we do not
>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>> off with KVM unless requested explicitly.
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  docs/system/arm/cpu-features.rst |  21 +++++
>>  hw/arm/virt.c                    |   2 +-
>>  target/arm/cpu.c                 |  18 ++---
>>  target/arm/cpu.h                 |   1 +
>>  target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
>>  target/arm/internals.h           |   1 +
>>  target/arm/kvm64.c               |   5 ++
>>  target/arm/kvm_arm.h             |  12 +++
>>  target/arm/monitor.c             |   1 +
>>  9 files changed, 181 insertions(+), 13 deletions(-)
>>
>> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
>> index 00c444042ff5..e278650c837e 100644
>> --- a/docs/system/arm/cpu-features.rst
>> +++ b/docs/system/arm/cpu-features.rst
>> @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
>>  than the maximum vector length enabled, the actual vector length will
>>  be reduced.  If this property is set to ``-1`` then the default vector
>>  length is set to the maximum possible length.
>> +
>> +MTE CPU Property
>> +================
>> +
>> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
>> +presence of tag memory (which can be turned on for the ``virt`` machine via
>> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
>> +proper migration support is implemented, enabling MTE will install a migration
>> +blocker.
>> +
>> +If not specified explicitly via ``on`` or ``off``, MTE will be available
>> +according to the following rules:
>> +
>> +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
>> +  preserves the behaviour prior to introduction of the feature.
>> +
>> +* When KVM is used, MTE will default to off, so that migration will not
>> +  unintentionally be blocked.
>> +
>> +* Other accelerators currently don't support MTE.
>
> Minor nits for the documentation:
> we should expand out "if and only if" -- not everybody recognizes
> "iff", especially if they're not native English speakers or not
> mathematicians.

Ok, will change that.

>
> Should we write specifically that in a future QEMU version KVM
> might change to defaulting to "on if available" when migration
> support is implemented?

I can certainly add "Future QEMU versions might change that behaviour."
We should be able to add compat handling for that.


