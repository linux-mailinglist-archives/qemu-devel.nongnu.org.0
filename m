Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0FE2C98B2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 08:53:19 +0100 (CET)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk0TO-00049c-0k
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 02:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kk0S4-0003d2-Vk
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kk0S1-0005eu-VI
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606809111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVHnLj5e/QeIMzmALBcIBTqQ0L3j8w8ceqFuRp5iHuE=;
 b=g7CNom4ZWEVVfY+Gj2REjCb/tOPtgRMkAa2SKLyw5zKUk9RAWkwpoEJzDU4WTg6EDUhAie
 3jYQT+Uj6DRlqbSjHNGpQTN3V/5poh8t637zzbzfoWK2V3ilc3bYu8bjVHrHT/gmTdYj8J
 V2G5wC5lRMG/M3bXFoEpz8N5XAA8ahw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-LevD82CXMs27pyQZJXgB-g-1; Tue, 01 Dec 2020 02:51:49 -0500
X-MC-Unique: LevD82CXMs27pyQZJXgB-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6CB0107ACF6;
 Tue,  1 Dec 2020 07:51:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E6135D9DC;
 Tue,  1 Dec 2020 07:51:43 +0000 (UTC)
Subject: Re: Proposal for a regular upstream performance testing
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201126094338.GB1122957@redhat.com>
 <20201130132300.GD422962@stefanha-x1.localdomain>
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Message-ID: <e35213ec-f4d6-d0df-92b1-1e664d5b96c3@redhat.com>
Date: Tue, 1 Dec 2020 08:51:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130132300.GD422962@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ldoktor@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dne 30. 11. 20 v 14:23 Stefan Hajnoczi napsal(a):
> On Thu, Nov 26, 2020 at 09:43:38AM +0000, Daniel P. Berrangé wrote:
>> On Thu, Nov 26, 2020 at 09:10:14AM +0100, Lukáš Doktor wrote:
>>> Ideally the community should have a way to also issue their custom builds
>>> in order to verify their patches so they can debug and address issues
>>> better than just commit to qemu-master.
>>
>> Allowing community builds certainly adds an extra dimension of complexity
>> to the problem, as you need some kind of permissions control, as you can't
>> allow any arbitrary user on the web to trigger jobs with arbitrary code,
>> as that is a significant security risk to your infra.
> 
> syzkaller and other upstream CI/fuzzing systems do this, so it may be
> hard but not impossible.
> 

Sure, not impossible, but could not be offered by me at this point. I can't promise anything but maybe in the future this can change, or in solution 2 someone else might resolve the perm issues and I can only assist with the setup (if needed).

>> I think I'd just suggest providing a mechanism for the user to easily spin
>> up performance test jobs on their own hardware. This could be as simple
>> as providing a docker container recipe that users can deploy on some
>> arbitrary machine of their choosing that contains the test rig. All they
>> should need do is provide a git ref, and then launching the container and
>> running jobs should be a single command. They can simply run the tests
>> twice, with and without the patch series in question.
> 
> As soon as developers need to recreate an environment it becomes
> time-consuming and there is a risk that the issue won't be reproduced.
> That doesn't mean the system is useless - big regressions will still be
> tackled - but I think it's too much friction and we should aim to run
> community builds.
> 

I do understand but unfortunately at this point I can not serve.

>>> The problem with those is that we can not simply use travis/gitlab/...
>>> machines for running those tests, because we are measuring in-guest
>>> actual performance.
>>
>> As mentioned above - distinguish between the CI framework, and the
>> actual test runner.
> 
> Does the CI framework or the test runner handle detecting regressions
> and providing historical data? I ask because I'm not sure if GitLab CI
> provides any of this functionality or whether we'd need to write a
> custom CI tool to track and report regressions.
> 

Currently I am using Jenkins which allows to publish result (number of failures and total checks) and store artifacts. I am storing the pbench json results with metadata (few MBs) and html report (also few MBs). Each html report contains a timeline of usually 14 previous builds using them as a reference.

Provided GitLab can do that similarly we should be able to see the number of tests run/failed somewhere and then browse the builds html reports. Last but not least we can fetch the pbench json results and issue another comparison cherry-picking individual results (internally I have a pipeline to do that for me, I could add a helper to do that via cmdline/container for others as well).

Regards,
Lukáš

> Stefan
> 


