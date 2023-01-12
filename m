Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96E666D66
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:06:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtL7-00078M-4x; Thu, 12 Jan 2023 03:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFtL3-00077U-8U
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:53:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFtL1-0007or-5I
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673513608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJHKmpWFrrKs+D4m4LbkYjV2I1A0x4rId7UaSS+vZ/8=;
 b=fzHFkFnBwddeJPiXqE7efOZ5Dz8mWFCUNNaE9mmOIeV6icbjMVlkoDf/l0gE6lsIfoeUdg
 3ZBy8g6KatAtDvCHTUbhZlLsIt8fpNf+cOhUP+jTuI2mI2aniXldxVwqI8/yInEP147Tag
 L1qRIhSWQ6BUIN0Js+MQX+Xj9dXtT4U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-3k98rBqyMequ6hVifO4ebw-1; Thu, 12 Jan 2023 03:53:25 -0500
X-MC-Unique: 3k98rBqyMequ6hVifO4ebw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17AA985CCE1;
 Thu, 12 Jan 2023 08:53:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE074078903;
 Thu, 12 Jan 2023 08:53:17 +0000 (UTC)
Date: Thu, 12 Jan 2023 08:53:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH] tests/qtest: Poll on waitpid() for a while before
 sending SIGKILL
Message-ID: <Y7/KeuE1itaHzA3i@redhat.com>
References: <20230111223018.3965423-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111223018.3965423-1-stefanb@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 11, 2023 at 05:30:18PM -0500, Stefan Berger wrote:
> To prevent getting stuck on waitpid() in case the target process does
> not terminate on SIGTERM, poll on waitpid() for 10s and if the target
> process has not changed state until then send a SIGKILL to it.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  tests/qtest/libqtest.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Since this is a test suite and we know our CI system gets very
heavily loaded, I think we should wait more than 10 secs, to
ensure QEMU has time to flush pending I/O in particular which
is most likely to delay things. If you bump the time to 30 secs
then

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 2fbc3b88f3..362b1f724f 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -202,8 +202,24 @@ void qtest_wait_qemu(QTestState *s)
>  {
>  #ifndef _WIN32
>      pid_t pid;
> +    uint64_t end;
> +
> +    /* poll for 10s until sending SIGKILL */
> +    end = g_get_monotonic_time() + 10 * G_TIME_SPAN_SECOND;
> +
> +    do {
> +        pid = waitpid(s->qemu_pid, &s->wstatus, WNOHANG);
> +        if (pid != 0) {
> +            break;
> +        }
> +        g_usleep(100 * 1000);
> +    } while (g_get_monotonic_time() < end);
> +
> +    if (pid == 0) {
> +        kill(s->qemu_pid, SIGKILL);
> +        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
> +    }
>  
> -    TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
>      assert(pid == s->qemu_pid);
>  #else
>      DWORD ret;
> -- 
> 2.39.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


