Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACFD32F08E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:03:18 +0100 (CET)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDr4-0005Eq-A9
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lIDiM-0005Zk-D8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:54:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lIDiJ-0006O0-3v
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFMg+CoTo6mnONRoVd2DdNS3rI/CkJgNyKm/Snlhmjw=;
 b=bkg9aYEfE6T9HNrzMKhC009WMW/XuvLsbvbIzpUfgCI8GxRZ9fO14g7suMF/IR1uwJk5eb
 5e9NOvaWbeDvThW5F/KcJK84YppPGGkH6J7aVrJx4XuXyigcYpNOrlmwh9V3ywwKKcpNVC
 TBzPNR2aG2K6Y+LxnKWrWszvm0noD9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-IzW8frESNcm_a4SokNkPzA-1; Fri, 05 Mar 2021 11:54:00 -0500
X-MC-Unique: IzW8frESNcm_a4SokNkPzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B52D193F562;
 Fri,  5 Mar 2021 16:53:59 +0000 (UTC)
Received: from [10.10.117.80] (ovpn-117-80.rdu2.redhat.com [10.10.117.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 007A21053B20;
 Fri,  5 Mar 2021 16:53:55 +0000 (UTC)
Subject: Re: [RESEND][BUG FIX HELP] QEMU main thread endlessly hangs in
 __ppoll()
To: Like Xu <like.xu@linux.intel.com>
References: <e1087f41-9bb2-6641-a642-94ffc8b20b38@linux.intel.com>
 <06dec6f0-d720-ce7b-8485-8be1954418bb@redhat.com>
 <624a6256-a735-6475-8831-b4c85f225c94@linux.intel.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e6cdfded-6727-2f73-358f-a9c019ca29f8@redhat.com>
Date: Fri, 5 Mar 2021 11:53:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <624a6256-a735-6475-8831-b4c85f225c94@linux.intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Thomas Huth \(S390-ccw/CHRP/qtest/GitLab\)" <thuth@redhat.com>,
 vsementsov@virtuozzo.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 10:08 PM, Like Xu wrote:
> Hi John,
> 
> Thanks for your comment.
> 
> On 2021/3/5 7:53, John Snow wrote:
>> On 2/28/21 9:39 PM, Like Xu wrote:
>>> Hi Genius,
>>>
>>> I am a user of QEMU v4.2.0 and stuck in an interesting bug, which may 
>>> still exist in the mainline.
>>> Thanks in advance to heroes who can take a look and share understanding.
>>>
>>
>> Do you have a test case that reproduces on 5.2? It'd be nice to know 
>> if it was still a problem in the latest source tree or not.
> 
> We narrowed down the source of the bug, which basically came from
> the following qmp usage:
> 
> {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 
> 'drive_del replication0' } }
> 
> One of the test cases is the COLO usage (docs/colo-proxy.txt).
> 
> This issue is sporadic,the probability may be 1/15 for a io-heavy guest.
> 
> I believe it's reproducible on 5.2 and the latest tree.
> 

Can you please test and confirm that this is the case, and then file a 
bug report on the LP: https://launchpad.net/qemu and include:

- The exact commit you used (current origin/master debug build would be 
the most ideal.)
- Which QEMU binary you are using (qemu-system-x86_64?)
- The shortest command line you are aware of that reproduces the problem
- The host OS and kernel version
- An updated call trace
- Any relevant commands issued prior to the one that caused the hang; or 
detailed reproduction steps if possible.

Thanks,
--js


