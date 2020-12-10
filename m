Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE62D5143
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:24:31 +0100 (CET)
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knCZC-0003YS-Dw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knCWt-0002nS-Lu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 22:22:07 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:36334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knCWr-0001Nw-6O
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 22:22:06 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BA3A6rD051543;
 Thu, 10 Dec 2020 03:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Dd3UjPOZTrYsfcfNT5ssOtquMyvUU4/W+pUEa7pFzGo=;
 b=MpsnCueITZ04Aw7wm5STJbf6OEjQxxQiDFg+Grf9XTLgb0GAwVvxIx82n5tyZuVNPuaL
 t480bMNFXKfCve6aPzKqCL3l9y7kyPZYOFSBymNAuKqzzZMdsNTzMV5jr8wF6iIahJNo
 rWEjM8WzB1da+MB4f4zvuSWu4avIYg+ji7q9xZR1uy50p03fXJ3vowM4Itthr3fiZJ83
 fwmB2Bp9+An+zLXxmgIZqWbbcpG0kimQp0Mb59r6MWtuv40QFE04d357aMqZFJpgfdo1
 3ooInMd96O2omWV5+hdj96jRwm2eT7PCTXtv/ESBio+SiTEWzrRlCgxYIX3tQvg9FAYz tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3581mr3878-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 03:22:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BA3Aaqf053990;
 Thu, 10 Dec 2020 03:21:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 358m415qa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 03:21:59 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BA3Lw8c011498;
 Thu, 10 Dec 2020 03:21:58 GMT
Received: from [10.39.212.11] (/10.39.212.11)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 19:21:57 -0800
Subject: Re: [PATCH v2 3/4] qmp: Allow setting -action parameters on the fly
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607536336-24701-4-git-send-email-alejandro.j.jimenez@oracle.com>
 <99a5b268-f37f-b7a3-c976-3342e1145157@redhat.com>
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Organization: Oracle Corporation
Message-ID: <12769054-aa3a-161b-2b25-6804d547d41c@oracle.com>
Date: Wed, 9 Dec 2020 22:21:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <99a5b268-f37f-b7a3-c976-3342e1145157@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100021
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: david.edmondson@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/9/2020 4:43 PM, Paolo Bonzini wrote:
> On 09/12/20 18:52, Alejandro Jimenez wrote:
>> +# Set the action that will be taken by the emulator in response to a 
>> guest
>> +# event.
>> +#
>> +# @pair: a @RunStateAction type that describes an event|action pair.
>> +#
>> +# Returns: Nothing on success.
>> +#
>> +# Since: 6.0
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "set-action",
>> +#         "arguments": { "pair": {
>> +#             "event": "shutdown",
>> +#             "action": "pause" } } }
>> +# <- { "return": {} }
>> +##
>> +{ 'command': 'set-action', 'data' : {'pair': 'RunStateAction'} }
>> +
>> +##
>>   # @GUEST_PANICKED:
>>   #
>>   # Emitted when guest OS panic is detected
>> diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
>> index a644d80..7877e7e 100644
>> --- a/softmmu/runstate-action.c
>> +++ b/softmmu/runstate-action.c
>> @@ -80,6 +80,35 @@ static void panic_set_action(PanicAction action, 
>> Error **errp)
>>   }
>>     /*
>> + * Receives a RunStateAction type which represents an event|action pair
>> + * and sets the internal state as requested.
>> + */
>> +void qmp_set_action(RunStateAction *pair, Error **errp)
>> +{
>> +    switch (pair->event) {
>> +    case RUN_STATE_EVENT_TYPE_REBOOT:
>> +        reboot_set_action(pair->u.reboot.action, NULL);
>> +        break;
>> +    case RUN_STATE_EVENT_TYPE_SHUTDOWN:
>> +        shutdown_set_action(pair->u.shutdown.action, NULL);
>> +        break;
>> +    case RUN_STATE_EVENT_TYPE_PANIC:
>> +        panic_set_action(pair->u.panic.action, NULL);
>> +        break;
>> +    case RUN_STATE_EVENT_TYPE_WATCHDOG:
>> +        qmp_watchdog_set_action(pair->u.watchdog.action, NULL);
>> +        break;
>> +    default:
>> +        /*
>> +         * The fields in the RunStateAction argument are validated
>> +         * by the QMP marshalling code before this function is called.
>> +         * This case is unreachable unless new variants are added.
>> +         */
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>
> Any reason not to have the multiple optional arguments as discussed in 
> v1 (no reply usually means you agree)?  The implementation would be 
> nice, like
>
>     if (actions->has_reboot) {
>         reboot_set_action(actions->reboot);
>     }
>     etc.
>
> ?
I misunderstood your request in v1. I'll try to be explicit to avoid 
more confusion. Are you expecting a command of the form:

{ 'command': 'set-action',
'data' : {
     '*reboot': 'RebootAction',
     '*shutdown': 'ShutdownAction',
     '*panic': 'PanicAction',
     '*watchdog': 'WatchdogAction' } }
?

Or is it better to encapsulate all of those optional fields inside a new 
struct definition (RunStateActions?) so that the command would be:

{ 'command': 'set-action', 'data': 'actions' : 'RunStateActions' }

which is what the "actions->has_reboot" example seems to suggest?

Or is it something else that I am not understanding yet?

>
> Note that, in patches 1-2, you don't need to add an Error** argument 
> to functions that cannot fail.
This was left over from the initial patch. I'll fix it.

Alejandro
>
> Thanks,
>
> Paolo
>


