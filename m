Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDE3FD8DB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:37:00 +0200 (CEST)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOY7-0007dy-L1
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLNrE-0002MV-Oz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLNrC-00019C-5a
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630493557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PqNah3n3JbPQKP3gSLt6kN+YikxKRXYtu3uyLlLh3mo=;
 b=hviPy3hqxzOvtNVagrjliPJX3YqRKqxFB/+DPE3v3tS90L2dDTxZ0nXuOpck9HFw4XJMNE
 loPKKS9BcdjJbkl9qPsrLJfinYYYSF6q2KK4SW6bb/pn+j1Vd1EDVr+jkWSdLYJHlBHpf8
 3etijuWwgIb2+4cXxToHoKvrFOW6o+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-RQ6cm7PSOOCfD8GGfPt-aA-1; Wed, 01 Sep 2021 06:52:34 -0400
X-MC-Unique: RQ6cm7PSOOCfD8GGfPt-aA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A201107ACCD;
 Wed,  1 Sep 2021 10:52:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3B285E253;
 Wed,  1 Sep 2021 10:52:32 +0000 (UTC)
Date: Wed, 1 Sep 2021 11:52:31 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 30/33] tcg: Allocate sufficient storage in
 temp_allocate_frame
Message-ID: <20210901105231.GA719@redhat.com>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
 <20210619181452.877683-31-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210619181452.877683-31-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 19, 2021 at 11:14:49AM -0700, Richard Henderson wrote:
> This function should have been updated for vector types
> when they were introduced.
> 
> Fixes: d2fd745fe8b
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/367
> Cc: qemu-stable@nongnu.org
> Tested-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
...
> +    assert(align <= TCG_TARGET_STACK_ALIGN);

This assertion is triggering:
https://bugzilla.redhat.com/show_bug.cgi?id=1999878

It happens when the kernel is booting after this line:

  [    7.315373] Loading compiled-in X.509 certificates

If everything was working then the next line of output *should* be:

  Loaded X.509 cert 'Fedora kernel signing key: 65d4930f94e951d5c1531017b9559872a4e7b0b0'

but instead it is:

  [    7.183521] ThumbEE CPU extension supported.
  [    7.186066] Registering SWP/SWPB emulation handler
  [    7.304374] registered taskstats version 1
  [    7.315373] Loading compiled-in X.509 certificates
  qemu-system-arm: ../tcg/tcg.c:3063: temp_allocate_frame: Assertion `align <= TCG_TARGET_STACK_ALIGN' failed.

Unfortunately I don't have an easy reproducer.  It reproduces very
reliably in Fedora's build system (qemu 6.1.0 running a TCG armv7 L2
guest on armv7 L1 host on unknown aarch64 L0 host).  But my attempts
to perform the same operation anywhere else don't reproduce the
problem.

What does the assertion mean?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


