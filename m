Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30983766F8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:17:31 +0200 (CEST)
Received: from localhost ([::1]:43654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1II-0006Sm-Tv
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1Gv-0005PV-Iw
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1Gt-0007du-B7
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620396962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBeikCK3fZaObfuukFEi4kY+WlZZJgAJrjVE7ryjVek=;
 b=OJo5JIrenO/dndVrUZRo6jQT8uN7mIK2xH/+/ix96HcKTgwevjSKAUGu4Ov22a7aHv1gl9
 rsfdehYVnkawGRSlVufzZcW15PcmFFVkAenZHzdEHUJyrpyS8UtG1MWJUfeANgdBoGHsvy
 4FsOC94tP5AqK/e1hiTHC8Nrdnp1Pnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-q2BhKzmpMo6V57eEtqrH8g-1; Fri, 07 May 2021 10:15:58 -0400
X-MC-Unique: q2BhKzmpMo6V57eEtqrH8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED86A9F92A;
 Fri,  7 May 2021 14:15:57 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C1E36DE;
 Fri,  7 May 2021 14:15:53 +0000 (UTC)
Subject: Re: [PATCH v3 1/8] block/write-threshold: don't use write notifiers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
 <20210506090621.11848-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <19006893-e652-edab-6292-40ae6e02444e@redhat.com>
Date: Fri, 7 May 2021 09:15:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506090621.11848-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 4:06 AM, Vladimir Sementsov-Ogievskiy wrote:
> write-notifiers are used only for write-threshold. New code for such
> purpose should create filters.
> 
> Let's better special-case write-threshold and drop write notifiers at
> all. (Actually, write-threshold is special-cased anyway, as the only
> user of write-notifiers)

As write-threshold is already partially special-cased, let's finish that
special-casing and drop write notifiers altogether.

> 
> So, create a new direct interface for bdrv_co_write_req_prepare() and
> drop all write-notifier related logic from write-threshold.c.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---

>  
> +/*
> + * bdrv_write_threshold_check_write
> + *
> + * Check whether the specified request exceeds the write threshold.
> + * If it is, send corresponding event and disable write threshold checking.

s/it is, send/so, send a/

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


