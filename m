Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8544D9E2C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:55:33 +0100 (CET)
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8aC-0000ln-Ek
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:55:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nU8Y7-0006MK-4c; Tue, 15 Mar 2022 10:53:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nU8Y5-00037E-1v; Tue, 15 Mar 2022 10:53:22 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FEThrf008618; 
 Tue, 15 Mar 2022 14:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VBmqh0SOSKeu1nlkfViPONHO+nDtRAfOwSoBIJINEKY=;
 b=rP56cPiuVvT8O2T2vJEqN7H6MQGyXFJkA1Igff6E1957mRwFkt/MXGwLcHJUyw3EqZuH
 OQd2xvF9XYo/CuQ2F+wImbifuOvUk8uof+eET6/tJj5KBCQIu07bXv5mAB4WhBpq+rew
 oqXI/pugawE/AzsGG3Ym3AZDXdQ2q7s5oH8TV0TMJKXPYclClyTJe0iXKMSNavl0//i5
 VGbd6PkGioxVztDG6nNLtgYi4R2puWVJhh6xk42L06bFcWGU0MmMSvvX0XpxJ3cI/V8X
 j3jtC+9FF1AvxNg0PSbo2gjmWgMfGHtK3JVWxYTQSKD3yQxg+EM4dzgeUpX+Yhu9oidC 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etvbm90nf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 14:53:16 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22FEq5jC004718;
 Tue, 15 Mar 2022 14:53:16 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etvbm90ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 14:53:16 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22FErEVX030663;
 Tue, 15 Mar 2022 14:53:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3erjshnw5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 14:53:13 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22FErBr426280214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 14:53:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BD28A4051;
 Tue, 15 Mar 2022 14:53:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94025A4040;
 Tue, 15 Mar 2022 14:53:10 +0000 (GMT)
Received: from [9.171.51.74] (unknown [9.171.51.74])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Mar 2022 14:53:10 +0000 (GMT)
Message-ID: <9a22c060-d22a-8fbf-6939-1f8b02d6f338@linux.ibm.com>
Date: Tue, 15 Mar 2022 15:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 00/18] migration queue
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 thuth@redhat.com
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <Yieku+cTxY0Xyp5C@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7XGrNp39DOtZLcqWqFxnva_njPIt7YxL
X-Proofpoint-ORIG-GUID: ULTBeF8N4mPIMi6SCGjfNolq_pcS9R_O
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150094
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, quintela@redhat.com,
 s.reiter@proxmox.com, qemu-devel@nongnu.org, peterx@redhat.com,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, hreitz@redhat.com,
 f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.03.22 um 19:47 schrieb Dr. David Alan Gilbert:
> * Philippe Mathieu-Daudé (philippe.mathieu.daude@gmail.com) wrote:
>> On 3/3/22 15:46, Peter Maydell wrote:
>>> On Wed, 2 Mar 2022 at 18:32, Dr. David Alan Gilbert (git)
>>> <dgilbert@redhat.com> wrote:
>>>>
>>>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>>>
>>>> The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:
>>>>
>>>>     Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220302b
>>>>
>>>> for you to fetch changes up to 18621987027b1800f315fb9e29967e7b5398ef6f:
>>>>
>>>>     migration: Remove load_state_old and minimum_version_id_old (2022-03-02 18:20:45 +0000)
>>>>
>>>> ----------------------------------------------------------------
>>>> Migration/HMP/Virtio pull 2022-03-02
>>>>
>>>> A bit of a mix this time:
>>>>     * Minor fixes from myself, Hanna, and Jack
>>>>     * VNC password rework by Stefan and Fabian
>>>>     * Postcopy changes from Peter X that are
>>>>       the start of a larger series to come
>>>>     * Removing the prehistoic load_state_old
>>>>       code from Peter M
>>
>> I'm seeing an error on the s390x runner:
>>
>> ▶  26/547 ERROR:../tests/qtest/migration-test.c:276:check_guests_ram:
>> assertion failed: (bad == 0) ERROR
>>
>>   26/547 qemu:qtest+qtest-i386 / qtest-i386/migration-test            ERROR
>> 78.87s   killed by signal 6 SIGABRT
>>
>> https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/562515884#L7848
> 
> Yeh, thuth mentioned that, it seems to only be s390 which is odd.
> I'm not seeing anything obviously architecture dependent in that set, or
> for that matter that plays with the ram migration stream much.
> Is this reliable enough that someone with a tame s390 could bisect?

I just asked Peter to try with DFLTCC=0 to disable the hardware acceleration. Maybe
the zlib library still has a bug? (We are not aware of any problem right now).
In case DFLTCC makes a difference, this would be something for Ilya to look at.


