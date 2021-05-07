Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061B3766FC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:20:14 +0200 (CEST)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1Kv-0008W7-7E
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1JC-0007Zn-Bj
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1JA-0000n0-U1
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620397104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5cgO9GdFDMdKphbHBg7DBqKiyHodMu1McXFd3Z02Ys=;
 b=gbyn53ShKERxL8htbSr+oaYAJXUUR4XhkltWtpj3Hv3iYt5mdLHp0z5pDyB914Z8XhwBUv
 dm+0LJR50xzbT4q3Hbwr40MMS1Kbnexk7Z+NI47x9qLH2Y9FFrwAIgQZuVH1h6kdoZiD7h
 OgUUONX1bCQgYvrIF1VmWTJhyuvdjM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-8yhTYNt8PDigjReLg7YDFQ-1; Fri, 07 May 2021 10:18:19 -0400
X-MC-Unique: 8yhTYNt8PDigjReLg7YDFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 429CD803620;
 Fri,  7 May 2021 14:18:18 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 520C21897F;
 Fri,  7 May 2021 14:18:14 +0000 (UTC)
Subject: Re: [PATCH v3 4/8] block/write-threshold: drop extra APIs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
 <20210506090621.11848-5-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9e4eb51b-02cb-6a1a-f15c-aa30038f1467@redhat.com>
Date: Fri, 7 May 2021 09:18:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506090621.11848-5-vsementsov@virtuozzo.com>
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
> bdrv_write_threshold_exceeded() is unused at all.

either:
s/unused/not used/
or:
s/ at all//

> 
> bdrv_write_threshold_is_set() is used only to double check the value of
> bs->write_threshold_offset in tests. No real sense in it (both tests do
> check real value with help of bdrv_write_threshold_get())
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


