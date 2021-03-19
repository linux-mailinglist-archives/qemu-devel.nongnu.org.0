Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E5342035
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:54:55 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGWc-0005Eb-OV
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lNGTC-00025y-Dz
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lNGT9-00031Q-Dj
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616165478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XV+RgrHyJc7GCaX+3gdBjBXH9Vzl1koCq6bvoVYFUCo=;
 b=QyqJAsLzsLjBVFyWBeCTpFO2daTG3pkV+b16NjPQethH/5aBscp5QPILRXI9VwfGC2ZsAt
 bV0h07yhzWeP+Zj+AtjpMMEeVXV52E4NISgPnBH6kYChkOI9H8wSZfuOfl+Ty/iQM7RxUP
 DNx01c+xjyHXjIPYqeiIAiZHmq2O6+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-7Nab4jZnPPKISG1xqvzeDQ-1; Fri, 19 Mar 2021 10:51:14 -0400
X-MC-Unique: 7Nab4jZnPPKISG1xqvzeDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 907D91092F00;
 Fri, 19 Mar 2021 14:51:13 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E863C6091B;
 Fri, 19 Mar 2021 14:51:04 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci: Restrict jobs using Docker to runners having
 'docker' tag
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <20210319004300.3800583-1-f4bug@amsat.org>
 <9cdb9c79-2466-93fa-a01a-f38532f2bd6f@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <900e7512-c90d-c0ff-2e10-c800ab02179a@redhat.com>
Date: Fri, 19 Mar 2021 15:51:04 +0100
MIME-Version: 1.0
In-Reply-To: <9cdb9c79-2466-93fa-a01a-f38532f2bd6f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/19/21 06:40, Thomas Huth wrote:
> On 19/03/2021 01.43, Philippe Mathieu-Daudé wrote:
>> When a job is based on a Docker image [1], or is using a Docker
>> service, it requires a runner with Docker installed.
>>
>> Gitlab shared runners provide the 'docker' tag when they have it
>> installed.
>>
>> Are Gitlab shared runners are limited resources, we'd like to
> 
> s/Are/As/
> 
>> add more runners to QEMU repositories hosted on Gitlab. If a
>> runner doesn't provide Docker, our jobs requiring it will fail.
>>
>> Use the standard 'docker' tag to mark the jobs requiring Docker
>> on the runner.
>>
>> [1] https://docs.gitlab.com/ee/ci/yaml/#image
>> [2] https://docs.gitlab.com/ee/ci/yaml/#services
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [...]
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index f65cb11c4d3..d4511cf7dea 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -14,6 +14,8 @@ include:
>>     - local: '/.gitlab-ci.d/crossbuilds.yml'
>>     .native_build_job_template: &native_build_job_definition
>> +  tags:
>> +  - docker
>>     stage: build
>>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>     before_script:
>> @@ -38,6 +40,8 @@ include:
>>         fi
>>     .native_test_job_template: &native_test_job_definition
>> +  tags:
>> +  - docker
>>     stage: test
>>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>     script:
> 
> If you add it to the templates ... won't this disable most of the jobs
> on the dedicated runners that don't have docker? Wouldn't it be better
> to add the tag only to the jobs that run "make check-tcg" ?

(I don't know if the docker dependency is presently expressed with the
exact granularity that we need, but I'm willing to ACK the edk2 part, on
principle. We should be explicit about dependencies.)

Thanks
Laszlo


