Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B951570667
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:59:26 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAusf-0000io-Gu
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oAuqS-0003mq-Tn
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oAuqR-0003XN-9p
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657551426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RjKS13/NlMqaLdRkWRLl34SCYGjbP2YQ4ufi2FT/Xdk=;
 b=EvgJpoQnrMcn0sw1dbnt5KRje/XqBrFgPZmlPSnsHtCiBc+cD7cJxyHocrT7MspB8xH7oT
 DaJSJu9A1QzTIg497pXXcd4VkKYwcKEf37igMEn+StwlZKYVRfffhXoDgRIt2qWnITr34x
 p14Bqtx2w0yp15n5ZVr5WWpyqEko090=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-szgrPC89OX-dLPadLwjCKQ-1; Mon, 11 Jul 2022 10:56:55 -0400
X-MC-Unique: szgrPC89OX-dLPadLwjCKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A818801590;
 Mon, 11 Jul 2022 14:56:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA84A40D296C;
 Mon, 11 Jul 2022 14:56:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <YswzM/Q75rkkj/+Y@work-vm>
Organization: Red Hat GmbH
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
 <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
 <YswzM/Q75rkkj/+Y@work-vm>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 11 Jul 2022 16:56:53 +0200
Message-ID: <87r12r66kq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Mon, Jul 11 2022, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Mon, 11 Jul 2022 at 14:24, Dr. David Alan Gilbert
>> <dgilbert@redhat.com> wrote:
>> > But, ignoring postcopy for a minute, with KVM how do different types of
>> > backing memory work - e.g. if I back a region of guest memory with
>> > /dev/shm/something or a hugepage equivalent, where does the MTE memory
>> > come from, and how do you set it?
>> 
>> Generally in an MTE system anything that's "plain old RAM" is expected
>> to support tags. (The architecture manual calls this "conventional
>> memory". This isn't quite the same as "anything that looks RAM-like",
>> e.g. the graphics card framebuffer doesn't have to support tags!)
>
> I guess things like non-volatile disks mapped as DAX are fun edge cases.
>
>> One plausible implementation is that the firmware and memory controller
>> are in cahoots and arrange that the appropriate fraction of the DRAM is
>> reserved for holding tags (and inaccessible as normal RAM even by the OS);
>> but where the tags are stored is entirely impdef and an implementation
>> could choose to put the tags in their own entirely separate storage if
>> it liked. The only way to access the tag storage is via the instructions
>> for getting and setting tags.
>
> Hmm OK;   In postcopy, at the moment, the call qemu uses is a call that
> atomically places a page of data in memory and then tells the vCPUs to
> continue.  I guess a variant that took an extra blob of MTE data would
> do.

Yes, the current idea is to extend UFFDIO_COPY with a flag so that we
get the tag data along with the page.

> Note that other VMMs built on kvm work in different ways; the other
> common way is to write into the backing file (i.e. the /dev/shm
> whatever atomically somehow) and then do the userfault call to tell the
> vcpus to continue.  It looks like this is the way things will work in
> the split hugepage mechanism Google are currently adding.

Hmm... I had the impression that other VMMs had not cared about this
particular use case yet; if they need a slightly different mechanism,
it would complicate things a bit.


