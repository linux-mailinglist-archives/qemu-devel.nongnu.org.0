Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8A6A2256
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:28:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdk2-0001sj-Ab; Fri, 24 Feb 2023 14:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pVdk0-0001qz-S5
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:28:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pVdjz-0006iS-DT
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677266901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbxReNmq4FkS9nfKxIoy66ln05Hgjka3rIOwCusiaLc=;
 b=PFQDSWYeF+IyCmpPEF8PXCO4/SjywBfAxMcCJVAKjfKwlt24euuGer/XX8aBPB2wv08bgI
 fZD3fU/1KPsciKU8fnAAw2h/54MLc7y+5daPLfUQE41+8aoHqH1NTQk0PMkmySnLO2/2Mb
 +x8bbiuWsgDD+6KIa0fjGi9YxzHQ6po=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-mNSXfmBHMg6cfbVoMYppuQ-1; Fri, 24 Feb 2023 14:28:14 -0500
X-MC-Unique: mNSXfmBHMg6cfbVoMYppuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DE2F85D061;
 Fri, 24 Feb 2023 19:28:14 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C81F11121314;
 Fri, 24 Feb 2023 19:28:13 +0000 (UTC)
Date: Fri, 24 Feb 2023 13:28:12 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Het Gala <het.gala@nutanix.com>
Subject: Re: [PATCH v2 2/3] qapi: use env var to trigger qapi test output
 updates
Message-ID: <20230224192812.eqdxkvlmn7zj3kae@redhat.com>
References: <20230223134027.2294640-1-berrange@redhat.com>
 <20230223134027.2294640-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223134027.2294640-3-berrange@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Thu, Feb 23, 2023 at 01:40:26PM +0000, Daniel P. Berrangé wrote:
> It is possible to pass --update to tests/qapi-schema/test-qapi.py
> to make it update the output files on error. This is inconvient

inconvenient

> to achieve though when test-qapi.py is run indirectly by make/meson.
> 
> Instead simply allow for an env variable to be set:
> 
>  $ QAPI_TEST_UPDATE=1 make check-qapi-schema
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qapi-schema/test-qapi.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
> index 2160cef082..75f2759fd6 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -215,7 +215,8 @@ def main(argv):
>          (dir_name, base_name) = os.path.split(t)
>          dir_name = dir_name or args.dir
>          test_name = os.path.splitext(base_name)[0]
> -        status |= test_and_diff(test_name, dir_name, args.update)
> +        update = args.update or "QAPI_TEST_UPDATE" in os.environ
> +        status |= test_and_diff(test_name, dir_name, update)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


