Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E863BDCC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:19:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozxhY-0005pk-QL; Tue, 29 Nov 2022 05:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1ozxhT-0005lb-Ga; Tue, 29 Nov 2022 05:18:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1ozxhR-0006er-9x; Tue, 29 Nov 2022 05:18:51 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT8BSJs003950; Tue, 29 Nov 2022 10:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GiHli5LfJ3etfGtAFOqYYnUrQQhwbX27K/T+xjCtMPk=;
 b=RiEmf51cD5TfgOW7BGLRqbfSHOgPLf9ZjB5cBFsnVvwVHBnXeYAr2IO77qnDbjrO1FVz
 OgvRDh7EAMuKL40hhZQ/YQQ8pz2hxmP3Je5ze9DiCfYaW25BZq9OvO4OXmpp256V0umr
 FHM4CcCSvp8mX945Kn4EsnIm7JGua4TYzxpSQ5QvYt4cskLxjOk/Qr8JoNgIXqyU9Az2
 VBhzH3wbsxEwVn7cochtAv4dhn1rqTN8ySndS7dG/nguJOguU7cZwUOGFyWf9sYZ17LT
 hs8aEiRlEH5SPlIVupeyYvXn4Q4zWIjJo88Zug3TnZ3ubbTgado5nCh9Uk79M22Oc1tV Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ebuav55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 10:18:47 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT9JRqL005780;
 Tue, 29 Nov 2022 10:18:46 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ebuav4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 10:18:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT9psxp029561;
 Tue, 29 Nov 2022 09:52:50 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3m3ae92shr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 09:52:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AT9kKSn14287458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 09:46:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51D244203F;
 Tue, 29 Nov 2022 09:52:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E341442041;
 Tue, 29 Nov 2022 09:52:46 +0000 (GMT)
Received: from [9.179.0.182] (unknown [9.179.0.182])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Nov 2022 09:52:46 +0000 (GMT)
Message-ID: <1a94f96b-d9b6-44af-cedb-aa17eb1a3a84@de.ibm.com>
Date: Tue, 29 Nov 2022 10:52:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Sven Schnelle <svens@linux.ibm.com>, Stefan Liebler <stli@linux.ibm.com>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <Y4UCPQ0E2ZY15aEq@work-vm> <87wn7ef6cm.fsf@linux.ibm.com>
 <Y4XT/ZxuyU7F5h1n@work-vm>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <Y4XT/ZxuyU7F5h1n@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PY_26uB1UGZrnYxDUmitbyQObBwMTCU5
X-Proofpoint-ORIG-GUID: GKpe4hrxF-QcRoCHUPEZVdK8_ydEb_mN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_07,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290062
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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



Am 29.11.22 um 10:42 schrieb Dr. David Alan Gilbert:
> * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>>
>>> * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
>>>> The virtiofsd currently crashes on s390x. This is because of a
>>>> `sigreturn` system call. See audit log below:
>>>>
>>>> type=SECCOMP msg=audit(1669382477.611:459): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=system_u:system_r:virtd_t:s0-s0:c0.c1023 pid=6649 comm="virtiofsd" exe="/usr/libexec/virtiofsd" sig=31 arch=80000016 syscall=119 compat=0 ip=0x3fff15f748a code=0x80000000AUID="unset" UID="root" GID="root" ARCH=s390x SYSCALL=sigreturn
>>>
>>> I'm curious; doesn't that mean that some signal is being delivered and
>>> you're returning?  Which one?
>>
>> code=0x80000000 means that the seccomp action SECCOMP_RET_KILL_PROCESS
>> is taken => process is killed by a SIGSYS signal (31) [1].
>>
>> At least, that’s my understanding of this log message.
>>
>> [1] https://man7.org/linux/man-pages/man2/seccomp.2.html
> 
> But isn't that the fallout rather than the cause ? i.e. seccomp
> is sending a SIGSYS because the process used sigreturn, my question
> is why did the process call sigreturn in the first place - it must
> have received a signal to return from?

Good question. virtiofsd seems to prepare itself for

int fuse_set_signal_handlers(struct fuse_session *se)
{
     /*
      * If we used SIG_IGN instead of the do_nothing function,
      * then we would be unable to tell if we set SIG_IGN (and
      * thus should reset to SIG_DFL in fuse_remove_signal_handlers)
      * or if it was already set to SIG_IGN (and should be left
      * untouched.
      */
     if (set_one_signal_handler(SIGHUP, exit_handler, 0) == -1 ||
         set_one_signal_handler(SIGINT, exit_handler, 0) == -1 ||
         set_one_signal_handler(SIGTERM, exit_handler, 0) == -1 ||
         set_one_signal_handler(SIGPIPE, do_nothing, 0) == -1) {
         return -1;
     }



Given that rt_sigreturn was already on the seccomp list it seems
to be expected that those handlers are called.

