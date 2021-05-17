Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A146E383179
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:40:24 +0200 (CEST)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liePv-0003aN-LJ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lieJi-0004qv-VP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lieJd-0001vw-Sh
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621262032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VAvkzY0OjZyD+6OPL3fyPKncl3mSnowN+/HLYDu533U=;
 b=jVHPkS77/F6IjvceL6uUH1NT+0HCrc1LX14w4yGlzBLa6e8cekYwMNipTd0IwN+NLxREZx
 zgz03dKKoLNRMgHX0gVDmzLs+K8iYVh6MGd9Pp1ilk6H7scR44VytuGEJF8aRKRt8xsUVC
 NGkVcX/AjeTD7Ht5yLKO1FFw1BB3EQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-6rcwxvM3OJCj3lKIMAb-5Q-1; Mon, 17 May 2021 10:33:51 -0400
X-MC-Unique: 6rcwxvM3OJCj3lKIMAb-5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B458107ACF5;
 Mon, 17 May 2021 14:33:50 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5EA35D6D7;
 Mon, 17 May 2021 14:33:48 +0000 (UTC)
Date: Mon, 17 May 2021 16:33:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v1] softmmu/vl: make default prealloc-threads work w/o
 -mem-prealloc
Message-ID: <20210517163345.61ce8b3b@redhat.com>
In-Reply-To: <20210311085918.284903-1-den-plotnikov@yandex-team.ru>
References: <20210311085918.284903-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 11:59:18 +0300
Denis Plotnikov <den-plotnikov@yandex-team.ru> wrote:

> Preallocation in memory backends can be specified with either global
> QEMU option "-mem-prealloc", or with per-backend property
> "prealloc=true".  In the latter case, however, the default for the
> number of preallocation threads is not set to the number of vcpus, but
> remains at 1 instead.
> 
> Fix it by setting the "prealloc-threads" sugar property of
> "memory-backend" to the number of vcpus unconditionally.

well, number of prealloc-threads are policy that should be set by user.
it was kept equal to vcpus for compat reasons with "-mem-prealloc",
for if one goes with supplying memory backends explicitly, one is supposed
to set prealloc-threads explicitly as well if default(==1) doesn't
suit user. It could be equal to #vcpus or be a different numbers
depending on host CPU configuration. That was intent when 
commit ffac16fab3 was introduced.

Imagine one has a VM with a lot of VCPUs but not so much of of RAM,
setting prealloc-threads to #VCPUs will be wasting CPU resources
at least.


> Fixes: ffac16fab3 ("hostmem: introduce "prealloc-threads" property")
> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  softmmu/vl.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ff488ea3e7db..e392e226a2d3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2300,14 +2300,17 @@ static void qemu_validate_options(void)
>  
>  static void qemu_process_sugar_options(void)
>  {
> -    if (mem_prealloc) {
> -        char *val;
> +    char *val;
>  
> -        val = g_strdup_printf("%d",
> -                 (uint32_t) qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> -        object_register_sugar_prop("memory-backend", "prealloc-threads", val,
> -                                   false);
> -        g_free(val);
> +    val = g_strdup_printf("%d",
> +              (uint32_t) qemu_opt_get_number(
> +                             qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> +
> +    object_register_sugar_prop("memory-backend", "prealloc-threads", val,
> +                                false);
> +    g_free(val);
> +
> +    if (mem_prealloc) {
>          object_register_sugar_prop("memory-backend", "prealloc", "on", false);
>      }
>  


