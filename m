Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0D06A9277
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:32:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0oV-0000X5-CY; Fri, 03 Mar 2023 03:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY0oQ-0000Wa-LG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:30:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY0oP-0004oI-1M
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677832243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhZEdZgwfG6wzdSDCxP5zIxrLj6ADxTWkvWfmDGvWiA=;
 b=ev/B1zSVURpkiAPVwmC72FtmF+Of9x2s4OMTenCQ6clmCWu/Y3+b1gs9Gb94QBotRvj9kr
 sYuAPQ6TmUf/6ammdUeQkSR+mWPkvpey5HCbIINYvEHDmotkgsOy2huSe3d4maJ2osfw0g
 G2RdXyYIyIIKonKOz+Y/NTyeHc7dT3A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-d12z_-1OOcuuTOsvotC3_A-1; Fri, 03 Mar 2023 03:30:42 -0500
X-MC-Unique: d12z_-1OOcuuTOsvotC3_A-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so652730wmk.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhZEdZgwfG6wzdSDCxP5zIxrLj6ADxTWkvWfmDGvWiA=;
 b=SNukOsCPqKyxYwg3jSb380Lih+WmTAPaW9OK5jeXapCa/VzR2NREbT98gXUiGtcHmJ
 hv0E5hBOhNTn1nrfW0BGbCI4WF+MPYG11R+FQz2ZEznacVhDuofiqYi8TV24XFePOT7V
 IPZwNac289Ej8A3DlEcGiC68X+GzAU/VkGMtz3S4poyQMdVk7llrsUuHQwlOvZaNN4hv
 mw8goXnvtf2oiEwU8DKwxCXbZ+Y6kMVJr6AmOOrOmO7D7OjvqiGgLMgWlZJ7Sxdfk29s
 sq+rwUv/MLIsGOdn9vsNzbF4vw9m3w3bQiw+t7k8BkiugPNDESzisRUxjkOHfujzKens
 CXvg==
X-Gm-Message-State: AO0yUKViJyTCzG9yoQC8edvshx6kGN1RI10uS+rfn1t8/GPy7OBymxIX
 7McDHBKG623ZwSe2GKHKgR+R/Q96hkfn2aOcKbESX7/wJUAYSYNVVagZcLsLMl2DcP5bsXwCedK
 LF1QGhAfUU7zHK8o=
X-Received: by 2002:adf:f587:0:b0:2c7:deb:c61 with SMTP id
 f7-20020adff587000000b002c70deb0c61mr837907wro.39.1677832241521; 
 Fri, 03 Mar 2023 00:30:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/dJwNruZz1M90tM7eo4IYbIHUhZOKktnfnI0vYyalAI4Di1r4S4buYoNzEhtM12vBaVFHjDw==
X-Received: by 2002:adf:f587:0:b0:2c7:deb:c61 with SMTP id
 f7-20020adff587000000b002c70deb0c61mr837895wro.39.1677832241230; 
 Fri, 03 Mar 2023 00:30:41 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 h16-20020a5d5490000000b002ce37d2464csm527688wrv.83.2023.03.03.00.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 00:30:40 -0800 (PST)
Message-ID: <44d571e7-05b6-b2a1-7eb7-44bf2912ec69@redhat.com>
Date: Fri, 3 Mar 2023 09:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/5] iotests: make meson aware of individual I/O tests
In-Reply-To: <20230302184606.418541-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 19.46, Daniel P. Berrangé wrote:
> To just repeat the patch 5 description...
> 
> Currently meson registers a single test that invokes an entire group of
> I/O tests, hiding the test granularity from meson. There are various
> downsides of doing this
> 
>   * You cannot ask 'meson test' to invoke a single I/O test
>   * The meson test timeout can't be applied to the individual
>     tests
>   * Meson only gets a pass/fail for the overall I/O test group
>     not individual tests
>   * If a CI job gets killed by the GitLab timeout, we don't
>     get visibility into how far through the I/O tests
>     execution got.
> 
> This is not really specific to the I/O tests, the problem is common
> to any case of us running a test which is in fact another test
> harness which runs many tests. It would be nice to have meson have
> the full view of all tests run. Adapting the I/O tests is as easy
> win in this respect.
> 
> This switches meson to perform test discovery by invoking 'check' in
> dry-run mode. It then registers one meson test case for each I/O
> test. Parallel execution remains disabled since the I/O tests do not
> use self contained execution environments and thus conflict with
> each other.

Great to see some movement in this area again!

Some questions/remarks:

1) Could you remove tests/check-block.sh now? See also:
    https://lore.kernel.org/all/20220209101530.3442837-9-thuth@redhat.com/

2) With regards to parallel execution ... I think it should be
    possible nowadays - the "check" script is normally also run
    with the "-j" switch by the tests/check-block.sh script, so
    if you remove the possibility to run in parallel, it's a
    regression from the previous behavior!

3) When I tried this last year, I had a weird problem that
    the terminal sometimes gets messed up ... I wasn't able
    to track it down back then - could you check by running
    "make check-block" many times (>10 times) to see whether
    it happens with your series or not?

  Thomas


