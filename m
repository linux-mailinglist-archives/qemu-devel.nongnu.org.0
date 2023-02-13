Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCCA6942C8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:25:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRW0R-0007UA-1r; Mon, 13 Feb 2023 05:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRW0H-0007T3-T8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:24:10 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRW0F-0008VB-UV
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:24:09 -0500
Received: by mail-wr1-x42a.google.com with SMTP id co8so7833129wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjUOJLlno5H6pHQMqX+/O+Frwp0/yqk1zxxD5H4a/pY=;
 b=ZyhFcfBNM0U5WCKgYzgB8kfnA5hHHDclcBa5i0U3ZADCE67xUMMdPlmf+2u/8vsFB5
 Fed/NkGF29yBV6Z6Uh9eZQTgquE63zBD37qkezMD4jo95J9QDZv8rDV6caR/2+BDfFwG
 X6MkK9zVgyyfeI5ZIouxI9jD0U+gBV0A6KWKlHnY0svX2Lvq21y7gJYrA05Wd0v1EF/y
 ERk2CcM0Bn22sEYeCPwwlIV7NkAkdWW4L7sc6weovsK/Fnj5M1yAt0KOIa+79VANPEFp
 UmYjFVW/mF5uII5Yjmvgzry+WIw91gjkd2H5rbz2BoVdN1hRvKrdDAnx1b+nVK727RQt
 xXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IjUOJLlno5H6pHQMqX+/O+Frwp0/yqk1zxxD5H4a/pY=;
 b=l6jhKhUaEtSYrV837rGjmGeoSXceCU9g3KPT/a+7HT0Dlm0AoKcWVGhkHjvG3O/xbu
 sSE6ZF3PMMbrcn6htHuggGcrC/Do/YDs1H6VQpFqlXYQz3Bs+nIzgRijkR5JCUvnmG/U
 cRSOPmxInXJBXwBcQ0Ve6o8F8jwxBM1pbZ4QmzyE0we4d2P66N5JEL0alk1tl9uXYRZS
 TvgPreNK7zKWVpEgdPLOZGTc3Yoy29FrdSTHwYRoH4iAVWm3MSmUvu0559TziCdoFSZf
 a9dggFn8lklHdX6U7lHLtv2YWrhJYEkMHtPck2wPPHsgjXs1ZqssqKZQuroongd511MU
 DnRw==
X-Gm-Message-State: AO0yUKWPbrgVgVMz6X/aYP/yGUfeuKkyMl01ncd8ZAAjyN5U6m11ey/E
 9bWL+0vmXVmC7ZkPG7Z26iM1/A==
X-Google-Smtp-Source: AK7set8IlrWGJ385e51swnmC/LlGQ4OJ+vXwgwSGI0WTQfMvtITJyoNwwrRVewnt/ZpfGOGBKH/Myw==
X-Received: by 2002:adf:ef05:0:b0:2c5:5298:893f with SMTP id
 e5-20020adfef05000000b002c55298893fmr4944110wro.43.1676283845935; 
 Mon, 13 Feb 2023 02:24:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b002c4008f0daasm10147957wrv.107.2023.02.13.02.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 02:24:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26FD01FFB7;
 Mon, 13 Feb 2023 10:24:05 +0000 (GMT)
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding
 <zhuocheng.ding@intel.com>, Robert Hoo <robert.hu@linux.intel.com>, Sean
 Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org
Subject: Re: [RFC 00/52] Introduce hybrid CPU topology
Date: Mon, 13 Feb 2023 10:14:22 +0000
In-reply-to: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
Message-ID: <87y1p1c18a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Zhao Liu <zhao1.liu@linux.intel.com> writes:

> From: Zhao Liu <zhao1.liu@intel.com>
>
> Hi list,
>
> This RFC series is to introduce hybrid topology in QEMU, and is based
> on our previous patches about cluster support for x86 [1] ([PATCH RESEND
> 00/18] Support smp.clusters for x86).
>
> Though our cluster support patches [1] has not yet accepted, we are
> still posting the hybrid topology support patches in advance, hoping to
> get discussion and feedbacks.
>
> In this RFC series, we mainly have the following work:
> * Introduce the new cpu topology under heterogeneous architecture, which
>   we called "hybrid" cpu topology.
>       - since the name "hmp" is already used in QEMU and "hybrid" is
>         also a synonym for heterogeneous.
> * Reorganized the relevant topology information in qemu to adapt to the
>   hybrid topology.
> * Introduce a new command "hybrid", which allows user to set a custom
>   hybrid topology.
>       - currently limited to custom cluster and custom core
> * Support hybrid topology in i386 PC machine.
> * Expose basic topology information (topology type and core type) in
>   query_cpus_fast.
>
> We hope that the hybrid topology can be general enough to be compatible
> with the needs of hybrids with various architectures in the future.
>
> Welcome your feedbacks!
>
>
> # 1. Background
>
> Heterogeneous computing refers to systems that use more than one kind of
> processor or cores [2]. Now there are more and more heterogeneous
> computing architectures, typically including arm's big.LITTLE [3] and
> intel hybrid architecture [4].
>
> The development of heterogeneous computing brings new challenges to
> virtualization. The first problem we face is how to support the vCPU
> topology under the heterogeneous architecture.
>
> Here, to distinguish it from "smp" cpu topology, we call it "hybrid" cpu
> topology.
>
>
> # 2. Motivation
>
> In a typical hybrid system, different types of core may have different
> capabilities. This difference may be reflected in different capacities,
> performance or power efficiencies, and even different instruction-per-
> cycle (IPC) capabilities. The direct consequence of these differences is
> to affect the performance of the workload.

This elides a use case for heterogeneous computing under emulation where
different cores can have totally different ISA's. We already support
emulation models where we have varying classes of the same ISA, for
example xlnx-zyncmp supports 4 A profile and 2 R profile Arm chips.

I've glanced over the patch set and I don't think there is any direct
clash with that as this is mainly about representing the topology for
x86 non-emulation accelerators but I just want ensure we don't end up
stepping on each others toes.

> For a virtual machines, vCPUs are just threads, although we can bind
> vCPUs to different cores to benefit from the different advantages of
> these physical cores, it's obviously not enough since CPU topology (and
> cache topology) will still have a significant impact on scheduling
> performance.
>
<snip>
> ## 3.3. "-hybrid" command
>
> For hybrid cpu topology configuration, the original "-smp" lack of
> flexibility to expand, and unables to customize different cores.
>
> So we introduce "-hybrid" command and implement it as the multi-
> line command. The multi-line command format is more complex than the
> single-line one, but it can bring stronger scalability and
> intuitiveness. In the future, it can also be easily extended to more
> heterogeneous topology levels.
>
> "-hybrid" command is as follows:
>
> -hybrid socket,sockets=3Dn
> -hybrid die,dies=3Dn
> -hybrid cluster,clusters=3Dn
> -hybrid core,cores=3Dn,type=3Dcore_type[,threads=3Dthreads]
>         [,clusterid=3Dcluster]
>
> Here, we first define the corresponding qapi options for these 4
> topology levels: core, cluster, die and socket.
>
> We doesn't need a thread level since thread doesn't have different
> type.
>
> For example:
>
> -hybrid socket,sockets=3D1
> -hybrid die,dies=3D1
> -hybrid cluster,clusters=3D4
> -hybrid core,cores=3D1,coretype=3D"core",threads=3D2,clusterid=3D0-2
> -hybrid core,cores=3D4,coretype=3D"atom",threads=3D1
>
> Here we can build a hybrid cpu topology, which has 1 socket, 1 die per
> socket, 4 clusters per die. And in each die, every clusters has 4 "atom"
> core with 1 threads, and cluster0, cluster1 and cluster2 have 1 "core"
> cores with 2 threads.
>
> Please note this example is not an actual machine topology, but it shows
> the powerful flexibility of "hybrid" command.

Is there any intention to apply this command to emulation or will it
only be for hardware virtualisation? For example the x86 translator
should be capable of emulating two different classes of x86 with
different subsets of instructions. It requires ensuring each CPU is
assigned to the correct TYPE_CPU_CLUSTER so we don't re-use TBs from
the "wrong" CPU.

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

