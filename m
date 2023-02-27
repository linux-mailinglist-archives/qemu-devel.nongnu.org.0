Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F86A4647
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:43:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfea-0001fx-Pj; Mon, 27 Feb 2023 10:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWfeY-0001b9-94
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:43:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWfeW-00030R-R5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677512580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZmm0dkHHu1gtdR6Pn8es1YlTHROluQ3L0iSaEbgzvo=;
 b=UuNW3g91OR0jNRkfJpWmCjw9Uc224clK2O0valgFbuSksr9FtWCvPHW2O6wsvpu8wi6tzv
 ZTiZaNuoZgFrA0tByJP7gl77+Oxs7T+G6ZQ/F8Pig0TphNR2VBuzmQ3gsLLLY5I+etPWo1
 VARUYcNDbvJ4+19oRZegTHLHUmColr0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-xAohin6jM4WwRqsvuOeokA-1; Mon, 27 Feb 2023 10:42:56 -0500
X-MC-Unique: xAohin6jM4WwRqsvuOeokA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 158911C02D30;
 Mon, 27 Feb 2023 15:42:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABEC71121314;
 Mon, 27 Feb 2023 15:42:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 957C321E6A1F; Mon, 27 Feb 2023 16:42:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  Yanan Wang <wangyanan55@huawei.com>,  Eric Blake
 <eblake@redhat.com>
Subject: Re: [PATCH] qapi: Add 'acpi' field to 'query-machines' output
References: <c556e203447618f5e1020878b1781428b16ad97e.1677511289.git.pkrempa@redhat.com>
Date: Mon, 27 Feb 2023 16:42:54 +0100
In-Reply-To: <c556e203447618f5e1020878b1781428b16ad97e.1677511289.git.pkrempa@redhat.com>
 (Peter Krempa's message of "Mon, 27 Feb 2023 16:31:39 +0100")
Message-ID: <875ybnp11d.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Peter Krempa <pkrempa@redhat.com> writes:

> Report which machine types support ACPI so that management applications
> can properly use the 'acpi' property even on platforms such as ARM where
> support for ACPI depends on the machine type and thus checking presence
> of '-machine acpi=' in 'query-command-line-options' is insufficient.
>
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>

[...]

> diff --git a/qapi/machine.json b/qapi/machine.json
> index b9228a5e46..f82a00963b 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -155,6 +155,8 @@
>  #
>  # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
>  #
> +# @acpi: machine type supports acpi (since 8.0)

supports ACPI

> +#
>  # Since: 1.2
>  ##
>  { 'struct': 'MachineInfo',
> @@ -162,7 +164,7 @@
>              '*is-default': 'bool', 'cpu-max': 'int',
>              'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
>              'deprecated': 'bool', '*default-cpu-type': 'str',
> -            '*default-ram-id': 'str' } }
> +            '*default-ram-id': 'str', 'acpi': 'bool' } }
>
>  ##
>  # @query-machines:


With that
Acked-by: Markus Armbruster <armbru@redhat.com>


