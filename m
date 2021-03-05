Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6289C32E5F5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:16:38 +0100 (CET)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI7Vd-0004ca-FG
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI7Te-0003Wy-KX
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:14:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI7Tb-0007Tw-T0
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614939269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4vnbUEM8bdJEqv7ZwQoWFdubDGSNDkB4eefEut0hA8=;
 b=Pm5HH+m4r0nd7mjfGQ68bBCMs51Ms2Iu+FJ5RudRYfalC+qAAAJkNTAUBgJDNZBpJio5CT
 UZGAl6impIdaVd5JiIiciHF94CixN8MPYrRdTRHJNIAvlKS2cGiGNr7UVUP4sedz9hAVcd
 eQCtGGQ45Hvt0C1uArJ3qFQWCeVlN1Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-YFc7CCqDNCGtXtC9UQxulg-1; Fri, 05 Mar 2021 05:14:26 -0500
X-MC-Unique: YFc7CCqDNCGtXtC9UQxulg-1
Received: by mail-wm1-f69.google.com with SMTP id n25so576317wmk.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 02:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I4vnbUEM8bdJEqv7ZwQoWFdubDGSNDkB4eefEut0hA8=;
 b=cEimUR5kpfXGmJvj2Dac+HaebZUTU6vwBOlG8+e8HD5GlKX5grpEYuCUvfLHUx6oS5
 BSaG866ZWSLZl97WDkPfP91aatH4Vle/0h17GyQgD+hgjo+E4NDTUTEVPsltSfLeWvJ3
 tHeO+WrXbweSlfswvl/crxLvIRAUoVlfMD+wQUHNQaXXdekoauXNfFgF/4DWiQV0vVvE
 ZRRQD0mUnfzyVq9qGQBbGPjBTGg9kL9pfkE1nqfFyKMZfksIxVEKlnSsahfeNkI50/Ng
 PEdFk4Rv6uTAKeaPjj/sjeR2pc08/jGt/1YrD9t8yLjfhXAwVCzFJxp8wcnyofYyqJk4
 x+og==
X-Gm-Message-State: AOAM531AG7gu2cFEI61zNdb7+/72teK2xd23DlRGLaBe+Eka6DXN7CKn
 57mQ9wxttKzqVCMIhAh8eB5KiZ3pc+46Pq3LxqI3MSNdHgd3B44k2y0sqvnGb9xolZjGKBKotRn
 Awkv3m3YWEFzA8Zw=
X-Received: by 2002:a05:600c:2247:: with SMTP id
 a7mr8251426wmm.131.1614939264616; 
 Fri, 05 Mar 2021 02:14:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsF+zxaOCwDcPGokHOKJSYV6BVdVhq6F7dpeNXCmwo8UvOe54kPbchGlwmD07tNdpL0FYLLw==
X-Received: by 2002:a05:600c:2247:: with SMTP id
 a7mr8251406wmm.131.1614939264494; 
 Fri, 05 Mar 2021 02:14:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v5sm3867205wmh.2.2021.03.05.02.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 02:14:24 -0800 (PST)
Subject: Re: [PATCH v5 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating
 CI)
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0acfe9de-c7c9-ef1e-8ed4-6f7e42859dcc@redhat.com>
Date: Fri, 5 Mar 2021 11:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 2/19/21 10:58 PM, Cleber Rosa wrote:
> TL;DR: this should allow the QEMU maintainer to push to the staging
> branch, and have custom jobs running on the project's aarch64 and
> s390x machines.  Jobs in this version are allowed to fail, to allow
> for the inclusion of the novel machines/jobs without CI disruption.
> Simple usage looks like:
> 
>    git push remote staging
>    ./scripts/ci/gitlab-pipeline-status --verbose --wait
> 
> Long version:
> 
> The idea about a public facing Gating CI for QEMU was summarized in an
> RFC[1].  Since then, it was decided that a simpler version should be
> attempted first.
> 
> At this point, there are two specific runners (an aarch64 and an s390x)
> registered with GitLab, at https://gitlab.com/qemu-project, currently
> setup to the "qemu" repository.

Our CI is heavily based on containerized testing, your scripts/document
don't cover that.

Should we document how to install a container service (we mostly
use Docker and Podman)?

Or should we simply explicit these are only "native" runners and
container support will be considered later eventually?

Regards,

Phil.


