Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB850A0EB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:35:30 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWy1-0004gJ-3t
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhWww-0003lX-Kc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhWwt-0003Ai-JV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650548058;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxQRiqcT5bk01fuoaUKOZQtko4HmjVgxP33FR3lb1hw=;
 b=JYVRJeRE5U/c+Z6TMAPavble3cmlx5k23PedrTJoBmm8NaGGRDs4rXiQHcIs/NAnIJFzHS
 N6o9E8VsjSyRfMypbO1m0ZEF5PNO1VWzyPQx9//67v2nPzIcPBuw4Nl+ro16xjEoMzp2aB
 TFYe45bB9m6PAAES++RLiChEPnnXqug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-LQHCbQfMNWqbI7LGoEHANg-1; Thu, 21 Apr 2022 09:34:17 -0400
X-MC-Unique: LQHCbQfMNWqbI7LGoEHANg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF70D18A0160
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 13:34:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 073E854C739;
 Thu, 21 Apr 2022 13:34:15 +0000 (UTC)
Date: Thu, 21 Apr 2022 14:34:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 26/41] compiler.h: add QEMU_SANITIZE_{ADDRESS,THREAD}
Message-ID: <YmFdVS3VkG8rl/G4@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-27-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-27-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:26:09PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Simplify a bit pre-compiler conditions.
> 
> For TSAN, QEMU already has CONFIG_TSAN, but it is only set when the
> fiber API is present. (I wonder whether supporting TSAN without the
> fiber API is really relevant)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


