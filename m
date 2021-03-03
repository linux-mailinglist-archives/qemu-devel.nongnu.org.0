Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242A32B8A8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:38:45 +0100 (CET)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSeC-0001HK-00
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lHScZ-0000IW-8I; Wed, 03 Mar 2021 09:37:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lHScX-0007dF-1M; Wed, 03 Mar 2021 09:37:02 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123EXP69143119; Wed, 3 Mar 2021 09:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Evb1gUXe+Q3wJtuA09/9IzlrzNWHiQi/ExszBl5+qHo=;
 b=XGLTmjCwqs5A152JFdDiUxXjHhM3OhpBpUw2FkLB+Kyfl3Uc7xUytBF36bwP6uBKQZgK
 /6Nnk3EIfBZrGrT51dC0FOYpuAmSvyijD+hsvHuaWoFTJlnPV1XzHQDbjEFf4QUK5csa
 4ro2ewbxQgKZqHTOA2K6Rl1JEZdygbkpp1noNaRZX4vtnAROjJ0Nnzlsx9kBUmZwPMoh
 cqn0Fb/7MEts6cQREzkSh6ds7aobCaZd2SQaRUP8pZ7nIgmLuiW6UpJCs0LH3GsFQ5TP
 12XzNC+jh3FQaCC4B+OYKXLg2e9vovkcaqhD9mUlh6bTwvqhm0iiPQpvRDJTkb7HaeR2 Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372c1qgy95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 09:36:58 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 123EXZDh144073;
 Wed, 3 Mar 2021 09:36:57 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372c1qgy65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 09:36:57 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123EX6cP031818;
 Wed, 3 Mar 2021 14:36:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 37150crwsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 14:36:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 123Eabek37486864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 14:36:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A8F9A4051;
 Wed,  3 Mar 2021 14:36:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86D73A4053;
 Wed,  3 Mar 2021 14:36:50 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.0.197])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  3 Mar 2021 14:36:50 +0000 (GMT)
Date: Wed, 3 Mar 2021 15:36:47 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210303153647.626d9aa6.pasic@linux.ibm.com>
In-Reply-To: <20210303070750.etddrd7duu5ep77l@sirius.home.kraxel.org>
References: <20210222125548.346166-1-pasic@linux.ibm.com>
 <20210224113617.6v42bfxyzvw6733h@sirius.home.kraxel.org>
 <20210224174634.58a1ecda.pasic@linux.ibm.com>
 <20210225221451.5c20c42d.pasic@linux.ibm.com>
 <20210303070750.etddrd7duu5ep77l@sirius.home.kraxel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_04:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 08:07:50 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > The only approaches I can think of to make type_register_mayfail()
> > "work" involve adding a dependency check in type_register_internal()
> > before the call to type_table_add() is made. This can "work" for modules,
> > because for types loaded from we can hope, that all dependencies are
> > already, as modules are loaded relatively late.  
> 
> Yes, for modules the lazy binding should not be needed and we should be
> able to check for the parent at registration time.  module.c keeps track
> of whenever phase1 init for builtin qom objects did happen already, so
> we can use that instead of passing mayfail through a bunch of function
> calls.  Quick & dirty test hack below.

Hi Gerd! Thank you very much for your patience. I've sent out a v3 yesterday,
which takes a similar, yet slightly different approach. I will comment
on the proposed diff below. Could you please have a look at my v3? I
would prefer if we can go forward with that solution, but I am more than
willing to prepare a v4 based on this proposal.


> 
> BTW: "qemu-system-x86_64 -device help" tries to load all modules and is
> a nice test case ;)

Yes, I've reported the problem in 
Message-ID: <20210219035206.730f145e.pasic@linux.ibm.com>
using that, for the trace I took -device virtio-gpu-ccw because
the trace looked nicer to me. ;)

> 
> HTH,
>   Gerd
> 
> commit 75ca3012e626318b562bcb51ecdc34400e25f2d0
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Mar 2 16:26:39 2021 +0100
> 
>     [hack] modular type init check
> 
> diff --git a/qom/object.c b/qom/object.c
> index 491823db4a2d..01785e73f495 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -135,11 +135,22 @@ static TypeImpl *type_new(const TypeInfo *info)
>      return ti;
>  }
>  
> +/* HACK: util/module.c */
> +extern bool modules_init_done[MODULE_INIT_MAX];
> +static TypeImpl *type_get_by_name(const char *name);
> +
>  static TypeImpl *type_register_internal(const TypeInfo *info)
>  {
>      TypeImpl *ti;
>      ti = type_new(info);
>  
> +    if (modules_init_done[MODULE_INIT_QOM]) {
> +        if (ti->parent && !type_get_by_name(ti->parent)) {
> +            g_free(ti);

The function type_new() has some g_strdup() action. We would need a
type_delete() in order to clean those up properly if we are taking
this approach. In v3 I decided to check the info, and avoid instantiating
a ti so I don't have to clean it up.

> +            return NULL;
> +        }
> +    }
> +

This would change the postcondition of the type_register*() familiy
of functions. It effectively  makes type_register_*() a 'mayfail'
depending on a global state, which is
modules_init_done[MODULE_INIT_QOM].  It affects all modules. IMHO we should also update the documentation if we decide to move forward with this approach.

I will give this a spin later.

Please have a look at my v3 and let us decide how to move forward based
on that.

Regards,
Halil

[..]

