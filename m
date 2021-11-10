Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB144BE72
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:18:23 +0100 (CET)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkgP-0005yZ-NJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:18:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkkeq-0004dY-F7
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:16:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkkel-0003kA-Mo
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636539398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrB9f1WXPCrn5QI3aeWWIw68+42+wcepHbXoM2kORu8=;
 b=RQQlbkVyUweTH1iRrgu/ptR6/BWyYRi5tOQcV555ORw3gxXuunhmpoLXsUNe0TliO+bCuK
 QbigxetQflUww/RYdW//9ZgUmA/GpXa6fpwyPbGx8jwORqvxCSlFateqrVbZMYRvWTX8SO
 VWVE534RUITBrdl9rNWZUjjFsTP3++w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-Ru4scFQlMnO72eLp49RG7w-1; Wed, 10 Nov 2021 05:16:36 -0500
X-MC-Unique: Ru4scFQlMnO72eLp49RG7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95E75804140;
 Wed, 10 Nov 2021 10:16:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 329CE1055085;
 Wed, 10 Nov 2021 10:16:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF88A11380A7; Wed, 10 Nov 2021 11:16:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 2/2] tests/unit/test-smp-parse: Fix a check-patch complain
References: <20211110095208.448-1-wangyanan55@huawei.com>
 <20211110095208.448-3-wangyanan55@huawei.com>
Date: Wed, 10 Nov 2021 11:16:33 +0100
In-Reply-To: <20211110095208.448-3-wangyanan55@huawei.com> (Yanan Wang's
 message of "Wed, 10 Nov 2021 17:52:08 +0800")
Message-ID: <87tugkz56m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 wanghaibin.wang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yanan Wang <wangyanan55@huawei.com> writes:

> Checkpatch.pl reports errors like below for commit 9e8e393bb7. Fix it.
> ERROR: space required after that close brace '}'
> +    SMPTestData *data = &(SMPTestData){{ }};
>
> Fixes: 9e8e393bb7 ("tests/unit: Add an unit test for smp parsing")
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index 872512aa37..3627fe61ad 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -514,7 +514,7 @@ static void test_generic(void)
>      Object *obj = smp_test_machine_init();
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){{ }};
> +    SMPTestData *data = &(SMPTestData){ {0} };
>      int i;
>  
>      for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
> @@ -548,7 +548,7 @@ static void test_with_dies(void)
>      Object *obj = smp_test_machine_init();
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){{ }};
> +    SMPTestData *data = &(SMPTestData){ {0} };
>      unsigned int num_dies = 2;
>      int i;

Why not

       SMPTestData *data = &(SMPTestData){};

?


