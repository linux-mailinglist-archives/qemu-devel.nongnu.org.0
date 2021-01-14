Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231862F623B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:44:06 +0100 (CET)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02uz-0001w1-7T
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02lN-0006UK-69
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:34:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02lJ-0004Ca-AL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0TzLd/XQrisWR/CBkPpIqMc6H1QK6c71Gu+xuJPcI4=;
 b=FQIxZH+oo7BIq7KCl0atNE20XB0jHDjID8gTJAdCPpibANYLr0N6Ve00Z0/OmZw9p76qum
 iVfRDAl0jUvxFGgUP9xaBO/BSSNKHQAV8LWTnt5pA/GQ3fKZRxsn743hrrzERJ1yPE5oBW
 SLeafHQxaCAis8o2bsII0mT+jjmAUec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-s7S1M4vWP--g29i92mD3NA-1; Thu, 14 Jan 2021 08:34:03 -0500
X-MC-Unique: s7S1M4vWP--g29i92mD3NA-1
Received: by mail-wr1-f72.google.com with SMTP id r11so2596160wrs.23
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a0TzLd/XQrisWR/CBkPpIqMc6H1QK6c71Gu+xuJPcI4=;
 b=Exe/MkI7oUK2eqNt2J1YT5fpzkPCMsyQ5uQnwBQN5eW9dXPn1sOYdlzl2i4RtsTWdH
 m0tlRYsoR0/KNwrzHSsqwtwv6wLmMsjvDA614K07W+7eKuPzeLQUI2+7k3LHJ3QOXlYb
 OydHZF7M4SY/fGClztoMIwNUF6EuV6zEl/9SX3yRuwr3Eb0t90L4WZfpRHszhTsIjq8q
 5p+moIQFDoQGOtipd7kfH0UZmp+p+58mrMXPF2CzzeSeGpceZHuZdNQp7vfkypPOvELY
 K0q10AWO2+obMsKwzH3lZopQWYyaiLTnIvWzFutgvoghXnbpoB3inqvwuvVWzRkDmN+4
 Thjw==
X-Gm-Message-State: AOAM5326mlMeuvCg8Ziu8jHXD5HGN7IC4q5vQHW5CKZsUr3UJfYPLLc3
 E4/uK2xAYZ7BTe1LQaW5Ywgy6vN3BEekoYY7kmmRJ+T5SOLpW5j/azS4PiDeI8Yi85rqcwA+3Q0
 hXgfCvXFNYAA+XdY=
X-Received: by 2002:adf:fa02:: with SMTP id m2mr7825704wrr.130.1610631241810; 
 Thu, 14 Jan 2021 05:34:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0UFE7pHJSzruMHjUbahkNf+qusZWbgK5yHhWpUmWEWXm9jhB0ZC1zQVijFHoivydHPRQhjQ==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr7825687wrr.130.1610631241689; 
 Thu, 14 Jan 2021 05:34:01 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f14sm10264350wre.69.2021.01.14.05.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:34:00 -0800 (PST)
Subject: Re: [PATCH v2 13/25] tests/docker: expand centos7 package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-14-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b29e953b-a59a-88ad-dc0a-911c50173ec9@redhat.com>
Date: Thu, 14 Jan 2021 14:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-14-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/centos7.docker | 58 +++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


