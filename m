Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50BA5706E0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:22:20 +0200 (CEST)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvEp-0006eI-P3
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oAv24-0005KE-8C
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oAv21-0006ZR-G4
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657552144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFM/HEtXZOYwhdUDHDICOY0NO6iZvyQ10TFIilDHEGc=;
 b=XT9q6TV0h7psBO01URMoMfLDTVlCpVDm/wisVAYGSP+BU23Cf8IxxJo/GKAyI31M74Le5B
 Olps4tUZ/iySF1vYxtZ3MhRjhoURv5Hk68Y7/PMatTpnUQvOBD1emmsMusjEXFVGlIjLGj
 Yp4lL8EKhRR5FbwJRZayULe+RE8zQ5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-YLpegqmMNImf2jGbCwM8ZA-1; Mon, 11 Jul 2022 11:09:02 -0400
X-MC-Unique: YLpegqmMNImf2jGbCwM8ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BE2F811E9B;
 Mon, 11 Jul 2022 15:09:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C6440D296C;
 Mon, 11 Jul 2022 15:09:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Eric Auger
 <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <YswkdVeESqf5sknQ@work-vm>
Organization: Red Hat GmbH
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 11 Jul 2022 17:08:59 +0200
Message-ID: <87o7xv660k.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Mon, Jul 11 2022, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Cornelia Huck (cohuck@redhat.com) wrote:
>> For kvm, mte stays off by default; this is because migration is not yet
>> supported (postcopy will need an extension of the kernel interface, possibly
>> an extension of the userfaultfd interface), and turning on mte will add a
>> migration blocker.
>
> My assumption was that a normal migration would need something as well
> to retrieve and place the MTE flags; albeit not atomically.

There's KVM_ARM_MTE_COPY_TAGS, which should be sufficient to move tags
around for normal migration.

>
>> My biggest question going forward is actually concerning migration; I gather
>> that we should not bother adding something unless postcopy is working as well?
>
> I don't think that restriction is fair on you; just make sure
> postcopy_ram_supported_by_host gains an arch call and fails cleanly;
> that way if anyone tries to enable postcopy they'll find out with a
> clean fail.

Ok, if simply fencing off postcopy is fine, we can try to move forward
with what we have now. The original attempt at
https://lore.kernel.org/all/881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org/
hooked itself directly into common code; maybe we should rather copy the
approach used for s390 storage keys (extra "device") instead?


