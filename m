Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3AF303AE9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:58:26 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4M3E-0002Re-Qi
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4M23-0001eq-FM
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:57:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4M20-0001Ec-S9
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611658627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6iPNciDfzkPicSCY6qWrp0oZkL3Y9E3JfMj/MGEh2c=;
 b=PgU85SSMcGvSDCUzG6GByi91N9y5yizC4Cl9erCmHrMeUMKqpHK5bCxaf5bLNTK0L2O3Ae
 fpyoKV6WvJOEVqG8R2XmPjUfqGmM1teeJ8wnDdLPArRF/97mftHefVKEzmOzpOblQ9IEuk
 9Nu8hyEfAwYw2Rh3RddPAWulC/TJ8fo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-7LE6DHRHOu2oiscYCAL_UA-1; Tue, 26 Jan 2021 05:57:04 -0500
X-MC-Unique: 7LE6DHRHOu2oiscYCAL_UA-1
Received: by mail-ej1-f70.google.com with SMTP id d15so4773255ejc.21
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 02:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6iPNciDfzkPicSCY6qWrp0oZkL3Y9E3JfMj/MGEh2c=;
 b=hXb8UgHWk9eD4bg7hsdp/RZGFBL3tO1hcu5xlJvvhkaQkBkJk8ZFQXC77GHgI46mx2
 oafnTvJudYKYZAQpH5rwrun5xesAWyHKA3dyVKuRryA9gOfQHlTSm+LmBcdLE75x8x+o
 UqEFlJ4LC1ks2CIG1ZR9q8AUXL5iRyjlZUp/YwZ6nVj8TBmXva2v1yl5oGk4dWZukoyk
 NtjFBwmW2ljutSfB7fC84wvSsHLfG4ao/J9HuNg3ycS7KiZaaBTNFWWJL1f/CP8L/ANn
 0xG9IdNHxevAwNch93F63+3dFvjtl57IbVuUHfYycAD0PUq8y07CAFbK8qdUKZgZKmkY
 8l2w==
X-Gm-Message-State: AOAM531yz23P6T+m/ydRl/wkoGP4u2nOKwpY0OmI0PNaE+qyDfp42qHy
 nAPMFjz0K+EA9oAqVQRy0P3yc0ZLiXNgQeo+2hSZvU3LAw81PtuVfXoo0zOsOtKyzXoRSHNQGpL
 2HXZVvmbUFloGUes=
X-Received: by 2002:a17:906:409:: with SMTP id d9mr2986624eja.70.1611658623237; 
 Tue, 26 Jan 2021 02:57:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD+fDx/NGee5mlLDVJ0FXFUQWQJ1Do9K+eVME8PLMiGflt8XwpYgnbI2sbfujmeJzAs4D8IQ==
X-Received: by 2002:a17:906:409:: with SMTP id d9mr2986612eja.70.1611658623088; 
 Tue, 26 Jan 2021 02:57:03 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b17sm1970738edv.56.2021.01.26.02.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 02:57:02 -0800 (PST)
Subject: Re: [PATCH] iotests/118: Drop 'change' test
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210126104833.57026-1-mreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <09cdd313-d410-bdff-bc63-e476383d9fa3@redhat.com>
Date: Tue, 26 Jan 2021 11:57:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126104833.57026-1-mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 11:48 AM, Max Reitz wrote:
> Commit 0afec75734331 removed the 'change' QMP command, so we can no
> longer test it in 118.
> 
> Fixes: 0afec75734331a0b52fa3aa4235220eda8c7846f
>        ('qmp: remove deprecated "change" command')
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/118     | 17 -----------------
>  tests/qemu-iotests/118.out |  4 ++--
>  2 files changed, 2 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


