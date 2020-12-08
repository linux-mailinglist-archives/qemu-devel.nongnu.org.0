Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B162D3602
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:14:28 +0100 (CET)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlFb-0006kw-Fh
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmk5d-0003ps-JG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:00:05 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmk5Z-00073g-2O
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:00:04 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8KxU4v128357;
 Tue, 8 Dec 2020 20:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=RTIFZsGQGfSkBSfJJwl5BZuY2YanAdX75zlMhIfgFlU=;
 b=Aduau2RFQ0M5gcwn0/88EKJByBBydDlxEQ9Sw/xnVNdn0FlreS8Jst3gchy/dlT9a2Ci
 0DATfGGhZvjvruXej+1TuhxAY22OwWRRAQKn0x+baBqz8tSzysSoSEeFpGjKJGHJ9DET
 tIBym7KRIRtSMw0twjwh2em7UeoGnnhONc+bq+m6AvSTYnVx7Q+JKkHXbNodQEC1TJus
 gH8HkjRtSkHIFm7v1lIde4Ws1V3lHVBWKyshV4HS2R/Z3g/EuoICibGs1I86j/hh3T78
 qpf1633h1Utb8gUgfUatPCPfD85G5nIV+uAruag0XSTIjQES8GUAJ2DhuZSRq7YqD2B3 uA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35825m50u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 08 Dec 2020 20:59:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8KuUeG043102;
 Tue, 8 Dec 2020 20:59:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 358m3y91yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Dec 2020 20:59:59 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8KxvD6022511;
 Tue, 8 Dec 2020 20:59:57 GMT
Received: from [10.39.218.85] (/10.39.218.85)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 12:59:57 -0800
Subject: Re: [PATCH 3/4] qmp: Allow setting -action parameters on the fly
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607454890-3339-4-git-send-email-alejandro.j.jimenez@oracle.com>
 <98a0e686-5e3c-b9c3-6885-04cdaa54df60@redhat.com>
 <1aeb78a5-4ddc-348a-505a-6e9a20d1331d@redhat.com>
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Organization: Oracle Corporation
Message-ID: <855b56c2-dd9e-287d-8794-ec68a19f0f8c@oracle.com>
Date: Tue, 8 Dec 2020 15:59:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1aeb78a5-4ddc-348a-505a-6e9a20d1331d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080129
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=aserp2120.oracle.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/8/2020 2:58 PM, Paolo Bonzini wrote:
> On 08/12/20 20:57, Paolo Bonzini wrote:
>> On 08/12/20 20:14, Alejandro Jimenez wrote:
>>>   ##
>>> +# @reboot-set-action:
>>> +#
>>> +# Set reboot action
>>> +#
>>> +# Since: 6.0
>>> +##
>>> +{ 'command': 'reboot-set-action', 'data' : {'action': 
>>> 'RebootAction'} }
>>> +
>>> +##
>>> +# @shutdown-set-action:
>>> +#
>>> +# Set shutdown action
>>> +#
>>> +# Since: 6.0
>>> +##
>>> +{ 'command': 'shutdown-set-action', 'data' : {'action': 
>>> 'ShutdownAction'} }
>>> +
>>> +##
>>> +# @panic-set-action:
>>> +#
>>> +# Set panic action
>>> +#
>>> +# Since: 6.0
>>> +##
>>> +{ 'command': 'panic-set-action', 'data' : {'action': 'PanicAction'} }
>>> +
>>> +##
>>
>> What about a single action-set command with arguments reboot, 
>> shutdown and panic?
>
> (and watchdog, of course)?
Just to make sure I understand the request: an action-set QMP command 
would need to take two arguments: an event 
(reboot|shutdown|panic|watchdog), and a valid action for that event 
type, akin to what set_runstate_action() does. I'll work on it.

Alejandro
>
> Paolo


