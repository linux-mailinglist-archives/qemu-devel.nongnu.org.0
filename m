Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF652FA42B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:10:17 +0100 (CET)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WAZ-0008Vu-SO
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1W8b-0007Me-9W
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:08:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1W8Y-0006FN-7I
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610982488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDKaAsAoUFzi6R5tadD9duFeT9U2epesCjJldLs6TbQ=;
 b=UfSTcJfhoIGUfqKClP9QPlMO7iegC3LqZPbZxt8k/8AO6wjaHgEmJDn59dUh6HBrBCu7+h
 CO4rt6tiizU2zLkZbU18cl1bQno8OxhnfQgTOv66XeYnRoqhkKZp1ayF3YZab/9qNBWytF
 CVGmLfFPq0CetQY0W02HbNStR4pzERU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-gp6z6K0HN2CNsYrDezM4BQ-1; Mon, 18 Jan 2021 10:08:04 -0500
X-MC-Unique: gp6z6K0HN2CNsYrDezM4BQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95957800D55;
 Mon, 18 Jan 2021 15:08:02 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 387CB9CA0;
 Mon, 18 Jan 2021 15:07:59 +0000 (UTC)
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3d6f7b5a-49b6-bed8-8048-38552fa6292a@redhat.com>
Date: Mon, 18 Jan 2021 16:07:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
> Hi Max!
> I applied my series onto yours 129-fixing and found, that 129 fails for backup.
> And setting small max-chunk and even max-workers to 1 doesn't help! (setting
> speed like in v3 still helps).
> 
> And I found, that the problem is that really, the whole backup job goes during
> drain, because in new architecture we do just job_yield() during the whole
> background block-copy.

OK, so as it was in v3, the job was drained, but since it was already 
yielding while block-copy was running in the background, nothing 
happened; the block-copy completed and only then was the job woken (and 
then there was no reason to pause, because it was done already).

So now the job is entered on drain, too (not only user pauses), which 
means that it gets a chance to pause background requests.

In backup’s case, that means invoking job_yield() again, which sets a 
job_pause_point(), which will cancel the block-copy.  Once the job is 
unpaused (re-entered by job_resume()), backup sees block-copy is 
cancelled (and finished), leaves the loop, and retries with a new 
block-copy call.

I think I got it now.


So all that’s left is issuing a thanks to you – thanks! – and announcing 
that I’ve applied this series to my block branch (with s/not 
unsupported/not supported/ in patch 23):

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


