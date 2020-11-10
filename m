Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5762AE11D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:56:04 +0100 (CET)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcagN-0004Zt-0J
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaex-00044g-5u
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaeu-0002hW-Rg
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605041670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofApBKJfF8tM4UqtmfxTCMlAjQwKoQeSUzNEXuAO9wE=;
 b=LdIF2o+oops/kbZBuXUmqGqFdemiva/xXjOb+u/OCRrk43YOBQCxvQe/jkmMM72zXhuN/5
 uUkmGy1gH+77cnfQu9M+oKEbT8sAWMY8aqQQCk1xeRqiji6/S70E7ov6TP4zxASC3C06MB
 xrrbjuv/htspmrO2W+Tzd0OGWOmuVV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-maMzwUbRO3i6ruMprIQyiw-1; Tue, 10 Nov 2020 15:54:27 -0500
X-MC-Unique: maMzwUbRO3i6ruMprIQyiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E4D487951B;
 Tue, 10 Nov 2020 20:54:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AD873C04;
 Tue, 10 Nov 2020 20:54:24 +0000 (UTC)
Subject: Re: [PATCH v3 08/11] gitlab-ci: Extract common job definition as
 'native_common_job'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-9-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <cc51b177-c248-467f-f9c8-f56236ede1d2@redhat.com>
Date: Tue, 10 Nov 2020 18:54:16 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108221925.2344515-9-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 8:19 PM, Philippe Mathieu-Daudé wrote:
> Extract the common definitions shared by '.native_build_job'
> and '.native_test_job' to '.native_common_job'.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d4526323169..f708573884e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -13,9 +13,12 @@ include:
>     - local: '/.gitlab-ci.d/containers.yml'
>     - local: '/.gitlab-ci.d/crossbuilds.yml'
>   
> -.native_build_job:
> -  stage: build
> +.native_common_job:
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest

Do you envision that "native_common_job" with more common properties?

Asking because it creates another indirection to just replace two "image"s.

Anyway,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


> +
> +.native_build_job:
> +  extends: .native_common_job
> +  stage: build
>     before_script:
>       - JOBS=$(expr $(nproc) + 1)
>       - sed -i s,git.qemu.org/git,gitlab.com/qemu-project, .gitmodules
> @@ -35,8 +38,8 @@ include:
>         fi
>   
>   .native_test_job:
> +  extends: .native_common_job
>     stage: test
> -  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     script:
>       - cd build
>       - find . -type f -exec touch {} +


