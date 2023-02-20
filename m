Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4709569D05F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7rs-00022E-Bu; Mon, 20 Feb 2023 10:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pU7rl-00021R-8l; Mon, 20 Feb 2023 10:14:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pU7rj-0001k8-4B; Mon, 20 Feb 2023 10:14:09 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31KEO5mM024488; Mon, 20 Feb 2023 15:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=79hUVYpbDM3lLZw90LIujSkRErr78VoKJyXlRDJx/p0=;
 b=TgCfCbja6UXBN6drh++QoXr4/N3l1ooXTo/TIr92zFt5ZNjeIzVTnVtGw8ikPySWE/jG
 02Dk8VYx9PBLeZI9iP97/DrdCwb+tmVAFK4oHd0nb6O3SZVMBCfXQRvDkRxDs4u4Xung
 kIAgUXqooSbKKAe+CaVEqRB9qOTuaYt5BtsySXkzZ0CI+pdK67h9hFmXIvEBSIM+YLS3
 KVauqh0CyU5UDO2PyEMtdzJifxaTpEudU3maRak1xAmiV1V7kk1dhdBq1h8KsX2UP4YT
 8/F/1yirk61gVs4YDJBfPsJnoWSAv+xpSEOlEGB0S62fLxRC8ehql6ZnWhPL5NiedNXK 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nv96kbnu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 15:14:04 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31KDfwbc012902;
 Mon, 20 Feb 2023 15:14:03 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nv96kbnth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 15:14:03 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31KEuDIL018763;
 Mon, 20 Feb 2023 15:14:03 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3ntpa6nsxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 15:14:03 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31KFE1xl35783240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Feb 2023 15:14:01 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1426658062;
 Mon, 20 Feb 2023 15:14:01 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 817045805E;
 Mon, 20 Feb 2023 15:14:00 +0000 (GMT)
Received: from [9.160.99.184] (unknown [9.160.99.184])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Feb 2023 15:14:00 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------dCCUo7qlnoYpt2dCIfhGIBzg"
Message-ID: <62db22bc-2787-6c2d-6fad-9b4834ac12c4@linux.ibm.com>
Date: Mon, 20 Feb 2023 10:13:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/1] pc-bios: Support List-Directed IPL from ECKD DASD
Content-Language: en-US
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Cc: thuth@redhat.com, frankja@linux.ibm.com, jjherne@linux.ibm.com
References: <20230130212411.1167822-1-jrossi@linux.ibm.com>
From: Jared Rossi <jrossi@linux.ibm.com>
In-Reply-To: <20230130212411.1167822-1-jrossi@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CXaKXAjZ6OU5gh1Qr2YDgLOXG4WHFX6x
X-Proofpoint-ORIG-GUID: MOKzCzgQ-CwF_nVixLacNvN7FGsgS6qG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200138
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jrossi@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.09,
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

This is a multi-part message in MIME format.
--------------dCCUo7qlnoYpt2dCIfhGIBzg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Pinging this patch since v2.26.0 of s390-tools adds ECKD DASD list-directed IPL.
This patch set allows QEMU to utilize that new boot pointer format.
Any feedback about what needs to be changed for acceptance is much appreciated.

Thanks,
Jared Rossi

On 1/30/23 4:24 PM, Jared Rossi wrote:

> Add support for List-Directed IPL (LD-IPL) type pointers.
>
> We check for a boot record indicating LD-IPL and use it if it is valid,
> otherwise we use the CCW CDL or LDL format as usual. When a block is accessed
> during IPL the block number is first calculated based on the cylinder, head,
> and record numbers included in the block pointer; if LD-IPL has been initiated
> then each pointer will be interpreted using the new format.
>
> For simplicity, there is no choice presented to forcibly use CCW-IPL if LD-IPL
> is available.  Because both sets of pointers ultimately go to the same
> kernel/initrd, using CCW- or LD-IPL is transparent to the user.
>
> One aspect of the user experience that does change is the availability of the
> interactive boot menu when a loadparm is not specified.  For the existing
> CCW-IPL, when the user does not specify a loadparm they are presented with a
> list of boot options; however, this list is only written in the old style
> pointers.  Therefore, if no loadparm is specified, and LD-IPL is supported, the
> default boot option will be used automatically.
>
> Jared Rossi (1):
>    pc-bios: Add support for List-Directed IPL from ECKD DASD
>
>   pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
>   pc-bios/s390-ccw/bootmap.h |  30 ++++++-
>   2 files changed, 148 insertions(+), 39 deletions(-)
>
--------------dCCUo7qlnoYpt2dCIfhGIBzg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi,

Pinging this patch since v2.26.0 of s390-tools adds ECKD DASD list-directed IPL.
This patch set allows QEMU to utilize that new boot pointer format.
Any feedback about what needs to be changed for acceptance is much appreciated.

Thanks,
Jared Rossi</pre>
    <div class="moz-cite-prefix">
      <pre>On 1/30/23 4:24 PM, Jared Rossi wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20230130212411.1167822-1-jrossi@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Add support for List-Directed IPL (LD-IPL) type pointers.

We check for a boot record indicating LD-IPL and use it if it is valid,
otherwise we use the CCW CDL or LDL format as usual. When a block is accessed
during IPL the block number is first calculated based on the cylinder, head,
and record numbers included in the block pointer; if LD-IPL has been initiated
then each pointer will be interpreted using the new format.

For simplicity, there is no choice presented to forcibly use CCW-IPL if LD-IPL
is available.  Because both sets of pointers ultimately go to the same
kernel/initrd, using CCW- or LD-IPL is transparent to the user.

One aspect of the user experience that does change is the availability of the
interactive boot menu when a loadparm is not specified.  For the existing
CCW-IPL, when the user does not specify a loadparm they are presented with a
list of boot options; however, this list is only written in the old style
pointers.  Therefore, if no loadparm is specified, and LD-IPL is supported, the
default boot option will be used automatically.

Jared Rossi (1):
  pc-bios: Add support for List-Directed IPL from ECKD DASD

 pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
 pc-bios/s390-ccw/bootmap.h |  30 ++++++-
 2 files changed, 148 insertions(+), 39 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------dCCUo7qlnoYpt2dCIfhGIBzg--


