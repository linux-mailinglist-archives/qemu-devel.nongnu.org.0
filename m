Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495B212233
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:26:22 +0200 (CEST)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqxMD-00023T-AU
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jqxEN-0004ND-QV
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:18:15 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29018
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jqxEM-0004tB-42
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXKLVLo2h5qezdwGypOJQF29rTOGqXgEv+3iQAcc+BI=;
 b=VpfwKGK5mUzzABrHML/eARm3HLP87pQfZAzIFZQS3gIPmSpwx9NCIJnHTFsKJo5bfo+DG3
 tH1m9QOQ6nJM47/YT1rNoGwRUwtzZT3n1DX8Jdel3Qz0m9qIKHRbNX2MKEYtDsZwZ2wd8G
 9Ni1CM+0Z64scTPtmae3lq8HF7VPpvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Yrdr3F-OOSWBScxpZArAOw-1; Thu, 02 Jul 2020 07:18:11 -0400
X-MC-Unique: Yrdr3F-OOSWBScxpZArAOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E9C100CCC0;
 Thu,  2 Jul 2020 11:18:10 +0000 (UTC)
Received: from gondolin (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EC0879233;
 Thu,  2 Jul 2020 11:18:02 +0000 (UTC)
Date: Thu, 2 Jul 2020 13:18:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] two atomic_cmpxchg() related fixes
Message-ID: <20200702131800.053146c9.cohuck@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
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

Thanks, applied.


