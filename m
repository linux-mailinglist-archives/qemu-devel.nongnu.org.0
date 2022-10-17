Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E1600F56
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 14:43:09 +0200 (CEST)
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPSW-00031I-SE
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 08:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okPJ5-0001cX-De
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okPJ0-0001RH-22
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666009993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpmltPvF4xuti8G9mGdQKq+c9od5D3bbvd6apbDZUes=;
 b=ULl4+DULqsqpWTPhFuKehsItTd0rNaHc1oKOgvwcemIUu6ezO8jAR5RHRSkRJcIpwNy1hT
 LMgme/4Z7TcSpiCX0jgAaUg363nAVv0qVkdj9HxQ1MJXqF+3yTN9PYWrUiuLdS8/ewDF9Z
 9DgtNL4zfT/0FcX6B1nsV471V5Ip0Xk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-PLuJey9kNQmC_f7POnzZ2g-1; Mon, 17 Oct 2022 08:33:09 -0400
X-MC-Unique: PLuJey9kNQmC_f7POnzZ2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 723682999B49;
 Mon, 17 Oct 2022 12:33:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F600207B372;
 Mon, 17 Oct 2022 12:33:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2614621E691D; Mon, 17 Oct 2022 14:33:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,  Bin Meng <bin.meng@windriver.com>,  Shengjiang
 Wu <shengjiang.wu@windriver.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] tests/qtest: vhost-user-test: Fix
 [-Werror=format-overflow=] build warning
References: <20221017114647.2226535-1-bmeng.cn@gmail.com>
 <20221017114647.2226535-2-bmeng.cn@gmail.com>
Date: Mon, 17 Oct 2022 14:33:04 +0200
In-Reply-To: <20221017114647.2226535-2-bmeng.cn@gmail.com> (Bin Meng's message
 of "Mon, 17 Oct 2022 19:46:47 +0800")
Message-ID: <87v8oi635r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Fixes: e6efe236c1d1 ("tests/qtest: vhost-user-test: Avoid using hardcoded /tmp")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/vhost-user-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index e8d2da7228..819b87df3c 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -571,7 +571,7 @@ static TestServer *test_server_new(const gchar *name,
>  
>      tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", &err);
>      if (!tmpfs) {
> -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +        g_test_message("g_dir_make_tmp on path (%s): %s", g_get_tmp_dir(),
>                         err->message);
>          g_error_free(err);
>      }

Suggest to improve the error message while there: "can't create
temporary file in %s: %s"

Reviewed-by: Markus Armbruster <armbru@redhat.com>


