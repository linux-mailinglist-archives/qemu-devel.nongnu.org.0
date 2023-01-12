Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85366667272
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:42:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwuQ-0003b7-3m; Thu, 12 Jan 2023 07:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwu3-0003Im-2j
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:42:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwu1-0003h6-JA
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673527312;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTjy2BtlPz6Bv3rtXRZXTRKqAYwkmM9UkxXWRoeFxU0=;
 b=MCdcXzI3rA+MHQkZChlYcsz7Et9I56TrU+AME+TucJIXkslXx0/YuoOfiY4JVczhDcseW0
 T69hM+FXBf3KA6ULIV7sXMpsjOHiCKRJ2XZI/GovtYgAOLJokXHt3se5s1rn/3TQDgc69s
 O/XgeROkp+VCUVQOEVXtF6Q8XEhjuKQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-3DS5IoG2OoScBVRMM_pAig-1; Thu, 12 Jan 2023 07:41:49 -0500
X-MC-Unique: 3DS5IoG2OoScBVRMM_pAig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28BA5857A99;
 Thu, 12 Jan 2023 12:41:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DD711759E;
 Thu, 12 Jan 2023 12:41:48 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:41:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: Re: [PATCH v4 2/3] block/rbd: Add luks-any encryption opening option
Message-ID: <Y8AACrpM+2ftPweI@redhat.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-3-oro@il.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221120102836.3174090-3-oro@il.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Nov 20, 2022 at 04:28:35AM -0600, Or Ozeri wrote:
> Ceph RBD encryption API required specifying the encryption format
> for loading encryption. The supported formats were LUKS (v1) and LUKS2.
> 
> Starting from Reef release, RBD also supports loading with "luks-any" format,
> which works for both versions of LUKS.
> 
> This commit extends the qemu rbd driver API to enable qemu users to use
> this luks-any wildcard format.
> 
> Signed-off-by: Or Ozeri <oro@il.ibm.com>
> ---
>  block/rbd.c          | 19 +++++++++++++++++++
>  qapi/block-core.json | 20 ++++++++++++++++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


