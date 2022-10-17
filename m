Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C39600F53
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 14:42:33 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPRu-0001LX-Kn
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 08:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okPEm-00077A-Cn
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okPEk-00004y-9t
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666009732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W27Gmr/vjSGRWwrwcdzJnfpUFZxi5gsQe93fcYhyvWM=;
 b=MqJiRFb+JWAW4AYJElCz5y4/msAwFZu28ya9M+WlKrZlUVWGXpeUQWOSqhTJYeI4HGEFtP
 nriJVFYr4hFPrminZhBM2j0u4MISPeVGSG6z8681occShWOfjymJZx1zuKa+Bi1whbSZ63
 Ho4iSKgiONypdiw0ZxrlAkCod8qhoxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-_Hm0H45BPTKGeZZ08SvmEA-1; Mon, 17 Oct 2022 08:28:49 -0400
X-MC-Unique: _Hm0H45BPTKGeZZ08SvmEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E7E0101AA46;
 Mon, 17 Oct 2022 12:28:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8921D1401C35;
 Mon, 17 Oct 2022 12:28:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 175BC21E691D; Mon, 17 Oct 2022 14:28:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,  Bin Meng <bin.meng@windriver.com>,  Shengjiang
 Wu <shengjiang.wu@windriver.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Thomas
 Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] tests/qtest: migration-test: Fix
 [-Werror=format-overflow=] build warning
References: <20221017114647.2226535-1-bmeng.cn@gmail.com>
Date: Mon, 17 Oct 2022 14:28:38 +0200
In-Reply-To: <20221017114647.2226535-1-bmeng.cn@gmail.com> (Bin Meng's message
 of "Mon, 17 Oct 2022 19:46:46 +0800")
Message-ID: <878rle7hxl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
> It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
> neither did the QEMU CI.
>
> Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
> Fixes: e5553c1b8d28 ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/migration-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index ef4427ff4d..83a8998e40 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2481,7 +2481,7 @@ int main(int argc, char **argv)
>  
>      tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
>      if (!tmpfs) {
> -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +        g_test_message("g_dir_make_tmp on path (%s): %s", g_get_tmp_dir(),
>                         err->message);
>      }
>      g_assert(tmpfs);

Thomas posted the same fix as "[PATCH] tests/qtest/migration-test: Do
not try to print NULL pointer string".  You guys figure out which one
you like better :)

Reviewed-by: Markus Armbruster <armbru@redhat.com>


