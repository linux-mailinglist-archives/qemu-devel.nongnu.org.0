Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ED4367528
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 00:30:53 +0200 (CEST)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZLMy-0000gm-Mu
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 18:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1lZLJs-0008Gy-It
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 18:27:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1lZLJp-0003n7-06
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 18:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619044055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgs9iWMlRcTy+5zhV5Pw9xMlJXZqx7WwJ9LgpNzEK2o=;
 b=Hv1f/mjZ54+NHEXCXpDVe551FRXrrTLf2xczwkCA6kwEQedKKbIZTZDpfhRcPYPL8qQZVF
 fhIqPQp0sTOOQlQfjDx7SMam72UP/cjk/3t6udmkd7CSBCAMiYJXMUar/MGn5rqGc5cn3C
 xLP6jo1XQPBGf9BscDzt9Y6PfXrjKkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-x4bz0zY9P6mOetNExgE6jg-1; Wed, 21 Apr 2021 18:27:33 -0400
X-MC-Unique: x4bz0zY9P6mOetNExgE6jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76FDA107ACCA;
 Wed, 21 Apr 2021 22:27:32 +0000 (UTC)
Received: from [10.10.117.254] (ovpn-117-254.rdu2.redhat.com [10.10.117.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9F135DAA5;
 Wed, 21 Apr 2021 22:27:31 +0000 (UTC)
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: Peter Maydell <peter.maydell@linaro.org>
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
 <CAFEAcA-=jNMCTcWZMnyC7vm=8z526zmAJ146=pKzzVg5uuaBVQ@mail.gmail.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <439194e8-f480-f5d4-e683-65758c2413f4@redhat.com>
Date: Wed, 21 Apr 2021 18:27:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-=jNMCTcWZMnyC7vm=8z526zmAJ146=pKzzVg5uuaBVQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 3:54 PM, Peter Maydell wrote:
> On Wed, 21 Apr 2021 at 16:24, Cole Robinson <crobinso@redhat.com> wrote:
>>
>> Attempting to hotplug a tap nic with libvirt will crash qemu:
>>
>> $ sudo virsh attach-interface f32 network default
>> error: Failed to attach interface
>> error: Unable to read from monitor: Connection reset by peer
>>
>> 0x000055875b7f3a99 in tap_send (opaque=0x55875e39eae0) at ../net/tap.c:206
>> 206             if (!s->nc.peer->do_not_pad) {
>> gdb$ bt
>>
>> s->nc.peer may not be set at this point. This seems to be an
>> expected case, as qemu_send_packet_* explicitly checks for NULL
>> s->nc.peer later.
>>
>> Fix it by checking for s->nc.peer here too. Padding is applied if
>> s->nc.peer is not set.
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=1949786
>> Fixes: 969e50b61a2
> 
> Is this a regression since 5.2 ? (I guess so given the Fixes tag.)
> 

Yes

> Also, I'm kind of irritated that this was reported to RH on the
> 15th and we only get a patch now after rc4.

Sorry about that, I was slow attempting the reproducer, only gave it a
spin today. I saw Jason had some reverts in rc3 so I guessed that would
fix things, I was surprised to see it still reproduced with rc4.

 I really really don't
> want to have to roll an rc5, so this now has a much higher
> hill to climb to get into 6.0 than if it had been reported
> (eg on the "Planning" wiki page) as a for-6.0 issue before rc4
> was tagged..
I'm not too in tune to rules of the rc releases TBH, I used the subject
prefix just to ensure this got attention. For Fedora's needs it's not a
big deal if this isn't in 6.0.0 GA. But AFAICT most nic hotplug via
libvirt will crash qemu 100% of the time so I imagine every distro will
want to immediately backport this patch.

Thanks,
Cole


