Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB052E9F49
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 22:06:05 +0100 (CET)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwX3E-0000S3-VY
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 16:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kwX0N-0007Mi-0U
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 16:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kwX0J-0001sm-EC
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 16:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609794181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sIGj1SzWlJRNIKxC6vEqvsaJGQg5N4rtXniBD8QyaU=;
 b=B3Ss9ydMBa7f7HFNuDtBqfOmXyDGyRITrhkNFy37KbyJwcd6s98zjSsP/xgw7qb4JvvV2z
 ln8thXwBQzj9Gswcn6Z/uxPmArIY6PHBKxeAzbLRtmQ2UghnGLneG1H0Kq28QNuxpgqG2K
 FLPcQR7Jq6YRMyVoa3NXRhqRplMu14E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-VvQLmSW-Ppa7KTWwapV1cw-1; Mon, 04 Jan 2021 16:03:00 -0500
X-MC-Unique: VvQLmSW-Ppa7KTWwapV1cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A728959;
 Mon,  4 Jan 2021 21:02:58 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-175.gru2.redhat.com
 [10.97.116.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3320A60BE5;
 Mon,  4 Jan 2021 21:02:45 +0000 (UTC)
Subject: Re: [PATCH v2 04/12] libqtest: add qtest_remove_abrt_handler()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-5-stefanha@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <413538aa-8faa-f901-42e4-fea1cd16c52f@redhat.com>
Date: Mon, 4 Jan 2021 18:02:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207172030.251905-5-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/7/20 2:20 PM, Stefan Hajnoczi wrote:
> Add a function to remove previously-added abrt handler functions.
>
> Now that a symmetric pair of add/remove functions exists we can also
> balance the SIGABRT handler installation. The signal handler was
> installed each time qtest_add_abrt_handler() was called. Now it is
> installed when the abrt handler list becomes non-empty and removed again
> when the list becomes empty.
>
> The qtest_remove_abrt_handler() function will be used by
> vhost-user-blk-test.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h | 18 ++++++++++++++++++
>   tests/qtest/libqtest.c        | 35 +++++++++++++++++++++++++++++------
>   2 files changed, 47 insertions(+), 6 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index 51287b9276..a68dcd79d4 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -649,8 +649,26 @@ void qtest_add_data_func_full(const char *str, void *data,
>           g_free(path); \
>       } while (0)
>   
> +/**
> + * qtest_add_abrt_handler:
> + * @fn: Handler function
> + * @data: Argument that is passed to the handler
> + *
> + * Add a handler function that is invoked on SIGABRT. This can be used to
> + * terminate processes and perform other cleanup. The handler can be removed
> + * with qtest_remove_abrt_handler().
> + */
>   void qtest_add_abrt_handler(GHookFunc fn, const void *data);
>   
> +/**
> + * qtest_remove_abrt_handler:
> + * @data: Argument previously passed to qtest_add_abrt_handler()
> + *
> + * Remove an abrt handler that was previously added with
> + * qtest_add_abrt_handler().
> + */
> +void qtest_remove_abrt_handler(void *data);
> +
>   /**
>    * qtest_qmp_assert_success:
>    * @qts: QTestState instance to operate on
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index cc2cec4a35..7cf247baf0 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -196,15 +196,30 @@ static void cleanup_sigabrt_handler(void)
>       sigaction(SIGABRT, &sigact_old, NULL);
>   }
>   
> +static bool hook_list_is_empty(GHookList *hook_list)
> +{
> +    GHook *hook = g_hook_first_valid(hook_list, TRUE);
> +
> +    if (!hook) {
> +        return false;
> +    }
> +
> +    g_hook_unref(hook_list, hook);
> +    return true;
> +}
> +
>   void qtest_add_abrt_handler(GHookFunc fn, const void *data)
>   {
>       GHook *hook;
>   
> -    /* Only install SIGABRT handler once */
>       if (!abrt_hooks.is_setup) {
>           g_hook_list_init(&abrt_hooks, sizeof(GHook));
>       }
> -    setup_sigabrt_handler();
> +
> +    /* Only install SIGABRT handler once */
> +    if (hook_list_is_empty(&abrt_hooks)) {
> +        setup_sigabrt_handler();
> +    }
>   
>       hook = g_hook_alloc(&abrt_hooks);
>       hook->func = fn;
> @@ -213,6 +228,17 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data)
>       g_hook_prepend(&abrt_hooks, hook);
>   }
>   
> +void qtest_remove_abrt_handler(void *data)
> +{
> +    GHook *hook = g_hook_find_data(&abrt_hooks, TRUE, data);
> +    g_hook_destroy_link(&abrt_hooks, hook);
> +
> +    /* Uninstall SIGABRT handler on last instance */
> +    if (hook_list_is_empty(&abrt_hooks)) {
> +        cleanup_sigabrt_handler();
> +    }
> +}
> +
>   static const char *qtest_qemu_binary(void)
>   {
>       const char *qemu_bin;
> @@ -369,10 +395,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
>   
>   void qtest_quit(QTestState *s)
>   {
> -    g_hook_destroy_link(&abrt_hooks, g_hook_find_data(&abrt_hooks, TRUE, s));
> -
> -    /* Uninstall SIGABRT handler on last instance */
> -    cleanup_sigabrt_handler();
> +    qtest_remove_abrt_handler(s);
>   
>       qtest_kill_qemu(s);
>       close(s->fd);


