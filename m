Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71668A6B4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 00:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO53G-0003zf-DT; Fri, 03 Feb 2023 18:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO53D-0003yr-U6
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 18:00:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO53C-0006JE-7p
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 18:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675465257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vierdp5mmOXWkBv/H5tO4qyfCyLpm656VrHeIC6vJaA=;
 b=RWTMtv2E7sCCZhqVcrFRuOw2m36Faj0rCG6wsyTm8rsZuq5n1QDLRQ8XEgwmMmEhPv6UnD
 oZYQfcY7TdhpsiDK6s9LPmj2qNNmLOe2Fl1gY8J/YVPW50mUwGDMPH3Z+ArhNJd8DuD1Y0
 TNxFdL2xl7CbG/doWN6CIgfmAbTa03w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-RK_OywZLOfS3UzIe3F8pgg-1; Fri, 03 Feb 2023 18:00:54 -0500
X-MC-Unique: RK_OywZLOfS3UzIe3F8pgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D9C33806647;
 Fri,  3 Feb 2023 23:00:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 268E4140EBF4;
 Fri,  3 Feb 2023 23:00:53 +0000 (UTC)
Date: Fri, 3 Feb 2023 17:00:51 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru
Subject: Re: [PATCH 5/5] docs: add throttle filter description
Message-ID: <20230203230051.hcyftzh7fmbhnz5p@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
 <20230201211234.301918-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201211234.301918-6-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 04:12:34PM -0500, Stefan Hajnoczi wrote:
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/system/qemu-block-drivers.rst.inc | 110 +++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index af72817763..ea4be5c210 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -1004,3 +1004,113 @@ some additional tasks, hooking io requests.
>    .. option:: prealloc-size
>  
>      How much to preallocate (in bytes), default 128M.
> +
> +.. program:: filter-drivers
> +.. option:: throttle
> +
> +  The throttle filter driver rate limits I/O requests so that the given IOPS
> +  and bandwidth values are not exceeded. Limits are specified using the
> +  following syntax::
> +
> +     --object '{"driver":"throttle-group","id":"tg0","limits":{"iops-total":2048,"bps-total":10485760}}'

Is it worth adding spaces after the commas, since JSON permits that,
to make the line a bit less cluttered?


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


