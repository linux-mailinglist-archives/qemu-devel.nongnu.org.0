Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B56830370F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:06:41 +0100 (CET)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IQy-0002Vn-JY
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4IOL-0001Gq-KZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:03:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4IOJ-00065j-KG
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611644634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpiTyqhuSMGFLUEdRzpzHnngSJ8bP02nklEZvIzdTNE=;
 b=QY8emh6S0rN5GNC//cqa2l5Lj6O+OpniXSfgT9xHZv6uIjiA1w4yx91e2Uc/dTmTzFweaB
 yEzA+Ixd228fig9kD6xbolsNf9+c73oM6Kigt0B7JyRA5tKqTH3OHyYE9cpz8gpegULut/
 e0XVMUx41MxTwsjUV9ClHAbevrlvXfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-dlyj0qZ5OuiRLdC4ihEaxA-1; Tue, 26 Jan 2021 02:03:48 -0500
X-MC-Unique: dlyj0qZ5OuiRLdC4ihEaxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DAA68799FE
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:03:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5633C60C5F;
 Tue, 26 Jan 2021 07:03:43 +0000 (UTC)
Subject: Re: [PATCH v1] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210125090339.134019-1-thuth@redhat.com>
 <e8699ffe-3260-3033-cc13-ae9c3f86cbf1@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b6be5064-c3aa-8666-126d-e48e47392108@redhat.com>
Date: Tue, 26 Jan 2021 08:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e8699ffe-3260-3033-cc13-ae9c3f86cbf1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/2021 10.51, Paolo Bonzini wrote:
> On 25/01/21 10:03, Thomas Huth wrote:
>> Currently, our check-system-* jobs are recompiling the whole sources
>> again. This happens due to the fact that the jobs are checking out
>> the whole source tree and required submodules again, and only try
>> to use the "build" directory with the binaries and object files
>> as an artifact from the previous stage - which simply does not work
>> anymore (with the current version of meson). Due to some changed
>> time stamps, meson is always trying to rebuild the whole tree.
>>
>> To fix this problem, we can use "meson test --no-rebuild" instead of
>> make check" to avoid rebuilding all binaries every time. However, the
>> iotests ("make check-block") are not run by "meson test", so we have
>> to execute these manually now. But instead of adding them to the same
>> job as "meson test", it's better to put them into a separate new job
>> instead, to keep things nicely running in parallel in the CI.
>> This saves ca. 15 - 20 minutes of precious CI cycles in each run.
> 
> The reason why we're not using "meson test" is that the reporting is (still) 
> inferior to what you get from "make check", especially with respect to which 
> tests are failing.  This is being tracked at 
> https://github.com/mesonbuild/meson/issues/7830 and the last missing bits 
> are at https://github.com/mesonbuild/meson/issues/8200 (after which we'll 
> change the "meson test" command line to also include "meson test --verbose").
> 
> However, for CI this is a minor issue because we can let GitLab parse the 
> XML testing logs.  Can you add something like this to the test jobs for v2?
> 
> +  artifacts:
> +    when: always
> +    paths:
> +      - build/meson-logs/
> +    reports:
> +      junit: build/meson-logs/testlog.junit.xml

Ok, I've tried that but it also worked not quite as expected:

https://gitlab.com/huth/qemu/-/pipelines/246463068/test_report

The "check-*" jobs now show up in the test report page, but even though I've 
made some tests failing (e.g. the check-system-centos job), the failing jobs 
are showing up with "Failed: 0" there. Also the duration is always marked 
with 0.00ms.

> Another possibility could be to use "make check NINJA=:".  I am not sure if 
> that works, but if it does it would be the smallest possible workaround.

It works! So since all the other options seem to have other drawbacks right 
now, I guess that's the best way to go until we completely switch to "meson 
test". Thus I've just sent a patch for that.

  Thomas


