Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AD5248A9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:14:12 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np4tf-0007ou-Nd
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np4M0-0005xj-I7
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np4Ly-0007JA-PF
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652344762;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAQefQojXytnBR9Yc7Er8eTELdjgwE3cUrTGB23XJdY=;
 b=ZMQdrZ0xvxNYmaba8+GuWWPdUGVk/GBKxelMUkklWQKagtESjsAhjV7YhnmZUHu1MMVyte
 ouc8RbjHvdqprdvPeu8KhSnbJbEgdzWaCCzhT1oPK09u9Vp2ZKt7BQTb5rk2QqTOTZSOkH
 8Y0FLuUVRqYnRRtRPl+sTU1Dx9eeDWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-HM9cD06gO_GDjhdqJZM_-g-1; Thu, 12 May 2022 04:39:20 -0400
X-MC-Unique: HM9cD06gO_GDjhdqJZM_-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A67B3C14CCB
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:39:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7961641617C;
 Thu, 12 May 2022 08:39:19 +0000 (UTC)
Date: Thu, 12 May 2022 09:39:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] net: stream: Don't ignore EINVAL on netdev
 socket connection
Message-ID: <YnzHswjOM1YLryDD@redhat.com>
References: <20220512080932.735962-1-lvivier@redhat.com>
 <20220512080932.735962-5-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220512080932.735962-5-lvivier@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 10:09:28AM +0200, Laurent Vivier wrote:
> From: Stefano Brivio <sbrivio@redhat.com>
> 
> Other errors are treated as failure by net_stream_client_init(),
> but if connect() returns EINVAL, we'll fail silently. Remove the
> related exception.
> 
> Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
> [lvivier: applied to net/stream.c]
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  net/stream.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


