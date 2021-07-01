Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689F3B928F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 15:58:15 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxCn-0006zh-Nr
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 09:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyxBR-0006ED-8b
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 09:56:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyxBO-0001Hm-Gw
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 09:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625147804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AHAAS/7DLmi/iXcDDNzlOZ/vpeUHmdiZRcmYYXaKeNk=;
 b=VxYWvLbWjXeunbM6Q02oIL3NAeTk6fo+28u6oqIQ5N9fgECmTjb8A4TUJ5TRM9H7c9aIeR
 IsuTVLfYeX5Z9YZCUP3cFsd6AI0qv+Ql2VLdnmJTnVXjKiuxkzEssthnl44WcDCpxC1mfg
 NFa7kgAlbAPBw+JcULyipgIQYFXECpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-vINfbMpDNOCHinUXzNo3vA-1; Thu, 01 Jul 2021 09:56:43 -0400
X-MC-Unique: vINfbMpDNOCHinUXzNo3vA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33A7510C1ADC;
 Thu,  1 Jul 2021 13:56:42 +0000 (UTC)
Received: from localhost (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F297110016F5;
 Thu,  1 Jul 2021 13:56:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ulrich Weigand <ulrich.weigand@de.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, david@redhat.com, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
In-Reply-To: <20210630105058.GA29130@oc3748833570.ibm.com>
Organization: Red Hat GmbH
References: <20210630105058.GA29130@oc3748833570.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 01 Jul 2021 15:56:36 +0200
Message-ID: <87czs2jfxn.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30 2021, Ulrich Weigand <ulrich.weigand@de.ibm.com> wrote:

> The FP-to-integer conversion instructions need to set CC 3 whenever
> a "special case" occurs; this is the case whenever the instruction
> also signals the IEEE invalid exception.  (See e.g. figure 19-18
> in the Principles of Operation.)
>
> However, qemu currently will set CC 3 only in the case where the
> input was a NaN.  This is indeed one of the special cases, but
> there are others, most notably the case where the input is out
> of range of the target data type.
>
> This patch fixes the problem by switching these instructions to
> the "static" CC method and computing the correct result directly
> in the helper.  (It cannot be re-computed later as the information
> about the invalid exception is no longer available.)
>
> This fixes a bug observed when running the wasmtime test suite
> under the s390x-linux-user target.
>
> Signed-off-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
> ---
>  target/s390x/fpu_helper.c | 63 ++++++++++++++++++++++++++++++++++++++++++++---
>  target/s390x/helper.h     | 24 +++++++++---------
>  target/s390x/translate.c  | 39 +++++++++--------------------
>  3 files changed, 83 insertions(+), 43 deletions(-)

Thanks, applied.


