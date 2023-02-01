Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3B6865CA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 13:14:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNC0K-0006RK-04; Wed, 01 Feb 2023 07:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNC0F-0006R8-9P
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNC0D-0002jk-AN
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675253652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XVvsadOMWhMj2Js7NAQfUTfvwSK/kOyE6K7oR4EOgm8=;
 b=F5PvQ6LYPufJhr/tTDE2sgEKeiHGkWsYofnKJVPUfGTJ9Y7axcJV/1CYGwHGVGEE861oST
 SCWyJY43Z4cbJrC6IBkUs01ehIA2miWvrdGqpVu5KjngX/1fgFFJ188kyEB4AdC9i5kfJP
 WjuCiB4yfROhGIG2UHo9xsd3d76jGnE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-e7hEy-yLOJSagC51u0YnEg-1; Wed, 01 Feb 2023 07:14:08 -0500
X-MC-Unique: e7hEy-yLOJSagC51u0YnEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52B10811E6E;
 Wed,  1 Feb 2023 12:14:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C46F112132C;
 Wed,  1 Feb 2023 12:14:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5AC621E6A1F; Wed,  1 Feb 2023 13:14:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron via <qemu-devel@nongnu.org>
Cc: Michael Tsirkin <mst@redhat.com>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>,  <linuxarm@huawei.com>,  Ira Weiny
 <ira.weiny@intel.com>,  Alison Schofield <alison.schofield@intel.com>
Subject: Re: [RFC PATCH v2 1/3] hw/cxl: QMP based poison injection support
References: <20230201100350.23263-1-Jonathan.Cameron@huawei.com>
 <20230201100350.23263-2-Jonathan.Cameron@huawei.com>
Date: Wed, 01 Feb 2023 13:14:06 +0100
In-Reply-To: <20230201100350.23263-2-Jonathan.Cameron@huawei.com> (Jonathan
 Cameron via's message of "Wed, 1 Feb 2023 10:03:48 +0000")
Message-ID: <87k011y44x.fsf@pond.sub.org>
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

Jonathan Cameron via <qemu-devel@nongnu.org> writes:

> Inject poison using qmp command cxl-inject-poison to add an entry to the
> poison list.
>
> For now, the poison is not returned CXL.mem reads, but only via the
> mailbox command Get Poison List.
>
> See CXL rev 3.0, sec 8.2.9.8.4.1 Get Poison list (Opcode 4300h)
>
> Kernel patches to use this interface here:
> https://lore.kernel.org/linux-cxl/cover.1665606782.git.alison.schofield@intel.com/
>
> To inject poison using qmp (telnet to the qmp port)
> { "execute": "qmp_capabilities" }
>
> { "execute": "cxl-inject-poison",
>     "arguments": {
>          "path": "/machine/peripheral/cxl-pmem0",
>          "start": 2048,
>          "length": 256
>     }
> }
>
> Adjusted to select a device on your machine.
>
> Note that the poison list supported is kept short enough to avoid the
> complexity of state machine that is needed to handle the MORE flag.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

[...]

> diff --git a/qapi/cxl.json b/qapi/cxl.json
> index 3c18556ee8..5b995db255 100644
> --- a/qapi/cxl.json
> +++ b/qapi/cxl.json

There is no qapi/cxl.json in current master.  So this must be based on
some other patch(es).  Please point to it in the cover letter.  I like
to point both in human-readable and machine-readable form, e.g. like
this:

    Based on my "[PATCH 00/22] qapi: Remove simple unions from the schema
    language".

    Based-on: Message-Id: <20210913123932.3306639-1-armbru@redhat.com>

> @@ -5,6 +5,17 @@
>  # = CXL devices
>  ##
>  
> +##
> +# @cxl-inject-poison:
> +#
> +# @path: CXL type 3 device canonical QOM path
> +#
> +# @start: Start address
> +# @length: Length of poison to inject

Either separate all the arguments with blank lines, or none.

> +##
> +{ 'command': 'cxl-inject-poison',
> +  'data': { 'path': 'str', 'start': 'uint64', 'length': 'uint64' }}
> +
>  ##
>  # @CxlUncorErrorType:
>  #

Both commit message and doc comment are rather terse.

The commit message should make the case for the feature: why do we want
it?  This typically involves explaining the problem(s) it solves.

The doc comment ideally explains intended use.


