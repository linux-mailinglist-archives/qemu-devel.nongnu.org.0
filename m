Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7FF3AAEE3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 10:35:42 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltnUz-00029g-0F
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 04:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltnTK-00014i-23
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltnTG-0003yH-29
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623918831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bZZhG0nZP+zsYstZ84yW+YVzKm8Mx3CUMX5cLii0OGc=;
 b=M6Zr+omAz7LG01K5k5BheMIJzsytMiK8FCoRjTOQy63Ek0TwpwaX+tWmS1QTvMKpgbiNO9
 3+clhjLBsTbhuPZbmsAwB1Wbb0r7q6agM4vmYl+jm04FUVagaZdBxPKylJnOcuitXVv/g+
 hhTslQrz/hv0d0/+wkkaHx3RpapDyQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-umpgkxdIP4esRj6td7bwyQ-1; Thu, 17 Jun 2021 04:33:50 -0400
X-MC-Unique: umpgkxdIP4esRj6td7bwyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DBCA18D6A2A;
 Thu, 17 Jun 2021 08:33:49 +0000 (UTC)
Received: from localhost (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7535E60622;
 Thu, 17 Jun 2021 08:33:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
Organization: Red Hat GmbH
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 17 Jun 2021 10:33:43 +0200
Message-ID: <874kdwx53s.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14 2021, Richard Henderson <richard.henderson@linaro.org> wrote:

> The PSW_MASK_CC component of psw.mask was not handled properly
> in the creation or restoration of signal frames.
>
>
> r~
>
>
> Richard Henderson (5):
>   target/s390x: Expose load_psw and get_psw_mask to cpu.h
>   target/s390x: Do not modify cpu state in s390_cpu_get_psw_mask
>   target/s390x: Improve s390_cpu_dump_state vs cc_op
>   target/s390x: Use s390_cpu_{set_psw,get_psw_mask} in gdbstub
>   linux-user/s390x: Save and restore psw.mask properly
>
>  target/s390x/cpu.h         |   3 ++
>  target/s390x/internal.h    |   5 --
>  linux-user/s390x/signal.c  |  37 ++++++++++++--
>  target/s390x/cc_helper.c   |   2 +-
>  target/s390x/excp_helper.c |  28 +++++-----
>  target/s390x/gdbstub.c     |  15 +-----
>  target/s390x/helper.c      | 101 ++++++++++++++++++++-----------------
>  target/s390x/sigp.c        |   3 +-
>  8 files changed, 110 insertions(+), 84 deletions(-)

Thanks, applied.


