Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0044E68ECCC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 11:27:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPhen-0006Oa-O7; Wed, 08 Feb 2023 05:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPheg-0006NX-D9
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:26:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPhee-0005lJ-KJ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675851978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZxUOFGo/oarxfcGG9oY6hXvruRUG0pgjB7RxEKPGdc=;
 b=AH8hao8nnO9K3DA0kgVdT95CepuZFx06PIeumx4AKk+z/i4kF4cdJ+bIKuVj6p0fTvL7ZD
 Sgq1vPu+B63Qju0faL8gt7Um+VyfMmPsoPIkQxDZM+R77tM8qCKKBlUNSDf5JxoddIyBbn
 ObVPA7ljAgr+eMX5edH5KKMcChKl7V0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-G7KRo0L-MViExItRDzgpwA-1; Wed, 08 Feb 2023 05:26:15 -0500
X-MC-Unique: G7KRo0L-MViExItRDzgpwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5AD3101B42B;
 Wed,  8 Feb 2023 10:26:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F711121314;
 Wed,  8 Feb 2023 10:26:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5E89E21E6A1F; Wed,  8 Feb 2023 11:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 peter.maydell@linaro.org,  philmd@linaro.org,  thuth@redhat.com,
 mst@redhat.com,  maobibo@loongson.cn,  yangxiaojuan@loongson.cn
Subject: Re: [PATCH v1 2/2] loongarch: Add smbios command line option.
References: <20230208094133.2945979-1-gaosong@loongson.cn>
 <20230208094133.2945979-2-gaosong@loongson.cn>
Date: Wed, 08 Feb 2023 11:26:13 +0100
In-Reply-To: <20230208094133.2945979-2-gaosong@loongson.cn> (Song Gao's
 message of "Wed, 8 Feb 2023 17:41:33 +0800")
Message-ID: <87fsbglagq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Song Gao <gaosong@loongson.cn> writes:

> LoongArch has enabled CONFIG_SMBIOS, but didn't enable CLI '-smbios'.
>

Suggest

  Fixes: 3efa6fa1e629 ("hw/loongarch: Add smbios support")

> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 88e93c6103..2aa6709466 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2592,7 +2592,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 17 fields\n"
>      "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
>      "                specify SMBIOS type 41 fields\n",
> -    QEMU_ARCH_I386 | QEMU_ARCH_ARM)
> +    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
>  SRST
>  ``-smbios file=binary``
>      Load SMBIOS entry from binary file.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


