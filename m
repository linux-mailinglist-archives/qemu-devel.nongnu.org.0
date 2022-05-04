Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B6D51A154
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 15:50:38 +0200 (CEST)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFOm-0004Gk-34
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 09:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmFL4-0001Cj-Og
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:46:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmFL1-0002eE-VA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651672002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lpDh6gK9irmqxQs1mt+Zsz8sF8AUdOJKIPrb5KkDjU=;
 b=WUe0MeZncehCLdtrCbHuzOxDTlCbgd7StlrT9YpFuk9DeFIJkWmJDHlwK7ozNFhlI6DhjA
 KftzkMDFZdIM3jEGUaK5nwdh7gD3NPOV6ER7hAnEhK444SDfezVTtbsRhcglYrT4FZE2/6
 8ZR2MPimkzRktsEO82VDV0K2C59gcxM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-J1Mbct0MNaiJWok-NX4hNA-1; Wed, 04 May 2022 09:46:41 -0400
X-MC-Unique: J1Mbct0MNaiJWok-NX4hNA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j5-20020a05600c1c0500b0039419a269a1so712323wms.3
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 06:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lpDh6gK9irmqxQs1mt+Zsz8sF8AUdOJKIPrb5KkDjU=;
 b=sENAe4vbXInXMOgLhPcz6f33L54t2Sc7cTilXT5/MqpxT5LSBeL/1Zr/2/ePXq/Dmc
 SUoQyrO0+bMA/wRHqi/SCOUkToQIEHJ8RitosToC8kRHlnzzZsZQbJ1Nyupl0ipyV1l+
 9h5u6lu7mBak8Yi/jpLJ/01YTgjpl2RfwA/Fo1p2NUyVG9vaZT0XCPMcXAgAuF+EvCDD
 Z2EOxcY2nGHNWpTDWbcAP9awzVVrJNpa8d7zrpntghSuhQvhATgGORixF5oKfmMB2Tym
 v3d5+2yKQwjtNbRU2T9l4bxcMGUzR6HjhaBFreY3g8lpEJptFnRj+AVfZ46ss1Kfs6K6
 GZXA==
X-Gm-Message-State: AOAM532fFCUFhYuHPqnJIQiwkB1MBy7tttZXk47p1ICwiXDXrQsb13N3
 GZr18NOrLDzjoHLrCCFe/pwuI9+9/RXjo6bwqwwiXVBNGdHTWImI0crmO6DYVpJRxnJNU9qV7FY
 /VDDbHL/ORlt+t04=
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr9310486wrf.678.1651672000116; 
 Wed, 04 May 2022 06:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXSQRQTEZoLGJnKpD/PXnziP9xk79QWXpgr+tej1CYH3LgtHUWFZiQSY+KB5fRQwZW5YhsUw==
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr9310449wrf.678.1651671999787; 
 Wed, 04 May 2022 06:46:39 -0700 (PDT)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b003942a244f57sm4023378wmq.48.2022.05.04.06.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 06:46:39 -0700 (PDT)
Date: Wed, 4 May 2022 15:46:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@Huawei.com,
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v9 4/6] qtest/numa-test: Correct CPU and NUMA
 association in aarch64_numa_cpu()
Message-ID: <20220504154637.17cfc995@redhat.com>
In-Reply-To: <20220503140304.855514-5-gshan@redhat.com>
References: <20220503140304.855514-1-gshan@redhat.com>
 <20220503140304.855514-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Tue,  3 May 2022 22:03:02 +0800
Gavin Shan <gshan@redhat.com> wrote:

> In aarch64_numa_cpu(), the CPU and NUMA association is something
> like below. Two threads in the same core/cluster/socket are
> associated with two individual NUMA nodes, which is unreal as
> Igor Mammedov mentioned. We don't expect the association to break
> NUMA-to-socket boundary, which matches with the real world.
> 
>     NUMA-node  socket  cluster   core   thread
>     ------------------------------------------
>         0       0        0        0      0
>         1       0        0        0      1
> 
> This corrects the topology for CPUs and their association with
> NUMA nodes. After this patch is applied, the CPU and NUMA
> association becomes something like below, which looks real.
> Besides, socket/cluster/core/thread IDs are all checked when
> the NUMA node IDs are verified. It helps to check if the CPU
> topology is properly populated or not.
> 
>     NUMA-node  socket  cluster   core   thread
>     ------------------------------------------
>        0        1        0        0       0
>        1        0        0        0       0

I'd place 'socket 1' on node 0, so it wouldn't look odd.
But it probably doesn't matter, so

Acked-by: Igor Mammedov <imammedo@redhat.com>

> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  tests/qtest/numa-test.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index aeda8c774c..32e35daaae 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -224,17 +224,17 @@ static void aarch64_numa_cpu(const void *data)
>      g_autofree char *cli = NULL;
>  
>      cli = make_cli(data, "-machine "
> -        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
> +        "smp.cpus=2,smp.sockets=2,smp.clusters=1,smp.cores=1,smp.threads=1 "
>          "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> -        "-numa cpu,node-id=1,thread-id=0 "
> -        "-numa cpu,node-id=0,thread-id=1");
> +        "-numa cpu,node-id=0,socket-id=1,cluster-id=0,core-id=0,thread-id=0 "
> +        "-numa cpu,node-id=1,socket-id=0,cluster-id=0,core-id=0,thread-id=0");
>      qts = qtest_init(cli);
>      cpus = get_cpus(qts, &resp);
>      g_assert(cpus);
>  
>      while ((e = qlist_pop(cpus))) {
>          QDict *cpu, *props;
> -        int64_t thread, node;
> +        int64_t socket, cluster, core, thread, node;
>  
>          cpu = qobject_to(QDict, e);
>          g_assert(qdict_haskey(cpu, "props"));
> @@ -242,12 +242,18 @@ static void aarch64_numa_cpu(const void *data)
>  
>          g_assert(qdict_haskey(props, "node-id"));
>          node = qdict_get_int(props, "node-id");
> +        g_assert(qdict_haskey(props, "socket-id"));
> +        socket = qdict_get_int(props, "socket-id");
> +        g_assert(qdict_haskey(props, "cluster-id"));
> +        cluster = qdict_get_int(props, "cluster-id");
> +        g_assert(qdict_haskey(props, "core-id"));
> +        core = qdict_get_int(props, "core-id");
>          g_assert(qdict_haskey(props, "thread-id"));
>          thread = qdict_get_int(props, "thread-id");
>  
> -        if (thread == 0) {
> +        if (socket == 0 && cluster == 0 && core == 0 && thread == 0) {
>              g_assert_cmpint(node, ==, 1);
> -        } else if (thread == 1) {
> +        } else if (socket == 1 && cluster == 0 && core == 0 && thread == 0) {
>              g_assert_cmpint(node, ==, 0);
>          } else {
>              g_assert(false);


