Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F10750D8CA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 07:25:08 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nirDe-00016u-VO
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 01:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nirAx-0007fQ-2W
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nirAv-0006X0-D8
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650864135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hU7no6e4+DkWPard1chFGEIy5bV/yaIe6ZJtghq1Qi0=;
 b=WRKZmdp9tMOoj2NLdSq/RLo7OmNdtuFrhy92JmK7v8KOOXJsw7l+NGNSHGnaUJZwTJG0hu
 jYsEkdh9t4qx7lE0J8yRufZZm1+8j+y4UJUesK0VddCQ+xWVQWX1bgPPhgbTla0G3nGhGg
 gaehHj+W/NGib0So/tqJlmtZRiW479E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-i06ig8BuNdSPxsM_8bEtgQ-1; Mon, 25 Apr 2022 01:22:14 -0400
X-MC-Unique: i06ig8BuNdSPxsM_8bEtgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08C4F80346F;
 Mon, 25 Apr 2022 05:22:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0311C52D63;
 Mon, 25 Apr 2022 05:22:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CDAA021E6A1F; Mon, 25 Apr 2022 07:22:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v5 0/3] util/thread-pool: Expose minimun and maximum size
References: <20220422163857.703111-1-nsaenzju@redhat.com>
Date: Mon, 25 Apr 2022 07:22:09 +0200
In-Reply-To: <20220422163857.703111-1-nsaenzju@redhat.com> (Nicolas Saenz
 Julienne's message of "Fri, 22 Apr 2022 18:38:54 +0200")
Message-ID: <87ee1lrb3y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:

> As discussed on the previous RFC[1] the thread-pool's dynamic thread
> management doesn't play well with real-time and latency sensitive
> systems. This series introduces a set of controls that'll permit
> achieving more deterministic behaviours, for example by fixing the
> pool's size.
>
> We first introduce a new common interface to event loop configuration by
> moving iothread's already available properties into an abstract class
> called 'EventLooopBackend' and have both 'IOThread' and the newly
> created 'MainLoop' inherit the properties from that class.
>
> With this new configuration interface in place it's relatively simple to
> introduce new options to fix the even loop's thread pool sizes. The
> resulting QAPI looks like this:
>
>     -object main-loop,id=main-loop,thread-pool-min=1,thread-pool-max=1
>
> Note that all patches are bisect friendly and pass all the tests.
>
> [1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.656711-1-nsaenzju@redhat.com/
>
> @Stefan I kept your Signed-off-by, since the changes trivial/not
> thread-pool related

With the doc nit in PATCH 2 addressed, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


