Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF7233813
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 20:02:42 +0200 (CEST)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Ct2-00062s-3W
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 14:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1CrV-0005SA-Mh
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 14:01:02 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1CrT-0008AA-CZ
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 14:01:00 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UHv58i050239;
 Thu, 30 Jul 2020 18:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ql1fGPUxfzV89DNrtUsQRWNlOxsrKr/hfRfaP6YAzl0=;
 b=N/uW8TCOLA3v6rEZq4PkW8C0HH89vU8+HUvr+mDY8hT7wAp6ERx6AtyXdK0VRzatDoZM
 LpkKvB1LJPgvXumvjaYWWxIX50hfN1XpRHD/HbMsuB3jVcb9NoO05zKvUQQ3Yqif6VRW
 oCXezJQBaRVedw0ozQsKypqWJSvEamvGiSTCRGHUv7tMb3CIEXTmxO2dQ0aBHwULUw9z
 tbEHRVQZeup7lKdxYMoqa3KrwnDezbknoQM6jHQcw43Uevf35G7Jb4L/08JijboyujJ/
 1EgLRZutmLVsI274AJlBnU1uHS1KTmvl8aoFrVpM1ZOiYrPMoXz+Z5QV1XxYB3YkMj1c kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 32hu1jn5w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 18:00:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UHqZvq136486;
 Thu, 30 Jul 2020 18:00:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 32hu61mt5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 18:00:54 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06UI0reL025981;
 Thu, 30 Jul 2020 18:00:53 GMT
Received: from [10.39.200.60] (/10.39.200.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jul 2020 11:00:53 -0700
Subject: Re: [PATCH V1 05/32] savevm: QMP command for cprload
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-6-git-send-email-steven.sistare@oracle.com>
 <654553cb-e071-0498-fe66-78ddda3942e9@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <c135f2e5-10d5-81f5-7251-cead777428aa@oracle.com>
Date: Thu, 30 Jul 2020 14:00:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <654553cb-e071-0498-fe66-78ddda3942e9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300127
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 14:00:56
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/2020 12:14 PM, Eric Blake wrote:
> On 7/30/20 10:14 AM, Steve Sistare wrote:
>> Provide the cprload QMP command.  The VM is created from the file produced
>> by the cprsave command.  Guest RAM is restored in-place from the shared
>> memory backend file, and guest block devices are used as is.  The contents
>> of such devices must not be modified between the cprsave and cprload
>> operations.  If the VM was running at cprsave time, then VM execution
>> resumes.
> 
> Is it always wise to unconditionally resume, or might this command need an additional optional knob that says what state (paused or running) to move into?

This can already be done.  Issue a stop command before cprsave, then cprload will finish in a
paused state.

Also, cprsave re-execs and leaves the guest in a paused state.  One can

send device add commands, then send cprload which continues
.

>> Syntax:
>>    {'command':'cprload', 'data':{'file':'str'}}
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> Signed-off-by: Maran Wilson <maran.wilson@oracle.com>
>> ---
> 
>> +++ b/qapi/migration.json
>> @@ -1635,3 +1635,14 @@
>>   ##
>>   { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'str' } }
>>   +##
>> +# @cprload:
>> +#
>> +# Start virtual machine from checkpoint file that was created earlier using
>> +# the cprsave command.
>> +#
>> +# @file: name of checkpoint file
>> +#
>> +# Since 5.0
> 
> another 5.2 instance. I'll quit pointing it out for the rest of the series.

Will find and fix all, thanks.

- Steve


