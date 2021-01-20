Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCA2FCCAF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 09:27:45 +0100 (CET)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l28q8-0000lu-HC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 03:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1l28o9-0008FY-7Q
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:25:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6916
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1l28o4-0007UG-Tk
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:25:40 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10K84Z03086496
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 03:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/e5/j4I3to31VZuWqDwMIPm1XPRJ58PBYB+tgtGd/4E=;
 b=PKWFDYRpHKPoBE5PdWTRYfNvFq3zIZSzjtvv9A3K4PrgmdUfKOzytUSSGsYighB3xHZs
 ZBLLRBGKXdxDyijrduyFdoyygoEj3F9xWRDbaBBRY4YRozPf0IBGxFLg+EipL4sOzBMT
 PLoBUBLdkrXcoaRDb+vGuEtOvJ3K5EwHW+XXrAWaO46JwaI2fdwftUYXNhrRTPPGl8fz
 8RXDFekOSI0feMKVOawv0LUk05Sku4yzSis2iOp+dbQGGSkG7eqsupeysk+u4zyqJPu0
 P4UeNfkQhb1YqMMGj2TEvKYduOCrNEvliwjGqVsyCfBfQN29dOC+qyVq/T8H1KcOCeAF 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366gaxs2h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 03:25:33 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10K853RE089170
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 03:25:33 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366gaxs2gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 03:25:33 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10K8HVnH008186;
 Wed, 20 Jan 2021 08:25:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3668parbv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 08:25:31 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10K8PTRo42467722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 08:25:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 357AB42045;
 Wed, 20 Jan 2021 08:25:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE39342041;
 Wed, 20 Jan 2021 08:25:27 +0000 (GMT)
Received: from [9.65.219.40] (unknown [9.65.219.40])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 08:25:27 +0000 (GMT)
Subject: Re: [PATCH] qmp-shell: Suppress banner and prompt when stdin is not a
 TTY
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210117072742.119377-1-dovmurik@linux.vnet.ibm.com>
 <f6b88346-9dac-2679-385c-17d4a0e245c4@redhat.com>
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
Message-ID: <1d63a097-27d5-5b3a-2ce6-f6a2402e135e@linux.vnet.ibm.com>
Date: Wed, 20 Jan 2021 10:25:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <f6b88346-9dac-2679-385c-17d4a0e245c4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_02:2021-01-18,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200041
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi John,

On 19/01/2021 22:02, John Snow wrote:
> On 1/17/21 2:27 AM, Dov Murik wrote:
>> Detect whether qmp-shell's standard input is not a TTY; in such case,
>> assume a non-interactive mode, which suppresses the welcome banner and
>> the "(QEMU)" prompt.  This allows for easier consumption of qmp-shell's
>> output in scripts.
>>
>> Example usage before this change:
>>
>>      $ printf "query-status\nquery-kvm\n" | sudo scripts/qmp/qmp-shell 
>> qmp-unix-sock
>>      Welcome to the QMP low-level shell!
>>      Connected to QEMU 5.1.50
>>
>>      (QEMU) {"return": {"status": "running", "singlestep": false, 
>> "running": true}}
>>      (QEMU) {"return": {"enabled": true, "present": true}}
>>      (QEMU)
>>
>> Example usage after this change:
>>
>>      $ printf "query-status\nquery-kvm\n" | sudo scripts/qmp/qmp-shell 
>> qmp-unix-sock
>>      {"return": {"status": "running", "singlestep": false, "running": 
>> true}}
>>      {"return": {"enabled": true, "present": true}}
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> 
> Hiya! I've been taking lead on modernizing a lot of our python 
> infrastructure, including our QMP library and qmp-shell.
> 
> (Sorry, not in MAINTAINERS yet; but I am in the process of moving these 
> scripts and tools over to ./python/qemu/qmp.)

Thanks for this effort.

> 
> This change makes me nervous, because qmp-shell is not traditionally a 
> component we've thought of as needing to preserve backwards-compatible 
> behavior. Using it as a script meant to be consumed in a headless 
> fashion runs a bit counter to that assumption.
> 
> I'd be less nervous if the syntax of qmp-shell was something that was 
> well thought-out and rigorously tested, but it's a hodge-podge of 
> whatever people needed at the moment. I am *very* reluctant to cement it.

Yes, I understand your choice.


> 
> Are you trying to leverage the qmp.py library from bash?

Yes, I want to send a few QMP commands and record their output.  If I 
use socat to the unix-socket I need to serialize the JSON request 
myself, so using qmp-shell saves me that; also not sure if there's any 
negotiation done at the beginning by qmp-shell.

Is there an easier way to script qmp commands, short of writing my own 
python program which uses the qmp.py library?

-Dov


> 
> --js
> 
>> ---
>>
>> Notes:
>>      Note that this might be considered a breaking change; if users have
>>      automated scripts which assume that qmp-shell prints 3 lines of 
>> banner,
>>      this change will break their scripts.  If there are special
>>      considerations/procedures for breaking changes, please let me know.
>>      The rationale behaind the TTY check is to imitate python's 
>> behaviour:
>>          $ python3
>>          Python 3.7.5 (default, Apr 19 2020, 20:18:17)
>>          [GCC 9.2.1 20191008] on linux
>>          Type "help", "copyright", "credits" or "license" for more 
>> information.
>>          >>> print(19+23)
>>          42
>>          >>>
>>          $ echo 'print(19+23)' | python3
>>          42
>>
>>   scripts/qmp/qmp-shell | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
>> index b4d06096ab..9336066fa8 100755
>> --- a/scripts/qmp/qmp-shell
>> +++ b/scripts/qmp/qmp-shell
>> @@ -288,6 +288,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>>           self.__completer_setup()
>>       def show_banner(self, msg='Welcome to the QMP low-level shell!'):
>> +        if not self._interactive:
>> +            return
>>           print(msg)
>>           if not self._greeting:
>>               print('Connected')
>> @@ -300,6 +302,15 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>>               return "TRANS> "
>>           return "(QEMU) "
>> +    def read_command(self, prompt):
>> +        if self._interactive:
>> +            return input(prompt)
>> +        else:
>> +            line = sys.stdin.readline()
>> +            if not line:
>> +                raise EOFError
>> +            return line
>> +
>>       def read_exec_command(self, prompt):
>>           """
>>           Read and execute a command.
>> @@ -307,7 +318,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>>           @return True if execution was ok, return False if disconnected.
>>           """
>>           try:
>> -            cmdline = input(prompt)
>> +            cmdline = self.read_command(prompt)
>>           except EOFError:
>>               print()
>>               return False
>> @@ -322,6 +333,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>>       def set_verbosity(self, verbose):
>>           self._verbose = verbose
>> +    def set_interactive(self, interactive):
>> +        self._interactive = interactive
>> +
>>   class HMPShell(QMPShell):
>>       def __init__(self, address):
>>           QMPShell.__init__(self, address)
>> @@ -449,8 +463,9 @@ def main():
>>       except qemu.error:
>>           die('Could not connect to %s' % addr)
>> -    qemu.show_banner()
>>       qemu.set_verbosity(verbose)
>> +    qemu.set_interactive(sys.stdin.isatty())
>> +    qemu.show_banner()
>>       while qemu.read_exec_command(qemu.get_prompt()):
>>           pass
>>       qemu.close()
>>
> 

