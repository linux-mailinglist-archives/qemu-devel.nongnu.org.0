Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121222D62F5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:05:45 +0100 (CET)
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPNw-0006QV-1L
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knPAb-0005r5-Bu
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knPAU-0006BK-Mp
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607619109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddJs8u954cNPTy4S9V3Y0MRsP6i8rPhUamO2b2UD7+8=;
 b=fWjW00YrI5ilDYt211qkjXZrr6DhvBdloXtksLkON2xFXMP7CUuyTcmGhr5d5ZiKjHCxic
 I2nqG33pQPVmBFxb8OTstRF/83otJbEUTXqME4nXA1okVd6YOFGmNVHUTwojuCwjbHJrc9
 LeFgxolBnoIpgfeAu4ejQaU7Pel8IhY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-zBOnxBL7M-WJIx0jIHFo5A-1; Thu, 10 Dec 2020 11:51:45 -0500
X-MC-Unique: zBOnxBL7M-WJIx0jIHFo5A-1
Received: by mail-ej1-f69.google.com with SMTP id 3so1812122ejw.13
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ddJs8u954cNPTy4S9V3Y0MRsP6i8rPhUamO2b2UD7+8=;
 b=hRJ11K7EKfdIYz5DmZFSnY1MtG8f8AyIBveYZWikZYmXyoAIT0zYPrIQLqzTl1aNbA
 Xuzwp5AgT+tEk3lPxoPwg03mtnf6Rrh7FMtCBLC5sRLaws2CfBeSMPwRA6VabSLKtGLA
 nLqB3SZkXTtL8A56ie6uH6W5HrQ8x5DO6f8EwzErGpJDst1avBgJ1RMU2W2EhjLiePE9
 ZQ4waSaD8xl+zkxInovgj9B+0Jr1Nw7TMdDB8agXW6YpAub5yyP7YUTDKP+gLxq3Tak/
 vTBhP7cwF3JMnxDtMB06oO+ohErKFzwM281P3Xub4uGvty2tO+NKyYLInnZpt/1IKd38
 eU8w==
X-Gm-Message-State: AOAM532Q5stKjYKTAtJPieaghrAZWJ/pMp4vesPASLr8e+zmxeIhgj07
 ajrL5Hgbhv+WnawnjjiqExmUK7f8TlN9MzP9RV44jdxyWlM31T7nCAMIEV93qZglnCDOGX35GHb
 kgs/0mh/hMj8ju3o=
X-Received: by 2002:a17:906:1a4e:: with SMTP id
 j14mr7123722ejf.507.1607619103950; 
 Thu, 10 Dec 2020 08:51:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwGkN0o+N4H/Uq0KyWDU64NkWMTfDoWBRzLaLmiLssQmwP0yiByn+wWFi8e0XCnyhwam7yWQ==
X-Received: by 2002:a17:906:1a4e:: with SMTP id
 j14mr7123708ejf.507.1607619103713; 
 Thu, 10 Dec 2020 08:51:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id x6sm5954693edl.67.2020.12.10.08.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 08:51:42 -0800 (PST)
Subject: Re: [PATCH v3 0/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20201210145517.1532269-1-danielhb413@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d8cac99-68e1-61bf-e270-b0287b8d48fa@redhat.com>
Date: Thu, 10 Dec 2020 17:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210145517.1532269-1-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 15:55, Daniel Henrique Barboza wrote:
> changes from v2, all proposed by Greg:
> * Handle 'NULL' value as default mode fallback in spapr_kvm_type()
> * Do not allow for 'AUTO' to be a valid mode in spapr_kvm_type()
> * Initialize 'spapr->kvm_type' in spapr_instance_init() like Paolo
>    proposed. This will spare us from changing spapr_get_kvm_type()
>    altogether.
> v2 link: https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg02623.html
> 
> 
> This patch addresses an issue that happens with the pseries machine after
> testing Paolo's patch [1]:
> 
> $ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries --enable-kvm
> qemu-system-ppc64: Unknown kvm-type specified ''
> 
> The reason lies on how qemu_opt_get() and object_property_get_str() works
> when there is no 'kvm-type' specified. We were conting on receiving NULL
> for kvm-type, but the latter will use a blank string "". Instead on relying
> on NULL, let's expose the already existing 'auto' kvm-type mode to the users
> and use that as default.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.html
> 
> Daniel Henrique Barboza (1):
>    spapr.c: set a 'kvm-type' default value instead of relying on NULL
> 
>   hw/ppc/spapr.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 

Will queue, thanks!

Paolo


