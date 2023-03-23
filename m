Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391106C6381
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 10:27:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfHDa-0005ps-A2; Thu, 23 Mar 2023 05:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pfHDR-0005o7-G7
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pfHDP-0004ma-Tq
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679563595;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMYAB+Jm6KrvIq+0tVxH4jR0/ctW54R0GTUuoFN7GIs=;
 b=eFWtfQ1v8Oi2d3SI6R10lXNz09m42bNfw949oXPaTWIh1yKkL7dMm3dkE4e3MggjIJyZF6
 X/ZGlBZIp0CP5azAuBp2gmF6ZWhXV6jAC3CTXqUnNpQXbfMp0k+FO9cfzkMmlvYHYf3VAw
 IpRTF1Ft5V3FZ2Sc8lmVaoL/gN8IDpk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-3Oj7pX9APhWvkuNmRm5KFA-1; Thu, 23 Mar 2023 05:26:31 -0400
X-MC-Unique: 3Oj7pX9APhWvkuNmRm5KFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 147B3281297C;
 Thu, 23 Mar 2023 09:26:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C35862166B29;
 Thu, 23 Mar 2023 09:26:26 +0000 (UTC)
Date: Thu, 23 Mar 2023 09:26:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 2/3] qga: Add `merged` variant to
 GuestExecCaptureOutputMode
Message-ID: <ZBwbQCxg+aDuofY+@redhat.com>
References: <cover.1679530587.git.dxu@dxuuu.xyz>
 <9b355e4fe0574022459c0fd94ed30de3b7415011.1679530587.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b355e4fe0574022459c0fd94ed30de3b7415011.1679530587.git.dxu@dxuuu.xyz>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Wed, Mar 22, 2023 at 06:19:27PM -0600, Daniel Xu wrote:
> Currently, any captured output (via `capture-output`) is segregated into
> separate GuestExecStatus fields (`out-data` and `err-data`). This means
> that downstream consumers have no way to reassemble the captured data
> back into the original stream.
> 
> This is relevant for chatty and semi-interactive (ie. read only) CLI
> tools.  Such tools may deliberately interleave stdout and stderr for
> visual effect. If segregated, the output becomes harder to visually
> understand.
> 
> This commit adds a new enum variant to the GuestExecCaptureOutputMode
> qapi to merge the output streams such that consumers can have a pristine
> view of the original command output.
> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  qga/commands.c       | 25 +++++++++++++++++++++++--
>  qga/qapi-schema.json |  5 ++++-
>  2 files changed, 27 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


