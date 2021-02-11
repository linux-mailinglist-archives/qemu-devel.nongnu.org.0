Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A6B319351
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:47:56 +0100 (CET)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHwR-00062N-Ck
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAHiJ-0001hl-IC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:33:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAHiD-0006Bb-Ko
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613071992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZU3I7ONDkxW+ysOa+IXklH8Iy5XuRBLy2zEiXgYT/g=;
 b=CPrtEuxEm5Gjpz9Sj40pjhBOdc+5kbe9z3FIxSCEz3DyQDq9tr4E71HVex1EeK75SCeuUy
 PX39EGpiG5mrS+1SgaCrr5gFGJF4OU+wPhNovd4m25by99sv71QtNKddbd5Khk8GGvDVEx
 wQCqGDi6XP8E9b8WYoCetR5eme9gdZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-WT7CYsaROha5HdXhGNk04g-1; Thu, 11 Feb 2021 14:33:08 -0500
X-MC-Unique: WT7CYsaROha5HdXhGNk04g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C890E107ACC7;
 Thu, 11 Feb 2021 19:33:07 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE262BFE3;
 Thu, 11 Feb 2021 19:33:07 +0000 (UTC)
Subject: Re: [PATCH 1/2] block/mirror: Fix mirror_top's permissions
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210211172242.146671-1-mreitz@redhat.com>
 <20210211172242.146671-2-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cbce1de7-2cc6-acb7-569b-97e02fec7d09@redhat.com>
Date: Thu, 11 Feb 2021 13:33:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211172242.146671-2-mreitz@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 11:22 AM, Max Reitz wrote:
> mirror_top currently shares all permissions, and takes only the WRITE
> permission (if some parent has taken that permission, too).
> 
> That is wrong, though; mirror_top is a filter, so it should take
> permissions like any other filter does.  For example, if the parent
> needs CONSISTENT_READ, we need to take that, too, and if it cannot share
> the WRITE permission, we cannot share it either.
> 
> The exception is when mirror_top is used for active commit, where we
> cannot take CONSISTENT_READ (because it is deliberately unshared above
> the base node) and where we must share WRITE (so that it is shared for
> all images in the backing chain, so the mirror job can take it for the
> target BB).
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/mirror.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


