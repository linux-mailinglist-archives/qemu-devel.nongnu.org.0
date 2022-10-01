Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AEA5F1EA3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 20:37:28 +0200 (CEST)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oehMd-0007Sn-4w
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 14:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oehH1-0004yJ-Lj
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 14:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oehGy-00071B-5a
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 14:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664649094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NsYykO/WF8k8jez6M2MN/LHa8YYfXuLVcpKItVPq94=;
 b=NvFx9HVR2t4+np0nhtm9IratmoIpGwjePc/Z8G/iR/+clmbYYWbVwAk8GnUjD4vg3AS8ve
 Tf13myMgikny5F7cfmBizeUhb0D/TeyDCKkVvBIBX007ZwdYvMQ++aAUX/jyF/8ljoAgSv
 tXqDHb3JB1j5+iV/MvckA8gVd1mZUoU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-seaHLdVUNzO1N2HDPEemiQ-1; Sat, 01 Oct 2022 14:31:31 -0400
X-MC-Unique: seaHLdVUNzO1N2HDPEemiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9974929AB3E7;
 Sat,  1 Oct 2022 18:31:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62B30140EBF4;
 Sat,  1 Oct 2022 18:31:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E0D321E691D; Sat,  1 Oct 2022 20:31:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 5/8] migration: Export dirty-limit time info
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <5ca0b4ae2aa787c1547d798521ab0e67867437a8.1662052189.git.huangy81@chinatelecom.cn>
Date: Sat, 01 Oct 2022 20:31:25 +0200
In-Reply-To: <5ca0b4ae2aa787c1547d798521ab0e67867437a8.1662052189.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 2 Sep 2022 01:22:33 +0800")
Message-ID: <87o7uvjszm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Export dirty limit throttle time and estimated ring full
> time, through which we can observe the process of dirty
> limit during live migration.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index bc4bc96..c263d54 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -242,6 +242,12 @@
>  #                   Present and non-empty when migration is blocked.
>  #                   (since 6.0)
>  #
> +# @dirty-limit-throttle-us-per-full: Throttle time (us) during the perio=
d of
> +#                                    dirty ring full (since 7.0)
> +#
> +# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty ring =
full.
> +#                            (since 7.0)
> +#

Can you explain what is measured here a bit more verbosely?

>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationInfo',
> @@ -259,7 +265,9 @@
>             '*postcopy-blocktime' : 'uint32',
>             '*postcopy-vcpu-blocktime': ['uint32'],
>             '*compression': 'CompressionStats',
> -           '*socket-address': ['SocketAddress'] } }
> +           '*socket-address': ['SocketAddress'],
> +           '*dirty-limit-throttle-us-per-full': 'int64',
> +           '*dirty-limit-us-ring-full': 'int64'} }
>=20=20
>  ##
>  # @query-migrate:

[...]


