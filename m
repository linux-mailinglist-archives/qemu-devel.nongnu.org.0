Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752DE31A771
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:23:50 +0100 (CET)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgqp-0002n6-L2
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAgmI-0007Yq-IZ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 17:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAgmF-0004sb-Ag
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 17:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613168341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWLZUKeOWSGgqP2ry+FlndoEyeknfoHaMC/z1GDtcsk=;
 b=QuYItvC9IEU9eFEgSsdmNGL4r7OOE8ZqA+psEmNa2zE3X31q8/pBc60bgFoQGej9g5Xtwn
 whaNPbhjGFC4Dz+y2nAse+oYgWF8nFHSvY+cj/Y8/Kt1scCyjgHhiwMTLPu+GtNaPDJ2VZ
 cpk2AYMHpcNYHgHBMi7k+gB1p5DTzO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-5EmNVK3wPuyPufoq-TJHTg-1; Fri, 12 Feb 2021 17:18:57 -0500
X-MC-Unique: 5EmNVK3wPuyPufoq-TJHTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 875F7803F47;
 Fri, 12 Feb 2021 22:18:55 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF6B5D9FC;
 Fri, 12 Feb 2021 22:18:51 +0000 (UTC)
Subject: Re: [PATCH v7 13/14] block/qed: bdrv_qed_do_open: deal with errp
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-14-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cd3a8b99-99d6-96e8-3a0b-0ec6930cdc55@redhat.com>
Date: Fri, 12 Feb 2021 16:18:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202124956.63146-14-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: kwolf@redhat.com, berto@igalia.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, Greg Kurz <groug@kaod.org>,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 6:49 AM, Vladimir Sementsov-Ogievskiy wrote:
> Set errp always on failure. Generic bdrv_open_driver supports driver
> functions which can return negative value and forget to set errp.
> That's a strange thing.. Let's improve bdrv_qed_do_open to not behave
> this way. This allows to simplify code in
> bdrv_qed_co_invalidate_cache().

Grammar tweak:

Always set errp on failure.  Generic bdrv_open_driver supports driver
functions which can return a negative value but forget to set errp.
That's a strange thing. Let's improve bdrv_qed_do_open to not behave
this way.  This allows the simplification of code in
bdrv_qed_co_invalidate_cache().

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>  block/qed.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


