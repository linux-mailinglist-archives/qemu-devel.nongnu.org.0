Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468A51831D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 13:13:25 +0200 (CEST)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlqT2-00068q-7c
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 07:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlq54-0002Nw-IV
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlq51-0007rU-E2
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651574910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BaAUY8ISF7twqkKpAy3c51J+G/aiDNmjuKfZGngDeVQ=;
 b=Ai5CyeUCygX10jHMfqa9Zw0l521019lKTzExXehRyrOQxjLBzPpSiaqd0Kh5tYJW3jafGP
 d0Rzuwtfmud89TWTtqb/XvZJV0+ib6ryZm4oBzwN/hSfGebv2uNk2RI5O/+bT3D8hvPv6K
 B56zKs9GhisFF6XMhx30IIot6hTmMec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-wlpcjMAvPAOgHBAzUUmSzw-1; Tue, 03 May 2022 06:48:29 -0400
X-MC-Unique: wlpcjMAvPAOgHBAzUUmSzw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C75C85A5A8;
 Tue,  3 May 2022 10:48:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DF2B416388;
 Tue,  3 May 2022 10:48:28 +0000 (UTC)
Date: Tue, 3 May 2022 12:48:27 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 0/3] coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
Message-ID: <YnEHPRupoWDtrG4U@redhat.com>
References: <20220307153853.602859-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307153853.602859-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.03.2022 um 16:38 hat Stefan Hajnoczi geschrieben:
> The coroutine implementation uses __thread variables internally. Compiler
> optimizations may cache Thread-Local Storage values across
> qemu_coroutine_yield(), leading to stale values being used after the coroutine
> is re-entered from another thread.
> 
> Kevin pointed out that the coroutine implementation itself is vulnerable to
> this problem. As a follow-up to my coroutine TLS patch series I'm sending these
> patches to convert __thread variables to the new "qemu/coroutine-tls.h" macros
> so they are safe.

Thanks, applied to the block branch.

Kevin


