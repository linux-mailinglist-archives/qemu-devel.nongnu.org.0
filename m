Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE174D1375
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:33:03 +0100 (CET)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWDG-000818-Dj
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nRWBP-0007Hh-Dl
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:31:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nRWBM-0001oz-Do
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646731862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VccWEP3/bGUcCMmKZmSRYQHOZKR7zGtGHtXGeVOPejY=;
 b=Ffw3rfiR3VoNr53n5xOutdYsXN2rSeb8egYqhD6nj9eWfmYxot0p//apdpiBp5i8Y1h4Cn
 SkEdz+ZfeYuBJCDYxhd1p7nqXO3Z/JpXSsJxL0uzNFKaBas4EKSPof6htjGqq21F0+8xyp
 3oo+x55oQyvqEKkHYOtiUZzHqlxCils=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-_FwMMfkPNTugU-yKWVSMrg-1; Tue, 08 Mar 2022 04:30:59 -0500
X-MC-Unique: _FwMMfkPNTugU-yKWVSMrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A183FC81;
 Tue,  8 Mar 2022 09:30:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B378105501E;
 Tue,  8 Mar 2022 09:29:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3837021E6A00; Tue,  8 Mar 2022 10:29:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v5 15/15] vdpa: Add x-svq to NetdevVhostVDPAOptions
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <20220307153334.3854134-16-eperezma@redhat.com>
Date: Tue, 08 Mar 2022 10:29:36 +0100
In-Reply-To: <20220307153334.3854134-16-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?= message of "Mon, 7 Mar 2022 16:33:34 +0100")
Message-ID: <87v8wordvj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 yebiaoxiang@huawei.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
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
> index 7fab2e7cd8..d626fa441c 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -445,12 +445,18 @@
>  # @queues: number of queues to be created for multiqueue vhost-vdpa
>  #          (default: 1)
>  #
> +# @svq: Start device with (experimental) shadow virtqueue. (Since 7.0)
> +#
> +# Features:
> +# @unstable: Member @svq is experimental.
> +#
>  # Since: 5.1
>  ##
>  { 'struct': 'NetdevVhostVDPAOptions',
>    'data': {
>      '*vhostdev':     'str',
> -    '*queues':       'int' } }
> +    '*queues':       'int',
> +    '*svq':          {'type': 'bool', 'features' : [ 'unstable'] } } }
> =20
>  ##
>  # @NetClientDriver:

QAPI schema:
Acked-by: Markus Armbruster <armbru@redhat.com>


