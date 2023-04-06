Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D36D9B79
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:00:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkR6D-0003dO-Pl; Thu, 06 Apr 2023 11:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkR69-0003XP-E4
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:00:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkR66-0007Cy-Ll
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:00:24 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336EwY6o026380; Thu, 6 Apr 2023 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ppmTb7bOqloop2C4fYOYZT4N9waaoksU5QSwJNNPoHk=;
 b=ktoAwjN9oI+FV6ZxePcku2nROMZ0a3OSpRQTmW2PNFmo+KbcvKn/jFoX3gYx8fwdiqbb
 pe/nIzJ9XZkXYgZRG24L82Ar0A+9jgeZqhYLGMzHGoCoeB+LLTgvLancOti+vvSachWP
 vMqXkHrDyho0yoEHTXk+dTLpB+wza2uMbfD4iQiVvRFMUujOOB606ejzC9VRXYw/kg5b
 GL2DFndW1RiGEpVJPwQOiDqTJDN/VxgWu+26ZEAShJBlH2xXE5N8Wkm+AV4XJBazKJJW
 4pdgW8zS+hTTKY6Mg0rSvua8Wvb/NhNiNCUQ+XQAo+31d73TC6UA4+CVIVY2WMUIZTJm 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3psyqeh605-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 15:00:18 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336EwdOA027060;
 Thu, 6 Apr 2023 15:00:13 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3psyqeh5y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 15:00:13 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 336D3Cjw031588;
 Thu, 6 Apr 2023 15:00:12 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3ppc88htwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 15:00:12 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336F0BHA30605606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 15:00:11 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20C315804E;
 Thu,  6 Apr 2023 15:00:11 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2100858062;
 Thu,  6 Apr 2023 15:00:10 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 15:00:09 +0000 (GMT)
Message-ID: <328a2ae2-ca27-0dee-6fae-7536128955bd@linux.ibm.com>
Date: Thu, 6 Apr 2023 11:00:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
 <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
 <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
 <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com>
 <CAFEAcA_Sagzoqy+GcdPgFyGLG9zenxWWFknzMz+gSrMPVuSsDQ@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAFEAcA_Sagzoqy+GcdPgFyGLG9zenxWWFknzMz+gSrMPVuSsDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JSKHNVM3vhVphF7vs-Akt2MlJm5l9rVW
X-Proofpoint-ORIG-GUID: ep7-ZIaT72VCFcH3x0LqR48Q9pmbtDq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_08,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060129
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



On 4/6/23 10:36, Peter Maydell wrote:
> On Thu, 6 Apr 2023 at 15:13, Stefan Berger <stefanb@linux.ibm.com> wrote:
>> I'll be out starting tomorrow. I don't see Marc-André online.
>>
>> Would this be acceptable?
>> It ensures that if error_handle() returns, err has been freed.
>> In the other two cases a copy is being made of the Error that can then be used after the error_handle() call.
> 
> "Not error_warn" is the common case, so it doesn't seem
> great to copy the error around like that. My thoughts were
> either:
>   (1) error_handle() should handle all of the error cases,
> like this:
> 
>      if (errp == &error_abort) {
>         ...
>         abort();
>      }
>      if (errp == &error_fatal) {
>         ...
>         exit(1);
>      }
>      if (errp = &error_warn) {
>          warn_report_err(err);
>      } else if (errp && !*errp) {
>          *errp = err;
>      } else {
>          error_free(err);
>      }
> 
> and delete the "set *errp" logic from the callers.


Like this?

diff --git a/util/error.c b/util/error.c
index 5537245da6..e5e247209a 100644
--- a/util/error.c
+++ b/util/error.c
@@ -46,6 +46,10 @@ static void error_handle(Error **errp, Error *err)
      }
      if (errp == &error_warn) {
          warn_report_err(err);
+    } else if (errp && !*errp) {
+        *errp = err;
+    } else {
+        error_free(err);
      }
  }

@@ -76,7 +80,6 @@ static void error_setv(Error **errp,
      err->func = func;

      error_handle(errp, err);
-    *errp = err;

      errno = saved_errno;
  }
@@ -289,11 +292,6 @@ void error_propagate(Error **dst_errp, Error *local_err)
          return;
      }
      error_handle(dst_errp, local_err);
-    if (dst_errp && !*dst_errp) {
-        *dst_errp = local_err;
-    } else {
-        error_free(local_err);
-    }
  }

  void error_propagate_prepend(Error **dst_errp, Error *err,



> 
> (note that error_setv() has done checks already that mean it
> will always take the "(errp && !*errp)" path, so we don't need
> to special-case for which caller this was.)
> 
> (2) error_handle() should return a bool to say whether it's handled
> the error entirely and the callsite should do nothing further

> with it.
> 
> I prefer (1) I think but would defer to people with more
> experience with the Error APIs.
> 
> thanks
> -- PMM

