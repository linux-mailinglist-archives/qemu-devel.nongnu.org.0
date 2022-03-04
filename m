Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8A4CCE42
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 08:02:22 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ1xF-00089o-26
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 02:02:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nQ1Xk-0007Ix-WB
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 01:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nQ1Xh-0004Gr-Su
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 01:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646375756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOBhEl8WthJ1K+xOEWPQA3QLzaHsRL4yF53fdJuQ43E=;
 b=D/atWO4V7tmm0PHPCdsmis0dgoCYwo+onvmFM2yyycIbuCR54fy0SIxqeZnAD/HC9dGQF6
 O7Crtdku9B4BdEKQJxfvHSZy5pBQhe1863w830N0uKYUF5kLI9/wBx1yijJ3tdDQV7H5T6
 nw8a9vROBMJEdncCptMvPmx/NG7Waq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-b4WcnWsgMQCjHgiArmPQHA-1; Fri, 04 Mar 2022 01:35:54 -0500
X-MC-Unique: b4WcnWsgMQCjHgiArmPQHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 223561006AA5;
 Fri,  4 Mar 2022 06:35:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47299107867F;
 Fri,  4 Mar 2022 06:35:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E18AA21E6A00; Fri,  4 Mar 2022 07:35:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v4 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
References: <20220303185147.3605350-1-eperezma@redhat.com>
 <20220303185147.3605350-15-eperezma@redhat.com>
Date: Fri, 04 Mar 2022 07:35:05 +0100
In-Reply-To: <20220303185147.3605350-15-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?= message of "Thu, 3 Mar 2022 19:51:47 +0100")
Message-ID: <8735jy8bty.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 yebiaoxiang@huawei.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> writes:

> Finally offering the possibility to enable SVQ from the command line.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  qapi/net.json    |  8 +++++++-
>  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 47 insertions(+), 9 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..06a74d4224 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -445,12 +445,18 @@
>  # @queues: number of queues to be created for multiqueue vhost-vdpa
>  #          (default: 1)
>  #
> +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.0)
> +#
> +# Features:
> +# @unstable: Member @x-svq could change in future revisions.

Elsewhere we document "Member @foo is experimental."  Does your
different phrasing indicate a difference in intent?

> +#
>  # Since: 5.1
>  ##
>  { 'struct': 'NetdevVhostVDPAOptions',
>    'data': {
>      '*vhostdev':     'str',
> -    '*queues':       'int' } }
> +    '*queues':       'int',
> +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
> =20
>  ##
>  # @NetClientDriver:

Do you hope to make @x-svq stable eventually?  If yes: you'll want to
rename it to @svq then, which could be a bother.  Can be avoided by
naming it @svq now.  Up to you.

[...]


