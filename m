Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B565269D143
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:22:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8v6-0004Cq-4v; Mon, 20 Feb 2023 11:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pU8v3-0004CP-U3; Mon, 20 Feb 2023 11:21:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pU8v1-0002IQ-P3; Mon, 20 Feb 2023 11:21:37 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31KGISeD001830; Mon, 20 Feb 2023 16:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=XubD5Qw/kR0VzSIbqrj/hgyN6jqCq0cpF1YhTNyUEvM=;
 b=KQePiOqtfo2GoBHn+bNeEjJEOl19p9etFFJHH6bbnypiufLomPfuT0+KOih2KuVQQFkk
 lGacveHzjMO4xoknKpf18olALs81oOmO9/51wnQtbuJIXGBsNGgxxanwWPdeLON7YMk2
 0MUAbaxEFnWsUm+4qsvgM3hJtX/Be5Zgj5eRDmHKTvWqIzdKGuXV0Pw1ahZ+cgTg9dSF
 TWb6ybOq5FMoXwBqQ4Z1bm3l+T5gzKH0bQAWB2dNqfttSOV5Itv61UdQVotKEzuCjlJE
 oa16RzyVGbG/iqOcMg70tKVmd5qdci0z6fe8f9JteuNss0ihVvrEJJoF8gH8jzrCzk2c QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nvc92g2fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 16:21:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31KGJO8i006110;
 Mon, 20 Feb 2023 16:21:32 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nvc92g2fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 16:21:32 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31KFJZNr014128;
 Mon, 20 Feb 2023 16:21:32 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3ntpa6x2um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 16:21:32 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31KGLUoB6423144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Feb 2023 16:21:30 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14B985805A;
 Mon, 20 Feb 2023 16:21:30 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90E2758051;
 Mon, 20 Feb 2023 16:21:29 +0000 (GMT)
Received: from [9.160.99.184] (unknown [9.160.99.184])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Feb 2023 16:21:29 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------uaz0ZyNf7rziCNYzcutSaeLa"
Message-ID: <eba35cef-32d1-69cd-2fc5-638880e2ee63@linux.ibm.com>
Date: Mon, 20 Feb 2023 11:21:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/1] pc-bios: Support List-Directed IPL from ECKD DASD
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: frankja@linux.ibm.com, jjherne@linux.ibm.com
References: <20230130212411.1167822-1-jrossi@linux.ibm.com>
 <62db22bc-2787-6c2d-6fad-9b4834ac12c4@linux.ibm.com>
 <837e025f-2307-225d-2b87-5f58ccda183a@redhat.com>
From: Jared Rossi <jrossi@linux.ibm.com>
In-Reply-To: <837e025f-2307-225d-2b87-5f58ccda183a@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yzr2jMSoM3sUrEthth4-bMYFbM65mo1i
X-Proofpoint-ORIG-GUID: t3hoz3UMqNWqr6C9y5p_qeLUVNXhOIVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200147
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jrossi@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
--------------uaz0ZyNf7rziCNYzcutSaeLa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/20/23 10:45 AM, Thomas Huth wrote:
> On 20/02/2023 16.13, Jared Rossi wrote:
>> Hi,
>>
>> Pinging this patch since v2.26.0 of s390-tools adds ECKD DASD 
>> list-directed IPL.
>> This patch set allows QEMU to utilize that new boot pointer format.
>> Any feedback about what needs to be changed for acceptance is much 
>> appreciated.
>
> Where did you send your patches to? I can't find it in neither my 
> qemu-s390x nor my qemu-devel mailing list folders.
>
>  Thomas

Hi Thomas,

I tried to send them toqemu-s390x@nongnu.org  andqemu-devel@nongnu.org  lists with some additional people (including you)
in CC.  The initial mail was on January 30th.  I can resend them if there was a problem with the delivery.

Regards,
Jared Rossi

>
>
>>
>> On 1/30/23 4:24 PM, Jared Rossi wrote:
>>
>>> Add support for List-Directed IPL (LD-IPL) type pointers.
>>>
>>> We check for a boot record indicating LD-IPL and use it if it is valid,
>>> otherwise we use the CCW CDL or LDL format as usual. When a block is 
>>> accessed
>>> during IPL the block number is first calculated based on the 
>>> cylinder, head,
>>> and record numbers included in the block pointer; if LD-IPL has been 
>>> initiated
>>> then each pointer will be interpreted using the new format.
>>>
>>> For simplicity, there is no choice presented to forcibly use CCW-IPL 
>>> if LD-IPL
>>> is available.  Because both sets of pointers ultimately go to the same
>>> kernel/initrd, using CCW- or LD-IPL is transparent to the user.
>>>
>>> One aspect of the user experience that does change is the 
>>> availability of the
>>> interactive boot menu when a loadparm is not specified.  For the 
>>> existing
>>> CCW-IPL, when the user does not specify a loadparm they are 
>>> presented with a
>>> list of boot options; however, this list is only written in the old 
>>> style
>>> pointers.  Therefore, if no loadparm is specified, and LD-IPL is 
>>> supported, the
>>> default boot option will be used automatically.
>>>
>>> Jared Rossi (1):
>>>    pc-bios: Add support for List-Directed IPL from ECKD DASD
>>>
>>>   pc-bios/s390-ccw/bootmap.c | 157 
>>> ++++++++++++++++++++++++++++---------
>>>   pc-bios/s390-ccw/bootmap.h |  30 ++++++-
>>>   2 files changed, 148 insertions(+), 39 deletions(-)
>>>
>
--------------uaz0ZyNf7rziCNYzcutSaeLa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 2/20/23 10:45 AM, Thomas Huth wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:837e025f-2307-225d-2b87-5f58ccda183a@redhat.com">On
      20/02/2023 16.13, Jared Rossi wrote:
      <br>
      <blockquote type="cite">Hi,
        <br>
        <br>
        Pinging this patch since v2.26.0 of s390-tools adds ECKD DASD
        list-directed IPL.
        <br>
        This patch set allows QEMU to utilize that new boot pointer
        format.
        <br>
        Any feedback about what needs to be changed for acceptance is
        much appreciated.
        <br>
      </blockquote>
      <br>
      Where did you send your patches to? I can't find it in neither my
      qemu-s390x nor my qemu-devel mailing list folders.
      <br>
      <br>
       Thomas
      <br>
    </blockquote>
    <pre>Hi Thomas,

I tried to send them to <a class="moz-txt-link-abbreviated" href="mailto:qemu-s390x@nongnu.org">qemu-s390x@nongnu.org</a> and <a class="moz-txt-link-abbreviated" href="mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a> lists with some additional people (including you)
in CC.  The initial mail was on January 30th.  I can resend them if there was a problem with the delivery.

Regards,
Jared Rossi
</pre>
    <blockquote type="cite"
      cite="mid:837e025f-2307-225d-2b87-5f58ccda183a@redhat.com">
      <br>
      <br>
      <blockquote type="cite">
        <br>
        On 1/30/23 4:24 PM, Jared Rossi wrote:
        <br>
        <br>
        <blockquote type="cite">Add support for List-Directed IPL
          (LD-IPL) type pointers.
          <br>
          <br>
          We check for a boot record indicating LD-IPL and use it if it
          is valid,
          <br>
          otherwise we use the CCW CDL or LDL format as usual. When a
          block is accessed
          <br>
          during IPL the block number is first calculated based on the
          cylinder, head,
          <br>
          and record numbers included in the block pointer; if LD-IPL
          has been initiated
          <br>
          then each pointer will be interpreted using the new format.
          <br>
          <br>
          For simplicity, there is no choice presented to forcibly use
          CCW-IPL if LD-IPL
          <br>
          is available.  Because both sets of pointers ultimately go to
          the same
          <br>
          kernel/initrd, using CCW- or LD-IPL is transparent to the
          user.
          <br>
          <br>
          One aspect of the user experience that does change is the
          availability of the
          <br>
          interactive boot menu when a loadparm is not specified.  For
          the existing
          <br>
          CCW-IPL, when the user does not specify a loadparm they are
          presented with a
          <br>
          list of boot options; however, this list is only written in
          the old style
          <br>
          pointers.  Therefore, if no loadparm is specified, and LD-IPL
          is supported, the
          <br>
          default boot option will be used automatically.
          <br>
          <br>
          Jared Rossi (1):
          <br>
             pc-bios: Add support for List-Directed IPL from ECKD DASD
          <br>
          <br>
            pc-bios/s390-ccw/bootmap.c | 157
          ++++++++++++++++++++++++++++---------
          <br>
            pc-bios/s390-ccw/bootmap.h |  30 ++++++-
          <br>
            2 files changed, 148 insertions(+), 39 deletions(-)
          <br>
          <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------uaz0ZyNf7rziCNYzcutSaeLa--


