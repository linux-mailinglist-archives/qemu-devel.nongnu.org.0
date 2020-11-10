Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37652AD764
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:21:32 +0100 (CET)
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTaV-0007k1-UE
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcTYe-0006lq-LL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcTYb-0006bP-8e
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605014371;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lbxmQ72vzxK6+JNK0tC8uxUl7s/vSTjNxtsvR/FT70=;
 b=fUsQmPkjzV1PBkgKN8obCIHFM91t8tPyrtlGmjKAfvn5/0ISQ2pSqBSRVAo/5C1ywYSqnY
 qk+Z/Q5i/lYFpa1r03nBkP0Nv9zpvekYt/LwwJp/dOOrAal/H2QinqnxPpvQpbWbIWRXVa
 wJ5wi82TowS03rrJYAWTTg2SPViBf/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-FRlvOXjHOo-ik2uxNC3SyQ-1; Tue, 10 Nov 2020 08:19:20 -0500
X-MC-Unique: FRlvOXjHOo-ik2uxNC3SyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDD5A1087D67;
 Tue, 10 Nov 2020 13:19:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B054A196FE;
 Tue, 10 Nov 2020 13:19:15 +0000 (UTC)
Date: Tue, 10 Nov 2020 13:19:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH] migration/multifd: fix hangup with TLS-Multifd due to
 blocking handshake
Message-ID: <20201110131912.GF869656@redhat.com>
References: <1604643893-8223-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1604643893-8223-1-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 06, 2020 at 02:24:53PM +0800, Chuan Zheng wrote:
> The qemu main loop could hang up forever when we enable TLS+Multifd.
> The Src multifd_send_0 invokes tls handshake, it sends hello to sever
> and wait response.
> However, the Dst main qemu loop has been waiting recvmsg() for multifd_recv_1.
> Both of Src and Dst main qemu loop are blocking and waiting for reponse which
> results in hanging up forever.
> 
> Src: (multifd_send_0)                                              Dst: (multifd_recv_1)
> multifd_channel_connect                                            migration_channel_process_incoming
>   multifd_tls_channel_connect                                        migration_tls_channel_process_incoming
>     multifd_tls_channel_connect                                        qio_channel_tls_handshake_task
>        qio_channel_tls_handshake                                         gnutls_handshake
>           qio_channel_tls_handshake_task                                       ...
>             qcrypto_tls_session_handshake                                      ...
>               gnutls_handshake                                                 ...
>                    ...                                                         ...
>                 recvmsg (Blocking I/O waiting for response)                recvmsg (Blocking I/O waiting for response)
> 
> Fix this by offloadinig handshake work to a background thread.
> 
> Reported-by: Yan Jin <jinyan12@huawei.com>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


