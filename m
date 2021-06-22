Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D313B0306
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:41:07 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvem8-00026q-Ta
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvekl-0001NO-VD
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvekg-0008IJ-HE
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624361972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E0fHC3xpiuljkeyRcWuxCK2uYsIQiekc3LIkfsLPQYA=;
 b=M0V3iHv5os+evD5/pCBwfORsW2FP/uv84dgCSL6EahXOMyTuWiTavtZvQVjVBo4LT/4lSX
 O/pGUPYmo+rNBEBc9x+i+b2+7Ay6DLVwHe1Mc30nZbuFYFZkLPuzyEKxIzBiNxDYp1KqV4
 eUVHCvT0T7KOyo5abPnTFt9BNsbax8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-9vyCyISqMtWe5QrPH7RHIw-1; Tue, 22 Jun 2021 07:39:28 -0400
X-MC-Unique: 9vyCyISqMtWe5QrPH7RHIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66BE881C861;
 Tue, 22 Jun 2021 11:39:27 +0000 (UTC)
Received: from localhost (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D38619C79;
 Tue, 22 Jun 2021 11:39:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v5 06/13] target/s390x: start moving TCG-only code to tcg/
In-Reply-To: <20210622101726.20860-7-acho@suse.com>
Organization: Red Hat GmbH
References: <20210622101726.20860-1-acho@suse.com>
 <20210622101726.20860-7-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 22 Jun 2021 13:39:21 +0200
Message-ID: <87czsenn6e.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: cfontana@suse.com, David Hildenbrand <david@redhat.com>, acho@suse.com,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> move everything related to translate, as well as HELPER code in tcg/
>
> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
>
> The internal.h file is renamed to s390x-internal.h, because of the
> risk of collision with other files with the same name.
>
> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directory:
>
> target/s390x/tcg/

(...)

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 636bf2f536..d05dcc22e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -294,7 +294,7 @@ S390 TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  M: David Hildenbrand <david@redhat.com>
>  S: Maintained
> -F: target/s390x/
> +F: target/s390x/tcg
>  F: hw/s390x/
>  F: disas/s390.c
>  F: tests/tcg/s390x/

This means that the pattern for tcg won't cover those files anymore that
are relevant for both tcg and kvm (e.g. cpu models). Maybe those files
need to be enumerated? Or keep the old pattern?


