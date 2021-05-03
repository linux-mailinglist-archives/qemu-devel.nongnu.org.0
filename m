Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7730371557
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:42:48 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXuR-0002ac-Oo
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldXtQ-00026U-Pm
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldXtO-0006jm-Lh
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620045701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=76iY0htqB/1Ku+VA4N5FUx0H3odjE0VJf+8ZtcKh1LA=;
 b=NJ4G2cChcNe8+1xZ3a0ymoZOuBhtwiQsFTWrNxtti4brk4bYnoWYSaV6CCqOr467+6U5Pu
 JrwqXJ9OgSRWzlI02v0OmD9c06TiC03BbKAFMrGFXMhG9mSdztBVJ60XQ4gblSA04pnrR0
 9v5qpgtV2mZv+05te7Dm+p4d/iTb+fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-IhvUOHq6PIW5PwJ8OqbXCg-1; Mon, 03 May 2021 08:41:40 -0400
X-MC-Unique: IhvUOHq6PIW5PwJ8OqbXCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7863591127;
 Mon,  3 May 2021 12:41:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CBAB5D9D0;
 Mon,  3 May 2021 12:41:38 +0000 (UTC)
Date: Mon, 3 May 2021 14:41:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/2] block: Fix Transaction leak in bdrv_reopen_multiple()
Message-ID: <YI/vgNBevsswQXe+@merkur.fritz.box>
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-3-kwolf@redhat.com>
 <ca5be7fe-9468-fce0-6f23-4d1c4c8ad1fb@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <ca5be7fe-9468-fce0-6f23-4d1c4c8ad1fb@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.05.2021 um 13:40 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 03.05.2021 14:05, Kevin Wolf wrote:
> > Like other error paths, this one needs to call tran_finalize() and clean
> > up the BlockReopenQueue, too.
> 
> We don't need the "abort" loop on that path. And clean-up of
> BlockReopenQueue is at "cleanup:" label.

The cleanup of the BlockReopenQueue itself is there, but not of all
fields in it. Specifically, these lines are needed:

    qobject_unref(bs_entry->state.explicit_options);
    qobject_unref(bs_entry->state.options);

The references are taken in bdrv_reopen_queue_child() and either used in
commit or released on abort. Doing nothing with them leaks them.

> So I'd prefer Peter's suggestion (my "[PATCH 2/6] block:
> bdrv_reopen_multiple(): fix leak of tran object")

I don't like it because I think every call that doesn't end in a commit,
should jump to the abort label to make sure that everything that remains
unused because of this is correctly cleaned up.

Kevin


