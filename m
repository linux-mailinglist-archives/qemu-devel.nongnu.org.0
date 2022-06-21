Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1FB553174
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:56:49 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3cUw-0001Tz-Iv
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3cTr-0000ho-1Z
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3cTn-0003cF-6c
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655812533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ro6qMZ6eEC0xsEhbEWetVqnlZ9y5x5+3M6K3OTNQf9A=;
 b=YdOwF7cafHObU3H6jztF7FSnjYz2JmRp9QVsoJZHWVSZenANsxjS4Nz73FUjWfDQ/ZjudM
 yDdOCYYTnLLK+Q3qT5W4tn0ObYI/Cot1kiZ6+HKJNpNRdFZLlNxn3YboeyNYSr9iJ5BVnE
 3mNuet8NhWSw/SG55bZjvwWg+ZLi3ZU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-TGuNSLX8N9igjO3jP4RFdQ-1; Tue, 21 Jun 2022 07:55:27 -0400
X-MC-Unique: TGuNSLX8N9igjO3jP4RFdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6619E3C16183;
 Tue, 21 Jun 2022 11:55:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7921121314;
 Tue, 21 Jun 2022 11:55:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CED7A21E688E; Tue, 21 Jun 2022 13:55:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 qemu-devel@nongnu.org,  yc-core@yandex-team.ru,  Paolo Bonzini
 <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo
 Habkost <ehabkost@gmail.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
References: <165296995578.196133.16183155555450040914.stgit@buzz>
 <87zgj5hog8.fsf@pond.sub.org> <YpDI5IMRzTbDu93A@rvkaganb>
 <87sforb6pa.fsf@pond.sub.org> <YpTdAPAo8RGD735z@rvkaganb>
 <YrB60nlxNeelb6r0@rvkaganb>
Date: Tue, 21 Jun 2022 13:55:25 +0200
In-Reply-To: <YrB60nlxNeelb6r0@rvkaganb> (Roman Kagan's message of "Mon, 20
 Jun 2022 16:49:06 +0300")
Message-ID: <87y1xqs02a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Roman Kagan <rvkagan@yandex-team.ru> writes:

> On Mon, May 30, 2022 at 06:04:32PM +0300, Roman Kagan wrote:
>> On Mon, May 30, 2022 at 01:28:17PM +0200, Markus Armbruster wrote:
>> > Roman Kagan <rvkagan@yandex-team.ru> writes:
>> > 
>> > > On Wed, May 25, 2022 at 12:54:47PM +0200, Markus Armbruster wrote:
>> > >> Konstantin Khlebnikov <khlebnikov@yandex-team.ru> writes:
>> > >> 
>> > >> > This event represents device runtime errors to give time and
>> > >> > reason why device is broken.
>> > >> 
>> > >> Can you give an or more examples of the "device runtime errors" you have
>> > >> in mind?
>> > >
>> > > Initially we wanted to address a situation when a vhost device
>> > > discovered an inconsistency during virtqueue processing and silently
>> > > stopped the virtqueue.  This resulted in device stall (partial for
>> > > multiqueue devices) and we were the last to notice that.
>> > >
>> > > The solution appeared to be to employ errfd and, upon receiving a
>> > > notification through it, to emit a QMP event which is actionable in the
>> > > management layer or further up the stack.
>> > >
>> > > Then we observed that virtio (non-vhost) devices suffer from the same
>> > > issue: they only log the error but don't signal it to the management
>> > > layer.  The case was very similar so we thought it would make sense to
>> > > share the infrastructure and the QMP event between virtio and vhost.
>> > >
>> > > Then Konstantin went a bit further and generalized the concept into
>> > > generic "device runtime error".  I'm personally not completely convinced
>> > > this generalization is appropriate here; we'd appreciate the opinions
>> > > from the community on the matter.
>> > 
>> > "Device emulation sending an even on entering certain error states, so
>> > that a management application can do something about it" feels
>> > reasonable enough to me as a general concept.
>> > 
>> > The key point is of course "can do something": the event needs to be
>> > actionable.  Can you describe possible actions for the cases you
>> > implement?
>> 
>> The first one that we had in mind was informational, like triggering an
>> alert in the monitoring system and/or painting the VM as malfunctioning
>> in the owner's UI.
>> 
>> There can be more advanced scenarios like autorecovery by resetting the
>> faulty VM, or fencing it if it's a cluster member.
>
> The discussion kind of stalled here.

My apologies...

>                                       Do you think the approach makes
> sense or not?  Should we try and resubmit the series with a proper cover
> letter and possibly other improvements or is it a dead end?

As QAPI schema maintainer, my concern is interface design.  To sell this
interface to me (so to speak), you have to show it's useful and
reasonably general.  Reasonably general, because we don't want to
accumulate one-offs, even if they have their uses.

I think this is mostly a matter of commit message(s) and documentation
here.  Explain your intended use cases.  Maybe hand-wave at other use
cases you can think of.  Document that you're implementing the event
only for the specific errors you need, but that it could be implemented
more widely as needed.  "Complete" feels impractical, though.

Makes sense?


