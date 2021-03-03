Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B332BD18
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:15:19 +0100 (CET)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZm2-0001QT-8H
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHZOx-0001EV-Fc
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:51:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHZOt-0003G0-EW
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614808280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=743yDidRK3Qa4bMstSGxulT1vZJTWJ1momedU8n6Ksc=;
 b=CDRQJXAIDXvZ1yyr6cK4SJXLGjNnXPfrpWReSoTfFjSg865/MdpK6scz1OPIrZiWhCH8Ud
 Czwgj0X6olFO7OCEVZr6H/cljQBvYdWX+p+Bq6FWm2DUtgT1vfQKo4HqDmBwXNTtrZbE6/
 xQAOG5HNaY7Z3tJytqu3tqAvfDpU5ko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-rFR0ZTpoPnmKAsNVYzoXgA-1; Wed, 03 Mar 2021 16:51:17 -0500
X-MC-Unique: rFR0ZTpoPnmKAsNVYzoXgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D318107ACC7;
 Wed,  3 Mar 2021 21:51:16 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1851F43E;
 Wed,  3 Mar 2021 21:51:15 +0000 (UTC)
Subject: Re: [PATCH] nbd: server: Report holes for raw images
To: Nir Soffer <nsoffer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210219160752.1826830-1-nsoffer@redhat.com>
 <f136b2e8-3510-a150-27f9-e69ba14e39aa@redhat.com>
 <81464e3d-c0ee-ac12-c43b-d0f7180db482@redhat.com>
 <6a714e21-0da5-7eb1-1350-277a25e23be4@virtuozzo.com>
 <CAMRbyysiNe1J54a1nQ0UOJGU26nTZQ6yqVGLVeUd4LV-n-LJ_Q@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7e9dc71e-d412-bf57-c708-b470893aac9d@redhat.com>
Date: Wed, 3 Mar 2021 15:51:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAMRbyysiNe1J54a1nQ0UOJGU26nTZQ6yqVGLVeUd4LV-n-LJ_Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 3:45 PM, Nir Soffer wrote:

>>>>
>>>> I'll wait a few days for any other reviewer commentary before taking
>>>> this through my NBD tree.
>>>>

>>
>> And thanks for CCing me. Hmm, maybe, I'll suggest myself as co-maintainer
>> for NBD?

Vladimir, I'd be happy if you want to do that in a separate patch
(you're already a co-maintainer on block bitmaps, which are somewhat
related).

> 
> 
> Kevin, Max, are you ok with this change?

I guess that means I should send my NBD pull request sooner rather than
later, since it's been a few days with no other comments?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


