Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985B7210AB4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 14:03:40 +0200 (CEST)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqbSl-0000nr-Jn
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 08:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jqbQo-0007fS-9b
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 08:01:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23433
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jqbQl-0004Sw-Ap
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 08:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593604894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qs7JbkDGKjYWUNWfZ77nlkbjqxZUKGmgzHqWdlflHmo=;
 b=U4KW5SK5vSJJxZc5lt8WyuxdqcJ6T7okfLM8+lSwq3jJFEoKT8hrceYdgWIZE+9Hu22Tog
 CXyuYvMJLoG6961DUmvnnRXbeuJYbXJwD5UBNSiZwvIP6PM124QbY9yYSVR5ENxsNFhEJC
 m1PLfotxw3385TOgpFcGY+zn8EYYksI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-CrZwBaEoM4S7TLv0tmhMRA-1; Wed, 01 Jul 2020 08:01:32 -0400
X-MC-Unique: CrZwBaEoM4S7TLv0tmhMRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D66ACC7440;
 Wed,  1 Jul 2020 12:01:30 +0000 (UTC)
Received: from gondolin (ovpn-113-61.ams2.redhat.com [10.36.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B92337BEA3;
 Wed,  1 Jul 2020 12:01:28 +0000 (UTC)
Date: Wed, 1 Jul 2020 14:01:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] two atomic_cmpxchg() related fixes
Message-ID: <20200701140106.004a3da2.cohuck@redhat.com>
In-Reply-To: <20200616045035.51641-1-pasic@linux.ibm.com>
References: <20200616045035.51641-1-pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 22:25:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jun 2020 06:50:33 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> The story short: compiler can generate code that does two
> distinct fetches of *ind_addr for old and _old. If that happens we can
> not figure out if we had the desired xchg or not.
> 
> Halil Pasic (2):
>   virtio-ccw: fix virtio_set_ind_atomic
>   s390x/pci: fix set_ind_atomic
> 
>  hw/s390x/s390-pci-bus.c | 16 +++++++++-------
>  hw/s390x/virtio-ccw.c   | 18 ++++++++++--------
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> 
> base-commit: 7d3660e79830a069f1848bb4fa1cdf8f666424fb

Have we managed to reach any kind of agreement on this? (A v2?)

We can still get in fixes post-softfreeze, of course.


