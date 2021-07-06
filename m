Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513203BD7AC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:21:45 +0200 (CEST)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0l1E-0008Gm-BQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0kzL-0005nx-J0
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0kzH-00005y-Ng
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625577583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QpPflFnNbDOf2CXE34ugYcyUFnV5CZgCjYKzAr/Aa6w=;
 b=HxwHAP7XdG+SAvJ45jN7R63Rk/THbtI6xJuC5PQW4RvFwthEvNtWjJYaAr35ZqiDLwRZoF
 CS56kFvW75BZcXtjyCp5W8UcLsrtd3MQzWS2e2w+vrVQ/SzYgngLw/jyGtZ2L7vfbFOcBa
 dytlw7EDLjBa9FE8TlN++1TSOiq7KLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-kgLyRKdZOryHY5JIkewysw-1; Tue, 06 Jul 2021 09:19:42 -0400
X-MC-Unique: kgLyRKdZOryHY5JIkewysw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F6619251A1;
 Tue,  6 Jul 2021 13:19:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49A0760877;
 Tue,  6 Jul 2021 13:19:38 +0000 (UTC)
Date: Tue, 6 Jul 2021 15:19:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
Message-ID: <YORYaF3tWDoNOqIw@redhat.com>
References: <20210702172356.11574-1-idryomov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210702172356.11574-1-idryomov@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 ct@flyingcircus.io, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.07.2021 um 19:23 hat Ilya Dryomov geschrieben:
> This series migrates the qemu rbd driver from the old aio emulation
> to native coroutines and adds write zeroes support which is important
> for block operations.
> 
> To achieve this we first bump the librbd requirement to the already
> outdated luminous release of ceph to get rid of some wrappers and
> ifdef'ry in the code.

Thanks, applied to the block branch.

I've only had a very quick look at the patches, but I think there is one
suggestion for a cleanup I can make: The qemu_rbd_finish_bh()
indirection is probably unnecessary now because aio_co_wake() is thread
safe.

(Also, if I were the responsible maintainer, I would prefer true/false
rather than 0/1 for bools, but that's minor. :-))

Kevin


