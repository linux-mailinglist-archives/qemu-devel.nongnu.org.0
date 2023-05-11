Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C76FF8A5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:43:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxAIw-00083s-Fn; Thu, 11 May 2023 13:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pxAIc-0007t4-27
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pxAIX-0001u4-Pp
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683826908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uk5lwB66pkpdQU49jnHnL/jnY9gHAw8MhxsZ1lbyWCI=;
 b=C+Qp6NO475WZc+G8HqxNA2iYQm+0MaYz8ih/OaYMoKFS+6nbyHcwX9WBWv5Xja82rMsBMG
 ZAVWaF+77G5gz02jfCMWBmg51mrnGPFNPn++TYp9tahpR1ZrPedvppHOrpEBLXMX5cKAYt
 Q/9PmH0Cqo5q9Uwfa7UaZw+lQCMRNX0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-VOohKhAdOXuCytTA9oS92w-1; Thu, 11 May 2023 13:41:45 -0400
X-MC-Unique: VOohKhAdOXuCytTA9oS92w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C88353C21BA1;
 Thu, 11 May 2023 17:41:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 689E7492C13;
 Thu, 11 May 2023 17:41:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 341CD21F9816; Thu, 11 May 2023 19:41:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dinah Baum <dinahbaum123@gmail.com>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  Yanan Wang <wangyanan55@huawei.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  David Hildenbrand <david@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),  qemu-s390x@nongnu.org
 (open list:S390 TCG CPUs)
Subject: Re: [PATCH v2 2/3] cpu, qapi, target/arm, i386, s390x: Generalize
 query-cpu-model-expansion
References: <20230404011956.90375-1-dinahbaum123@gmail.com>
 <20230404011956.90375-3-dinahbaum123@gmail.com>
Date: Thu, 11 May 2023 19:41:43 +0200
In-Reply-To: <20230404011956.90375-3-dinahbaum123@gmail.com> (Dinah Baum's
 message of "Mon, 3 Apr 2023 21:19:55 -0400")
Message-ID: <87h6sihijs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Dinah Baum <dinahbaum123@gmail.com> writes:

> This patch enables 'query-cpu-model-expansion' on all
> architectures. Only architectures that implement
> the command will return results, others will return an
> error message as before.
>
> This patch lays the groundwork for parsing a
> -cpu cpu,help option as specified in
> https://gitlab.com/qemu-project/qemu/-/issues/1480

Yes, but why does the change make sense for QMP?

Any idea how hard implementing the thing for more targets would be?
Question, not a demand!

> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> ---
>  cpu.c                            | 20 ++++++++++++
>  include/exec/cpu-common.h        |  8 +++++
>  qapi/machine-target-common.json  | 51 +++++++++++++++++++++++++++++
>  qapi/machine-target.json         | 56 --------------------------------
>  target/arm/arm-qmp-cmds.c        |  7 ++--
>  target/arm/cpu.h                 |  7 +++-
>  target/i386/cpu-sysemu.c         |  7 ++--
>  target/i386/cpu.h                |  6 ++++
>  target/s390x/cpu.h               |  7 ++++
>  target/s390x/cpu_models_sysemu.c |  6 ++--
>  10 files changed, 108 insertions(+), 67 deletions(-)
>
> diff --git a/cpu.c b/cpu.c
> index 849bac062c..daf4e1ff0d 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -292,6 +292,26 @@ void list_cpus(const char *optarg)
>  #endif
>  }
>  
> +CpuModelExpansionInfo *get_cpu_model_expansion_info(CpuModelExpansionType type,
> +                                                    CpuModelInfo *model,
> +                                                    Error **errp)
> +{
> +    /* XXX: implement cpu_model_expansion for targets that still miss it */
> +#if defined(cpu_model_expansion)
> +    return cpu_model_expansion(type, model, errp);
> +#else
> +    error_setg(errp, "Could not query cpu model information");

This is vague enough to leave the user wondering what could be done to
avoid this error and by whom.

Before the patch, it's clear enough: "The command
query-cpu-model-expansion has not been found".

You could go with something like "command not supported for this
target".

The error class changes from CommandNotFound to GenericError.  Please
verify libvirt is fine with that.

> +    return NULL;
> +#endif
> +}
> +
> +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> +                                                     CpuModelInfo *model,
> +                                                     Error **errp)
> +{
> +    return get_cpu_model_expansion_info(type, model, errp);
> +}
> +
>  #if defined(CONFIG_USER_ONLY)
>  void tb_invalidate_phys_addr(target_ulong addr)
>  {
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6feaa40ca7..ec6024dfde 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -7,6 +7,8 @@
>  #include "exec/hwaddr.h"
>  #endif
>  
> +#include "qapi/qapi-commands-machine-target-common.h"
> +
>  /**
>   * vaddr:
>   * Type wide enough to contain any #target_ulong virtual address.
> @@ -166,5 +168,11 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>  extern int singlestep;
>  
>  void list_cpus(const char *optarg);
> +typedef void (*cpu_model_expansion_func)(CpuModelExpansionType type,
> +                                         CpuModelInfo *model,
> +                                         Error **errp);
> +CpuModelExpansionInfo *get_cpu_model_expansion_info(CpuModelExpansionType type,
> +                                                    CpuModelInfo *model,
> +                                                    Error **errp);
>  
>  #endif /* CPU_COMMON_H */
> diff --git a/qapi/machine-target-common.json b/qapi/machine-target-common.json
> index 1e6da3177d..44713e9935 100644
> --- a/qapi/machine-target-common.json
> +++ b/qapi/machine-target-common.json
> @@ -77,3 +77,54 @@
>  ##
>  { 'enum': 'CpuModelCompareResult',
>    'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
> +
> +##
> +# @CpuModelExpansionInfo:
> +#
> +# The result of a cpu model expansion.
> +#
> +# @model: the expanded CpuModelInfo.
> +#
> +# Since: 2.8
> +##
> +{ 'struct': 'CpuModelExpansionInfo',
> +  'data': { 'model': 'CpuModelInfo' } }
> +
> +##
> +# @query-cpu-model-expansion:
> +#
> +# Expands a given CPU model (or a combination of CPU model + additional options)
> +# to different granularities, allowing tooling to get an understanding what a
> +# specific CPU model looks like in QEMU under a certain configuration.
> +#
> +# This interface can be used to query the "host" CPU model.
> +#
> +# The data returned by this command may be affected by:
> +#
> +# * QEMU version: CPU models may look different depending on the QEMU version.
> +#   (Except for CPU models reported as "static" in query-cpu-definitions.)
> +# * machine-type: CPU model  may look different depending on the machine-type.
> +#   (Except for CPU models reported as "static" in query-cpu-definitions.)
> +# * machine options (including accelerator): in some architectures, CPU models
> +#   may look different depending on machine and accelerator options. (Except for
> +#   CPU models reported as "static" in query-cpu-definitions.)
> +# * "-cpu" arguments and global properties: arguments to the -cpu option and
> +#   global properties may affect expansion of CPU models. Using
> +#   query-cpu-model-expansion while using these is not advised.
> +#
> +# Some architectures may not support all expansion types. s390x supports
> +# "full" and "static". Arm only supports "full".
> +#
> +# Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
> +#          not supported, if the model cannot be expanded, if the model contains
> +#          an unknown CPU definition name, unknown properties or properties
> +#          with a wrong type. Also returns an error if an expansion type is
> +#          not supported.
> +#
> +# Since: 2.8
> +##
> +{ 'command': 'query-cpu-model-expansion',
> +  'data': { 'type': 'CpuModelExpansionType',
> +  'model': 'CpuModelInfo' },

Please use the opportunity to fix the indentation.

> +  'returns': 'CpuModelExpansionInfo' }
> +

[Remainder skipped for now...]


