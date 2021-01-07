Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4C2ED344
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:11:34 +0100 (CET)
Received: from localhost ([::1]:55450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWwn-0003SV-K4
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxWsi-00073P-Df
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:07:21 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:47270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxWse-0003qc-9I
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:07:19 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107F4uTV084439;
 Thu, 7 Jan 2021 15:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=CPA8lb1I4B8tJXIi1XjD4aYcp6J36bPGn6F+IEiQGv4=;
 b=AtmdMNx1jswFctG0X7YjplPHQU0Y42D1IopRydVldkj/vbfoLDG6hep4pNP0zh31taLA
 4Ce9NP/52J/ZgO/XdNRKNFd2EkDgAHxLfp3WMbGtDetDN8Lup/zUjtY5f+baM01eacvN
 lgegOevppyl2K1xx2jrDH5/DGR811XDMPBvd7MXuNNJGMHge5NBTefGAW1nBaFk1Aopp
 elDVTBs7jyP/XC/hhM9rSg++EW+2/jr+tHVmc2MDuXYSTdPus/7WY1naa+20rKWlxmTN
 SanGsQDOKMgl/HYj3vllCH/Hq5Gqg+0hkTaE28eMD+5fnZpeTtsfvRgURQAKo4OrLfIo mA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35wcuxw4qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 15:07:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107F1SuY020938;
 Thu, 7 Jan 2021 15:05:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35w3g2uj5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 15:05:12 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 107F5BYd003290;
 Thu, 7 Jan 2021 15:05:11 GMT
Received: from [10.39.247.197] (/10.39.247.197)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 07:05:11 -0800
Subject: Re: [PATCH V1] gdbstub: suspended state support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1609963815-417989-1-git-send-email-steven.sistare@oracle.com>
 <87h7ns2a24.fsf@linaro.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <363fd686-aa5f-60ea-f330-1213a32ca031@oracle.com>
Date: Thu, 7 Jan 2021 10:05:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87h7ns2a24.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070095
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/2021 7:40 AM, Alex Bennée wrote:
> Steve Sistare <steven.sistare@oracle.com> writes:
> 
>> Modify the gdb server so a continue command appears to resume execution
>> when in RUN_STATE_SUSPENDED.  Do not print the next gdb prompt, but do not
>> actually resume instruction fetch.  While in this "fake" running mode, a
>> ctrl-C returns the user to the gdb prompt.
> 
> What exactly is the purpose of this? To hide the details of the runstate
> as controlled by the user? I wouldn't expect someone using gdb debugging
> not to also have control of the HMP/QMP interface.

Without this fix, a user that attaches gdb to a suspended guest breaks the
guest.  The state is RUN_STATE_SUSPENDED.  After attaching gdb and typing
continue or quit, qemu transitions to RUN_STATE_RUNNING (wrong) and the
guest continues execution (wrong).  The guest loops polling on an acpi port,
deep in a call stack under acpi_suspend_enter().  Sending a system_wakeup
request via qmp or hmp fails with the message "Error: Unable to wake up:
guest is not in suspended state".

With the fix, the state remains RUN_STATE_SUSPENDED throughout, until the
system_wakeup request, and the guest pc does not change.  gdb interprets 
RUN_STATE_SUSPENDED as "target is running", without causing instruction 
fetch to resume.

If you are satisfied, I will add this explanation to the commit message.

- Steve

>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  gdbstub.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index f3a318c..2f0d9ff 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -461,7 +461,9 @@ static inline void gdb_continue(void)
>>  #else
>>      if (!runstate_needs_reset()) {
>>          trace_gdbstub_op_continue();
>> -        vm_start();
>> +        if (!runstate_check(RUN_STATE_SUSPENDED)) {
>> +            vm_start();
>> +        }
>>      }
>>  #endif
>>  }
>> @@ -490,7 +492,7 @@ static int gdb_continue_partial(char *newstates)
>>      int flag = 0;
>>  
>>      if (!runstate_needs_reset()) {
>> -        if (vm_prepare_start()) {
>> +        if (!runstate_check(RUN_STATE_SUSPENDED) && vm_prepare_start()) {
>>              return 0;
>>          }
>>  
>> @@ -2835,6 +2837,9 @@ static void gdb_read_byte(uint8_t ch)
>>          /* when the CPU is running, we cannot do anything except stop
>>             it when receiving a char */
>>          vm_stop(RUN_STATE_PAUSED);
>> +    } else if (runstate_check(RUN_STATE_SUSPENDED) && ch == 3) {
>> +        /* Received ctrl-c from gdb */
>> +        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
>>      } else
>>  #endif
>>      {
>> @@ -3282,6 +3287,8 @@ static void gdb_sigterm_handler(int signal)
>>  {
>>      if (runstate_is_running()) {
>>          vm_stop(RUN_STATE_PAUSED);
>> +    } else if (runstate_check(RUN_STATE_SUSPENDED)) {
>> +        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
>>      }
>>  }
>>  #endif
> 
> 

