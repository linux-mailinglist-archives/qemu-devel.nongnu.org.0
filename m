Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB02F62A7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:06:24 +0100 (CET)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03GZ-0006x3-1f
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03CA-0003Sx-Hk
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:01:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03C4-0007wA-2E
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwBy8OhJCfaHt392j+DSRUrwF43K3GmQKqOoq1f5cIE=;
 b=eCBrtnSfntD1d07ihau1RbnhrYO9vDXpIyIhdVg3CLm58bWXRm+CaXrIj/Mca/0R/7aLfc
 IrXtU93t6BijmPrAT4F+qX89r5uxj5ynD7b1J2X8J+9BJBx5jgyUgR2kcYHAUwcdEJnywu
 Bd9waf6H68zKdWvKh9sz1SqkCPsxvNc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-dzjtRr41P2SAB0SyIOdWSQ-1; Thu, 14 Jan 2021 09:01:41 -0500
X-MC-Unique: dzjtRr41P2SAB0SyIOdWSQ-1
Received: by mail-wr1-f69.google.com with SMTP id m20so2644014wrh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RwBy8OhJCfaHt392j+DSRUrwF43K3GmQKqOoq1f5cIE=;
 b=GJ/veNskzMMsnuzSq34UvToEbOq6CVgL8dz+oBaGhymMUAdZVSanNTgusgz9EzhpWg
 lgfBPwPHf4rSQfh41vy4MaU9/Pju82KzMuEB5sUyHss8yXb5oIGvHhyV03+RgvEMTrA9
 bQAovujsxsT9kS5VEE6LrMh+MMWQNHiCtinucGxJxKtyq401hIBJha154DzGt5Uxwwe8
 lgXA7YXbp2/yXCgn/0faXbAgSpzbL+qVk3V1A9S8sPIQQR6ruTGKMaE4OLTuoesfV2pC
 4AoLE05ggk1LUuv6YxhyJFarND8mqv4XZBB8rXh+eRFaMwNLfeN9HAgxcbrUjzWzw/RD
 9Exg==
X-Gm-Message-State: AOAM5322R1aLKQf8Nb5gp5En7AoLvHNT60rAYK83NDvIYm3hc+tbYWwt
 YkhpQhM/YE4t5ivrmrqDiEvhkNWudqOnl3Veld4niy5FHKzdX4m6zaWS9orgRX2tvlBv3x7VdUf
 WYQ0EI2mFFFfocOY=
X-Received: by 2002:a5d:684b:: with SMTP id o11mr8079789wrw.157.1610632900663; 
 Thu, 14 Jan 2021 06:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6UHpT76qnzAdRVZZE2AKq7R+sgso8/Wqbtz7uesz5LdhsGRPAU+RypM8z8HV+/BAsq9pHaA==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr8079767wrw.157.1610632900483; 
 Thu, 14 Jan 2021 06:01:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m17sm10692740wrn.0.2021.01.14.06.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 06:01:39 -0800 (PST)
Subject: Re: [PATCH v2 06/25] tests/docker: remove FEATURES env var from
 templates
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-7-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd8ba1a5-cf8c-68db-f26c-a5eee3357295@redhat.com>
Date: Thu, 14 Jan 2021 15:01:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> In preparation for switching to auto-generated dockerfiles, remove the
> FEATURES env variable. The equivalent functionality can be achieved in
> most cases by just looking for existance of a binary.
> 
> The cases which don't correspond to binaries are simply dropped because
> configure/meson will probe for any requested feature anyway.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/common.rc                        | 19 ++++++++++++++-----
>  tests/docker/dockerfiles/debian10.docker      |  2 --
>  .../dockerfiles/fedora-win32-cross.docker     |  1 -
>  .../dockerfiles/fedora-win64-cross.docker     |  1 -
>  tests/docker/dockerfiles/fedora.docker        |  1 -
>  tests/docker/dockerfiles/ubuntu.docker        |  1 -
>  tests/docker/dockerfiles/ubuntu1804.docker    |  1 -
>  tests/docker/dockerfiles/ubuntu2004.docker    |  1 -
>  tests/docker/run                              |  3 ---
>  tests/docker/test-clang                       |  2 +-
>  tests/docker/test-debug                       |  2 +-
>  tests/docker/test-mingw                       |  3 ++-
>  tests/docker/test-misc                        |  2 +-
>  tests/docker/test-tsan                        |  2 +-
>  14 files changed, 20 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


