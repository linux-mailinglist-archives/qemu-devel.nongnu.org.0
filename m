Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292E2D318D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:57:52 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhFG-00054v-QA
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1kmhCl-0004Cj-OK
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:55:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5542
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1kmhCj-0005T7-T8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:55:15 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8HcLhw024440; Tue, 8 Dec 2020 12:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sdqN6uLk+tHIedQlRb4AO1EclkgSUzvSfkHVk68JDuk=;
 b=tAi4AVtjXoj/8NPAIc7akq60clvIHHx90+L+Dk3CFK1ebxgk2QBUwq6Pc35ezSaC2noB
 fZ064wqWeTDdbXClRUMWT6cwgCAopXWqtBbJgibmWrliU0wC/Yuu7cHiWbvZu7tuortZ
 QboNBmavnJ1UypW9l9aVMmr0M4XxZNYX+5+UKSTCtE5gdWSTr8wTLYJddu4w4YkOnK6q
 mAZ9wrtDFeTBa1mXLTQOMO2CXSaJwHko5g+6Yd2wCtVaJ/MMScWkRT7YKwv3yFnkxTZu
 5EykcDAMeQDCUs5SS3AJuOG40jMQeLmst34mDFQO8N60kDq4UnOqdnMWWzRuJthgWRJQ 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35acbkvan9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 12:55:10 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8Hp2e4068521;
 Tue, 8 Dec 2020 12:55:10 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35acbkvamw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 12:55:10 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8HmN28028430;
 Tue, 8 Dec 2020 17:55:09 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3581u97t4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 17:55:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8Ht8SX14090636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 17:55:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57D5ABE053;
 Tue,  8 Dec 2020 17:55:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 149F7BE051;
 Tue,  8 Dec 2020 17:55:07 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 17:55:07 +0000 (GMT)
Subject: Re: [PATCH] tpm: tpm_spapr: Remove unused tracepoint
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20201207064352.16167-1-r.bolshakov@yadro.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <a6c0b44f-764c-3237-87e5-0a5b2663c911@linux.ibm.com>
Date: Tue, 8 Dec 2020 12:55:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201207064352.16167-1-r.bolshakov@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_14:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 1:43 AM, Roman Bolshakov wrote:
> Linking of qemu-system-ppc64 fails on macOS with dtrace enabled:
>
>    error: probe tpm_spapr_show_buffer doesn't exist
>    error: Could not register probes
>    ld: error creating dtrace DOF section for architecture x86_64
>
> The failure is explained in 8c8ed03850208e4 ("net/colo: Match is-enabled
> probe to tracepoint"). In short, is-enabled probe can't be used without
> a matching trace probe. And for this particular case
> tpm_util_show_buffer probe should be enabled to print TPM buffer.
>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>   hw/tpm/tpm_spapr.c  | 8 ++------
>   hw/tpm/trace-events | 1 -
>   2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
> index e3775adc57..dea7b1333b 100644
> --- a/hw/tpm/tpm_spapr.c
> +++ b/hw/tpm/tpm_spapr.c
> @@ -93,9 +93,7 @@ struct SpaprTpmState {
>    */
>   static void tpm_spapr_tpm_send(SpaprTpmState *s)
>   {
> -    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
> -        tpm_util_show_buffer(s->buffer, s->be_buffer_size, "To TPM");
> -    }
> +    tpm_util_show_buffer(s->buffer, s->be_buffer_size, "To TPM");
>
>       s->state = SPAPR_VTPM_STATE_EXECUTION;
>       s->cmd = (TPMBackendCmd) {
> @@ -255,9 +253,7 @@ static void tpm_spapr_request_completed(TPMIf *ti, int ret)
>       rc = spapr_vio_dma_write(&s->vdev, be32_to_cpu(crq->data),
>                                s->buffer, len);
>
> -    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
> -        tpm_util_show_buffer(s->buffer, len, "From TPM");
> -    }
> +    tpm_util_show_buffer(s->buffer, len, "From TPM");
>
>       crq->valid = SPAPR_VTPM_MSG_RESULT;
>       if (rc == H_SUCCESS) {
> diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
> index 266de17d38..6005ecb5da 100644
> --- a/hw/tpm/trace-events
> +++ b/hw/tpm/trace-events
> @@ -25,7 +25,6 @@ tpm_tis_pre_save(uint8_t locty, uint32_t rw_offset) "locty: %d, rw_offset = %u"
>   tpm_ppi_memset(uint8_t *ptr, size_t size) "memset: %p %zu"
>
>   # tpm_spapr.c
> -tpm_spapr_show_buffer(const char *direction, size_t len, const char *buf) "direction: %s len: %zu\n%s"
>   tpm_spapr_do_crq(uint8_t raw1, uint8_t raw2) "1st 2 bytes in CRQ: 0x%02x 0x%02x"
>   tpm_spapr_do_crq_crq_result(void) "SPAPR_VTPM_INIT_CRQ_RESULT"
>   tpm_spapr_do_crq_crq_complete_result(void) "SPAPR_VTPM_INIT_CRQ_COMP_RESULT"

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


