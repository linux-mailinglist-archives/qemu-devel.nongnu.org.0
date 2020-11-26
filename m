Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2392C5303
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:33:25 +0100 (CET)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFWe-0004fo-AV
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kiFSs-0002hE-Kh
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kiFSq-00067L-4U
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihuwqCQX+5EVBMbH9X3N0XOYIiOcfIuOyZXtPF8hcn4=;
 b=UhLaUnyht+hNo/svD/qNQ28vizygOsSztppnw7GGEhmHv4LsIRbTyuuDVs2/G53y79AgfR
 t7G58m3XE1vpdiFOrd4ch78se83XzlRqqLgpp3NqDmc/XIdQlFB7Uu2XSRRRLh8vBFET79
 jvrZ5laJYGeKIQ7CTCNZJn0Fe1eAWeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-LgolUThtOsKUL9-7lHTjPg-1; Thu, 26 Nov 2020 06:29:25 -0500
X-MC-Unique: LgolUThtOsKUL9-7lHTjPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B5899CC03;
 Thu, 26 Nov 2020 11:29:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4605D9C6;
 Thu, 26 Nov 2020 11:29:19 +0000 (UTC)
Subject: Re: Proposal for a regular upstream performance testing
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201126094338.GB1122957@redhat.com>
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Message-ID: <c05d6f4e-c51e-a2b2-e4f0-f22bb8740359@redhat.com>
Date: Thu, 26 Nov 2020 12:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201126094338.GB1122957@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ldoktor@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dne 26. 11. 20 v 10:43 Daniel P. Berrangé napsal(a):
> On Thu, Nov 26, 2020 at 09:10:14AM +0100, Lukáš Doktor wrote:
>> How
>> ===
>>
>> This is a tough question. Ideally this should be a standalone service that
>> would only notify the author of the patch that caused the change with a
>> bunch of useful data so they can either address the issue or just be aware
>> of this change and mark it as expected.
> 
> We need to distinguish between the service that co-ordinates and reports
> the testing, vs the service which runs the tests.
> 
> For the service which runs the tests, it is critical that it be a standalone
> bare metal machine with nothing else being run, to ensure reproducability of
> results as you say.
> 

Ack, for "solution 1" that would be me and I do have a dedicated machine (more will hopefully come). In "solution 2" that would be up to the other volunteer and there could be a combination, of course.

> For the service which co-ordinates and reports test results, we ideally want
> it to be integrated into our primary CI dashboard, which is GitLab CI at
> this time.
> 

At this point I don't have the resources to make this per commit, nor push. I know that in github it is possible to manually inject CI results via:

     curl -u $GITHUB_USER:$GITHUB_TOKEN --data "\"state\": \"$status\", \"description\": \"$description\", \"context\": \"manual/$GITHUB_USER\"" -H "Accept: application/vnd.github.v3+json" "$base_url/statuses/$commit"

if something like this is available in gitlab than I would be glad to start injecting my results.

>> Ideally the community should have a way to also issue their custom builds
>> in order to verify their patches so they can debug and address issues
>> better than just commit to qemu-master.
> 
> Allowing community builds certainly adds an extra dimension of complexity
> to the problem, as you need some kind of permissions control, as you can't
> allow any arbitrary user on the web to trigger jobs with arbitrary code,
> as that is a significant security risk to your infra.
> 
> I think I'd just suggest providing a mechanism for the user to easily spin
> up performance test jobs on their own hardware. This could be as simple
> as providing a docker container recipe that users can deploy on some
> arbitrary machine of their choosing that contains the test rig. All they
> should need do is provide a git ref, and then launching the container and
> running jobs should be a single command. They can simply run the tests
> twice, with and without the patch series in question.
> 

Sure, I can bundle run-perf in a container along with some helpers to simplify the usage.

>> The problem with those is that we can not simply use travis/gitlab/...
>> machines for running those tests, because we are measuring in-guest
>> actual performance.
> 
> As mentioned above - distinguish between the CI framework, and the
> actual test runner.
> 
> 
> 
>> Solution 3
>> ----------
>>
>> You name it. I bet there are many other ways to perform system-wide
>> performance testing.
> 
> IMHO ideally we should use GitLab CI as the dashboard for trigger
> the tests, and report results back.  We should not use the GitLab
> shared runners though for reasons you describe of course. Instead
> register our own dedicated bare metal machine to run the perf jobs.
> Cleber has already done some work in this area to provide custom
> runners for some of the integration testing work. Red Hat is providing
> the hardware for those runners, but I don't know what spare we have
> available, if any,  that could be dedicated for the performance
> regression tests
> 

Thanks for the pointer, I'll ask Cleber about the integration possibilities.

> 
> Regards,
> Daniel
> 


