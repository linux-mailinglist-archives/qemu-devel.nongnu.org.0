Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A46264CCA8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:49:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Sm5-0003QF-2H; Wed, 14 Dec 2022 09:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p5Sm2-0003Oh-Nw
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p5Sm0-0004UU-SC
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671028214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PeHbrQMOzoHlYATkut7MsyIGzVE2Lr3uqBc4rAw21uI=;
 b=L1DODw15EFKuRr16Bf3dpKNJbu6zim+FhmyGgQoi3weEb2UIEersGk/gRQCodOGE95bM//
 1MiX/i8EkSCGQcPIEASuYBuBLpW0sNDDdEZyA8yObCotPFJFF6YzxNy3jiaxbeRgVYlM9v
 2xf/FR79EIudQOhDDzKyoq2HTTKpvTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-Q3fg9tkCOhqZJQLoPKvHtA-1; Wed, 14 Dec 2022 09:30:12 -0500
X-MC-Unique: Q3fg9tkCOhqZJQLoPKvHtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD278E1FD0;
 Wed, 14 Dec 2022 14:30:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 394D11121314;
 Wed, 14 Dec 2022 14:30:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>, Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 0/6] target/arm: general cleanups
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
Organization: Red Hat GmbH
References: <20221213190537.511-1-farosas@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 14 Dec 2022 15:30:04 +0100
Message-ID: <87wn6u9hxv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 13 2022, Fabiano Rosas <farosas@suse.de> wrote:

> Hi folks,
>
> I'm splitting this big series from Claudio from last year into more
> manageable chunks (at least for me):
>
> https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
>
> This is the first chunk with only the most trivial patches that make
> sense even without the kvm/tcg and sysemu/user splits.
>
> Claudio Fontana (1):
>   target/arm: cleanup cpu includes
>
> Fabiano Rosas (5):
>   target/arm: Fix checkpatch comment style warnings in helper.c
>   target/arm: Fix checkpatch space errors in helper.c
>   target/arm: Fix checkpatch brace errors in helper.c
>   target/arm: Remove unused includes from m_helper.c
>   target/arm: Remove unused includes from helper.c
>
>  target/arm/cpu.c      |   1 -
>  target/arm/cpu64.c    |   6 -
>  target/arm/helper.c   | 439 ++++++++++++++++++++++++++----------------
>  target/arm/m_helper.c |  16 --
>  4 files changed, 278 insertions(+), 184 deletions(-)

For the series

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


