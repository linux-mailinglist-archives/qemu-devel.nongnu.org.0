Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1693A83CF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:19:58 +0200 (CEST)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAr7-00052a-WD
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltAp9-0002GP-1G
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltAp7-0004AH-49
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623770272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2MjsUWgzvBeI7fviQOIRVhNbL0zCB7/v8VFQ2QkY9c=;
 b=H10Jswl/nc69XhaOAOCSrToC+HHcqhXlxv8ZFTdqMmFZaHAXF+D6Ejjn984AtHIa/bfY6D
 XMmmkwLpDPsZ4HM8PdTmjharSOj1LaaVEg/Czpmqqh1CchO6sY7bDJpeqa8kJn55ruaC+G
 0brFw8PThigHfay/MYNs4MbU9ba3rr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-L4lutbgOPNKUimUFMin2PA-1; Tue, 15 Jun 2021 11:17:51 -0400
X-MC-Unique: L4lutbgOPNKUimUFMin2PA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC80100C67C
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 15:17:50 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89A0C5B4A0;
 Tue, 15 Jun 2021 15:17:46 +0000 (UTC)
Date: Tue, 15 Jun 2021 16:17:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 26/26] configure: convert compiler tests to meson, part 6
Message-ID: <YMjEl1tZMqCdP3Ja@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-27-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-27-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 01:23:01PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   | 75 -----------------------------------------------------
>  meson.build | 11 ++++++++
>  2 files changed, 11 insertions(+), 75 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


