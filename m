Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A66231C33
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 11:39:02 +0200 (CEST)
Received: from localhost ([::1]:53038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0iY8-0006m5-Sq
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 05:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k0iX7-0006IZ-0W
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:37:57 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k0iX5-0003SI-HE
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596015474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WSq4nGbBEkBFMNKrBzHxHbboQs0BVVpuazhSeKzVI0=;
 b=RXP/8XjZceodXck+5DEpMJ+jHqve1iVFsVvxRCjusQNMyMhM+WIjqYukBMEf9QLQl4Qunv
 NsTPw7nkyPhtQidP4MH6rKBLmxTsOg+XMikID/1vzPSkFOwwCDrt0wb+xBZ+TghL0Oj2NK
 jYNfkBNeJelPqe2s2+xAeOMRd1in51Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-RhMbLJLQPZGvQISXJHeeWQ-1; Wed, 29 Jul 2020 05:37:49 -0400
X-MC-Unique: RhMbLJLQPZGvQISXJHeeWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F438017FB;
 Wed, 29 Jul 2020 09:37:47 +0000 (UTC)
Received: from gondolin (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1D0F19D7C;
 Wed, 29 Jul 2020 09:37:40 +0000 (UTC)
Date: Wed, 29 Jul 2020 11:37:37 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv3 6/9] s390x/diag: subcode to query device memory
 region
Message-ID: <20200729113737.39621d48.cohuck@redhat.com>
In-Reply-To: <3f337e2d-fc46-b842-cbca-cc4036bf8fe0@redhat.com>
References: <20200724143750.59836-1-david@redhat.com>
 <20200724143750.59836-7-david@redhat.com>
 <20200727114819.3f816010.cohuck@redhat.com>
 <963e5931-117e-48cb-b829-d630abff9e42@redhat.com>
 <20200727120930.7b8803e4.cohuck@redhat.com>
 <520ac822-df67-b33a-378f-a8f91a3bed2f@redhat.com>
 <20200727111546.GA13770@osiris>
 <68205bc1-1ac4-a023-0531-aa1a0c91e17d@redhat.com>
 <20200728091014.173a7d18.cohuck@redhat.com>
 <3f337e2d-fc46-b842-cbca-cc4036bf8fe0@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.74; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 03:32:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jul 2020 10:57:58 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 28.07.20 09:10, Cornelia Huck wrote:

> > However, I think we really need a central place for definitions that
> > are not just a Linux/QEMU interface, but can potentially also be used
> > by other hypervisors/guests. Nothing as complicated as an OASIS spec,
> > but maybe a git??b project?  
> 
> Sounds good. Maintainers? I can volunteer (+setup/create initial
> version), but would be good to have other QEMU/KVM maintainers there as
> well.

Count me in. Best as a collection of rst or markdown documents, I guess?

gitlab or github? Either would be fine with me.


