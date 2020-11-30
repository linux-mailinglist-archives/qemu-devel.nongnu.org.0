Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396F12C8CE3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:35:45 +0100 (CET)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjo1Y-0008Ob-86
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kjnz0-0007KM-9e
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:33:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kjnyx-000398-0X
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606761180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCWPyWtOvVSDasPnO3X4f7hxreS5PgU3Zg9zttld1JU=;
 b=dcM50zFrUDFT0ol3ROU6BSRxEoTpCLNvZ1IUBpqUXQuLSVm3x1sOCy0rlUNpJ9MR3hNEFI
 QN9k+S6+vCueGafVT0Z1q8zgntpBGQsPfbVVF2phzIOb3OaicPVZDwRQHVjkjos8wBYxzP
 yLaCQjT4C8E74tjyxOVziAPbhvs16v8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-zfF0xPrYPdeUoqkC2OIZ3g-1; Mon, 30 Nov 2020 13:32:58 -0500
X-MC-Unique: zfF0xPrYPdeUoqkC2OIZ3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6B38558E4;
 Mon, 30 Nov 2020 18:32:57 +0000 (UTC)
Received: from [10.10.119.122] (ovpn-119-122.rdu2.redhat.com [10.10.119.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 631F35D6AB;
 Mon, 30 Nov 2020 18:32:56 +0000 (UTC)
Subject: Re: QMP and the 'id' parameter
To: Markus Armbruster <armbru@redhat.com>
References: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
 <87361h20kd.fsf@dusky.pond.sub.org>
 <ab509dba-7cd8-aaed-7ded-9dd82c040b6d@redhat.com>
 <874klwqowa.fsf@dusky.pond.sub.org>
 <01fc83b3-0f80-9960-fff3-ecf5b1740b76@redhat.com>
 <87y2iw5nqw.fsf@dusky.pond.sub.org>
 <d07468f4-9332-f47a-2762-14f81bfcc0c5@redhat.com>
 <87blfowoek.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d2640fe1-eb65-5fa8-7311-b315fbba7081@redhat.com>
Date: Mon, 30 Nov 2020 13:32:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87blfowoek.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <mdroth@utexas.edu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 1:57 AM, Markus Armbruster wrote:
>> (Was it not possible to have the client send an ACK response that
>> doesn't indicate success, but just signals receipt? Semantically, it
>> would be the difference between do-x and start-x as a command.)
> Feels quite possible to me.
> 
> If I read git-log correctly, the commands' design ignored the race with
> shutdown / suspend, and 'success-response': false was a quick fix.
> 
> I think changing the commands from 'do-x' to 'start-x' would have been
> better.  A bit more work, though, and back then there weren't any
> 'start-x' examples to follow, I guess.
> 
> I wish success-response didn't exist, but is getting rid of it worth
> changing the interface?  I honestly don't know.
> 

OK, I'll jot it down in the ideas book and we can come back to it later, 
after we've fried the other 2,385 fish in queue. I think simplifying the 
interface is going to be helpful long-term, but I don't have a good grip 
on the actual work estimate.

In terms of a simple library design, this edge case makes an async 
library quite a bit worse to support, because now it needs to understand 
that sometimes the target will never reply, and it's command dependent. 
Now the core "QMP" library, ostensibly the command-agnostic layer, needs 
to query to discover the semantics of each command it sends.


(1) Identify 'success-response: false' commands:

- guest-shutdown
- guest-suspend-disk
- guest-suspend-ram
- guest-suspend-hybrid


(2) Replace them with jobs, where a success response acknowledges 
receipt and start of the job. Errors encountered setting up the job can 
be returned synchronously; errors encountered past the point of no 
return can be queried via the job system.

(I am assuming that it is untenable to have a system where we 
acknowledge receipt, go past the point of no return and then encounter 
an error and have no way to report it, since we've already responded to 
the shutdown/suspend request. Therefore, the job system seems appropriate.)

((The onus is now on the job layer to understand that on job success, 
the server goes away and cannot report success, but I think this is 
easier to implement in a client at the logical layer than at the 
protocol layer.))


(3) Deprecate the old interfaces.


(4) Delete the old interfaces. Remove 'success-response: false' from the 
meta-schema. Remove 'success-response' from GuestAgentCommandInfo.


...but, not terribly important. Might be nice to help plumb some 
non-block jobs for sake of example for other areas where they might be 
useful. Other stuff to think about in the meantime, but thank you for 
the heads up. Maybe a good GSoC project, actually? It seems 
straightforward, just with a lot of plumbing.


I suppose for now, what can happen is the client (using the AQMP 
library) can simply await the results of execute() with a timeout. If 
the server closes the connection, we know it worked -- or, if there's a 
timeout and we used --no-shutdown, we can interrogate the VM status.


