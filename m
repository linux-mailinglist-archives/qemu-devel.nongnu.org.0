Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48233E12C3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:39:58 +0200 (CEST)
Received: from localhost ([::1]:47678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBan7-0007XL-SS
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBalg-0006Qr-7f
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBald-0005r3-6Z
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628159904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lYMvEuIkaLEoniqksNot3tF/Yw6ORz/4PnEOyrVS6A=;
 b=LUgHfT3I/+gMIcJDR7TxLzUdFkqgeqMcctsPTcLmBUGW7r4cBTTK/VR7RUNVXlEf83vc2C
 twyOcoMvzVbHr8+vGbjp88LBGMLtmq7iLO1HSPob1Qw113m8lJsey+JqokrctPfL8bmQx8
 aKQNdqDgf+U3dvhtEdJBXqI84gHFbIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-TsvBLS7dNlmRf_XCga7IHQ-1; Thu, 05 Aug 2021 06:38:23 -0400
X-MC-Unique: TsvBLS7dNlmRf_XCga7IHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85653180FCBB
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 10:38:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 897785D9DD;
 Thu,  5 Aug 2021 10:38:17 +0000 (UTC)
Date: Thu, 5 Aug 2021 11:38:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 06/11] chardev: fix fd_chr_add_watch() when in != out
Message-ID: <YQu/lovrnKUTPgiE@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
 <20210804154848.557328-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210804154848.557328-7-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 07:48:43PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Create child sources for the different streams, and dispatch on the
> parent source with the synthesized conditions.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char-fd.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


