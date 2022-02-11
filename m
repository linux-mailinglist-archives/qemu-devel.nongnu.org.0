Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882934B21FF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:32:06 +0100 (CET)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISHc-0005Is-Jb
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:32:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nISF9-0004PB-2i
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:29:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nISF5-0005Yc-Ni
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644571765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6ZWlwXxoeCnIC16q/zDRFslz/6rCjh01VMeW6KGktM=;
 b=Pq1JXdRZk2SXx4Y+v9pn+hjYpmpGqk4evr9LCwwLxHaLht04W+WCulKyBYvHBLh40moKBs
 cl+AIM3PTGrcKR7oVYlWmZxvaMxbign3Wy+cfcKCX4Pu1InO5wNKbiJsoxJf25foCzJMpR
 tnGMN8HJAS2XcbKWZ2r9HTp3XMxm0u8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-qU_ooi3GNIywjx_l-tE-ng-1; Fri, 11 Feb 2022 04:29:22 -0500
X-MC-Unique: qU_ooi3GNIywjx_l-tE-ng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27BD1808337;
 Fri, 11 Feb 2022 09:29:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A409254558;
 Fri, 11 Feb 2022 09:29:19 +0000 (UTC)
Date: Fri, 11 Feb 2022 10:29:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/8] tests/qemu-iotests/testrunner: Allow parallel
 test invocations
Message-ID: <YgYsbRc9XNYjUH2L@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
 <20220209101530.3442837-2-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220209101530.3442837-2-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.2022 um 11:15 hat Thomas Huth geschrieben:
> If multiple tests run in parallel, they must use unique file
> names for the test output.
> 
> Suggested-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qemu-iotests/testrunner.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 0eace147b8..9d20f51bb1 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -259,7 +259,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>          """
>  
>          f_test = Path(test)
> -        f_bad = Path(f_test.name + '.out.bad')
> +        f_bad = Path(f'{os.getpid()}-{f_test.name}.out.bad')
>          f_notrun = Path(f_test.name + '.notrun')
>          f_casenotrun = Path(f_test.name + '.casenotrun')
>          f_reference = Path(self.find_reference(test))

Hmm... It does make sense, but nobody ever cleans those files up.
Currently, the next run of the test will just overwrite the existing
file or delete it when the test succeeds. So after running the test
suite, you have .out.bad files for every failed test, but not for those
that succeeded.

After this change, won't the test directory accumulate tons of .out.bad
files over time?

Kevin


