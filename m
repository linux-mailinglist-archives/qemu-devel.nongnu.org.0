Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5298659BCF6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:37:17 +0200 (CEST)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3rw-0002BO-8u
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oQ3QU-0002TP-S4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oQ3QR-0007P9-Bz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661159330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7p2mCd+etTTt3onbvjwFRzgYq7Aw2dr69iVt9EbyiQ=;
 b=GQ58V+1RbmGrm89f4SL2GmrmhuznXkRwdDW98ScrTLt5j5PtOuys/nvTrihPIhSXA/pmsl
 LXZAdOMMjEjzTHt0huMf11mmKgbQAcVDIG8ua889ysKUGCeUU0evUlW3jsVmoxy7K6GAX0
 vjGwdTs0g087OfVEP1yDiGKPohnpYAc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-gLehc8U1NZ-ycCuXhrLRqQ-1; Mon, 22 Aug 2022 05:08:48 -0400
X-MC-Unique: gLehc8U1NZ-ycCuXhrLRqQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F340129ABA3B;
 Mon, 22 Aug 2022 09:08:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1C3F403348;
 Mon, 22 Aug 2022 09:08:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, David Hildenbrand
 <david@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Maxim
 Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, Emanuele Giuseppe
 Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay
 kvm_vm_ioctl to the commit phase
In-Reply-To: <20220816101250.1715523-3-eesposit@redhat.com>
Organization: Red Hat GmbH
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 22 Aug 2022 11:08:46 +0200
Message-ID: <874jy4prvl.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 16 2022, Emanuele Giuseppe Esposito <eesposit@redhat.com> wrote:

> Instead of sending a single ioctl every time ->region_* or ->log_*
> callbacks are called, "queue" all memory regions in a list that will
> be emptied only when committing.
>
> This allow the KVM kernel API to be extended and support multiple
> memslots updates in a single call.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  accel/kvm/kvm-all.c       | 99 ++++++++++++++++++++++++++++-----------
>  include/sysemu/kvm_int.h  |  6 +++
>  linux-headers/linux/kvm.h |  9 ++++

Meta comment: Please split out any linux-headers changes into a [dummy,
if not yet accepted in the kernel] headers update patch.

>  3 files changed, 87 insertions(+), 27 deletions(-)


