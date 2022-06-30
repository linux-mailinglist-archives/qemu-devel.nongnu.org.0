Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643E562003
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 18:11:55 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wll-0004Kv-LM
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 12:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6wjX-00012F-Ei
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 12:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6wjV-0002MG-Fc
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 12:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656605372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dONI6L1250ENwLum9Ra5Xa01f9sLBJUmUKlzObKu5nU=;
 b=UitW79P4WKY+7tosdVzyrvVUFM94FPjXxLRc6LZ+5gyUpve0da4OhsM1iKwCJWWIf5ERL7
 3XcI5Vq4ZYZBJjVTwnLwZEFMEUOZ9Re31e28kg3VAyJgimnq7A3FLqvSua2RyL0lwwXVOx
 dLhqulTxi9ohOziK3QDhviOcMLxmxSE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-M93uYDPNNYqkKI8zA5tluw-1; Thu, 30 Jun 2022 12:09:28 -0400
X-MC-Unique: M93uYDPNNYqkKI8zA5tluw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94BD63C0ED4C;
 Thu, 30 Jun 2022 16:09:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FA940CF8EF;
 Thu, 30 Jun 2022 16:09:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <b684d1e6-2d8f-5d08-aae0-b085a722575b@redhat.com>
Organization: Red Hat GmbH
References: <20220512131146.78457-1-cohuck@redhat.com>
 <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com>
 <87a6agsg9t.fsf@redhat.com>
 <b684d1e6-2d8f-5d08-aae0-b085a722575b@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 30 Jun 2022 18:09:22 +0200
Message-ID: <87lete2kwd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Wed, Jun 29 2022, Eric Auger <eauger@redhat.com> wrote:

> Hi Connie,
>
> On 6/13/22 18:02, Cornelia Huck wrote:
>> On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:
>> 
>>> Hi Connie,
>>>
>>> On 5/12/22 15:11, Cornelia Huck wrote:
>>>> This series enables MTE for kvm guests, if the kernel supports it.
>>>> Lightly tested while running under the simulator (the arm64/mte/
>>>> kselftests pass... if you wait patiently :)
>>>>
>>>> A new cpu property "mte" (defaulting to on if possible) is introduced;
>>>> for tcg, you still need to enable mte at the machine as well.
>>> isn't the property set to off by default when kvm is enabled (because of
>>> the migration blocker).
>> 
>> Oh, I had changed that around several times, and it seems I ended up
>> being confused when I wrote this cover letter... I wonder what the best
>> state would be (assuming that I don't manage to implement it soonish,
>> but it seems we still would need kernel changes as by the discussion in
>> that other patch series.)
> Having mte=off by default along with KVM, until the migration gets
> supported, looks OK to me. Does it prevent you from having it set to
> another value by default with TCG (depending on the virt machine
> tag_memory option)?
>
> 		tag_memory=on	tag_memory=off
> KVM CPU mte=off	invalid		mte=off
> KVM CPU mte=on	invalid		mte=on
> TCG CPU mte=off	invalid		mte=off
> TCG CPU mte=on	mte=on		invalid
>
> default value:
> KVM mte = off until migration gets supported
> TCG mte = machine.tag_memory

With OnOffAuto, I currently have:

valid for tcg: cpu.mte=on, tag_memory=on (result: mte on)
               cpu.mte=off, tag_memory either on or off (result: mte off)
               cpu.mte unspecified, tag_memory either on or off (result:
               mte==tag_memory)
valid for kvm: tag_memory always off
               cpu.mte=off (result: mte off)
               cpu.mte=on if mte supported in kvm (result: mte on)
               cpu.mte unspecified (result: mte on if kvm supports it;
               this I can flip)
all other combinations: error


