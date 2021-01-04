Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95722E9E31
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 20:31:39 +0100 (CET)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwVZq-00046H-Nz
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 14:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kwVX5-00033R-Eb
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 14:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kwVX3-0003ea-Au
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 14:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609788524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Xl09HPcdWzkcDmVvbTM+9WW5Z5BVI1pN0TuGFKeAzM=;
 b=RoedaHWu8MzGSZXOWe599ANbt/Trr+JPrWV5H1SCr8ndnP5CIo6FZgZx8PX3s/W9/jeNtK
 7YqzzsMMulq/wgQwtp5WeUjUpNYbEMHou+GxWLyv3ZKYUYsRLSaP7a7FWowxplspDwYo8b
 G7Oj2pqD8q/e516JlINmvnjvkhu1lZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-pe0fFUUzNDC-xk2wSnmmCQ-1; Mon, 04 Jan 2021 14:28:40 -0500
X-MC-Unique: pe0fFUUzNDC-xk2wSnmmCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C659CDB4;
 Mon,  4 Jan 2021 19:28:39 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-175.gru2.redhat.com
 [10.97.116.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 658271002388;
 Mon,  4 Jan 2021 19:28:24 +0000 (UTC)
Subject: Re: [PATCH v2 03/12] libqtest: add qtest_kill_qemu()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-4-stefanha@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <c1a155f7-c8f2-2a71-a4bd-1eef30018ff2@redhat.com>
Date: Mon, 4 Jan 2021 16:28:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207172030.251905-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
> Tests that manage multiple processes may wish to kill QEMU before
> destroying the QTestState. Expose a function to do that.
>
> The vhost-user-blk-test testcase will need this.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h | 11 +++++++++++
>   tests/qtest/libqtest.c        |  7 ++++---
>   2 files changed, 15 insertions(+), 3 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index e5f1ec590c..51287b9276 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -74,6 +74,17 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args);
>    */
>   QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd);
>   
> +/**
> + * qtest_kill_qemu:
> + * @s: #QTestState instance to operate on.
> + *
> + * Kill the QEMU process and wait for it to terminate. It is safe to call this
> + * function multiple times. Normally qtest_quit() is used instead because it
> + * also frees QTestState. Use qtest_kill_qemu() when you just want to kill QEMU
> + * and qtest_quit() will be called later.
> + */
> +void qtest_kill_qemu(QTestState *s);
> +
>   /**
>    * qtest_quit:
>    * @s: #QTestState instance to operate on.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index bc389d422b..cc2cec4a35 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -133,7 +133,7 @@ void qtest_set_expected_status(QTestState *s, int status)
>       s->expected_status = status;
>   }
>   
> -static void kill_qemu(QTestState *s)
> +void qtest_kill_qemu(QTestState *s)
>   {
>       pid_t pid = s->qemu_pid;
>       int wstatus;
> @@ -143,6 +143,7 @@ static void kill_qemu(QTestState *s)
>           kill(pid, SIGTERM);
>           TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
>           assert(pid == s->qemu_pid);
> +        s->qemu_pid = -1;
>       }
>   
>       /*
> @@ -169,7 +170,7 @@ static void kill_qemu(QTestState *s)
>   
>   static void kill_qemu_hook_func(void *s)
>   {
> -    kill_qemu(s);
> +    qtest_kill_qemu(s);
>   }
>   
>   static void sigabrt_handler(int signo)
> @@ -373,7 +374,7 @@ void qtest_quit(QTestState *s)
>       /* Uninstall SIGABRT handler on last instance */
>       cleanup_sigabrt_handler();
>   
> -    kill_qemu(s);
> +    qtest_kill_qemu(s);
>       close(s->fd);
>       close(s->qmp_fd);
>       g_string_free(s->rx, true);


