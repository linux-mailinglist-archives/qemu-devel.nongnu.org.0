Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A982C5FD7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 06:43:13 +0100 (CET)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiWXH-00069L-K2
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 00:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1kiWWI-0005io-Nn; Fri, 27 Nov 2020 00:42:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1kiWWG-0006Fx-Lt; Fri, 27 Nov 2020 00:42:10 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR5WNiH184759; Fri, 27 Nov 2020 00:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=oc/RZtn1v9qpD3Flopm2nTXpBpCScyPH6DG7FnRg670=;
 b=lce7Fv5a5Kcm6aPndAo81z78UwBDsBj7oATj15lBs7SfDnTh92efDBhT8f+hmbhdMlnJ
 PWkKRP1u9zShas0k4Gp1h2PbqcUxjM9JOkfayIEUJpcGmNIJ5crND6B+tp+NGHMZciG0
 gUHXLIuMBATU/+vTI1HFhBoWjFHtLiwIU0+l21qmHGoEwqfnlMS7zQlTGVWVT/ehwiI2
 r+zZ20DX1GT6eDHlNcTdOzPN0jTLKoS54wqJ0HOEV4RztYGdaQAN9aIDqV++iwr9sMrx
 a4mmnxxXKyUYCVc+W09CfK8tR+xK2oF1X72jnNH8vThixD8B7W/kFF/f3HdtPFzYybqE qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352u8a8ats-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 00:42:02 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AR5d4L9036202;
 Fri, 27 Nov 2020 00:42:02 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352u8a8asv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 00:42:02 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR5ceVw032304;
 Fri, 27 Nov 2020 05:41:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 352ata0da5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 05:41:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR5fvkG40960386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 05:41:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F027D11C054;
 Fri, 27 Nov 2020 05:41:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C15A11C04A;
 Fri, 27 Nov 2020 05:41:55 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.69.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 27 Nov 2020 05:41:55 +0000 (GMT)
Date: Fri, 27 Nov 2020 11:11:52 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] spapr: drc: Add support for async hcalls at the
 drc level
Message-ID: <20201127054152.GB72234@in.ibm.com>
References: <160637722874.1977658.13777818163262816915.stgit@lep8c.aus.stglabs.ibm.com>
 <160637728389.1977658.13576068142432992889.stgit@lep8c.aus.stglabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160637728389.1977658.13576068142432992889.stgit@lep8c.aus.stglabs.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 suspectscore=5 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270028
Received-SPF: pass client-ip=148.163.156.1; envelope-from=bharata@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: bharata@linux.ibm.com
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, qemu-devel@nongnu.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com,
 imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 01:54:55AM -0600, Shivaprasad G Bhat wrote:
> The patch adds support for async hcalls at the DRC level for the
> spapr devices. To be used by spapr-scm devices in the patch/es to follow.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  hw/ppc/spapr_drc.c         |  146 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr_drc.h |   25 ++++++++
>  2 files changed, 171 insertions(+)
> 
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 77718cde1f..2cecccf701 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -15,6 +15,7 @@
>  #include "qapi/qmp/qnull.h"
>  #include "cpu.h"
>  #include "qemu/cutils.h"
> +#include "qemu/guest-random.h"
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
>  #include "migration/vmstate.h"
> @@ -421,6 +422,145 @@ void spapr_drc_detach(SpaprDrc *drc)
>      spapr_drc_release(drc);
>  }
> 
> +
> +/*
> + * @drc : device DRC targetting which the async hcalls to be made.
> + *
> + * All subsequent requests to run/query the status should use the
> + * unique token returned here.
> + */
> +uint64_t spapr_drc_get_new_async_hcall_token(SpaprDrc *drc)
> +{
> +    Error *err = NULL;
> +    uint64_t token;
> +    SpaprDrcDeviceAsyncHCallState *tmp, *next, *state;
> +
> +    state = g_malloc0(sizeof(*state));
> +    state->pending = true;
> +
> +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> +retry:
> +    if (qemu_guest_getrandom(&token, sizeof(token), &err) < 0) {
> +        error_report_err(err);
> +        g_free(state);
> +        return 0;
> +    }

Returning w/o releasing the lock.

> +
> +    if (!token) /* Token should be non-zero */
> +        goto retry;
> +
> +    if (!QLIST_EMPTY(&drc->async_hcall_states)) {
> +        QLIST_FOREACH_SAFE(tmp, &drc->async_hcall_states, node, next) {
> +            if (tmp->continue_token == token) {
> +                /* If the token already in use, get a new one */
> +                goto retry;
> +            }
> +        }
> +    }
> +
> +    state->continue_token = token;
> +    QLIST_INSERT_HEAD(&drc->async_hcall_states, state, node);
> +
> +    qemu_mutex_unlock(&drc->async_hcall_states_lock);
> +
> +    return state->continue_token;
> +}
> +
> +static void *spapr_drc_async_hcall_runner(void *opaque)
> +{
> +    int response = -1;
> +    SpaprDrcDeviceAsyncHCallState *state = opaque;
> +
> +    /*
> +     * state is freed only after this thread finishes(after pthread_join()),
> +     * don't worry about it becoming NULL.
> +     */
> +
> +    response = state->func(state->data);
> +
> +    state->hcall_ret = response;
> +    state->pending = 0;
> +
> +    return NULL;
> +}
> +
> +/*
> + * @drc  : device DRC targetting which the async hcalls to be made.
> + * token : The continue token to be used for tracking as recived from
> + *         spapr_drc_get_new_async_hcall_token
> + * @func() : the worker function which needs to be executed asynchronously
> + * @data : data to be passed to the asynchronous function. Worker is supposed
> + *         to free/cleanup the data that is passed here
> + */
> +void spapr_drc_run_async_hcall(SpaprDrc *drc, uint64_t token,
> +                               SpaprDrcAsyncHcallWorkerFunc *func, void *data)
> +{
> +    SpaprDrcDeviceAsyncHCallState *state, *next;
> +
> +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> +    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, next) {
> +        if (state->continue_token == token) {
> +            state->func = func;
> +            state->data = data;
> +            qemu_thread_create(&state->thread, "sPAPR Async HCALL",
> +                               spapr_drc_async_hcall_runner, state,
> +                               QEMU_THREAD_JOINABLE);
> +            break;
> +        }
> +    }

Looks like QLIST_FOREACH should be enough here as you don't
seem to be removing any list entry in this path.

> +    qemu_mutex_unlock(&drc->async_hcall_states_lock);
> +}
> +
> +/*
> + * spapr_drc_finish_async_hcalls
> + *      Waits for all pending async requests to complete
> + *      thier execution and free the states
> + */
> +static void spapr_drc_finish_async_hcalls(SpaprDrc *drc)
> +{
> +    SpaprDrcDeviceAsyncHCallState *state, *next;
> +
> +    if (QLIST_EMPTY(&drc->async_hcall_states)) {
> +        return;
> +    }
> +
> +    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, next) {
> +        qemu_thread_join(&state->thread);
> +        QLIST_REMOVE(state, node);
> +        g_free(state);
> +    }
> +}

Why is it safe to iterate the list here w/o the lock?

Regards,
Bharata.

