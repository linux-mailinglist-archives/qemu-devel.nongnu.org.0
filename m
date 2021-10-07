Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E224425840
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:44:42 +0200 (CEST)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWVd-0000Ir-2l
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mYWFx-0008NS-Vo
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:28:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mYWFs-0006q6-F1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:28:29 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197GKNTr008023; 
 Thu, 7 Oct 2021 12:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SxfBzTDZ5aBiiFI/Cnc99nu3wvV9Q/JspjLdOCuAnM4=;
 b=myqnlDPHrCsdAZWNQ8ymZCWx+pj1kyvhp+ydTDUTTdHIg5DTAyJ53MGqnbdZIJizJNKD
 Nd+yYJAoUPT2DtB7jfDydevETeBn42SduhEz0AnJ5t1qBP3UzG5S0FDymN3NSTKcaSYY
 pUA2UzMigMwQ8YIDMwhOq4zTgJoRpAdA1mkznuslbG7peVrMEX+Yuk0ItDq/B33cqhYh
 No0fMjlTq7F/Y7urGyXB18KIEwc0WP4q4Ja6gwzzNWUKYphIZ27I+llp+1Cv+zTcYFM7
 srvZV0GV2dJWDRul8FMlOkzL44jV62jZrz7QPNs9FAcpiX8SpM1QFjA5GYMHCerK0CWA aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bj1f0n1r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 12:28:19 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 197GLWGB010519;
 Thu, 7 Oct 2021 12:28:19 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bj1f0n1qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 12:28:18 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 197GCQX3018228;
 Thu, 7 Oct 2021 16:28:17 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3bef2crgdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 16:28:17 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 197GSG0831392188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Oct 2021 16:28:16 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B6E5C605D;
 Thu,  7 Oct 2021 16:28:16 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E6E6C60AE;
 Thu,  7 Oct 2021 16:28:13 +0000 (GMT)
Received: from [9.65.95.104] (unknown [9.65.95.104])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  7 Oct 2021 16:28:13 +0000 (GMT)
Subject: Re: [PATCH v4 12/23] target/i386/sev: Use g_autofree in
 sev_launch_get_measure()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-13-philmd@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <73fbdf51-411c-71da-56bf-644ee45a1cbe@linux.ibm.com>
Date: Thu, 7 Oct 2021 19:28:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007161716.453984-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OtWHWiWOWmXOlkGgVpoBXa-2vMLXB--S
X-Proofpoint-GUID: vQeiGY5naMuTDVFN9F9rQiZ__IimUtAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_02,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070105
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 19:17, Philippe Mathieu-Daudé wrote:
> Use g_autofree to remove a pair of g_free/goto.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/sev.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 3a30ba6d94a..5cbbcf0bb93 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -685,8 +685,8 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>  {
>      SevGuestState *sev = sev_guest;
>      int ret, error;
> -    guchar *data;
> -    struct kvm_sev_launch_measure *measurement;
> +    g_autofree guchar *data = NULL;
> +    g_autofree struct kvm_sev_launch_measure *measurement = NULL;

Sorry for joining so late, but why do we allocate struct
kvm_sev_launch_measure on the heap (even before this patch)? It's only
12 bytes. Might be simpler to have a local (stack) variable and not care
about memory management.

-Dov


>  
>      if (!sev_check_state(sev, SEV_STATE_LAUNCH_UPDATE)) {
>          return;
> @@ -708,7 +708,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>      if (!measurement->len) {
>          error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
>                       __func__, ret, error, fw_error_to_str(errno));
> -        goto free_measurement;
> +        return;
>      }
>  
>      data = g_new0(guchar, measurement->len);
> @@ -720,7 +720,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>      if (ret) {
>          error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
>                       __func__, ret, error, fw_error_to_str(errno));
> -        goto free_data;
> +        return;
>      }
>  
>      sev_set_guest_state(sev, SEV_STATE_LAUNCH_SECRET);
> @@ -728,11 +728,6 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>      /* encode the measurement value and emit the event */
>      sev->measurement = g_base64_encode(data, measurement->len);
>      trace_kvm_sev_launch_measurement(sev->measurement);
> -
> -free_data:
> -    g_free(data);
> -free_measurement:
> -    g_free(measurement);
>  }
>  
>  char *
> 

