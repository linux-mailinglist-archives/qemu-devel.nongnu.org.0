Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E9531C6A3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 07:57:06 +0100 (CET)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBuIC-0007Ud-SV
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 01:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBuGu-0006wj-H3
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 01:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBuGq-0003M5-2Q
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 01:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613458537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PEJnbqMzn4PgmSlpKErUiCo3IraFCV1rEfyQnevjxgk=;
 b=Vg9mQ8+bAiRNZaIyFCxE8cBSMj9TwoNzfPZZt06Cnc4jRY/84REqL8ZzUhTHjWgzboQAQJ
 G55wrerHFUmNjNn6Z7dxEhrt/WKPIlwfIyXNfsTZxKeui9PWkR5h8usEvMmwQ/MRM8KiUl
 IYPYO6F69nBXeOlE0byiciBtTuMXvGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-Qk2r8atFOK6TxiflkfUUjQ-1; Tue, 16 Feb 2021 01:55:35 -0500
X-MC-Unique: Qk2r8atFOK6TxiflkfUUjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8E9100B3B0;
 Tue, 16 Feb 2021 06:55:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9E1760C15;
 Tue, 16 Feb 2021 06:55:29 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci: Only push Docker 'latest' image when building
 default branch
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210215192814.989441-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <97878d0a-5c47-c50c-c4ef-f6d69a52a7d0@redhat.com>
Date: Tue, 16 Feb 2021 07:55:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215192814.989441-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/2021 20.28, Philippe Mathieu-Daudé wrote:
> While we are interested in building docker images in different
> branches, it only makes sense to push 'latest' to the registry
> when this is the project default branch (usually 'master').
> 
> Else when pushing different branches concurrently we might have
> inconsistent image state between branches.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.d/containers.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 90fac85ce46..52a915f4141 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -17,7 +17,7 @@
>             -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
>             -r $CI_REGISTRY_IMAGE
>       - docker tag "qemu/$NAME" "$TAG"
> -    - docker push "$TAG"
> +    - test "$CI_COMMIT_BRANCH" = "$CI_DEFAULT_BRANCH" && docker push "$TAG"

So does that mean that the following stages in the CI (i.e. build, test) are 
only always (i.e. also for the non-master branches) going to use containers 
that have been build on the master branch?

  Thomas


