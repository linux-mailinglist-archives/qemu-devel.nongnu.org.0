Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F03532A81
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:39:33 +0200 (CEST)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntToy-0000LU-9n
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntTWg-0002py-4F
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntTWc-0000Js-NF
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653394833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ErZSZUipbNchDnUbvAOHUgI5eriqwgSP5amAxqpz0qE=;
 b=detH4sPpFzkV1v/LGrAvyej+0b/fvLyvzEKtwuDdAIFUt/9j0gYROhHtRYkZkQlVLNJ8JU
 lgp1MAW6wKJIrqBLXDs5kCyqeFdyDlKDi/fD8NwG/ariHLFMkK4DGszyGnDAVnSriMhx94
 EC/1madgi9MSNkiB2hUCxeWDLjbPVGs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-F-DkUpg6MCenOQzPblFUTg-1; Tue, 24 May 2022 08:20:32 -0400
X-MC-Unique: F-DkUpg6MCenOQzPblFUTg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B91AD299E76E;
 Tue, 24 May 2022 12:20:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94765492CA3;
 Tue, 24 May 2022 12:20:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5994D21E6906; Tue, 24 May 2022 14:20:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
Date: Tue, 24 May 2022 14:20:30 +0200
In-Reply-To: <20220523150722.349700-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 23 May 2022 17:07:15 +0200")
Message-ID: <87k0abxgtt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[...]

> diff --git a/qapi/stats.json b/qapi/stats.json
> new file mode 100644
> index 0000000000..650d883297
> --- /dev/null
> +++ b/qapi/stats.json
[...]
> +##
> +# @query-stats-schemas:
> +#
> +# Return the schema for all available runtime-collected statistics.
> +#
> +# Note: runtime-collected statistics and their names fall outside QEMU's
> +# usual deprecation policies.  QEMU will try to keep the set of available

/work/armbru/qemu/scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:96:
../qapi/stats.json:201:1: unexpected de-indent (expected at least 6 spaces)

> +# data stable, together with their names, but will not guarantee stability
> +# at all costs; the same is true of providers that source statistics
> +# externally, e.g. from Linux.  For example, if the same value is being
> +# tracked with different names on different architectures or by different
> +# providers, one of them might be renamed.  A statistic might go away if
> +# an algorithm is changed or some code is removed; changing a default might
> +# cause previously useful statistics to always report 0.  Such changes,
> +# however, are expected to be rare.
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'query-stats-schemas',
> +  'data': { },
> +  'returns': [ 'StatsSchema' ] }


