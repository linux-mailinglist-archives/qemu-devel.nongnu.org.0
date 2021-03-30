Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D165D34E4C2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 11:50:49 +0200 (CEST)
Received: from localhost ([::1]:48110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRB1L-0002Dp-Cr
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 05:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRAzy-0001he-Ax
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:49:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRAzv-0004QU-3h
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617097753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BSwL0CmW/dK0eEX2L7ANr27hWydJnZSgd83rK5Z4y2g=;
 b=Wbfg/CjLNmebiUh0Obb50eGyZKitPBoEeXg+IZseGRHjr3dXpITNe+hBJkP6HhQlbsAD7d
 VTFUXCs3JUK991t7iiXLKtpGLMKGzXN4hZLH+ZCA63RzLxYd135WEWcDfJOtUhHHPCF3zz
 1NPkdLy1LioEojyO6O3p95Ed+aBH/tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-0kr7PNvZPKGlpSeI9LQ7gA-1; Tue, 30 Mar 2021 05:49:11 -0400
X-MC-Unique: 0kr7PNvZPKGlpSeI9LQ7gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8CC180FCB9;
 Tue, 30 Mar 2021 09:49:10 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-220.ams2.redhat.com
 [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED18A17177;
 Tue, 30 Mar 2021 09:49:08 +0000 (UTC)
Subject: Re: [PATCH v4 for-6.0? 0/3] qcow2: fix parallel rewrite and discard
 (rw-lock)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
 <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c3c2ea3a-9475-69f2-b9d7-e88001d822c0@redhat.com>
Date: Tue, 30 Mar 2021 11:49:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.03.21 20:12, Vladimir Sementsov-Ogievskiy wrote:
> ping. Do we want it for 6.0?

I’d rather wait.  I think the conclusion was that guests shouldn’t hit 
this because they serialize discards?

There’s also something Kevin wrote on IRC a couple of weeks ago, for 
which I had hoped he’d sent an email but I don’t think he did, so I’ll 
try to remember and paraphrase as well as I can...

He basically asked whether it wouldn’t be conceptually simpler to take a 
reference to some cluster in get_cluster_offset() and later release it 
with a to-be-added put_cluster_offset().

He also noted that reading is problematic, too, because if you read a 
discarded and reused cluster, this might result in an information leak 
(some guest application might be able to read data it isn’t allowed to 
read); that’s why making get_cluster_offset() the point of locking 
clusters against discarding would be better.

This would probably work with both of your solutions.  For the in-memory 
solutions, you’d take a refcount to an actual cluster; in the CoRwLock 
solution, you’d take that lock.

What do you think?

Max


