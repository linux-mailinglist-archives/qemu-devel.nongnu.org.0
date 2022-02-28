Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2793A4C66E4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 11:09:47 +0100 (CET)
Received: from localhost ([::1]:51626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcyN-0002sS-PU
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 05:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOcwI-0001b1-MJ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOcwE-0003WK-Fb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646042849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J0yDhiYJgGnqVHXU9QAKV8P8QR1yO0iglD7G5lqLPTI=;
 b=XGIH8KoICllqw5/Z0g9xtSB8Nv3yL+8k+ba7KFt0QF6tJT2jrlZBlslmyPptfeZ2AEk7xV
 kUA0EtjfucuUP51EoPvpfYgYm0aKRovg1AoOrcWWR4fjPO1J7IhDycg2LvjXMvy5vudogL
 QYLk/YUiXVYcnzr5ivzW9XspGATqcE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-yQ4dkSFXOHiYXG6DvX4pWg-1; Mon, 28 Feb 2022 05:07:24 -0500
X-MC-Unique: yQ4dkSFXOHiYXG6DvX4pWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B731091DA0;
 Mon, 28 Feb 2022 10:07:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFE327623F;
 Mon, 28 Feb 2022 10:07:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2EF5B21E6A00; Mon, 28 Feb 2022 11:07:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Subject: Re: [PATCH v15 2/8] net/vmnet: add vmnet backends to qapi/net
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-3-Vladislav.Yaroshchuk@jetbrains.com>
Date: Mon, 28 Feb 2022 11:07:15 +0100
In-Reply-To: <20220225171402.64861-3-Vladislav.Yaroshchuk@jetbrains.com>
 (Vladislav Yaroshchuk's message of "Fri, 25 Feb 2022 20:13:56 +0300")
Message-ID: <87zgmbuwx8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, qemu-devel@nongnu.org, dirty@apple.com,
 f4bug@amsat.org, roman@roolebo.dev, r.bolshakov@yadro.com, agraf@csgraf.de,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com> writes:

> Create separate netdevs for each vmnet operating mode:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
>
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>

I acked v8 and v13 of the QAPI schema part.  You should add Acked-by and
Reviewed-by you receive in later revisions, unless you make changes that
invalidate them.  When in doubt, drop them.  However, this patch is
identical to v13.  You dropping my Acked-by made me look at it again,
wasting my time.  Please don't.

> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..b922e2e34f 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -452,6 +452,120 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
>  
> +##
> +# @NetdevVmnetHostOptions:
> +#
> +# vmnet (host mode) network backend.
> +#
> +# Allows the vmnet interface to communicate with other vmnet
> +# interfaces that are in host mode and also with the host.
> +#
> +# @start-address: The starting IPv4 address to use for the interface.
> +#                 Must be in the private IP range (RFC 1918). Must be
> +#                 specified along with @end-address and @subnet-mask.
> +#                 This address is used as the gateway address. The
> +#                 subsequent address up to and including end-address are
> +#                 placed in the DHCP pool.
> +#
> +# @end-address: The DHCP IPv4 range end address to use for the
> +#               interface. Must be in the private IP range (RFC 1918).
> +#               Must be specified along with @start-address and
> +#               @subnet-mask.
> +#
> +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> +#               be specified along with @start-address and @subnet-mask.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that vmnet interface is not able to communicate
> +#            with any other vmnet interfaces. Only communication with
> +#            host is allowed. Available since macOS Big Sur 11.0.

In review of v13, I suggested to replace "Available since macOS Big Sur
11.0" by "Requires at least macOS Big Sur 11.0" here and below, and you
agreed.  Looks like you forgot to actually change them.

With these changes, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


