Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977163E1195
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:44:12 +0200 (CEST)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZv9-0005vD-N9
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBZu8-0005Fo-Ec
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:43:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBZu5-0000c4-TM
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:43:08 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1759YO2a093652; Thu, 5 Aug 2021 05:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wuBZx9NF+1XjJanCA71SWnPUYCmhO+I072LFx8g+wyc=;
 b=JCmV5b924OOCikVQ21wWxyCHAKpZops9qBkBJY7X/kaa1V0mUdk1/ksBNuKju+MARGf9
 rFs8RwkCCqVadYrNalua7PkJyPpBlIPJ1tdJDmww9aVXBARAa+/+aCUX0pVEuDoktH88
 k/VV52GFaGXHes3AJXQDTAW4i5ljSSY2EERY9RAvAcb9O6dJ5R26XObnuGSa1InXJe/s
 anfu5psWPyIgxQ7LluUNfuyt+Vc2/Ukn/a4Dc/zxxNl1wtx6+fyDGGHHwItTiIBOQfZp
 CsdS7SFrb9rM8XW2BSCbDUw9Yyqrvq33PWMf6X6THZstpIXxiKwtMhRufSs4RV6vorec Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a83gpp3ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:43:03 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1759Z5QT099484;
 Thu, 5 Aug 2021 05:43:02 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a83gpp3wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:43:02 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1759gWaw008115;
 Thu, 5 Aug 2021 09:43:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3a6j2hc05a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:43:02 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1759h0Yk13762978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 09:43:00 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C202136053;
 Thu,  5 Aug 2021 09:43:00 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50673136066;
 Thu,  5 Aug 2021 09:42:52 +0000 (GMT)
Received: from [9.160.123.143] (unknown [9.160.123.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 09:42:51 +0000 (GMT)
Subject: Re: [PATCH v4 03/14] migration.json: add AMD SEV specific migration
 parameters
To: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <d6a23bde6b6e10162282e6ea3b4f94ed331f4b3f.1628076205.git.ashish.kalra@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <6ff4ec2b-6441-9f9f-a652-7b7e87bbb45a@linux.ibm.com>
Date: Thu, 5 Aug 2021 12:42:50 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d6a23bde6b6e10162282e6ea3b4f94ed331f4b3f.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: go-mPvT52FwRP2wFyTkHcfxk7LrW1zJV
X-Proofpoint-GUID: OIHY4b5xxs3Aunk-7HKc2lCPpA2oIT2h
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_03:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050057
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, dgilbert@redhat.com,
 Dov Murik <dovmurik@linux.ibm.com>, dovmurik@linux.vnet.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/08/2021 14:54, Ashish Kalra wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> AMD SEV migration flow requires that target machine's public Diffie-Hellman
> key (PDH) and certificate chain must be passed before initiating the guest
> migration. User can use QMP 'migrate-set-parameters' to pass the certificate
> chain. The certificate chain will be used while creating the outgoing
> encryption context.

Just making sure: The source QEMU must *not* accept the sev_amd_cert
from the target, because that will allow a malicious target to give its
own root cert instead of the official AMD one.  Instead it should use
its own trusted AMD root certificate.


> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  migration/migration.c | 61 +++++++++++++++++++++++++++++++++++++++++++
>  monitor/hmp-cmds.c    | 18 +++++++++++++
>  qapi/migration.json   | 40 +++++++++++++++++++++++++---
>  3 files changed, 116 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 041b8451a6..daea3ecd04 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -907,6 +907,12 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>      params->announce_rounds = s->parameters.announce_rounds;
>      params->has_announce_step = true;
>      params->announce_step = s->parameters.announce_step;
> +    params->has_sev_pdh = true;
> +    params->sev_pdh = g_strdup(s->parameters.sev_pdh);
> +    params->has_sev_plat_cert = true;
> +    params->sev_plat_cert = g_strdup(s->parameters.sev_plat_cert);
> +    params->has_sev_amd_cert = true;
> +    params->sev_amd_cert = g_strdup(s->parameters.sev_amd_cert);
> 
>      if (s->parameters.has_block_bitmap_mapping) {
>          params->has_block_bitmap_mapping = true;
> @@ -1563,6 +1569,18 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>          dest->has_block_bitmap_mapping = true;
>          dest->block_bitmap_mapping = params->block_bitmap_mapping;
>      }
> +    if (params->has_sev_pdh) {
> +        assert(params->sev_pdh->type == QTYPE_QSTRING);
> +        dest->sev_pdh = g_strdup(params->sev_pdh->u.s);
> +    }
> +    if (params->has_sev_plat_cert) {
> +        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
> +        dest->sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
> +    }
> +    if (params->has_sev_amd_cert) {
> +        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
> +        dest->sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
> +    }
>  }
> 
>  static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> @@ -1685,6 +1703,21 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>              QAPI_CLONE(BitmapMigrationNodeAliasList,
>                         params->block_bitmap_mapping);
>      }
> +    if (params->has_sev_pdh) {
> +        g_free(s->parameters.sev_pdh);
> +        assert(params->sev_pdh->type == QTYPE_QSTRING);
> +        s->parameters.sev_pdh = g_strdup(params->sev_pdh->u.s);
> +    }
> +    if (params->has_sev_plat_cert) {
> +        g_free(s->parameters.sev_plat_cert);
> +        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
> +        s->parameters.sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
> +    }
> +    if (params->has_sev_amd_cert) {
> +        g_free(s->parameters.sev_amd_cert);
> +        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
> +        s->parameters.sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
> +    }
>  }
> 
>  void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> @@ -1705,6 +1738,27 @@ void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
>          params->tls_hostname->type = QTYPE_QSTRING;
>          params->tls_hostname->u.s = strdup("");
>      }
> +    /* TODO Rewrite "" to null instead */
> +    if (params->has_sev_pdh
> +        && params->sev_pdh->type == QTYPE_QNULL) {
> +        qobject_unref(params->sev_pdh->u.n);
> +        params->sev_pdh->type = QTYPE_QSTRING;
> +        params->sev_pdh->u.s = strdup("");
> +    }
> +    /* TODO Rewrite "" to null instead */
> +    if (params->has_sev_plat_cert
> +        && params->sev_plat_cert->type == QTYPE_QNULL) {
> +        qobject_unref(params->sev_plat_cert->u.n);
> +        params->sev_plat_cert->type = QTYPE_QSTRING;
> +        params->sev_plat_cert->u.s = strdup("");
> +    }
> +    /* TODO Rewrite "" to null instead */
> +    if (params->has_sev_amd_cert
> +        && params->sev_amd_cert->type == QTYPE_QNULL) {
> +        qobject_unref(params->sev_amd_cert->u.n);
> +        params->sev_amd_cert->type = QTYPE_QSTRING;
> +        params->sev_amd_cert->u.s = strdup("");
> +    }
> 
>      migrate_params_test_apply(params, &tmp);
> 
> @@ -4233,6 +4287,9 @@ static void migration_instance_finalize(Object *obj)
>      qemu_mutex_destroy(&ms->qemu_file_lock);
>      g_free(params->tls_hostname);
>      g_free(params->tls_creds);
> +    g_free(params->sev_pdh);
> +    g_free(params->sev_plat_cert);
> +    g_free(params->sev_amd_cert);
>      qemu_sem_destroy(&ms->wait_unplug_sem);
>      qemu_sem_destroy(&ms->rate_limit_sem);
>      qemu_sem_destroy(&ms->pause_sem);
> @@ -4280,6 +4337,10 @@ static void migration_instance_init(Object *obj)
>      params->has_announce_rounds = true;
>      params->has_announce_step = true;
> 
> +    params->sev_pdh = g_strdup("");
> +    params->sev_plat_cert = g_strdup("");
> +    params->sev_amd_cert = g_strdup("");
> +

TODO: init to NULL instead.

>      qemu_sem_init(&ms->postcopy_pause_sem, 0);
>      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
>      qemu_sem_init(&ms->rp_state.rp_sem, 0);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index e00255f7ee..27ca2024bb 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1399,6 +1399,24 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          error_setg(&err, "The block-bitmap-mapping parameter can only be set "
>                     "through QMP");
>          break;
> +    case MIGRATION_PARAMETER_SEV_PDH:
> +        p->has_sev_pdh = true;
> +        p->sev_pdh = g_new0(StrOrNull, 1);
> +        p->sev_pdh->type = QTYPE_QSTRING;
> +        visit_type_str(v, param, &p->sev_pdh->u.s, &err);
> +        break;
> +    case MIGRATION_PARAMETER_SEV_PLAT_CERT:
> +        p->has_sev_plat_cert = true;
> +        p->sev_plat_cert = g_new0(StrOrNull, 1);
> +        p->sev_plat_cert->type = QTYPE_QSTRING;
> +        visit_type_str(v, param, &p->sev_plat_cert->u.s, &err);
> +        break;
> +    case MIGRATION_PARAMETER_SEV_AMD_CERT:
> +        p->has_sev_amd_cert = true;
> +        p->sev_amd_cert = g_new0(StrOrNull, 1);
> +        p->sev_amd_cert->type = QTYPE_QSTRING;
> +        visit_type_str(v, param, &p->sev_amd_cert->u.s, &err);
> +        break;
>      default:
>          assert(0);
>      }
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 1124a2dda8..69c615ec4d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -743,6 +743,15 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> +#           (Since 4.2)

Since 6.2, I assume. (same for all the changes in this file)


> +#
> +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> +#                 (Since 4.2)
> +#
> +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> +#                base64 (Since 4.2)
> +#
>  # Since: 2.4
>  ##
>  { 'enum': 'MigrationParameter',
> @@ -758,7 +767,8 @@
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'block-bitmap-mapping',
> +           'sev-pdh', 'sev-plat-cert', 'sev-amd-cert' ] }
> 
>  ##
>  # @MigrateSetParameters:
> @@ -903,6 +913,15 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> +#           (Since 4.2)
> +#
> +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> +#                 (Since 4.2)
> +#
> +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> +#                base64 (Since 4.2)
> +#
>  # Since: 2.4
>  ##
>  # TODO either fuse back into MigrationParameters, or make
> @@ -934,7 +953,10 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*sev-pdh':'StrOrNull',
> +            '*sev-plat-cert': 'StrOrNull',
> +            '*sev-amd-cert' : 'StrOrNull' } }
> 
>  ##
>  # @migrate-set-parameters:
> @@ -1099,6 +1121,15 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> +#           (Since 4.2)
> +#
> +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> +#                 (Since 4.2)
> +#
> +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> +#                base64 (Since 4.2)
> +#
>  # Since: 2.4
>  ##
>  { 'struct': 'MigrationParameters',
> @@ -1128,7 +1159,10 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*sev-pdh':'str',
> +            '*sev-plat-cert': 'str',
> +            '*sev-amd-cert' : 'str'} }
> 
>  ##
>  # @query-migrate-parameters:
> 

