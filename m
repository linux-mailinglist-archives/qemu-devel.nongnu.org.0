Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97CE8B9DD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 15:18:07 +0200 (CEST)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxWgh-0003SD-3R
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 09:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hxWfX-0001mg-6r
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:16:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hxWfW-00043U-AW
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:16:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hxWfW-00042f-4u; Tue, 13 Aug 2019 09:16:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B042E3082E0F;
 Tue, 13 Aug 2019 13:16:52 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B1957FB98;
 Tue, 13 Aug 2019 13:16:48 +0000 (UTC)
Date: Tue, 13 Aug 2019 15:16:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190813151646.5fc7dfd0.cohuck@redhat.com>
In-Reply-To: <20190812112737.6652-3-david@redhat.com>
References: <20190812112737.6652-1-david@redhat.com>
 <20190812112737.6652-3-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 13 Aug 2019 13:16:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v1 2/6] s390x/tcg: Rework MMU
 selection for instruction fetches
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
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Aug 2019 13:27:33 +0200
David Hildenbrand <david@redhat.com> wrote:

> Instructions are always fetched from primary address space, except when
> in home address mode. Perform the selection directly in cpu_mmu_index().
> 
> get_mem_index() is only used to perform data access, instructions are
> fetched via cpu_lduw_code(), which translates to cpu_mmu_index(env, true).
> 
> We don't care about restricting the access permissions of the TLB
> entries anymore, as we no longer enter PRIMARY entries into the
> SECONDARY MMU. Cleanup related code a bit.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.h        |  7 +++++++
>  target/s390x/mmu_helper.c | 35 ++++++++++++++---------------------
>  2 files changed, 21 insertions(+), 21 deletions(-)

Looks sane to me; will wait for v2 to give a tag.

