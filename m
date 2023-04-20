Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA16E9779
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:45:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVVs-0004fW-JC; Thu, 20 Apr 2023 10:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVVp-0004eI-R5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVVo-0006Pm-8A
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682001831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+PdAZrzxcIcGI11kH+hm5yqto04FAF3cB4N4qIMrQM=;
 b=fGKRalfRsDmcFkbmUYLdyjaX7PU5lBW7zxnmTd+D2SwIBK+T17s23m5V1oPVcuB/8898Nk
 LidskKvfySGWVMG1RL4r2yRnaPs2/6ZEjmleRHXJndGEgWfESGcd8Mbg5iNLWUWe94cJyV
 y+E31fqR7mW7qdmi/lZMcgFjLdnOgjQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-0IW8RHA8MsuwbHhHFK_gEA-1; Thu, 20 Apr 2023 10:43:48 -0400
X-MC-Unique: 0IW8RHA8MsuwbHhHFK_gEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8426E85A5A3;
 Thu, 20 Apr 2023 14:43:47 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA40E40C2064;
 Thu, 20 Apr 2023 14:43:45 +0000 (UTC)
Date: Thu, 20 Apr 2023 09:43:43 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com, 
 armbru@redhat.com, jasowang@redhat.com, quintela@redhat.com, 
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, 
 marcandre.lureau@redhat.com, pbonzini@redhat.com, dave@treblig.org,
 hreitz@redhat.com, 
 kwolf@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com
Subject: Re: [PATCH v2 2/4] scripts/qapi: allow optional experimental enum
 values
Message-ID: <rt6g5voqlmz2x3ydkyi4zabffigjfnl2ivqwjqhtnusjztqtdw@ndmtjfneg4mc>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-3-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419225232.508121-3-vsementsov@yandex-team.ru>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 20, 2023 at 01:52:30AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> To be used in the next commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  scripts/qapi/types.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index c39d054d2c..18f8734047 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -61,10 +61,12 @@ def gen_enum_lookup(name: str,
>  
>          special_features = gen_special_features(memb.features)
>          if special_features != '0':
> +            feats += memb.ifcond.gen_if()
>              feats += mcgen('''
>          [%(index)s] = %(special_features)s,
>  ''',
>                             index=index, special_features=special_features)
> +            feats += memb.ifcond.gen_endif()

Perhaps Markus will have a comment here; but in general, changes to
the QAPI that don't have accompanying changes in the testsuite are
hard to prove that they do something useful.

At a minimum, the commit message should at least say what sort of
things are not permitted without this patch that are now possible,
rather than making me figure out what the next patch uses that failed
the QAPI generator without this patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


