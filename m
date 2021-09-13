Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB261409A2D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:57:30 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpGq-0002r9-Ro
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mPosW-0001N8-PB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:32:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mPosU-00059f-Mp
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:32:20 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18DFI8rj000310
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vGsNBCVnxl4lif2+i2VytkNl1OiFBLSsNaVYbb+DI/A=;
 b=dZSDpMxMEd1vP8Gzf68l4aHZcQh6Xo/CZmTPf/nTfu2mJ7MvSYi8aAY6kyzrf/wOe9sA
 LTKROi0StNwq8G0d3+wDxHYQVyBtdF6E/+tt+75uaPCJ0Ty1uKjhw9nFWFdQJTePdTUk
 apEIZbRDChJ/nXOcIHIb+tjPj5tHzcsz9TQzLcmpyqcwTRt69O8fqlRpWuyD2ak0lRZf
 kSaH14T5jzXr5qTf6NhxkNVfUeAjnofpJTcJ2SU8Y8JsqHGEJBXgSX+YTF2sp+E0DSPK
 Iy79HS6ry6ofk+8kTT41ACknWXFKEc2vVjRweeZBVmgF0ZcYqcFIqgu7af+VEVYIQJlc 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b23hw3pgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:32:15 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18DF8Atq007103
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:32:15 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b23hw3pg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 12:32:15 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18DGJjWt007109;
 Mon, 13 Sep 2021 16:32:14 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3b0m3bwvkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 16:32:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18DGWDtA14156498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 16:32:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAA5D78068;
 Mon, 13 Sep 2021 16:32:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98E887805F;
 Mon, 13 Sep 2021 16:32:12 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 13 Sep 2021 16:32:12 +0000 (GMT)
Subject: Re: [PATCH 05/22] qapi: Convert simple union TpmTypeOptions to flat
 one
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-6-armbru@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <438e44f9-ef24-d459-b4a4-5a9ac04c9f5f@linux.ibm.com>
Date: Mon, 13 Sep 2021 12:32:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-6-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KziXlghxxNBWGf2w4No7rbmvVrE_hBgD
X-Proofpoint-GUID: zUQygK6XHjGGgi7wsMWf9YgAnST701mP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130048
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 9/13/21 8:39 AM, Markus Armbruster wrote:
> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
>
> To prepare for their removal, convert simple union TpmTypeOptions to
> an equivalent flat one, with existing enum TpmType replacing implicit
> enum TpmTypeOptionsKind.  Adds some boilerplate to the schema, which
> is a bit ugly, but a lot easier to maintain than the simple union
> feature.
>
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   qapi/tpm.json                  | 24 ++++++++++++++++++++++--
>   backends/tpm/tpm_emulator.c    |  2 +-
>   backends/tpm/tpm_passthrough.c |  2 +-
>   monitor/hmp-cmds.c             |  8 ++++----
>   4 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/qapi/tpm.json b/qapi/tpm.json
> index f4dde2f646..b3ade008bf 100644
> --- a/qapi/tpm.json
> +++ b/qapi/tpm.json
> @@ -99,6 +99,24 @@
>   { 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
>     'if': 'CONFIG_TPM' }
>
> +##
> +# @TPMPassthroughOptionsWrapper:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'TPMPassthroughOptionsWrapper',
> +  'data': { 'data': 'TPMPassthroughOptions' },
> +  'if': 'CONFIG_TPM' }
> +
> +##
> +# @TPMEmulatorOptionsWrapper:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'TPMEmulatorOptionsWrapper',
> +  'data': { 'data': 'TPMEmulatorOptions' },
> +  'if': 'CONFIG_TPM' }
> +
>   ##
>   # @TpmTypeOptions:
>   #
> @@ -110,8 +128,10 @@
>   # Since: 1.5
>   ##
>   { 'union': 'TpmTypeOptions',
> -   'data': { 'passthrough' : 'TPMPassthroughOptions',
> -             'emulator': 'TPMEmulatorOptions' },
> +  'base': { 'type': 'TpmType' },
> +  'discriminator': 'type',
> +   'data': { 'passthrough' : 'TPMPassthroughOptionsWrapper',
> +             'emulator': 'TPMEmulatorOptionsWrapper' },
>     'if': 'CONFIG_TPM' }
>
>   ##
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index f8095d23d5..87d061e9bb 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -623,7 +623,7 @@ static TpmTypeOptions *tpm_emulator_get_tpm_options(TPMBackend *tb)
>       TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
>       TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
>
> -    options->type = TPM_TYPE_OPTIONS_KIND_EMULATOR;
> +    options->type = TPM_TYPE_EMULATOR;
>       options->u.emulator.data = QAPI_CLONE(TPMEmulatorOptions, tpm_emu->options);
>
>       return options;
> diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
> index 21b7459183..d5558fae6c 100644
> --- a/backends/tpm/tpm_passthrough.c
> +++ b/backends/tpm/tpm_passthrough.c
> @@ -321,7 +321,7 @@ static TpmTypeOptions *tpm_passthrough_get_tpm_options(TPMBackend *tb)
>   {
>       TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
>
> -    options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
> +    options->type = TPM_TYPE_PASSTHROUGH;
>       options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions,
>                                                TPM_PASSTHROUGH(tb)->options);
>
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index e00255f7ee..d6858407ad 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -925,10 +925,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>                          c, TpmModel_str(ti->model));
>
>           monitor_printf(mon, "  \\ %s: type=%s",
> -                       ti->id, TpmTypeOptionsKind_str(ti->options->type));
> +                       ti->id, TpmType_str(ti->options->type));
>
>           switch (ti->options->type) {
> -        case TPM_TYPE_OPTIONS_KIND_PASSTHROUGH:
> +        case TPM_TYPE_PASSTHROUGH:
>               tpo = ti->options->u.passthrough.data;
>               monitor_printf(mon, "%s%s%s%s",
>                              tpo->has_path ? ",path=" : "",
> @@ -936,11 +936,11 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>                              tpo->has_cancel_path ? ",cancel-path=" : "",
>                              tpo->has_cancel_path ? tpo->cancel_path : "");
>               break;
> -        case TPM_TYPE_OPTIONS_KIND_EMULATOR:
> +        case TPM_TYPE_EMULATOR:
>               teo = ti->options->u.emulator.data;
>               monitor_printf(mon, ",chardev=%s", teo->chardev);
>               break;
> -        case TPM_TYPE_OPTIONS_KIND__MAX:
> +        case TPM_TYPE__MAX:
>               break;
>           }
>           monitor_printf(mon, "\n");

