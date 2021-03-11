Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A200E3370F4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:15:51 +0100 (CET)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJIE-0004yT-Lr
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJFy-0003dv-3V
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJFu-0005Zn-DP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615461205;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKTdLxpsn/YfXdD5NAeNQhABBPg+f0JkCRt6p0YuzjA=;
 b=Wr9HO+1D8lohac8UkSTBeQ+gX3+2sAeq5nj30A92ykGXOBPbYRRgVVYRpr6OcjKJWd66YP
 8THE6nBD8jtHGpF902MdQB81ounxIVsxgzxQZUaEUTpF+g0ACM+CnafuT9UF0zrirWME1p
 7CHfqHgfkucXQSrGY/vpkP/53fjxeBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-K7mrlb_4Nk23xLxjp9MXgw-1; Thu, 11 Mar 2021 06:13:23 -0500
X-MC-Unique: K7mrlb_4Nk23xLxjp9MXgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4314010866A0;
 Thu, 11 Mar 2021 11:13:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C031F62463;
 Thu, 11 Mar 2021 11:13:16 +0000 (UTC)
Date: Thu, 11 Mar 2021 11:13:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v5 2/3] vnc: support reload x509 certificates for vnc
Message-ID: <YEn7SbdMbKBJMgMy@redhat.com>
References: <20210311105424.1370-1-changzihao1@huawei.com>
 <20210311105424.1370-3-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210311105424.1370-3-changzihao1@huawei.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com, yebiaoxiang@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 06:54:23PM +0800, Zihao Chang wrote:
> This patch add vnc_display_reload_certs() to support
> update x509 certificates.
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  include/ui/console.h |  1 +
>  ui/vnc.c             | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


