Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C015452A619
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:23:04 +0200 (CEST)
Received: from localhost ([::1]:60210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqz2N-0003RW-Br
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqyzW-0001Uy-VO
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqyzU-0008NJ-AP
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652800803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tTq+tMkq52JlZtxhGRiWJkMpEH015DDSxCf1KYUBbTY=;
 b=fwTfmH4Pa1/V94NEqSE5lFe/kfXtPiiToDulaQikKn7iGgog8LIYOeUSUTzKm8x1fKqfrx
 aVbVyFfMEZHvpzYfW1gr3RY1nI2g1XE/SYgDd2ijwYUEuhynlEVpACBLPCd3tt9Rwai+W8
 4nVQ7bh/40jGHenv5uBJngF3JGlRFbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-pkQk0IXXO_q90mVDubYRPw-1; Tue, 17 May 2022 11:20:00 -0400
X-MC-Unique: pkQk0IXXO_q90mVDubYRPw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FE35804199
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 15:20:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E55DD442670;
 Tue, 17 May 2022 15:19:59 +0000 (UTC)
Date: Tue, 17 May 2022 16:19:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, nsaenzju@redhat.com,
 =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: [PATCH v3 2/3] thread-pool: replace semaphore with condition
 variable
Message-ID: <YoO9HrmmpvBBN9Zi@stefanha-x1.localdomain>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
 <20220514065012.1149539-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nhE3slFkk/4BmZeS"
Content-Disposition: inline
In-Reply-To: <20220514065012.1149539-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nhE3slFkk/4BmZeS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 14, 2022 at 08:50:11AM +0200, Paolo Bonzini wrote:
> @@ -134,6 +122,12 @@ static void *worker_thread(void *opaque)
>      pool->cur_threads--;
>      qemu_cond_signal(&pool->worker_stopped);
>      qemu_mutex_unlock(&pool->lock);
> +
> +    /*
> +     * Wake up another thread, in case we got a wakeup but decided
> +     * to exit due to pool->cur_threads > pool->max_threads.
> +     */
> +    qemu_cond_signal(&pool->worker_stopped);

&pool->worker_stopped? Was this supposed to be &pool->request_cond?

--nhE3slFkk/4BmZeS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKDvR4ACgkQnKSrs4Gr
c8gqNAf/dvdpJx+p+vz3Ce8RoDhyrOU+6iXUR8Rbb0AlINhRJrjN3C/NQqrii8//
i+9TJj4MfqG5Br9D/w8jUwujXxDARktOtG01xVQ2fIpt0eXICeFj+Dax6Wvt4Mqb
FBWJx8WMisY3QiwWrbxCmYhNwqdhIAf1TuHz7MLVsT367jzi10hVeFHEAhVwKNuX
rotvBKO4lXbb5suFSKkARQjkP3Cf8Rfzk8+sGMbRtGxXvabLnnW0e7UejuDAQr3a
NinlYjQoCIU/f2KBQkd1HsYiBHkeW3GPP0oUjJxlOFza+nVEh4GlG3eJ+2c2pA+Y
QWvVCQmagJ32mPWQbbL/FeOnZ4hYag==
=nr+S
-----END PGP SIGNATURE-----

--nhE3slFkk/4BmZeS--


