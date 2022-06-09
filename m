Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB38544B4F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:08:46 +0200 (CEST)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGxt-0007qK-4W
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzEdA-0008Qg-Rm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzEd7-0002Oz-4E
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654767543;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/bzNCv9AGSUVQ674f5Bah1VcuWZnvg+Jo6Qpr38Yqg=;
 b=IksQTo0o3TDaVnH++osrcy94YpiHhmbCG2CI+Lx4zlk9FyGM3xm7Np7iUq2kgfFkyhrtzk
 O8JYp1Rm/+Nu6Zq69+ffnjMoy+ivjV6cQ62KEsM1wROde9dxuSXBsUKGWv0+4rKiKfWNrv
 HolpzJGCavPVLWCoFH9Df24XxinX7Z4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-EcKzbPLpO4aSOdkqLqdpVQ-1; Thu, 09 Jun 2022 05:39:00 -0400
X-MC-Unique: EcKzbPLpO4aSOdkqLqdpVQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4FDE85A585;
 Thu,  9 Jun 2022 09:38:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1140492C3B;
 Thu,  9 Jun 2022 09:38:56 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:38:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <YqG/rdSVuEBExaFQ@redhat.com>
References: <20220531202327.14636-1-dongwon.kim@intel.com>
 <20220531202327.14636-3-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531202327.14636-3-dongwon.kim@intel.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 31, 2022 at 01:23:27PM -0700, Dongwon Kim wrote:
> New integer array parameter, 'monitor' is for specifying the target
> displays where individual QEMU windows are placed upon launching.
> 
> The array contains a series of numbers representing the monitor where
> QEMU windows are placed.
> 
> Numbers in the array are mapped to QEMU windows like,
> 
> [1st detached window, 2nd detached window,.... Main window]
> 
> Usage example: -display gtk,monitor.0=0,monitor.1=1.....
> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  qapi/ui.json    |  7 ++++++-
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 32 +++++++++++++++++++++++++++++++-
>  3 files changed, 38 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


