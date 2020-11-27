Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7880E2C623C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:49:51 +0100 (CET)
Received: from localhost ([::1]:55724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiaNy-0005t7-Ge
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiaMf-0005I0-Ri
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:48:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiaMd-0004Ij-SK
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606470507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dn+wNXK127dOmnXsgMZHwhUmM+AR+iVfOUfWY/O+nkE=;
 b=DhbD/DpGtf7Dba+mexGQWG10m15VCoqB2lx/0f/xCpjTMRAl31WG1ZBWv3u6/Dm7Q/Ox1e
 ZShAUw2NZjtZj7u1vacldwaUZKjxxuVdrEy2RIZi8hGFElb5jgkxbsGK6RxXcd7Mrs2Im+
 dekPicaZOQlgRymn/mBxfGxzUglUa40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-IFhDPNHbP6CXXru8F-7jng-1; Fri, 27 Nov 2020 04:48:25 -0500
X-MC-Unique: IFhDPNHbP6CXXru8F-7jng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA02F8030B6;
 Fri, 27 Nov 2020 09:48:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B78F75D9D0;
 Fri, 27 Nov 2020 09:48:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D6E3113864E; Fri, 27 Nov 2020 10:48:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zeyu Jin <jinzeyu@huawei.com>
Subject: Re: [PATCH 1/6] migration: Add multi-thread compress method
References: <20201127074116.2061-1-jinzeyu@huawei.com>
Date: Fri, 27 Nov 2020 10:48:22 +0100
In-Reply-To: <20201127074116.2061-1-jinzeyu@huawei.com> (Zeyu Jin's message of
 "Fri, 27 Nov 2020 15:41:16 +0800")
Message-ID: <87zh33ruzd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Kevin, Max, suggest to skip right to Qcow2CompressionType.

Zeyu Jin <jinzeyu@huawei.com> writes:

> A multi-thread compress method parameter is added to hold the method we
> are going to use. By default the 'zlib' method is used to maintain the
> compatibility as before.
>
> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
[...]
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 3c75820527..2ed6a55b92 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -525,6 +525,19 @@
>    'data': [ 'none', 'zlib',
>              { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>  
> +##
> +# @CompressMethod:
> +#
> +# An enumeration of multi-thread compression methods.
> +#
> +# @zlib: use zlib compression method.
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'enum': 'CompressMethod',
> +  'data': [ 'zlib' ] }
> +
>  ##
>  # @BitmapMigrationBitmapAlias:
>  #
> @@ -599,6 +612,9 @@
>  #                      compression, so set the decompress-threads to the number about 1/4
>  #                      of compress-threads is adequate.
>  #
> +# @compress-method: Set compression method to use in multi-thread compression.
> +#                   Defaults to zlib. (Since 6.0)

We already have @multifd-compression.  Why do we need to control the two
separately?  Can you give a use case for different settings?

If we do want two parameters: the names @compress-method and
@multifd-compression are inconsistent.  According to your comment,
@compress-method applies only to multi-thread compression.  That leads
me to suggest renaming it to @multi-thread-compression.

After PATCH 4, CompressMethod is almost the same as MultiFDCompression:

   { 'enum': 'CompressMethod',
     'data': [ 'zlib' ] }
     'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }

   { 'enum': 'MultiFDCompression',
     'data': [ 'none', 'zlib',
               { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }

The difference is member 'none'.  Why does compression 'none' make sense
for multi-fd, but not for multi-thread?

If the difference is wanted: the names are inconsistent.  Less of an
issue than member names, because type names are not externally visible.
Let's make them consistent anyway.

Hmm, there's also Qcow2CompressionType.  That's another conversation;
I'll start a new thread for it.

[...]


