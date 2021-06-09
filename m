Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76153A13DF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:12:38 +0200 (CEST)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqx4X-0007r9-TM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lqx3T-0007CN-9Y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lqx3R-0004T3-BY
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240688;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/NnZ8wf5V9LFvW6crG2RtCudLQS3hwaV/cG0WRoKoI=;
 b=e1Hoeqiw2ivER9blf/T0WnI68zP63w617hMdh6Imzfak7yUsknlznMvidx4RgkbzXMpI/X
 sMTaGe+LP3kp2AIok5QnV4jKEK5Ta/OXv/qbCuqR1LCLbdTM9XibLqbQXHt1A2bba3h2g+
 fIP6q/pKLgg/HGvf6MT9H8BD6v0nMwI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-3fd3SP0YMlmA0lBc9fXdmQ-1; Wed, 09 Jun 2021 08:11:27 -0400
X-MC-Unique: 3fd3SP0YMlmA0lBc9fXdmQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so6725587wri.20
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=f/NnZ8wf5V9LFvW6crG2RtCudLQS3hwaV/cG0WRoKoI=;
 b=nQaswzvLSOV03uu7JLkjTCN7oY1BjSFbREOtaJQHYfhWBHW+f0o5RNgpdS19ske25m
 ydAHeK+o0o5zQrrWJFPQ4lfeFFCu1AmgZIZPZbOnzICo7uXTjvxF7VX9wQ4UkGot/cpa
 zwsdLzl2D8hXKwf26GlfU0TewbXrEBTp8Ldd38+UcQa9TWBERcj2BrrnEgL58phz1Jsy
 W6jAXUwLTHTfoBrctZY1A9w33A9y0Z2nlRAOcv+zuzpQCwBtoaXg6vAgBCY07nLigTdP
 Tjt3szjGiFAPfHtVWIavdaoe7onXQuspeWosUW0pCA0WS04kmH2mGUIv1f+/RRcsDZEc
 yI6w==
X-Gm-Message-State: AOAM530Bi5m8Uc4I+h7LX68FzZvFc1V3WbSsm1kN6wIudlCIGWm0h0wy
 Mpg2k3WJVBz42BMXqHftEIHwLrUTOFQ6WwjMyzflQEBErvzuF29N/LOQSFdmWxy+y46nSyxbMko
 DyRBZBVz3f7MeAM4=
X-Received: by 2002:a05:600c:4a09:: with SMTP id
 c9mr9353649wmp.162.1623240686174; 
 Wed, 09 Jun 2021 05:11:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeqZ+VdDSEnc4+bWsnFHD5DB+iPqGssx+SaxkgW+5JPAvciYeP05G7tqDLWiyARe6sxE1wrg==
X-Received: by 2002:a05:600c:4a09:: with SMTP id
 c9mr9353630wmp.162.1623240685997; 
 Wed, 09 Jun 2021 05:11:25 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id i9sm20416621wrn.54.2021.06.09.05.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:11:25 -0700 (PDT)
Subject: Re: [PATCH 0/3] Acceptance Tests: support choosing specific distro
 and version
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <812f1d67-5fe4-bfde-0d40-d1c8cc5e651e@redhat.com>
Date: Wed, 9 Jun 2021 14:11:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210414221457.1653745-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: eric.auger@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi CLeber,

On 4/15/21 12:14 AM, Cleber Rosa wrote:
> Because Fedora 31 will not suit all tests that depend on a Linux
> guest, this allows for the configuration of the guest distribution.
> It came out of a suggestion from Eric Auger, and it was actually a
> feature I planned to submit for a while.
>
> This is based on the following series:
>
>  [PATCH v3 00/11] Acceptance Test: introduce base class for Linux based tests

What is the state of this series, do you plan to respin. My SMMU
avocado-qemu tests depend on it. Also I have added some intel iommu
tests on top of it.

Thanks

Eric
>
> A GitLab CI pipeline can be seen here:
>
>  https://gitlab.com/cleber.gnu/qemu/-/pipelines
>
> Note: I'll address the line length caught in the check-patch job as
> soon as I find what was the outcome of the line limits for Python
> code discussion.
>
> Based-On: <20210412044644.55083-1-crosa@redhat.com>
>
> Cleber Rosa (3):
>   Acceptance Tests: rename attribute holding the distro image checksum
>   Acceptance Tests: move definition of distro checksums to the framework
>   Acceptance Tests: support choosing specific distro and version
>
>  docs/devel/testing.rst                    | 65 ++++++++++++++++++++++
>  tests/acceptance/avocado_qemu/__init__.py | 67 +++++++++++++++++++++--
>  tests/acceptance/boot_linux.py            |  8 ---
>  3 files changed, 127 insertions(+), 13 deletions(-)
>


