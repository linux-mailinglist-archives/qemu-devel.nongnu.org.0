Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E9A2DE20E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:34:56 +0100 (CET)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqE2B-0007mx-P9
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqDxj-0003Nr-74
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:30:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqDxf-00048D-BC
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608291014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUpyYW0BnpK9I/JdCYfKO5Y1i3BTSFM6Xfv0UyUsiP4=;
 b=C9EZ8DpgYPKSwv32zHA5WTkNFdUNMeKstGyn2QY7b40rbMQl2dn8Uoneh2UgVoLw7gluYf
 4vXkXChLUwYreEJqFOEgK+r0OXJ+cz96CYuPBobIF2+u+MMz6R56IiSp/BLTWsT/7/aRmX
 QSqujDsD8fsFKOER80RFXL2z9IeNcGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-fYaWbQEzMCO1qFX4j558qw-1; Fri, 18 Dec 2020 06:30:11 -0500
X-MC-Unique: fYaWbQEzMCO1qFX4j558qw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C00AB107ACE4;
 Fri, 18 Dec 2020 11:30:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDB4910013C0;
 Fri, 18 Dec 2020 11:29:56 +0000 (UTC)
Subject: Re: [PATCH v2 02/12] libqtest: add qtest_socket_server()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-3-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7d999b7d-5420-d31a-6c1d-3b2d613d0abd@redhat.com>
Date: Fri, 18 Dec 2020 12:29:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207172030.251905-3-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2020 18.20, Stefan Hajnoczi wrote:
> Add an API that returns a new UNIX domain socket in the listen state.
> The code for this was already there but only used internally in
> init_socket().
> 
> This new API will be used by vhost-user-blk-test.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/qtest/libqos/libqtest.h |  8 +++++++
>  tests/qtest/libqtest.c        | 40 ++++++++++++++++++++---------------
>  2 files changed, 31 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index 724f65aa94..e5f1ec590c 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -132,6 +132,14 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
>  void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
>      GCC_FMT_ATTR(2, 3);

Reviewed-by: Thomas Huth <thuth@redhat.com>


