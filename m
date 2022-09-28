Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24F5ED900
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:32:01 +0200 (CEST)
Received: from localhost ([::1]:57968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTQ8-0004lX-GY
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRji-0007iw-HN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRjf-00041F-B7
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664351042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FB3jnEA28KtY3xF1XPXF6s+H8g2x9YtLzBT9zUGuwV8=;
 b=MW3GH2sCoRVID6SAwqX6Nhx59C7BqGPrU/CbomGin21BF/VSq5xKbpUw5hGNmU+bHUI6BA
 Vs9vR6ksrtloM2FgnxE5ApApk0FL9C9TfelI/kYhOayFmJMMo7I003PLg7P5WceSIddrvF
 8PPuVZ+40KaV1Tqv0MbNnlEM15QKfs8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-212-blE70XiTPE6pqR2nssE2gQ-1; Wed, 28 Sep 2022 03:43:58 -0400
X-MC-Unique: blE70XiTPE6pqR2nssE2gQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 e3-20020a05600c218300b003b4e4582006so292037wme.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 00:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FB3jnEA28KtY3xF1XPXF6s+H8g2x9YtLzBT9zUGuwV8=;
 b=LegUXJ3j53nKlkaB8cc03GLiRi3DMh6KwiYTytk1BbzeXZApenW3hxFL6+D2oO3vTD
 cX0r9Lfhjn7V9ilGItcAxfp3iYkBVg0kmqgTAfBgTCHlUNItWLuqKPK5WqGfvJJ9VuBl
 j6niviydeyo04tOGE9OLbqwy6sn1Wdp5Jef4bbhemk5VfupCuywSdtsm3bKZXwCUyAIe
 eaT5AzlAJ3sgNobzu+n1+ogSLIUUBCf4GCI61FBjlhwMKPYWAiv7SUnZi5dJ7jAsK9zu
 iLIdUa0HXKdmc+aDMRWZBOP1n8IYnaCrg22FuccuDhMyvY3iMECNu79wfEmqdJAN0dUV
 Srmw==
X-Gm-Message-State: ACrzQf3Gtp7qa43ufeHDPwMrRXOp+51dIx0HQNHuASIiIX968EMvQ1A5
 /C2x44HoMoWVA5661vn7P4G5z373qVKyaNYXxSAlKCrR1DpYQM9RqYFTvx2IZnBhy1R9iODY+GH
 1ZBAplb9VhyromaE=
X-Received: by 2002:a5d:588c:0:b0:22b:24d4:d896 with SMTP id
 n12-20020a5d588c000000b0022b24d4d896mr19458587wrf.611.1664351037481; 
 Wed, 28 Sep 2022 00:43:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jc/t1YGqdK9s4M5C6orHiJ+sg0ezY/8cqhi4bjMFHZ5G9JE7redq8p89BM+WCtQ3MfhDF2g==
X-Received: by 2002:a5d:588c:0:b0:22b:24d4:d896 with SMTP id
 n12-20020a5d588c000000b0022b24d4d896mr19458565wrf.611.1664351037204; 
 Wed, 28 Sep 2022 00:43:57 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 r7-20020adfda47000000b0021e51c039c5sm3499626wrl.80.2022.09.28.00.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 00:43:56 -0700 (PDT)
Message-ID: <6850c0d0-b578-9239-406e-e6c379cff3df@redhat.com>
Date: Wed, 28 Sep 2022 09:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 qemu-devel <qemu-devel@nongnu.org>, "Maydell, Peter"
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 "Mammedov, Igor" <imammedo@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
 <20220927175440-mutt-send-email-mst@kernel.org> <YzPyasEmJcKLJNvX@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
In-Reply-To: <YzPyasEmJcKLJNvX@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/2022 09.06, Daniel P. Berrangé wrote:
> On Tue, Sep 27, 2022 at 06:09:22PM -0400, Michael S. Tsirkin wrote:
>> On Tue, Sep 27, 2022 at 11:44:56PM +0200, Paolo Bonzini wrote:
>>> I also second the idea of using avocado instead of pytest, by the way.
> 
> snip
> 
>> Problem is I don't think avocado is yet at the level where I can
>> ask random developers to use it to check their ACPI patches.
>>
>> I just went ahead and rechecked and the situation isn't much better
>> yet. I think the focus of avocado is system testing of full guests with
>> KVM, not unit testing of ACPI.
>>
>> Let's start with installation on a clean box:
> 
> ...snip...
> 
> Do not do any of this stuff, it is irrelevant to QEMU's needs.
> A developer using Avocado with QEMU does nothing more than:
> 
>      make check-avocado

Right. And if you want to run individual tests, you can also do it like this:

     make check-venv   # Only for the first time
     ./tests/venv/bin/avocado run tests/avocado/boot_linux.py

Or run tests via tags (very convenient for maintainers):

    ./tests/venv/bin/avocado run -t arch:s390x tests/avocado/

  HTH,
   Thomas


