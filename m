Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0F63AC2F6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:54:04 +0200 (CEST)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu7S5-0006bU-Js
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lu7RD-0005vn-4V
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 01:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lu7R7-0007Ce-Vj
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 01:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623995579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pt7s6thOZ7bruleZlMytZjolyQHwvGo+oh9LKoATJaQ=;
 b=cOrohjj0/RAwQLpf5IOTnrGgTkxDr8vCFVNDJ2w5V5OPR6Lu1MlNtKHETKbzWdNSKEJG2m
 NMwK912twI4b1kda1apQTG0WyDJAwI+wpbcRZy3mnwdfOL3pKE2FPl3RgiR03FvPVI5EwM
 YQq6wz9OUeFN5jliZROjFR1QK+7fu6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-z2giWGiJPCaVzEnRt1VuKQ-1; Fri, 18 Jun 2021 01:52:58 -0400
X-MC-Unique: z2giWGiJPCaVzEnRt1VuKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 784128015DB;
 Fri, 18 Jun 2021 05:52:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A448116E4D;
 Fri, 18 Jun 2021 05:52:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3AC80113865F; Fri, 18 Jun 2021 07:52:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v9] qapi: introduce 'query-kvm-cpuid' action
References: <20210603090753.11688-1-valeriy.vdovin@virtuozzo.com>
 <87im2d6p5v.fsf@dusky.pond.sub.org>
 <20210617074919.GA998232@dhcp-172-16-24-191.sw.ru>
 <87a6no3fzf.fsf@dusky.pond.sub.org>
 <790d22e1-5de9-ba20-6c03-415b62223d7d@suse.de>
 <877dis1sue.fsf@dusky.pond.sub.org>
 <20210617153949.GA357@dhcp-172-16-24-191.sw.ru>
 <e69ea2b4-21cc-8203-ad2d-10a0f4ffe34a@suse.de>
 <20210617165111.eu3x2pvinpoedsqj@habkost.net>
Date: Fri, 18 Jun 2021 07:52:47 +0200
In-Reply-To: <20210617165111.eu3x2pvinpoedsqj@habkost.net> (Eduardo Habkost's
 message of "Thu, 17 Jun 2021 12:51:11 -0400")
Message-ID: <87sg1fwwgg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Denis Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Jun 17, 2021 at 05:53:11PM +0200, Claudio Fontana wrote:
>> On 6/17/21 5:39 PM, Valeriy Vdovin wrote:
>> > On Thu, Jun 17, 2021 at 04:14:17PM +0200, Markus Armbruster wrote:
>> >> Claudio Fontana <cfontana@suse.de> writes:
>> >>
>> >>> On 6/17/21 1:09 PM, Markus Armbruster wrote:

[...]

>> >>>> If it just isn't implemented for anything but KVM, then putting "kvm"
>> >>>> into the command name is a bad idea.  Also, the commit message should
>> >>>> briefly note the restriction to KVM.
>> >>
>> >> Perhaps this one is closer to reality.
>> >>
>> > I agree.
>> > What command name do you suggest?
>> 
>> query-exposed-cpuid?
>
> Pasting the reply I sent at [1]:
>
>   I don't really mind how the command is called, but I would prefer
>   to add a more complex abstraction only if maintainers of other
>   accelerators are interested and volunteer to provide similar
>   functionality.  I don't want to introduce complexity for use
>   cases that may not even exist.
>
> I'm expecting this to be just a debugging mechanism, not a stable
> API to be maintained and supported for decades.  (Maybe a "x-"
> prefix should be added to indicate that?)
>
> [1] https://lore.kernel.org/qemu-devel/20210602204604.crsxvqixkkll4ef4@habkost.net

x-query-x86_64-cpuid?


