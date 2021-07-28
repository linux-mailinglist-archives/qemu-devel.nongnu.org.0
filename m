Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77163D9546
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:28:06 +0200 (CEST)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oHl-0003V9-TX
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oGZ-0002oT-UR
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oGV-0002x4-M8
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627496805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1k+Qz+EILOFI7Mnpv9Gu7pylp23wO44ejalzuAhoMM=;
 b=fZT7ykmrqXluZVrrJSGbXrrNQ5pX+voS0WEEk/izo5lhWXPUhfPFMtZV9FDv2iZo1MdXC2
 BEKzmLlidTfDkKCpUw//ZXtBpQCugH4OQIJ3SUliqIRIeZYG48+O9KlsLPbEEkLl0oeQkn
 qySF6Z/NC3dDVVqRRDXeU2n626RRke8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-RDvOKDo4MtiJFporLJmPjQ-1; Wed, 28 Jul 2021 14:26:44 -0400
X-MC-Unique: RDvOKDo4MtiJFporLJmPjQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o8-20020a5d4a880000b029013a10564614so1249450wrq.15
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W1k+Qz+EILOFI7Mnpv9Gu7pylp23wO44ejalzuAhoMM=;
 b=evYpYaxMb3JmFYdgM/qCqdnwsR5JFvw3a3ymTa2d6ZwRND051BEA0QMA0HHZo9G67g
 zFBaQ95COqxe5Qrm94bExgReXtv5VDp1cbgWVKL2QGEo3do7YTniCG8IHouaJxnafCx/
 k1eIFfY1SXfbP74iyNDPi46z8EF/bzPdwSf0pNCLIF6LaEd8MOFLvdRfKDex+n6lj+Nr
 H0KLf2JoL0mbkodhMtX2EZoa9rmPkmKiY90h7XvtWx3WymRDjY77kJgkN6a6UV8dGTl8
 zZ203FV5pBXWWjC+OPUjwoUpypFKFydPh9j1FlxL6DtcKLEA9NSe1+eaRPrqNXEdSLDH
 NrJA==
X-Gm-Message-State: AOAM532kZoRv1e3Jiyxq+csu4qcpsUL+RIUN3J8X2IOR4gKgCOo0dodr
 I/m4SegkXVM/shc3SeY/wZv0tcoPA5C1fXemX5rTYvCYKPOG3DW7wqqGH+Ex0igLVAJ820XRtpU
 +ydZHneL9LdzUseo=
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr10778440wmj.128.1627496803298; 
 Wed, 28 Jul 2021 11:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzorx/l82fHH2Vpi6CHRbQCgZbcRQ+7J2frS0oiTFZI+c6x3U6BdTWxbQjuSWAw7VfLHAgBRA==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr10778418wmj.128.1627496803067; 
 Wed, 28 Jul 2021 11:26:43 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id p5sm781617wrd.25.2021.07.28.11.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 11:26:42 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci.d/custom-runners: Improve rules for the staging
 branch
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210728173857.497523-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <42b2acfc-cf8e-5b9c-22af-0e3cd1d80283@redhat.com>
Date: Wed, 28 Jul 2021 20:26:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728173857.497523-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 7:38 PM, Thomas Huth wrote:
> If maintainers are currently pushing to a branch called "staging"
> in their repository, they are ending up with some stuck jobs - unless
> they have a s390x CI runner machine available. That's ugly, we should
> make sure that the related jobs are really only started if such a
> runner is available. So let's only run these jobs if it's the
> "staging" branch of the main repository of the QEMU project (where
> we can be sure that the s390x runner is available), or if the user
> explicitly set a S390X_RUNNER_AVAILABLE variable in their CI configs
> to declare that they have such a runner available, too.
> 
> Fixes: 4799c21023 ("Jobs based on custom runners: add job definitions ...")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 40 +++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index 061d3cdfed..564b94565d 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -24,7 +24,8 @@ ubuntu-18.04-s390x-all-linux-static:
>   - ubuntu_18.04
>   - s390x
>   rules:
> - - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> + - if: "$S390X_RUNNER_AVAILABLE"

If you base this patch on top of "docs: Document GitLab
custom CI/CD variables" that you already queued, you can
directly add a description for S390X_RUNNER_AVAILABLE in
docs/devel/ci.rst, but this can be done later too.

Regardless of whether docs/devel/ci.rst is updated:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


