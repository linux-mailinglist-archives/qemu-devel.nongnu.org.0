Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29B35A41A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:56:11 +0200 (CEST)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuQT-0007Y2-4n
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUuOw-0006RX-Kq
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUuOs-0000eN-9o
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617987268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBlEKhOfhbmoFACybNMh/DmUtMbMDVQ47m4USOC2ImM=;
 b=FqwBRKAqj0VYjfJmBLbQ0nJBN17hdJTwbRIvO1+gwlQgh8x/ln3DavRKkyaICVUoVbEBo+
 CNgtIjpJe/TLFs7JT39tfen62yDQoOVKNn9bVv1K1RmXu2IGHLcXyUaGCn1fSt6ovLP3VO
 5TPjTxQ0W1dBu9CoSUZhNA5wGWBFwKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-1EHXHaRpPhO4BzvX1f5i0A-1; Fri, 09 Apr 2021 12:54:26 -0400
X-MC-Unique: 1EHXHaRpPhO4BzvX1f5i0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1056D246;
 Fri,  9 Apr 2021 16:54:25 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9835C19727;
 Fri,  9 Apr 2021 16:54:23 +0000 (UTC)
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
To: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
 <f9827dc5-d154-8995-e505-3481fa3e482f@redhat.com>
 <YHAiCyl6x0kZutXg@merkur.fritz.box>
 <d8c87c27-f116-c0a4-5557-62fcfc8de44f@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e4c401fb-ce0b-26c4-55d6-b8590d65e9b8@redhat.com>
Date: Fri, 9 Apr 2021 12:54:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d8c87c27-f116-c0a4-5557-62fcfc8de44f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 5:57 AM, Max Reitz wrote:
> 
> Just as a PS, in a reply to one of Vladimir’s mails 
> (da048f58-43a6-6811-6ad2-0d7899737a23@redhat.com) I was wondering 
> whether it even makes sense for mirror to do all the stuff it does in 
> mirror_complete() to do it there.  Aren’t all of those things that 
> should really be done in job-finalize (i.e. mirror_exit_common())?
> 
> Max

Yes, I think so -- admittedly, when I added that finalize logic, I was 
just very confused about what was safe to move where in the mirror code 
and never got my patches off the ground to do a more vigorous refactoring.

We've got, I think, three different user-initiated "This job should 
finish now" mechanisms:

- Cancelling the mirror job after it reaches READY
- Issuing "complete" to the mirror job after it reaches READY
- Issuing "finalize" to a job

Maybe these could all be integrated into a single mechanism somehow. I 
think I just lack the knowledge of the draining/threading/aio models to 
do it safely myself, and we'd need some compatibility shims for a while, 
etc.

Would have to look at this stuff again to know for certain what we'd be 
able to change compatibly.

--js


