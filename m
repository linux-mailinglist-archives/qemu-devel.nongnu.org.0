Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879E39F8CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:18:17 +0200 (CEST)
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcYZ-0004Qo-TH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqcXO-0003ah-No
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqcXM-0006bG-Ng
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623161819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4EUCDLImnHjegf6RFMUNCETgHRKInX6/rrsBrC6UDU=;
 b=Rp3JCh7Szo0K5OT/Q47VX+Q4WpiM+BySkHlUeE3aMTVXZko3RAKkT59ZTny1UU8UFAWtbA
 tEjvs2W52JuVapB7Heo+qgAemk6PCjRJQiMzXLLL/JRYkU5lVN+MKbvLQyhIQcNUt0bc9O
 AVYuYFycphmCTJgMITGHtAmmeiYZWX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-SQCJZAP1O7-BBjTp3kVWig-1; Tue, 08 Jun 2021 10:16:57 -0400
X-MC-Unique: SQCJZAP1O7-BBjTp3kVWig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094AB6D4E8;
 Tue,  8 Jun 2021 14:16:56 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E5DE5D6A1;
 Tue,  8 Jun 2021 14:16:55 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:16:53 -0500
From: Eric Blake <eblake@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v4 1/6] blkdebug: refactor removal of a suspended request
Message-ID: <20210608141653.vhhxhocebg4ygz5i@redhat.com>
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-2-eesposit@redhat.com>
 <20210604161610.6we6yk2e77borfif@redhat.com>
 <b804f4ce-ff75-ba06-d3f4-fb288e38515d@redhat.com>
 <077c6de4-26fa-6e61-3797-882aa79a0919@redhat.com>
MIME-Version: 1.0
In-Reply-To: <077c6de4-26fa-6e61-3797-882aa79a0919@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 10:00:01AM +0200, Emanuele Giuseppe Esposito wrote:
> > > Oh, I see - you abandon the iteration in all control flow paths, so
> > > the simpler loop is still okay.  Still, this confused me enough on
> > > first read that it may be worth a comment, maybe:
> > > 
> > > /* No need for _SAFE, because iteration stops on first hit */
> > 
> > This is a bit confusing too because it sounds like not using _SAFE is an
> > optimization, but it's actually wrong (see commit message).
> > 
> 
> What about:
> 
> /* No need for _SAFE, since a different coroutine can remove another node
> (not the current one) in this list, and when the current one is removed the
> iteration starts back from beginning anyways. */

Works for me, although you'll have to reformat it to pass syntax check.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


