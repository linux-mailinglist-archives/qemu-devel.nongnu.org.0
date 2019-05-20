Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119522C3C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 08:43:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSc1P-0008P9-KU
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 02:43:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSc0O-00085R-PM
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSc0N-0004cN-Vp
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:42:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSc0N-0004bH-Q5; Mon, 20 May 2019 02:42:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAE3230832E1;
	Mon, 20 May 2019 06:42:34 +0000 (UTC)
Received: from gondolin (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF91600C6;
	Mon, 20 May 2019 06:42:27 +0000 (UTC)
Date: Mon, 20 May 2019 08:42:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <20190520084223.297cf9d6.cohuck@redhat.com>
In-Reply-To: <20190429090250.7648-1-borntraeger@de.ibm.com>
References: <20190429090250.7648-1-borntraeger@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 20 May 2019 06:42:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/9] s390x: new guest features
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
	Collin Walling <walling@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Apr 2019 05:02:41 -0400
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> Adding gen15.
> 
> v2->v3: - merge  deprecation patch into gen 15 patch
> 	- fix comments
> 	- use gen15a and gen15b instead of cpuid
> v1->v2: - rework csske deprecation
> 	- white space fixes
> 	- also require msa4 for msa9
> 
> Christian Borntraeger (9):
>   linux header sync
>   s390x/cpumodel: ignore csske for expansion
>   s390x/cpumodel: Miscellaneous-Instruction-Extensions Facility 3
>   s390x/cpumodel: msa9 facility
>   s390x/cpumodel: vector enhancements
>   s390x/cpumodel: enhanced sort facility
>   s390x/cpumodel: add Deflate-conversion facility
>   s390x/cpumodel: add gen15 defintions
>   s390x/cpumodel: wire up 8561 and 8562 as gen15 machines
> 
>  linux-headers/asm-s390/kvm.h    |   5 +-
>  target/s390x/cpu_features.c     |  54 ++++++++++++++++
>  target/s390x/cpu_features.h     |   3 +
>  target/s390x/cpu_features_def.h |  49 +++++++++++++++
>  target/s390x/cpu_models.c       |  13 ++--
>  target/s390x/gen-features.c     | 105 ++++++++++++++++++++++++++++++++
>  target/s390x/kvm.c              |  18 ++++++
>  7 files changed, 242 insertions(+), 5 deletions(-)
> 

Thanks, queued to s390-next (with a proper header sync against
5.2-rc1).

