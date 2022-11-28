Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99863A8DD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:01:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozdkL-0002TT-J7; Mon, 28 Nov 2022 08:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ozdkE-0002PQ-DZ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:00:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ozdkC-0007lb-0M
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669640419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrbHP1lBbGFW24fe3r9N1TIkIZ/509WSXjgjV8HPCi0=;
 b=Q2vCSB4yAVlxV8//DgkwUDhYkEJtwpsjTZh46/xpwxXfSkflRTV2//bKV3IGTPXO5w/W1h
 yrij1qca/qOa6TN2IaeV0c47Gl5FeH7udtCScykHptjWrajIHoLS4DWkDoLVfKM8WJy99t
 KlF22lF0ubtZcccXKpbSdNmYAHZlGXY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-HcGvEvFxMLS2ymx7FZLaWA-1; Mon, 28 Nov 2022 08:00:15 -0500
X-MC-Unique: HcGvEvFxMLS2ymx7FZLaWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2DD13C0F7EC;
 Mon, 28 Nov 2022 13:00:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C0842166B4B;
 Mon, 28 Nov 2022 13:00:13 +0000 (UTC)
Date: Mon, 28 Nov 2022 14:00:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/15] block: Simplify drain
Message-ID: <Y4Sw2WItlX9JE9W5@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 18.11.2022 um 18:40 hat Kevin Wolf geschrieben:
> I'm aware that exactly nobody has been looking forward to a series with
> this title, but it has to be. The way drain works means that we need to
> poll in bdrv_replace_child_noperm() and that makes things rather messy
> with Emanuele's multiqueue work because you must not poll while you hold
> the graph lock.
> 
> The other reason why it has to be is that drain is way too complex and
> there are too many different cases. Some simplification like this will
> hopefully make it considerably more maintainable. The diffstat probably
> tells something, too.
> 
> There are roughly speaking three parts in this series:
> 
> 1. Make BlockDriver.bdrv_drained_begin/end() non-coroutine_fn again,
>    which allows us to not poll on bdrv_drained_end() any more.
> 
> 2. Remove subtree drains. They are a considerable complication in the
>    whole drain machinery (in particular, they require polling in the
>    BdrvChildClass.attach/detach() callbacks that are called during
>    bdrv_replace_child_noperm()) and none of their users actually has a
>    good reason to use them.
> 
> 3. Finally get rid of polling in bdrv_replace_child_noperm() by
>    requiring that the child is already drained by the caller and calling
>    callbacks only once and not again for every nested drain section.
> 
> If necessary, a prefix of this series can be merged that covers only the
> first or the first two parts and it would still make sense.

Thanks for the review, applied to block-next.

Kevin


