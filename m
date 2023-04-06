Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90B6D994F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 16:15:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkQMy-0003Le-JD; Thu, 06 Apr 2023 10:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkQMw-0003LV-4B
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:13:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkQMt-0006TK-5j
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:13:41 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336D3pIR011934; Thu, 6 Apr 2023 14:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZzclgH5FUPvaNfXJGtOt4d/gBTNOKJeoVhRcBstwChI=;
 b=cyVpn8MVwYZ3spHGCJOuiqM4VqZQEO7jMTrSFe67pjJio6oWedzi2bQx0FIZibo1tY9B
 1qw3OoXUFMZ9ZgwItZyoar+Iq9uVvI+OreSuB0nVJJcW2C9K3AHvHoLB/N/kOR6t20a0
 40uiAxXp72fvzPwfbSskORw5vLs4yfQQy4cxbGadwKeWBzyRcFNqb5hm9+jR8o0jH7ZQ
 /72i0x+90Ba2/rLWMr058nQOzzZTyJZ4l4/csKDTZuGyxF+ZaIUldeQwoPgi7Iy+pwup
 MDLcKt9NGG3MTCkg1CjqnQCAiZN4vuTiuyuF2JWNRT6rksD2kWzHhB0CZTaAahHCcu+x hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3psta9gd3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 14:13:35 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336DNpv4025806;
 Thu, 6 Apr 2023 14:13:34 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3psta9gd3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 14:13:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 336Cck7o022336;
 Thu, 6 Apr 2023 14:13:33 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3ppc88smp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 14:13:33 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336EDWhN41419236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 14:13:32 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4E105803F;
 Thu,  6 Apr 2023 14:13:32 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 567C758056;
 Thu,  6 Apr 2023 14:13:32 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 14:13:32 +0000 (GMT)
Message-ID: <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com>
Date: Thu, 6 Apr 2023 10:13:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
 <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
 <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UsqThuXjHh8CC-t6s5G1qjXPegGzYSME
X-Proofpoint-ORIG-GUID: 3j3_cauw9tzog8p6VkQqFWIjLpfNgTNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_06,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304060124
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 4/6/23 09:17, Peter Maydell wrote:
> On Thu, 6 Apr 2023 at 14:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 13 Mar 2023 at 11:47, <marcandre.lureau@redhat.com> wrote:
>>>
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> This can help debugging issues or develop, when error handling is
>>> introduced.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>>> Message-Id: <20230221124802.4103554-6-marcandre.lureau@redhat.com>
>>
>> Hi; Coverity points out that this introduces a use-after-free
>> (CID 1507493):
> 
> ...and also CID 1508179 (same issue, just one warning about the
> callsite in error_setv() and one about the callsite in
> error_propagate()).
> 
> thanks
> -- PMM
> 

I'll be out starting tomorrow. I don't see Marc-André online.

Would this be acceptable?
It ensures that if error_handle() returns, err has been freed.
In the other two cases a copy is being made of the Error that can then be used after the error_handle() call.


diff --git a/util/error.c b/util/error.c
index 5537245da6..7a2296e969 100644
--- a/util/error.c
+++ b/util/error.c
@@ -46,6 +46,8 @@ static void error_handle(Error **errp, Error *err)
      }
      if (errp == &error_warn) {
          warn_report_err(err);
+    } else {
+        error_free(err);
      }
  }

@@ -55,7 +57,7 @@ static void error_setv(Error **errp,
                         ErrorClass err_class, const char *fmt, va_list ap,
                         const char *suffix)
  {
-    Error *err;
+    Error *err, *err_bak;
      int saved_errno = errno;

      if (errp == NULL) {
@@ -75,8 +77,10 @@ static void error_setv(Error **errp,
      err->line = line;
      err->func = func;

+    err_bak = error_copy(err);
      error_handle(errp, err);
-    *errp = err;
+
+    *errp = err_bak;

      errno = saved_errno;
  }
@@ -285,14 +289,14 @@ void error_free_or_abort(Error **errp)

  void error_propagate(Error **dst_errp, Error *local_err)
  {
+    Error *local_err_bak;
      if (!local_err) {
          return;
      }
+    local_err_bak = error_copy(local_err);
      error_handle(dst_errp, local_err);
      if (dst_errp && !*dst_errp) {
-        *dst_errp = local_err;
-    } else {
-        error_free(local_err);
+        *dst_errp = local_err_bak;
      }
  }


