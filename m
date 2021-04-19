Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39C363B20
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:49:23 +0200 (CEST)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMmg-00013w-JN
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMlu-0000YM-F7
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMls-0003fe-96
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618811311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txr77UfUkVeuFh+/hj0O9+ywOhg0cKQ6DbH05eh71bk=;
 b=JQkBB3sqs3mFWKhAT6f2np5TrYqZZgGdj+9bUebX468L7IVmWVqih0KPY8lViSpGv136PV
 W2vud5EFlE4FqE0EwgctMCiy1VnVklRQJ62KcXK1/TO36cUhj5pU6m7FpmJNB2S+iG1NoV
 DKg4FEFvE4TVU3EMCc15RRm/qrH3oA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-uTs1iSNTN56L8jGiftM23g-1; Mon, 19 Apr 2021 01:48:27 -0400
X-MC-Unique: uTs1iSNTN56L8jGiftM23g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4122087A826;
 Mon, 19 Apr 2021 05:48:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E02C5D71D;
 Mon, 19 Apr 2021 05:48:17 +0000 (UTC)
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1f1ec642-90f4-ec33-1ce1-a1a76b0259ec@redhat.com>
Date: Mon, 19 Apr 2021 07:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210418233448.1267991-15-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 01.34, Philippe Mathieu-Daudé wrote:
> Forks run the same jobs than mainstream, which might be overkill.
> Allow them to easily rebase their custom set, while keeping using
> the mainstream templates, and ability to pick specific jobs from
> the mainstream set.
> 
> To switch to your set, simply add your .gitlab-ci.yml as
> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
> is your gitlab 'namespace', usually username). This file will be
> used instead of the default mainstream set.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.yml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 718c8e004be..35fd35075db 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -9,7 +9,12 @@ generate-config:
>       paths:
>         - generated-config.yml
>     script:
> -    - cp .gitlab-ci.d/qemu-project.yml generated-config.yml
> +    - if test -e .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml ;
> +      then
> +        cp .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml generated-config.yml ;
> +      else
> +        cp .gitlab-ci.d/qemu-project.yml generated-config.yml ;
> +      fi

I think you could merge this with the previous patch, since the previous 
patch is not very useful on its own.

Anyway, I like the idea, that could be useful for downstream, indeed!

  Thomas


