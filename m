Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6138062279C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 10:53:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oshkf-0003Di-Bt; Wed, 09 Nov 2022 04:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oshkd-0003DS-KY
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oshkb-0000Yp-G1
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667987524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UcC1tJD0r6k80cID6DJTAsUKabzbdDVMpQAS6UB8PA=;
 b=aJzEODOUQWnru5fJBBt2mJTFWq+VPbOqNo6tVYs+2fkSGDaCYKlJ/aLeaw7tjZjKNYnwGX
 iJJIPRMRpItjQe47634eef/9B+i0J4fKdGC7HZO1eIp2bYVcyuLFuiJk7lSUr/v7fYkLoB
 7kWifyjPMnk+5QO+ql23qUP5wwCeJpE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586--q7c9clpMN2r0pLdhsBoHQ-1; Wed, 09 Nov 2022 04:52:00 -0500
X-MC-Unique: -q7c9clpMN2r0pLdhsBoHQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93D3A833A11;
 Wed,  9 Nov 2022 09:52:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 612D54B400F;
 Wed,  9 Nov 2022 09:52:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C76021E6921; Wed,  9 Nov 2022 10:51:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhenyu Zhang <zhenyzha@redhat.com>
Cc: qemu-devel@nongnu.org,  philmd@linaro.org,  shan.gavin@gmail.com,
 liuyd.fnst@fujitsu.com,  eric.auger@redhat.com,  imammedo@redhat.com
Subject: Re: [PATCH v2] qom.json: default the prealloc-threads to smp-cpus
References: <20221104103017.181600-1-zhenyzha@redhat.com>
Date: Wed, 09 Nov 2022 10:51:59 +0100
In-Reply-To: <20221104103017.181600-1-zhenyzha@redhat.com> (Zhenyu Zhang's
 message of "Fri, 4 Nov 2022 06:30:17 -0400")
Message-ID: <87o7tgpi9s.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

The subject is misleading, I'm afraid.  It suggests you're changing the
default.  You don't, you just fix its documentation.

Zhenyu Zhang <zhenyzha@redhat.com> writes:

> Since the amount of prealloc-threads to smp-cpus is
> defaulted in hostmem, so sync this information.

Covering history could be helpful.

Here's my try

    qapi/qom: Memory backend property prealloc-threads doc fix

    Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
    (v5.0.0) changed the default number of threads from number of CPUs
    to 1.  This was deemed a regression, and fixed in commit f8d426a685
    "hostmem: default the amount of prealloc-threads to smp-cpus".
    Except the documentation remained unchanged.  Update it now.

>
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>

The following part ...

> v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg919682.html
>
> Changelog
> =========
> v2:
>   * This property is available since 5.0.                     (Philippe)
> ---

... needs to go below the --- line, so it doesn't go into git.

>  qapi/qom.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 87fcad2423..b2f6bceec7 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -576,7 +576,7 @@
>  #
>  # @prealloc: if true, preallocate memory (default: false)
>  #
> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> +# @prealloc-threads: number of CPU threads to use for prealloc (default: smp-cpus) (since 5.0)

Long line.

"smp-cpus" is not defined.  It's QOM property /machine/smp member @cpus,
commonly set with -M smp.cpus=N (or its sugared form -smp cpus=N).

Suggest

   # @prealloc-threads: number of CPU threads to use for prealloc
   # (default: number of CPUs) (since 5.0)

>  #
>  # @prealloc-context: thread context to use for creation of preallocation threads
>  #                    (default: none) (since 7.2)


