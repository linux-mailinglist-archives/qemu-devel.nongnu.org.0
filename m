Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962A3FC697
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 13:37:01 +0200 (CEST)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL24Z-0004Yi-Vw
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 07:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL23D-0003iP-7X
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL237-00008t-Ly
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630409727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g2VGzo5TqUEMNtHXLrpszy68t/BmZz8+gI4LAUeEDPs=;
 b=Ph32LLgsdfBFvKGuIJVvKbADUtpkWjmAW2kcghNkJhsbshQr4cQ5chE8Roexqqs+AeJLm/
 5jD6mfkmmRz/qGhIJE0+uU3bWaErgOq+1UwadVJm3JHiaBqa/UK7b4wgdZGGdLEDYcU/iT
 I1t+FA/CNQ+KzmovxJhbOO2pdM73S70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-zMfotjqVNFm4yiTm_TeaOA-1; Tue, 31 Aug 2021 07:35:26 -0400
X-MC-Unique: zMfotjqVNFm4yiTm_TeaOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE52871827
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 11:35:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 772CC6A912;
 Tue, 31 Aug 2021 11:35:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0CF011380A9; Tue, 31 Aug 2021 13:35:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
References: <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net> <YSQp0Nh6Gs5equAG@t490s>
 <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s>
Date: Tue, 31 Aug 2021 13:35:04 +0200
In-Reply-To: <YS0rXQXwqKjhr4TA@t490s> (Peter Xu's message of "Mon, 30 Aug 2021
 15:02:53 -0400")
Message-ID: <87mtoxzw2f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P . =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> On Thu, Aug 26, 2021 at 09:43:59AM -0400, Peter Xu wrote:
>> > > A simple state machine can track "has IOMMU" state.  It has three states
>> > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
>> > > that needs to know".  State diagram:
>> > > 
>> > >                           no so far
>> > >                    +--- (start state) ---+
>> > >                    |                     |
>> > >          add IOMMU |                     | add device that
>> > >                    |                     |  needs to know
>> > >                    v                     v
>> > >              +--> yes                    no <--+
>> > >              |     |   add device that   |     |
>> > >              +-----+    needs to know    +-----+
>> > > 
>> > > "Add IOMMU" in state "no" is an error.
>> > 
>> > question is how we distinguish "device that needs to know"
>> > from device that doesn't need to know, and then recently
>> > added feature 'bypass IOMMU' adds more fun to this.
>> 
>> Maybe we can start from "no device needs to know"? Then add more into it when
>> the list expands.
>> 
>> vfio-pci should be a natural fit because we're sure it won't break any valid
>> old configurations.  However we may need to be careful on adding more devices,
>> e.g. when some old configuration might work on old binaries, but I'm not sure.
>
> Btw, I think this state machine is indeed bringing some complexity on even
> understanding it - it is definitely working but it's not obvious to anyone at
> the first glance, and it's only solving problem for vIOMMU.  E.g., do we need
> yet another state machine for some other ordering constraints?
>
> From that POV, I don't like this solution more than the simple "assign priority
> for device realization" idea..

I wouldn't worry about other ordering constraints until we have them.
If you do, please tell!

I'm hoping you can't, because such implicit constraints are commonly
signs of oversimplified / screwed up machine modeling.


