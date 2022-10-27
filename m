Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28260EFB0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 07:55:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onvrA-0000OL-CG; Thu, 27 Oct 2022 01:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1onvqx-00072J-BV; Thu, 27 Oct 2022 01:54:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1onvqv-0004g7-I5; Thu, 27 Oct 2022 01:54:55 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R5Gr7I012205;
 Thu, 27 Oct 2022 05:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IhYYXjkLO9y4+WL/c9Kc6LDIw4R/msY/faNAYUhdojo=;
 b=J2lsnc8vA+wkdPEGHKePf/DlSSAvsfRN7pSfkVkFP8sLYBz35DqfIh68BdqctPtX4H7f
 GKHikIw1AiqEw0e29Sce5EdtgbgX6EcasodLLSsz+Nh65zb7oCUBIh+7XDxhmw1DDoA7
 xurd3Uh1co60v1suHr/Ymdw3qabUBCsAa1BlPqPtuhLjpV12TRnKZTw0iKDzRUY6wCad
 Dnddbni8a1a2DKa3N2+w+qy7IB3KqyIodUPtPazhuRlFBSU17mjLK6+KtK59MZA1PXae
 bo8Xu/r6pzMsMpPdrDw9Xg0hYIV1kYSVBdxnCB6394pn0hGuvQxhkmFIag/KsVBBtvrQ vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfkpq9682-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 05:54:49 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29R5snDl002995;
 Thu, 27 Oct 2022 05:54:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfkpq966w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 05:54:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29R5qHNT002239;
 Thu, 27 Oct 2022 05:54:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3kfah90q10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 05:54:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29R5sjYf4653712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 05:54:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D38DA405B;
 Thu, 27 Oct 2022 05:54:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBCF2A4054;
 Thu, 27 Oct 2022 05:54:44 +0000 (GMT)
Received: from [9.171.42.156] (unknown [9.171.42.156])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Oct 2022 05:54:44 +0000 (GMT)
Message-ID: <a73fbe58-507e-fdae-a0ad-809de110ade6@linux.ibm.com>
Date: Thu, 27 Oct 2022 07:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: qemu iotest 161 and make check
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
 <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
 <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
 <6d73af8a-4620-f702-5367-6bed666b61a8@virtuozzo.com>
 <54616427-1784-d12b-1a54-131796b56c07@linux.ibm.com>
 <d6d24f79-24bd-46ac-6332-a066410e0217@linux.ibm.com>
 <2592efbf-ec8f-d6ef-2708-37958b514a02@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <2592efbf-ec8f-d6ef-2708-37958b514a02@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VNADNv1dL2SAZSd5dQJT-kNl7cHMksXw
X-Proofpoint-ORIG-GUID: aWMF9odcmoyVwmctlVw5_Jcup7D0phxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_02,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270031
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 31.03.22 um 10:25 schrieb Christian Borntraeger:
> 
> 
> Am 31.03.22 um 09:44 schrieb Christian Borntraeger:
>>
>>
>> Am 21.02.22 um 11:27 schrieb Christian Borntraeger:
>>>
>>> Am 10.02.22 um 18:44 schrieb Vladimir Sementsov-Ogievskiy:
>>>> 10.02.2022 20:13, Thomas Huth wrote:
>>>>> On 10/02/2022 15.51, Christian Borntraeger wrote:
>>>>>>
>>>>>>
>>>>>> Am 10.02.22 um 15:47 schrieb Vladimir Sementsov-Ogievskiy:
>>>>>>> 10.02.2022 10:57, Christian Borntraeger wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> I do see spurious failures of 161 in our CI, but only when I use
>>>>>>>> make check with parallelism (-j).
>>>>>>>> I have not yet figured out which other testcase could interfere
>>>>>>>>
>>>>>>>> @@ -34,6 +34,8 @@
>>>>>>>>   *** Commit and then change an option on the backing file
>>>>>>>>
>>>>>>>>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
>>>>>>>> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
>>
>> FWIW, qemu_lock_fd_test returns -11 (EAGAIN)
>> and raw_check_lock_bytes spits this error.
> 
> 
> And its coming from here (ret is 0)
> 
> int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
> {
>      int ret;
>      struct flock fl = {
>          .l_whence = SEEK_SET,
>          .l_start  = start,
>          .l_len    = len,
>          .l_type   = exclusive ? F_WRLCK : F_RDLCK,
>      };
>      qemu_probe_lock_ops();
>      ret = fcntl(fd, fcntl_op_getlk, &fl);
>      if (ret == -1) {
>          return -errno;
>      } else {
> ----->        return fl.l_type == F_UNLCK ? 0 : -EAGAIN;
>      }
> }
> 
>>
>>
>> Is this just some overload situation that we do not recover because we do not handle EAGAIN any special.

Restarted my investigation. Looks like the file lock from qemu is not fully cleaned up when the process is gone.
Something like
diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index 0f1fecc68e..b28a6c187c 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -403,4 +403,5 @@ _cleanup_qemu()
          unset QEMU_IN[$i]
          unset QEMU_OUT[$i]
      done
+    sleep 0.5
  }


makes the problem go away.

Looks like we do use the OFD variant of the file lock, so any clone, fork etc will keep the lock.

So I tested the following:

diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index 0f1fecc68e..01bdb05575 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -388,7 +388,7 @@ _cleanup_qemu()
                  kill -KILL ${QEMU_PID} 2>/dev/null
              fi
              if [ -n "${QEMU_PID}" ]; then
-                wait ${QEMU_PID} 2>/dev/null # silent kill
+                wait 2>/dev/null # silent kill
              fi
          fi


And this also helps. Still trying to find out what clone/fork happens here.

