Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94D47BD31
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 10:47:49 +0100 (CET)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzbkK-0008BY-BJ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 04:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mzbhP-0006DO-6y; Tue, 21 Dec 2021 04:44:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19866
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mzbhM-0003np-VK; Tue, 21 Dec 2021 04:44:46 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BL9SWKL023108; 
 Tue, 21 Dec 2021 09:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5ujk2FARiXupktfxy9OINCtysksyilF2r0L8u7wtK0w=;
 b=h0pry/3g6zgPvYT6mMwPF5WPMiEE51x33dypuCy1aczoXYfkdo+gQnQ0XrTABqwF119R
 XZ2eb5XBFdz+QpS4Ivoc2d3tPs/c+UmGEoTaN0Bb2pZjy9cEJmh5W7ePeH1V2hqXkE/+
 Bst2HdGvII81btBwaCHrOKxUIps7orBe3++V/ezKogeeQsEdoK+w0PHXZPTVDWFYWFeL
 +vFOM2RwQmxNNYD7171FHbCN+pAaxpY1UXU+vdfiwkP3VqzNhDRyKLVND9XEUJxXO8Oe
 ukL5Qx8A04I6KRnqAfcAZPiALSkTUkK8/jH4COXWj8a8qT2feXduDHR9KXpkzFLlLhdR wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1s2jscha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 09:44:41 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BL9epUP031588;
 Tue, 21 Dec 2021 09:44:41 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1s2jscgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 09:44:41 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BL9grXe017061;
 Tue, 21 Dec 2021 09:44:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3d16wjty98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 09:44:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BL9iaNl46858608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 09:44:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 279D0A4040;
 Tue, 21 Dec 2021 09:44:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1A6EA404D;
 Tue, 21 Dec 2021 09:44:35 +0000 (GMT)
Received: from [9.171.0.148] (unknown [9.171.0.148])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Dec 2021 09:44:35 +0000 (GMT)
Message-ID: <0ee8f9c0-9ebd-0fcd-3c5a-502d6ac41c32@linux.ibm.com>
Date: Tue, 21 Dec 2021 10:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH RFC] MAINTAINERS: split out s390x sections
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20211220115419.308463-1-cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20211220115419.308463-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dfabY11NseWtExeUjgnMqpsVhOgnShiQ
X-Proofpoint-ORIG-GUID: Tc5eYCpVp3qS8FJiezbK6NUTPQUcZf0f
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_03,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210042
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 20.12.21 um 12:54 schrieb Cornelia Huck:
> Split out some more specialized devices etc., so that we can build
> smarter lists of people to be put on cc: in the future.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>

That should help to get additional maintainers (in add-on patches) added.
Letsa go with this split - we can fix and improve things anytime.
> ---
> 
> As discussed offlist. Some notes:
> - The new sections have inherited the maintainers of the sections
>    they have been split out of (except where people had already
>    volunteered). That's easy to change, obviously, and I hope that
>    the cc: list already contains people who might have interest in
>    volunteering for some sections.
> - I may not have gotten the F: patterns correct, please double check.
> - I'm also not sure about where in the MAINTAINERS file the new
>    sections should go; if you have a better idea, please speak up.
> - Also, if you have better ideas regarding the sections, please
>    speak up as well :)
> - Pull requests will probably continue the same way as now (i.e.
>    patches picked up at the top level and then sent, except for some
>    things like tcg which may go separately.) Not sure if it would
>    make sense to try out the submaintainer pull request model again,
>    I don't think it made life easier in the past, and now we have
>    the b4 tool to pick patches easily anyway. It might be a good
>    idea to check which of the tree locations should stay, or if we
>    want to have new ones.
> 
> ---
>   MAINTAINERS | 86 ++++++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 75 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a8d1bdf727d..d1916f075386 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -297,7 +297,6 @@ M: David Hildenbrand <david@redhat.com>
>   S: Maintained
>   F: target/s390x/
>   F: target/s390x/tcg
> -F: target/s390x/cpu_models_*.[ch]
>   F: hw/s390x/
>   F: disas/s390.c
>   F: tests/tcg/s390x/
> @@ -396,16 +395,10 @@ M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
>   F: target/s390x/kvm/
> -F: target/s390x/ioinst.[ch]
>   F: target/s390x/machine.c
>   F: target/s390x/sigp.c
> -F: target/s390x/cpu_features*.[ch]
> -F: target/s390x/cpu_models.[ch]
>   F: hw/s390x/pv.c
>   F: include/hw/s390x/pv.h
> -F: hw/intc/s390_flic.c
> -F: hw/intc/s390_flic_kvm.c
> -F: include/hw/s390x/s390_flic.h
>   F: gdb-xml/s390*.xml
>   T: git https://github.com/borntraeger/qemu.git s390-next
>   L: qemu-s390x@nongnu.org
> @@ -1529,12 +1522,8 @@ S390 Virtio-ccw
>   M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
> -F: hw/char/sclp*.[hc]
> -F: hw/char/terminal3270.c
>   F: hw/s390x/
>   F: include/hw/s390x/
> -F: hw/watchdog/wdt_diag288.c
> -F: include/hw/watchdog/wdt_diag288.h
>   F: configs/devices/s390x-softmmu/default.mak
>   F: tests/avocado/machine_s390_ccw_virtio.py
>   T: git https://github.com/borntraeger/qemu.git s390-next
> @@ -1559,6 +1548,80 @@ F: hw/s390x/s390-pci*
>   F: include/hw/s390x/s390-pci*
>   L: qemu-s390x@nongnu.org
>   
> +S390 channel subsystem
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/ccw-device.[ch]
> +F: hw/s390x/css.c
> +F: hw/s390x/css-bridge.c
> +F: include/hw/s390x/css.h
> +F: include/hw/s390x/css-bridge.h
> +F: include/hw/s390x/ioinst.h
> +F: target/s390x/ioinst.c
> +L: qemu-s390x@nongnu.org
> +
> +3270 device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Odd fixes
> +F: include/hw/s390x/3270-ccw.h
> +F: hw/char/terminal3270.c
> +F: hw/s390x/3270-ccw.c
> +L: qemu-s390x@nongnu.org
> +
> +diag 288 watchdog
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/watchdog/wdt_diag288.c
> +F: include/hw/watchdog/wdt_diag288.h
> +L: qemu-s390x@nongnu.org
> +
> +S390 CPU models
> +M: David Hildenbrand <david@redhat.com>
> +S: Maintained
> +F: target/s390x/cpu_features*.[ch]
> +F: target/s390x/cpu_models.[ch]
> +L: qemu-s390x@nongnu.org
> +
> +S390 storage key device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/storage-keys.h
> +F: hw/390x/s390-skeys*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 storage attribute device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/storage-attributes.h
> +F: hw/s390/s390-stattrib*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 SCLP-backed devices
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: include/hw/s390x/event-facility.h
> +F: include/hw/s390x/sclp.h
> +F: hw/char/sclp*.[hc]
> +F: hw/s390x/event-facility.c
> +F: hw/s390x/sclp*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 floating interrupt controller
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +M: David Hildenbrand <david@redhat.com>
> +S: Supported
> +F: hw/intc/s390_flic.c
> +F: hw/intc/s390_flic_kvm.c
> +F: include/hw/s390x/s390_flic.h
> +L: qemu-s390x@nongnu.org
> +
>   X86 Machines
>   ------------
>   PC
> @@ -1957,6 +2020,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/virtio-ccw*.[hc]
>   F: hw/s390x/vhost-vsock-ccw.c
> +F: hw/s390x/vhost-user-fs-ccw.c
>   T: git https://gitlab.com/cohuck/qemu.git s390-next
>   T: git https://github.com/borntraeger/qemu.git s390-next
>   L: qemu-s390x@nongnu.org
> 

