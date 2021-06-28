Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553DC3B65E9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:41:18 +0200 (CEST)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtNt-0000PE-DU
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lxtMn-0007vX-71
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lxtMg-0008Pv-MD
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624894802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMZVP0rMKaHcIwUOjp6MilfFbdUQeCaEEsaHxOb/7fw=;
 b=bQUqw1kYYYDN2sKeYMEnILH+379HHXO0NBUGLqHfKeB8f9p/Wz3mUhx242hZtDX5OyryGh
 jFUco4BRzaGlHUMO5wkwHioOCMp8B1J4wscDujqJHmq1AFDFyk1TcgoCAuTqqm/gMYlhKW
 pvzC1CZpoTzdJgo5s0P4LmlZ4Jafs1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-GC1GWV32PAqOGsNTTF-MCw-1; Mon, 28 Jun 2021 11:40:00 -0400
X-MC-Unique: GC1GWV32PAqOGsNTTF-MCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C6BA79EDD;
 Mon, 28 Jun 2021 15:39:59 +0000 (UTC)
Received: from redhat.com (ovpn-112-137.ams2.redhat.com [10.36.112.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB0F5189C4;
 Mon, 28 Jun 2021 15:39:56 +0000 (UTC)
Date: Mon, 28 Jun 2021 17:39:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 0/9] Allow changing bs->file on reopen
Message-ID: <YNntS5cW0l4eEPlw@redhat.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: berto@igalia.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.06.2021 um 14:05 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Note that this is only "subject" part of original Alberto's
> "[PATCH v4 0/6] Allow changing bs->file on reopen" which also included
> multiple reopen and dropping x- prefix of reopen together with some
> refactoring.
> 
> v6: rebased
> 08: changed error message in test
> 09: somehow, now '.' are spread in test output
> 
> Now, v6 based on two first simple patches of
>   "[PATCH v5 00/35] block: publish backup-top filter"
> Based-on: <20210610112618.127378-1-vsementsov@virtuozzo.com>
> 
> So, if this goes first, just take first two patches of
> "[PATCH v5 00/35] block: publish backup-top filter" which are already
> reviewed by Max.

Thanks, applied with the dependencies to the block branch.

Kevin


