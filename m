Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5272C64F2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:57 +0100 (CET)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicbU-00030U-8U
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kicaE-000268-It
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:10:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kicaD-0005zg-0i
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606479036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7tn2eXzd+wjc9aXxkXD77VU6xJp8/GiklImWfhwcrfk=;
 b=de5InVNm6rMlOGinw17Fod8Oy7oWB3hJG3edhM0h0pGbzu5WBBLf8HYEfV1JWRIZKZo1+H
 RelxceKfb4FVDWw91x/cOxj7WssU5Vg5+QtEsjLwaQEN+0pgoiFiY7VPnrJfCIMyBpPSxW
 /BAZ3AeSdVSSwBTi4+PtlqcoLaTpW1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-pkRszCaaPn2SwlF0xo1EPA-1; Fri, 27 Nov 2020 07:10:34 -0500
X-MC-Unique: pkRszCaaPn2SwlF0xo1EPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 564A210151E9;
 Fri, 27 Nov 2020 12:10:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2721760862;
 Fri, 27 Nov 2020 12:10:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF374113864E; Fri, 27 Nov 2020 13:10:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zeyu Jin <jinzeyu@huawei.com>
Subject: Re: [RFC PATCH 4/6] migration: Add zstd support in multi-thread
 compression
References: <20201127074209.2217-1-jinzeyu@huawei.com>
Date: Fri, 27 Nov 2020 13:10:31 +0100
In-Reply-To: <20201127074209.2217-1-jinzeyu@huawei.com> (Zeyu Jin's message of
 "Fri, 27 Nov 2020 15:42:09 +0800")
Message-ID: <87lfenq9u0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ying Fang <fangying1@huawei.com>, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zeyu Jin <jinzeyu@huawei.com> writes:

> This patch enables zstd option in multi-thread compression.
>
> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
[...]
> diff --git a/qapi/migration.json b/qapi/migration.json
> index d262683a38..ac6d06c683 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -536,7 +536,7 @@
>  #
>  ##
>  { 'enum': 'CompressMethod',
> -  'data': [ 'zlib' ] }
> +  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>  
>  ##
>  # @BitmapMigrationBitmapAlias:

Please document the new enum value @zstd.


