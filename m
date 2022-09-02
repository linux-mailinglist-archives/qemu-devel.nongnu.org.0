Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA35AA9DD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:23:43 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU1xm-0005RC-BJ
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1Yl-0000eE-L3
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 03:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1Yg-0003Jz-FO
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 03:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662105465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+W0eqeoD+058EuwUl2pRQWzAsCezEJj/TW5l+FE4Ec=;
 b=QDBmrwOrnqRia5Y7efVvn3fIzLBK+/f8fONhOGSaXNPidS3OgwQBLNS8qF7rWouXzhEddx
 p6MinXY2O5H48Y+ZUJnuZyr9ZkKY2B+2Hes5xFVrMO/AZ4/Wjxi3hVkutKc9OlQMJRT1Jo
 z7C25FVhgpV2oPmNamnk5X5nOKjho8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-IB8-FZBgNUujEpCk8iA-IA-1; Fri, 02 Sep 2022 03:57:43 -0400
X-MC-Unique: IB8-FZBgNUujEpCk8iA-IA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82CC785A585;
 Fri,  2 Sep 2022 07:57:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C1FDC15BB3;
 Fri,  2 Sep 2022 07:57:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB55C21E6900; Fri,  2 Sep 2022 09:57:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Wang, Lei" <lei4.wang@intel.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] qemu-config: extract same logic in *_add_opts() to
 fill_config_groups()
References: <20220902142028.1469716-1-lei4.wang@intel.com>
Date: Fri, 02 Sep 2022 09:57:41 +0200
In-Reply-To: <20220902142028.1469716-1-lei4.wang@intel.com> (Lei Wang's
 message of "Fri, 2 Sep 2022 22:20:28 +0800")
Message-ID: <87edwuxl6y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Gerd & Kevin, because they were involved with the code that gets
refactored here, and no good deed shall go unpunished.

"Wang, Lei" <lei4.wang@intel.com> writes:

> QEMU use qemu_add_opts() and qemu_add_drive_opts() to add config options
> when initialization. Extract the same logic in both functions to a
> seperate function fill_config_groups() to reduce code redundency.
>
> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> ---
>  util/qemu-config.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 433488aa56..3a1c85223a 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -282,36 +282,37 @@ QemuOptsList *qemu_find_opts_err(const char *group, Error **errp)
>      return find_list(vm_config_groups, group, errp);
>  }
>  
> -void qemu_add_drive_opts(QemuOptsList *list)
> +static int fill_config_groups(QemuOptsList *groups[], int entries,
> +                              QemuOptsList *list)
>  {
> -    int entries, i;
> +    int i;
>  
> -    entries = ARRAY_SIZE(drive_config_groups);
>      entries--; /* keep list NULL terminated */
>      for (i = 0; i < entries; i++) {
> -        if (drive_config_groups[i] == NULL) {
> -            drive_config_groups[i] = list;
> -            return;
> +        if (groups[i] == NULL) {
> +            groups[i] = list;
> +            return 0;
>          }
>      }
> -    fprintf(stderr, "ran out of space in drive_config_groups");
> -    abort();
> +    return -1;
>  }
>  
> -void qemu_add_opts(QemuOptsList *list)
> +void qemu_add_drive_opts(QemuOptsList *list)
>  {
> -    int entries, i;
> +    if (fill_config_groups(drive_config_groups, ARRAY_SIZE(drive_config_groups),
> +                           list) < 0) {
> +        fprintf(stderr, "ran out of space in drive_config_groups");
> +        abort();
> +    }
> +}
>  
> -    entries = ARRAY_SIZE(vm_config_groups);
> -    entries--; /* keep list NULL terminated */
> -    for (i = 0; i < entries; i++) {
> -        if (vm_config_groups[i] == NULL) {
> -            vm_config_groups[i] = list;
> -            return;
> -        }
> +void qemu_add_opts(QemuOptsList *list)
> +{
> +    if (fill_config_groups(vm_config_groups, ARRAY_SIZE(vm_config_groups),
> +                           list) < 0) {
> +        fprintf(stderr, "ran out of space in vm_config_groups");
> +        abort();
>      }
> -    fprintf(stderr, "ran out of space in vm_config_groups");
> -    abort();
>  }
>  
>  /* Returns number of config groups on success, -errno on error */


