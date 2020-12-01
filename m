Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E0D2CAF2B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 22:52:55 +0100 (CET)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkDZu-0006Tf-Cw
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 16:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkDXj-0005Rf-Nx
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkDXf-0005yT-IA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606859431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RC8+jPnJsWpYywnbNx80NII5nzH3EaM7Rpy8DiPayMo=;
 b=CVi/M+IL3NTEvE7HKVKIm05lcZM+tE5OsePcCzqFCS8IquWhCypM7AQxaOFfTmTF3Z14G0
 +vdeR85zcaacCs3mqVWG02QBy9iGncVEm5IQFFEebQJxtWX/TALud+drPlqTtvBRRVUw81
 prbsAuI/Pa1WCdeLov4kZKICAUNZZzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-R-LU477_NNmr4L2ly8d0Wg-1; Tue, 01 Dec 2020 16:50:27 -0500
X-MC-Unique: R-LU477_NNmr4L2ly8d0Wg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1B8B1006C82;
 Tue,  1 Dec 2020 21:50:23 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6646F63B8C;
 Tue,  1 Dec 2020 21:50:14 +0000 (UTC)
Subject: Re: [PATCH v3 00/17] 64bit block-layer
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200430111033.29980-1-vsementsov@virtuozzo.com>
 <2a61f322-b274-f642-2d5d-6664d653adc4@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f8c91027-9007-ba27-69da-c148794ceb8f@redhat.com>
Date: Tue, 1 Dec 2020 15:50:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2a61f322-b274-f642-2d5d-6664d653adc4@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, integration@gluster.org, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, dillaman@redhat.com, qemu-devel@nongnu.org,
 sw@weilnetz.de, pl@kamp.de, ronniesahlberg@gmail.com, mreitz@redhat.com,
 den@openvz.org, sheepdog@lists.wpkg.org, stefanha@redhat.com,
 namei.unix@gmail.com, pbonzini@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 10:07 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi!
> 
> I'm sorry, I should have pinged it, or resend, or suggest to pull at
> least a half long ago :(
> 
> I've rebased it on master and make some fixes.
> 
> What to do next? I can just resend. But I'm afraid that Eric's careful
> audits may be out of date: time passed, there is no guarantee that
> callers are not changed. Really sorry :(
> So r-b marks are not applicable as well, yes?

If you think the rebase has fundamentally changed things, then dropping
the r-b is safest.  I will probably spend a good time on the audit
again, but this time, I want to see the project through to completion,
and am willing to take patches through my NBD tree if Kevin or other
block maintainers do not have enough time to take it through a broader
block tree.  I can justify it because I have a specific patch in NBD
that will benefit from this audit - I want to rever 890cbccb08 in favor
of using saner 64-bit APIs throughout the block layer.  But I am also
aware that your patches touch more than NBD, so even if Kevin can't
commit to a full review, I will at least try to get his Acked-by.

> 
> But if I just resend it with no r-bs, is it feasible to review/merge it
> in a finite time? So that audits of patches will not become outdated?

Yes, let's agree to put a lot more effort into getting this series in
for 6.0.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


