Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EB8361057
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:43:10 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX55B-0000MR-Nx
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lX4tk-0002Er-ON
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:31:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lX4th-0005JH-OP
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G8ohVbjQ6a34HzWOEKarwWvEUqE+U5orGyHssEQKf8=;
 b=VxLRqhon4XjX1K2Qgf+EhVolBVm3uqnBbeFQ0bl9q2hbum0wTJDVBAFiXlDUhbWHQfWjsX
 q4X2oJS3tkauwEn1kerj5AeRySGRiCZbmSdYxi4ZXYJkIvUvrtzsU9V8fdRKEMShHfHRoP
 5NRGv1bgmjXB9i6tYWJvQqbQcGBgQa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-G5sm6VBSNVWvIgD5op4F4g-1; Thu, 15 Apr 2021 12:31:13 -0400
X-MC-Unique: G5sm6VBSNVWvIgD5op4F4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8B97107ACE4;
 Thu, 15 Apr 2021 16:31:11 +0000 (UTC)
Received: from work-vm (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB27210016DB;
 Thu, 15 Apr 2021 16:31:06 +0000 (UTC)
Date: Thu, 15 Apr 2021 17:31:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/5] softmmu: add trace point when bdrv_flush_all fails
Message-ID: <YHhqSCUErOGPYWtx@work-vm>
References: <20210415135851.862406-1-berrange@redhat.com>
 <20210415135851.862406-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415135851.862406-3-berrange@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The VM stop process has to flush outstanding I/O and this is a critical
> failure scenario that is hard to diagnose. Add a probe point that
> records the flush return code.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  softmmu/cpus.c       | 7 ++++++-
>  softmmu/trace-events | 3 +++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index a7ee431187..c3caaeb26e 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -44,6 +44,7 @@
>  #include "sysemu/whpx.h"
>  #include "hw/boards.h"
>  #include "hw/hw.h"
> +#include "trace.h"
>  
>  #ifdef CONFIG_LINUX
>  
> @@ -266,6 +267,7 @@ static int do_vm_stop(RunState state, bool send_stop)
>  
>      bdrv_drain_all();
>      ret = bdrv_flush_all();
> +    trace_vm_stop_flush_all(ret);
>  
>      return ret;
>  }
> @@ -704,12 +706,15 @@ int vm_stop_force_state(RunState state)
>      if (runstate_is_running()) {
>          return vm_stop(state);
>      } else {
> +        int ret;
>          runstate_set(state);
>  
>          bdrv_drain_all();
>          /* Make sure to return an error if the flush in a previous vm_stop()
>           * failed. */
> -        return bdrv_flush_all();
> +        ret = bdrv_flush_all();
> +        trace_vm_stop_flush_all(ret);
> +        return ret;
>      }
>  }
>  
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index b80ca042e1..f11b427544 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -19,6 +19,9 @@ flatview_new(void *view, void *root) "%p (root %p)"
>  flatview_destroy(void *view, void *root) "%p (root %p)"
>  flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
>  
> +# softmmu.c
> +vm_stop_flush_all(int ret) "ret %d"
> +
>  # vl.c
>  vm_state_notify(int running, int reason, const char *reason_str) "running %d reason %d (%s)"
>  load_file(const char *name, const char *path) "name %s location %s"
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


