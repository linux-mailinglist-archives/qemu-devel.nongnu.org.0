Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF78182CC4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 10:53:21 +0100 (CET)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCKWm-0003gF-DO
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 05:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1jCKVx-00030T-AV
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 05:52:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1jCKVw-0008Rz-E4
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 05:52:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37310
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1jCKVw-0008RA-Az
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 05:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584006747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zG8vPwXr3fW379kNEBs9k2zxUAhuYclstIC5n/OmTcY=;
 b=b/vhPXqYYMPntaKThNrjs0cdotHtowm7mHi1sfI8pzgA2TkmRQ7LisHKFwWNsgvjb53S61
 hVTuRmZIfLTku29lMyMqfHMUaNbrFa4TZd+WVTFYf4W4S8G5UIdXy/5igSOaVlJ6r8TJe0
 f6vsYGjSxQ2bTlqcc7kDYyLEU34inDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-0hKgPFkoNW-VDLxp0GcLmg-1; Thu, 12 Mar 2020 05:52:26 -0400
X-MC-Unique: 0hKgPFkoNW-VDLxp0GcLmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1B7800D4E;
 Thu, 12 Mar 2020 09:52:24 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE8360BEC;
 Thu, 12 Mar 2020 09:52:22 +0000 (UTC)
Date: Thu, 12 Mar 2020 10:52:20 +0100
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v3 1/2] target/arm: kvm: Inject events at the last stage
 of sync
Message-ID: <20200312095220.bb6xdezdujufnfzg@kamzik.brq.redhat.com>
References: <20200312003401.29017-1-beata.michalska@linaro.org>
 <20200312003401.29017-2-beata.michalska@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200312003401.29017-2-beata.michalska@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, Christoffer.Dall@arm.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 12, 2020 at 12:34:00AM +0000, Beata Michalska wrote:
> KVM_SET_VCPU_EVENTS might actually lead to vcpu registers being modified.
> As such this should be the last step of sync to avoid potential overwriti=
ng
> of whatever changes KVM might have done.
>=20
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  target/arm/kvm32.c | 15 ++++++++++-----
>  target/arm/kvm64.c | 15 ++++++++++-----
>  2 files changed, 20 insertions(+), 10 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


