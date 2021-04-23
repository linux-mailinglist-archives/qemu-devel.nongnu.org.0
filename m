Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDA3690AE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:57:11 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtUk-0000mV-02
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtTf-0000Jj-35
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtTb-0001V1-Qz
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619175358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMnh9B1TXb0nSrxjA6KsoHaHMo8nUuttoo5WneqWo8o=;
 b=gE5TwHMxjcRtZzGiIeeXhmWRfYegP22hBEKUd/X4ZMiTV8X9gWlOjx4jCx6hUxF06vw5pZ
 RGLyUl27wmvnIdg+TK2QgVL/LaJqKQFgfHnBwpun3k9BHmLyd7ILzm7bm3FYukZ3OJZGPf
 gNaJEKtxt7KzulHvT0fiQipf1Uj1hg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-cHJaXOWXON6nOf40NpqfxA-1; Fri, 23 Apr 2021 06:55:56 -0400
X-MC-Unique: cHJaXOWXON6nOf40NpqfxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E5E18189CB;
 Fri, 23 Apr 2021 10:55:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0CFE29692;
 Fri, 23 Apr 2021 10:55:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CBA9113525D; Fri, 23 Apr 2021 12:55:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 11/15] qmp: Clarify memory backend properties
 returned via query-memdev
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-12-david@redhat.com>
Date: Fri, 23 Apr 2021 12:55:40 +0200
In-Reply-To: <20210421122624.12292-12-david@redhat.com> (David Hildenbrand's
 message of "Wed, 21 Apr 2021 14:26:20 +0200")
Message-ID: <87mttpi82b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> We return information on the currently configured memory backends and
> don't configure them, so decribe what the currently set properties
> express.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  qapi/machine.json | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6e90d463fc..758b901185 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -790,11 +790,11 @@
>  #
>  # @size: memory backend size
>  #
> -# @merge: enables or disables memory merge support
> +# @merge: whether memory merge support is enabled
>  #
> -# @dump: includes memory backend's memory in a core dump or not
> +# @dump: whether memory backend's memory is included in a core dump
>  #
> -# @prealloc: enables or disables memory preallocation
> +# @prealloc: whether memory was preallocated
>  #
>  # @host-nodes: host nodes for its memory policy
>  #

Reviewed-by: Markus Armbruster <armbru@redhat.com>


