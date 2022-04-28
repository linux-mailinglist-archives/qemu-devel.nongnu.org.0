Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67C75135EE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:00:21 +0200 (CEST)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4gu-0000Ht-WD
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nk4fY-0007vD-OE
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nk4fW-0006e9-8Y
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651154333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jBy86KIf9Uvsiq0TfOJRnJNJw8DbprrtHX1TdIatLU=;
 b=GVDdJpkrz1IkQDW0IYjLOlmr1EfFwwjRZctvll7IJbDLKA+vNPnmgZxWNmDdE02k6lDfMw
 bN9gSBwzjeIikRz/uAbDgBIxaWbIeo4z/yZ3/z6gcb5aTz/05R4/5JGF5KBCJecwzTO49X
 Vur4tCwFj7d4au2k8heWsHOIJI2sIFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-u67Q-qyjMdeN6tRZIckjIw-1; Thu, 28 Apr 2022 09:58:49 -0400
X-MC-Unique: u67Q-qyjMdeN6tRZIckjIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 824F91014A66;
 Thu, 28 Apr 2022 13:58:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3630240314F;
 Thu, 28 Apr 2022 13:58:49 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, alex.williamson@redhat.com
Subject: Re: [PATCH v4] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
In-Reply-To: <20220428134945.511829-1-eric.auger@redhat.com>
Organization: Red Hat GmbH
References: <20220428134945.511829-1-eric.auger@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Thu, 28 Apr 2022 15:58:47 +0200
Message-ID: <87o80ll36w.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: f4bug@amsat.org, stefanb@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28 2022, Eric Auger <eric.auger@redhat.com> wrote:

> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This region could have been a RAM device
> region, easing the detection of such safe situation but this option
> was not well received. So let's add a helper function that uses the
> memory region owner type to detect the situation is safe wrt
> the assignment. Other device types can be checked here if such kind
> of problem occurs again.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>
> ---
>
> v3 -> v4:
> - rebase on top of qemu_real_host_page_size() and
>   qemu_real_host_page_size(). Print the size and make the message
>   consistent
> - Added Stefan's A-b and Connie R-b (despite the changes)

Still fine with me.

> ---
>  hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)


