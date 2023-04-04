Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B58B6D58E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 08:50:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjaTt-0004db-Fm; Tue, 04 Apr 2023 02:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjaTn-0004d0-Qm
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjaT8-0002Xp-Lz
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680590917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v3CORH+sBL1yduy3gQjrX81ua0rFJGHlL8JvXRt3dKw=;
 b=C5JjfOLoG8aKcw8j+yJsTb45RWl2hD7lMPcJTpCEwmuYRV2v5pa1rB6gkiUyRtRUYLDxHJ
 /yj6f8KqtPIpmdBPrBDFoAgw5YrBRE8xmHxTqxtj2byc/HH5qkoJ+nZ1orz4Pg+2gKNbag
 mnlL6A3Nbhf5GLFQqwCHVko/RVM0whU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-tTVjKliRNzqnZ_pk2fdgow-1; Tue, 04 Apr 2023 02:48:33 -0400
X-MC-Unique: tTVjKliRNzqnZ_pk2fdgow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CF263C0D856;
 Tue,  4 Apr 2023 06:48:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C9142166B26;
 Tue,  4 Apr 2023 06:48:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E7F7F21E6926; Tue,  4 Apr 2023 08:48:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: <qemu-devel@nongnu.org>,  David Hildenbrand <david@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  "Philippe Mathieu-Daude" <philmd@linaro.org>,  Peter
 Xu <peterx@redhat.com>,  "Paolo Bonzini" <pbonzini@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Stefan Hajnoczi" <stefanha@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>,  "Tom Lendacky"
 <thomas.lendacky@amd.com>
Subject: Re: [PATCH v5] hostmem-file: add offset option
References: <20230403221421.60877-1-graf@amazon.com>
Date: Tue, 04 Apr 2023 08:48:31 +0200
In-Reply-To: <20230403221421.60877-1-graf@amazon.com> (Alexander Graf's
 message of "Mon, 3 Apr 2023 22:14:21 +0000")
Message-ID: <878rf82lds.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Alexander Graf <graf@amazon.com> writes:

> Add an option for hostmem-file to start the memory object at an offset
> into the target file. This is useful if multiple memory objects reside
> inside the same target file, such as a device node.
>
> In particular, it's useful to map guest memory directly into /dev/mem
> for experimentation.
>
> To make this work consistently, also fix up all places in QEMU that
> expect fd offsets to be 0.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index a877b879b9..f740f74be3 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -635,6 +635,10 @@
>  #         specify the required alignment via this option.
>  #         0 selects a default alignment (currently the page size). (default: 0)
>  #
> +# @offset: the offset into the target file that the region starts at. You can
> +#          use this option to back multiple regions with a single file. Must be
> +#          a multiple of the page size. (default: 0) (since 8.1)
> +#
>  # @discard-data: if true, the file contents can be destroyed when QEMU exits,
>  #                to avoid unnecessarily flushing data to the backing file. Note
>  #                that ``discard-data`` is only an optimization, and QEMU might
> @@ -655,6 +659,7 @@
>  { 'struct': 'MemoryBackendFileProperties',
>    'base': 'MemoryBackendProperties',
>    'data': { '*align': 'size',
> +            '*offset': 'size',
>              '*discard-data': 'bool',
>              'mem-path': 'str',
>              '*pmem': { 'type': 'bool', 'if': 'CONFIG_LIBPMEM' },

Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


