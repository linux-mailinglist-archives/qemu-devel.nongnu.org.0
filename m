Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC103D6F82
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 08:32:07 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8GdD-0000xQ-Uz
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 02:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8Gbv-0000Eg-Gx
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8Gbr-0001um-Qb
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627367433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPcbzy2/auTKgd3xCsr1flHj/wFJNkFnMKC+M7D+BCU=;
 b=gjc3WIUec7gzld62/gvl9jg/I47RzbXLHkBjpK07yj0/n46Rc+7JJVXSsMpkFhPy6neOjE
 tcSrMIjlbD5dgK0yyf1gxXuDmzEbb7unQVKFtTz4fU3AelqhK/0vPfCHEyl6ax859FAiRg
 sIuHbcjMvnRaMLntsPj4zrrO1VlCzxs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-pWMqr8qpPoGc2AR7T20aBQ-1; Tue, 27 Jul 2021 02:30:31 -0400
X-MC-Unique: pWMqr8qpPoGc2AR7T20aBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c41-20020a05600c4a29b0290253935d0f82so308873wmp.9
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 23:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zPcbzy2/auTKgd3xCsr1flHj/wFJNkFnMKC+M7D+BCU=;
 b=EX9249LU8/BkzwD9ipUdB4KmoBEzPssGSVmqF6074DHT31PadrxcMgQqg+dSM++dVO
 tD/9SQN46r0hTKhGlA52dHwxSoDl1MQ+1KfJFQRHrCq6dqqJGUKqjuURntDYXjPqLHqL
 OAfU+PkiDXNWyHIs1MHkgjSsirZJQ8c7zELawdxez+r4iWOiAnImpLpuAo3SWIP2vzbb
 ebROxLsNkZuJ73hfJ0QYdLvP+uSjofvc+5Hz2j8Zq06yTm6fJNIQRifjlT3EXZBsCWzD
 JrohoPlO+OgTOiHF9sh49YTkpmfHAvJ/fIsVt0GwDSPmU50oomGsFeD2p+VzOCbSGT60
 0eHA==
X-Gm-Message-State: AOAM531iJQtkpI6t5bqtFncq917rtEZ6oMg2OMkCVsmTiXKyhwFDVuBJ
 AbgjX8dZQJtCkyIH9R24Q0HWlfCJcn2Om9ryiSNto4Q9QbMhjz00lYcy0zfWr1viQSi4VpsmrQi
 lKPl9TonWMBsQhZw=
X-Received: by 2002:adf:f112:: with SMTP id r18mr336687wro.160.1627367430507; 
 Mon, 26 Jul 2021 23:30:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsfrJKvG0LwHfsK2pNfRlh5Vin81nwORA5SoInaGII59NuetER+hfS4UvavOLCfxSXi8WewA==
X-Received: by 2002:adf:f112:: with SMTP id r18mr336661wro.160.1627367430304; 
 Mon, 26 Jul 2021 23:30:30 -0700 (PDT)
Received: from thuth.remote.csb (pd9575250.dip0.t-ipconnect.de. [217.87.82.80])
 by smtp.gmail.com with ESMTPSA id y3sm1980759wrh.16.2021.07.26.23.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 23:30:29 -0700 (PDT)
Subject: Re: [PATCH v2] gitlab: only let pages be published from default branch
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210723113051.2792799-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <08333e81-ea0d-6fb2-1526-c128eb264e61@redhat.com>
Date: Tue, 27 Jul 2021 08:30:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210723113051.2792799-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/07/2021 13.30, Daniel P. Berrangé wrote:
> GitLab will happily publish pages generated by the latest CI pipeline
> from any branch:
> 
> https://docs.gitlab.com/ee/user/project/pages/introduction.html
> 
>    "Remember that GitLab Pages are by default branch/tag agnostic
>     and their deployment relies solely on what you specify in
>     .gitlab-ci.yml. You can limit the pages job with the only
>     parameter, whenever a new commit is pushed to a branch used
>     specifically for your pages."
> 
> The current "pages" job is not limited, so it is happily publishing
> docs content from any branch/tag in qemu.git that gets pushed to.
> This means we're potentially publishing from the "staging" branch
> or worse from outdated "stable-NNN" branches
> 
> This change restricts it to only publish from the default branch
> in the main repository. For contributor forks, however, we allow
> it to publish from any branch, since users will have arbitrarily
> named topic branches in flight at any time.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 89df51517c..80b57b7082 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -663,6 +663,17 @@ build-tools-and-docs-debian:
>   
>   # Prepare for GitLab pages deployment. Anything copied into the
>   # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
> +#
> +# GitLab publishes from any branch that triggers a CI pipeline
> +#
> +# For the main repo we don't want to publish from 'staging'
> +# since that content may not be pushed, nor do we wish to
> +# publish from 'stable-NNN' branches as that content is outdated.
> +# Thus we restrict to just the default branch
> +#
> +# For contributor forks we want to publish from any repo so
> +# that users can see the results of their commits, regardless
> +# of what topic branch they're currently using
>   pages:
>     image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
>     stage: test
> @@ -681,3 +692,10 @@ pages:
>     artifacts:
>       paths:
>         - public
> +  rules:
> +    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
> +      when: on_success
> +    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
> +      when: never
> +    - if: '$CI_PROJECT_NAMESPACE != "qemu-project"'
> +      when: on_success
> 


Reviewed-by: Thomas Huth <thuth@redhat.com>


