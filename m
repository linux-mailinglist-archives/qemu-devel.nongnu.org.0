Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346342C5B38
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:57:21 +0100 (CET)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLWB-0005Ws-FV
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiLUD-0004Z8-6h
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:55:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiLUA-0000wy-Dq
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606413313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuep4z6YAArVf5KsQKx6n8Hz5veLSPYOyrlOiAJuR/c=;
 b=h4LvZPTL/tR4ORQraEA1ZPU5n7DHihRRbKoOJxfgN5Ym72/2zhgJr7EGKu45RXkBq+TmID
 GMeemzPya2r7hGH6g3PYQW20t/SjrDzJYCSttsuf/S7iVJbhIi83sfo1vfGjGklwA5qHFJ
 DweMCjyk9v83Gl3ZEL/GMFrxDf+HFII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-XijzKbllNUiX9ip-JfK7EQ-1; Thu, 26 Nov 2020 12:55:11 -0500
X-MC-Unique: XijzKbllNUiX9ip-JfK7EQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 946CE1007476
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 17:55:10 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ADAF100238C;
 Thu, 26 Nov 2020 17:55:09 +0000 (UTC)
Date: Thu, 26 Nov 2020 18:55:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 22/36] vl: move -global check earlier
Message-ID: <20201126185508.00815fa0@redhat.com>
In-Reply-To: <20201123141435.2726558-23-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-23-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 09:14:21 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> The check has the same effect here, it only matters that it is performed
> once all devices, both builtin and user-specified, have been created.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 073d7412ad..ccc3b8e838 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3483,6 +3483,8 @@ static void qemu_machine_creation_done(void)
>          net_check_clients();
>      }
>  
> +    qdev_prop_check_globals();
> +
>      if (boot_once) {
>          qemu_boot_set(boot_once, &error_fatal);
>          qemu_register_reset(restore_boot_order, g_strdup(boot_order));
> @@ -4540,7 +4542,6 @@ void qemu_init(int argc, char **argv, char **envp)
>          replay_vmstate_init();
>      }
>  
> -    qdev_prop_check_globals();
>      if (vmstate_dump_file) {
>          /* dump and exit */
>          dump_vmstate_json_to_file(vmstate_dump_file);


