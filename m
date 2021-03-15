Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0233C454
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:35:40 +0100 (CET)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLr7z-000765-I1
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lLr4Z-0005Js-3Y
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lLr3o-0003vf-VO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615829480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bguOANhvn0Zb0j6rekpkZj0I2UjQZyVfNJykVcbyPNU=;
 b=CUS+DBUMiJXZGrIeMOpFyCHRMhbJjphazF63WTJAqKDMusQY23AClPRqxueBHCMc1etdYv
 pwnFFyjQOP4TuJZ9lxndaHSd458wmlw+ZvJSoudf7Qa58VQGvwYCoFvt0CPPMlmmrztFfR
 WHXtN7+nPu+wD7BgwCNtV1DVJ49j84E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-r0L5RbJ1NpKEiyTOn7Dl3A-1; Mon, 15 Mar 2021 13:31:16 -0400
X-MC-Unique: r0L5RbJ1NpKEiyTOn7Dl3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF46880006E;
 Mon, 15 Mar 2021 17:31:14 +0000 (UTC)
Received: from gondolin (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBFA919727;
 Mon, 15 Mar 2021 17:31:09 +0000 (UTC)
Date: Mon, 15 Mar 2021 18:31:07 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 0/2] target/s390x: Implement the MVPG
 condition-code-option bit
Message-ID: <20210315183107.703adaea.cohuck@redhat.com>
In-Reply-To: <20210315085449.34676-1-david@redhat.com>
References: <20210315085449.34676-1-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 09:54:47 +0100
David Hildenbrand <david@redhat.com> wrote:

> Based on work from Richard and Thomas.
> 
> v6 -> v7:
> - "target/s390x: Implement the MVPG condition-code-option bit"
> -- Fix PGM_PROTECTION for QEMU_USER_ONLY (overridden by patch #2)
> 
> v5 -> v6:
> - "target/s390x: Implement the MVPG condition-code-option bit"
> -- Better handle CONFIG_USER_ONLY
> -- Factor handling out into s390_probe_access().
> - "target/s390x: Store r1/r2 for page-translation exceptions during MVPG"
> -- Store tec only for !PGM_ADDRESSING
> 
> v4 -> v5:
> - Don't realy on TLB_INVALID_MASK
> -- Check against tlb_fill_exc and return the exception right away
> - Handle !CONFIG_USER_ONLY
> -- Check against haddr
> -- Properly store vaddr to env->__excp_addr and return PGM_ADDRESSING
> - Exclude tlb_fill_tec/tlb_fill_exc for CONFIG_USER_ONLY
> - While at it, tackle r1/r2 indication as well
> 
> KVM unit tests continue working as expected.
> 
> David Hildenbrand (1):
>   target/s390x: Store r1/r2 for page-translation exceptions during MVPG
> 
> Richard Henderson (1):
>   target/s390x: Implement the MVPG condition-code-option bit
> 
>  target/s390x/cpu.h         |   5 ++
>  target/s390x/excp_helper.c |   3 +
>  target/s390x/helper.h      |   2 +-
>  target/s390x/insn-data.def |   2 +-
>  target/s390x/mem_helper.c  | 160 ++++++++++++++++++++++++++++++-------
>  target/s390x/translate.c   |   7 +-
>  6 files changed, 146 insertions(+), 33 deletions(-)
> 

Thanks, applied.


