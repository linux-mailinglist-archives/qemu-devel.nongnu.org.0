Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18200330C22
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:20:41 +0100 (CET)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDwG-0000ph-4u
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJDtN-00076B-3g
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJDtF-0002NE-5B
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615202252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O0sMwf2FSVfRl+opNYhX9x4t09Nd7/48PFfrKeKUsVw=;
 b=OpslfPDeIuFQ+Db8nu7wfnipnl0w4cm9gKCcKfRNOBT4Ui1N+t+WZjaU2R15FNZUqthfJb
 0ZneIzJLau61sECRnvyd00VnlsJvcr2bdkwMSeS8QjIze4bk7hqMAGhJj4B3qMDgE34VQd
 jxq43Mp0lGx4Pc5+qfr5gzuUIDzsr4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-fxfuD4VfOee9x5Njry0eBQ-1; Mon, 08 Mar 2021 06:17:28 -0500
X-MC-Unique: fxfuD4VfOee9x5Njry0eBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1F9B108BD10;
 Mon,  8 Mar 2021 11:17:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 532095D756;
 Mon,  8 Mar 2021 11:17:26 +0000 (UTC)
Date: Mon, 8 Mar 2021 12:17:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qom: Check for wellformed id in user_creatable_add_type()
Message-ID: <20210308111724.GC7021@merkur.fritz.box>
References: <20210302171623.49709-1-kwolf@redhat.com>
 <deeee390-7c4b-6857-8ec2-6d19ca8c03a0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <deeee390-7c4b-6857-8ec2-6d19ca8c03a0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: armbru@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.03.2021 um 11:50 hat Paolo Bonzini geschrieben:
> On 02/03/21 18:16, Kevin Wolf wrote:
> > Most code paths for creating a user creatable object go through
> > QemuOpts, which ensures that the provided 'id' option is actually a
> > valid identifier.
> > 
> > However, there are some code paths that don't go through QemuOpts:
> > qemu-storage-daemon --object (since commit 8db1efd3) and QMP object-add
> > (since it was first introduced in commit cff8b2c6). We need to have the
> > same validity check for those, too.
> > 
> > This adds the check and makes it print the same error message as
> > QemuOpts on failure.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> > This makes sense even without the -object QAPIfication, so no reason to
> > wait for v3 of that series to get this fixed.
> 
> It needs a check for id != NULL, but no big deal so I added it.

Oops, yes. Thanks for fixing it up.

Kevin


