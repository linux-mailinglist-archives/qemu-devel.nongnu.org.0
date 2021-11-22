Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C57459702
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 22:53:21 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpHFY-00066u-7s
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 16:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpHEk-0005EG-Nv
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 16:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpHEi-0008C0-AQ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 16:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637617947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hKcbz42WDlceZiRI92VB8Ef/+3asFlAb8Tm5J5HJVcU=;
 b=ZWi4WbAs0Og01p15lTS4tMtA7wlgYiR4+ILOj/ZazGjGobOMsViYibGq2sAkopM4SM839b
 B1xUZ2DjVPdQIQZ9mCcg/X/7eAsZZU5+sUvHVpH95jOJ2oU2hBXX55UiTJJh0drzfuX/At
 pWB6Kbbon6Fbrl3kinfXjjz7UNHBBTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-1DOa4UaNNOeoNQ-unWEj6w-1; Mon, 22 Nov 2021 16:52:23 -0500
X-MC-Unique: 1DOa4UaNNOeoNQ-unWEj6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D409A0CAD;
 Mon, 22 Nov 2021 21:52:22 +0000 (UTC)
Received: from redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE04D1037F5D;
 Mon, 22 Nov 2021 21:51:47 +0000 (UTC)
Date: Mon, 22 Nov 2021 15:51:45 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 20/32] nbd/client-connection: implement connection retry
Message-ID: <20211122215145.wf2dqyhsc5zt6wbm@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-21-vsementsov@virtuozzo.com>
 <20211122163001.ahvcby7rrg4hc23n@redhat.com>
 <fca77dff-caba-907b-6ab2-91ed9987760f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <fca77dff-caba-907b-6ab2-91ed9987760f@virtuozzo.com>
User-Agent: NeoMutt/20211029-26-f6989f
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 08:17:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 22.11.2021 19:30, Eric Blake wrote:
> > Reviving this thread, as a good as place as any for my question:
> > 

> >   But I can't
> > find anywhere in the code base that ensures that on a reconnect, the
> > new server supplies at least as many extensions as the original
> > server, nor anywhere that we would be able to gracefully handle an
> > in-flight block status command that can no longer be successfully
> > continued because the reconnect landed on a downgraded server.
> > 

> 
> Yes that's a problem. We previously noted it here https://lists.gnu.org/archive/html/qemu-block/2021-06/msg00458.html

Aha!  And oops that we've let it slide this long.  But now that we
know the problem was also present in 6.1, and not a new regression in
6.2, it is less urgent to get a fix in.  If we get one written in
time, it's still game for inclusion for -rc2 or maybe -rc3, but as we
get further along in the process, it should not hold up the final
release (it would not be -rc4 material, for example).

> 
> Honestly, I didn't start any fix for that :(.. I agree, it would be good to fix it somehow in 6.2. I'll try to make something simple this week. Or did you already started doing some fix?

I haven't started writing anything on the topic.  I've got some
patches that I hope to post soon targetting 7.0 that allow an
extension for NBD_CMD_BLOCK_STATUS to do a full round-trip 64-bit
operation, which is why I noticed it (if the 64-bit extension is not
present on reconnect, we have a problem - but it's no worse than the
existing problems).  But I'm currently so focused on getting the new
feature interoperating between qemu, libnbd, and nbdkit, plus the US
Thanksgiving break this week, that I'm happy to let you take first
shot at client-side validation that a server reconnect does not lose
capabilities.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


