Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AAC6A69FF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:46:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJ2B-0002KP-AK; Wed, 01 Mar 2023 04:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXJ29-0002EY-FI
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXJ27-00020S-RJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677663957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLX1Q5OzdLtk/zNLQoTAvxlMX4QsjLh0H0baXmXQUV8=;
 b=deCavUdWixR2c8RAjY70JAaFtiIsbyL8uESdzvAbMeoE281AA8orVOA+0XUR2tq0kquu8D
 AY/JtzakUwIVsvgP5KzClfLt4it5iNp+PgA0oPMPKoYGqylOyNDaoJGhIaC0S0V2uMFo57
 nHUcY4WtvVTUp7xd0UliYLbCUunoXzM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-RCqTLPyGPgiAtAeKtAl_bw-1; Wed, 01 Mar 2023 04:45:54 -0500
X-MC-Unique: RCqTLPyGPgiAtAeKtAl_bw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0C2585A588;
 Wed,  1 Mar 2023 09:45:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E00040B40DF;
 Wed,  1 Mar 2023 09:45:52 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:45:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 10/12] cryptodev: support QoS
Message-ID: <Y/8ezUQ4+yXvvKB4@redhat.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-11-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301025124.3605557-11-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Wed, Mar 01, 2023 at 10:51:22AM +0800, zhenwei pi wrote:
> Add 'throttle-bps' and 'throttle-ops' limitation to set QoS. The
> two arguments work with both QEMU command line and QMP command.
> 
> Example of QEMU command line:
> -object cryptodev-backend-builtin,id=cryptodev1,throttle-bps=1600,\
> throttle-ops=100
> 
> Example of QMP command:
> virsh qemu-monitor-command buster --hmp qom-set /objects/cryptodev1 \
> throttle-ops 100
> 
> or cancel limitation:
> virsh qemu-monitor-command buster --hmp qom-set /objects/cryptodev1 \
> throttle-ops 0
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev.c       | 138 +++++++++++++++++++++++++++++++++++++
>  include/sysemu/cryptodev.h |   7 ++
>  qapi/qom.json              |   8 ++-
>  3 files changed, 152 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


