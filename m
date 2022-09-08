Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AAB5B1BD3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:48:06 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWG0r-0000mn-FV
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWFug-0003NR-By
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:41:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWFud-000774-VP
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662637298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l/grBcTr5W3I7gOWsmfkTQeIo7Y3cwMlfO1zu/Vvlvo=;
 b=fzGcSXY53g4aG4JzsKfgTLkD/mhgbxYQIMS1jYm7xN5opaVTG/i9ceLvcVVvFAmHwHsHsY
 nvcidVA8Qkf3mauKtKJ20Q8A0ptKGcCmt8aMDocSziWi4Wm/UQ2wRiBEFbdT2K6lPRv/wF
 RfC9ZaA17zduzll5v4w07lcelcR2DxM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-zpdN10SXNzKMYJ05jNNiwA-1; Thu, 08 Sep 2022 07:41:35 -0400
X-MC-Unique: zpdN10SXNzKMYJ05jNNiwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7028B1C01B30;
 Thu,  8 Sep 2022 11:41:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0BFC15BB3;
 Thu,  8 Sep 2022 11:41:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AAE7121E6900; Thu,  8 Sep 2022 13:41:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: liuhaiwei <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org,  pbonzini@redhat.com,  eduardo@habkost.net,
 eblake@redhat.com,  armbru@redhat.com,  liuhaiwei <liuhaiwei@inspur.com>
Subject: Re: [PATCH] Use QMP command object-add instead of object_add for
 memory hotplugin
References: <20220908095247.2582144-1-liuhaiwei9699@126.com>
Date: Thu, 08 Sep 2022 13:41:33 +0200
In-Reply-To: <20220908095247.2582144-1-liuhaiwei9699@126.com> (liuhaiwei's
 message of "Thu, 8 Sep 2022 05:52:47 -0400")
Message-ID: <877d2edrf6.fsf@pond.sub.org>
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

liuhaiwei <liuhaiwei9699@126.com> writes:

> From: liuhaiwei <liuhaiwei@inspur.com>
>
> Signed-off-by: liuhaiwei <liuhaiwei@inspur.com>
> ---
>  docs/memory-hotplug.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/docs/memory-hotplug.txt b/docs/memory-hotplug.txt
> index 6aa5e17e26..85ed4d8f3d 100644
> --- a/docs/memory-hotplug.txt
> +++ b/docs/memory-hotplug.txt
> @@ -34,15 +34,15 @@ hotplugged by using any combination of the available memory slots.
>  
>  Two monitor commands are used to hotplug memory:
>  
> - - "object_add": creates a memory backend object
> + - "object-add": creates a memory backend object
>   - "device_add": creates a front-end pc-dimm device and inserts it
>                   into the first empty slot
>  
>  For example, the following commands add another 1GB to the guest
>  discussed earlier:
>  
> -  (qemu) object_add memory-backend-ram,id=mem1,size=1G
> -  (qemu) device_add pc-dimm,id=dimm1,memdev=mem1
> +  (qemu) object-add qom-type=memory-backend-ram id=mem1 size=1073741824
> +  (qemu) device_add driver=pc-dimm id=dimm1 memdev=mem1

This is HMP, where the command is spelled object_add.  Your patch is
wrong.

>  
>  Using the file backend
>  ----------------------
> @@ -55,7 +55,7 @@ For example, assuming that the host has 1GB hugepages available in
>  the /mnt/hugepages-1GB directory, a 1GB hugepage could be hotplugged
>  into the guest from the previous section with the following commands:
>  
> -  (qemu) object_add memory-backend-file,id=mem1,size=1G,mem-path=/mnt/hugepages-1GB

Likewise.

> +  (qemu) object-add qom-type=memory-backend-file id=mem1  size=1073741824 mem-path=/mnt/hugepages-1GB 
>    (qemu) device_add pc-dimm,id=dimm1,memdev=mem1
>  
>  It's also possible to start a guest with memory cold-plugged into the


