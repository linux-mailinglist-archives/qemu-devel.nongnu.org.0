Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093C665C9F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFbDX-0006qb-BB; Wed, 11 Jan 2023 08:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFbDW-0006qR-4T
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFbDU-0003Px-6p
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673443951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q7lYsqUG782XCMXYPKQq+xzd3m2Sc/nxpU1q8I0OK2U=;
 b=O/5+o/YJTxMex5W2ZcF7HDXfaIFmdPvSnZAUTJ6rwrud8zdnNbvgSSr4+UgZUP6sEm/mZZ
 cGsTeFeRtAcQVw32X5FBQ03kHqzkWSZWohBaBJNuXXUli4F9/S+qlFtafyOonseCKgLyT5
 n4ApuyGAegDmirAz94Hq0yVQNIWPbWI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-7TiDC-EENrOGRfNCWONPTg-1; Wed, 11 Jan 2023 08:32:28 -0500
X-MC-Unique: 7TiDC-EENrOGRfNCWONPTg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC2071C0512A;
 Wed, 11 Jan 2023 13:32:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D612A492C18;
 Wed, 11 Jan 2023 13:32:26 +0000 (UTC)
Date: Wed, 11 Jan 2023 13:32:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH] tests/qtest/tpm-emu: Avoid hangs using abort handlers
 closing channels
Message-ID: <Y766aNAJqcIhg+yw@redhat.com>
References: <20230111133023.3958587-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230111133023.3958587-1-stefanb@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Wed, Jan 11, 2023 at 08:30:23AM -0500, Stefan Berger wrote:
> Install abort handlers that close the TPM control and data channels in
> case an abort occurs. The purpose of this is to have QEMU terminate
> under abnormal test case failures to resolve intermittent hangs on s390x
> hosts running TPM tests for QEMU/x86_64.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  tests/qtest/tpm-emu.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 2994d1cf42..5740cab950 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -36,11 +36,18 @@ void tpm_emu_test_wait_cond(TPMTestState *s)
>      g_mutex_unlock(&s->data_mutex);
>  }
>  
> +static void tpm_emu_close_data_ioc(void *ioc)
> +{
> +    qio_channel_close(ioc, NULL);
> +}

We could actually just call it tpm_emu_close_ioc and
refer to it from both places....

> +
>  static void *tpm_emu_tpm_thread(void *data)
>  {
>      TPMTestState *s = data;
>      QIOChannel *ioc = s->tpm_ioc;
>  
> +    qtest_add_abrt_handler(tpm_emu_close_data_ioc, ioc);
> +
>      s->tpm_msg = g_new(struct tpm_hdr, 1);
>      while (true) {
>          int minhlen = sizeof(s->tpm_msg->tag) + sizeof(s->tpm_msg->len);
> @@ -77,12 +84,18 @@ static void *tpm_emu_tpm_thread(void *data)
>                            &error_abort);
>      }
>  
> +    qtest_remove_abrt_handler(ioc);
>      g_free(s->tpm_msg);
>      s->tpm_msg = NULL;
>      object_unref(OBJECT(s->tpm_ioc));
>      return NULL;
>  }
>  
> +static void tpm_emu_close_ctrl_ioc(void *ioc)
> +{
> +    qio_channel_close(ioc, NULL);
> +}

... as this code is identical.

> +
>  void *tpm_emu_ctrl_thread(void *data)
>  {
>      TPMTestState *s = data;
> @@ -99,6 +112,7 @@ void *tpm_emu_ctrl_thread(void *data)
>      qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
>      ioc = QIO_CHANNEL(qio_channel_socket_accept(lioc, &error_abort));
>      g_assert(ioc);
> +    qtest_add_abrt_handler(tpm_emu_close_ctrl_ioc, ioc);
>  
>      {
>          uint32_t cmd = 0;
> @@ -190,6 +204,7 @@ void *tpm_emu_ctrl_thread(void *data)
>          }
>      }
>  
> +    qtest_remove_abrt_handler(ioc);
>      object_unref(OBJECT(ioc));
>      object_unref(OBJECT(lioc));
>      return NULL;
> -- 
> 2.39.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


