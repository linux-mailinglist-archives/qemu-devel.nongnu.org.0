Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF4548B23
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 18:09:26 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0md3-0007Aa-0Z
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 12:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o0mWd-0001t6-Py
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o0mWc-0004XQ-1u
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655136165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ZN1SruJXh6GSm3tIf4Etj3mJf1Qp5u8MmFUMs27FWo=;
 b=FEjWsaiBGU2+RT7mxqR89WQNW5Nn/5t/IkykkTGr4zF34vvw2bQ1XkFQGp40L9BFMUFOO8
 1eHnzUnr3j3a7CWLQu92DZEvmGMIb0NNfjClXfqHmBfLhW1Ipq3B/Rgsg9mdmAYBD2TW9Q
 vtdL0ZuH4qItfagfZww58S77h8QCMf0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-NTZBAbvNO4OVmWE81gHcEA-1; Mon, 13 Jun 2022 12:02:41 -0400
X-MC-Unique: NTZBAbvNO4OVmWE81gHcEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4014B2919EA9;
 Mon, 13 Jun 2022 16:02:40 +0000 (UTC)
Received: from localhost (unknown [10.39.194.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9D442026D2D;
 Mon, 13 Jun 2022 16:02:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com>
Organization: Red Hat GmbH
References: <20220512131146.78457-1-cohuck@redhat.com>
 <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 13 Jun 2022 18:02:38 +0200
Message-ID: <87a6agsg9t.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:

> Hi Connie,
>
> On 5/12/22 15:11, Cornelia Huck wrote:
>> This series enables MTE for kvm guests, if the kernel supports it.
>> Lightly tested while running under the simulator (the arm64/mte/
>> kselftests pass... if you wait patiently :)
>> 
>> A new cpu property "mte" (defaulting to on if possible) is introduced;
>> for tcg, you still need to enable mte at the machine as well.
> isn't the property set to off by default when kvm is enabled (because of
> the migration blocker).

Oh, I had changed that around several times, and it seems I ended up
being confused when I wrote this cover letter... I wonder what the best
state would be (assuming that I don't manage to implement it soonish,
but it seems we still would need kernel changes as by the discussion in
that other patch series.)

>
> Eric
>> 
>> I've hacked up some very basic qtests; not entirely sure if I'm going
>> about it the right way.
>> 
>> Some things to look out for:
>> - Migration is not (yet) supported. I added a migration blocker if we
>>   enable mte in the kvm case. AFAIK, there isn't any hardware available
>>   yet that allows mte + kvm to be used (I think the latest Gravitons
>>   implement mte, but no bare metal instances seem to be available), so
>>   that should not have any impact on real world usage.
>> - I'm not at all sure about the interaction between the virt machine 'mte'
>>   prop and the cpu 'mte' prop. To keep things working with tcg as before,
>>   a not-specified mte for the cpu should simply give us a guest without
>>   mte if it wasn't specified for the machine. However, mte on the cpu
>>   without mte on the machine should probably generate an error, but I'm not
>>   sure how to detect that without breaking the silent downgrade to preserve
>>   existing behaviour.
>> - As I'm still new to arm, please don't assume that I know what I'm doing :)
>> 
>> 
>> Cornelia Huck (2):
>>   arm/kvm: enable MTE if available
>>   qtests/arm: add some mte tests
>> 
>>  target/arm/cpu.c               | 18 +++-----
>>  target/arm/cpu.h               |  4 ++
>>  target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
>>  target/arm/kvm64.c             |  5 +++
>>  target/arm/kvm_arm.h           | 12 ++++++
>>  target/arm/monitor.c           |  1 +
>>  tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
>>  7 files changed, 137 insertions(+), 12 deletions(-)
>> 


