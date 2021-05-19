Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C066338949E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:24:52 +0200 (CEST)
Received: from localhost ([::1]:44718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPwB-0001RB-Gi
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljPli-0003Kf-T0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljPlf-0005CR-Gr
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621444436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulq3UBr0ev6rVnxLkKEJ8lrslDev+cWt8/+Nj9Feuq8=;
 b=IMP1tMWZdmX9LlExZxCQtewVEHER9/PAHnCHWEKyBjyBgGtCxOY+p2PIP5EQtmTmrBnidN
 +EZw8FusOnZGlqg0v8KHlpLumZSOqNx+2eR3O11efpNgpIO2uXwHS843RBb1B5PM74pCaY
 TUrGgFt3OlFEe5SERn209j1D54irs+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-qNlgbnevOV2himIEp5TefQ-1; Wed, 19 May 2021 13:13:54 -0400
X-MC-Unique: qNlgbnevOV2himIEp5TefQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02C45801B15;
 Wed, 19 May 2021 17:13:53 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61C9D5D9CC;
 Wed, 19 May 2021 17:13:51 +0000 (UTC)
Date: Wed, 19 May 2021 19:13:48 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] target/i386: Make sure that vsyscall's tb->size
 != 0
Message-ID: <20210519191348.4483bd26.cohuck@redhat.com>
In-Reply-To: <20210519045738.1335210-1-iii@linux.ibm.com>
References: <20210519045738.1335210-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 06:57:36 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> This series for the s390-next tree fixes [1]. Patch 1 is the fix, patch
> 2 is the new test to avoid similar regressions in the future.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg02962.html
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03219.html
> v1 -> v2: Fixed a problem with compiling the new test on centos7. `make
>           docker-all-tests` does not spot any other issues with the
>           updated patch (it does fail though: a number of iotests have
>           problems, there is a build problem with musl, etc, but this
>           all happens without the patch too).
> 
> Ilya Leoshkevich (2):
>   target/i386: Make sure that vsyscall's tb->size != 0
>   tests/tcg/x86_64: add vsyscall smoke test
> 
>  target/i386/tcg/translate.c      |  1 +
>  tests/tcg/x86_64/Makefile.target |  6 +++++-
>  tests/tcg/x86_64/vsyscall.c      | 12 ++++++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/x86_64/vsyscall.c
> 

Thanks, queued to s390-next.


