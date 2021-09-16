Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E140D296
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:34:19 +0200 (CEST)
Received: from localhost ([::1]:54536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj6I-0002px-Rn
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQj3J-0000bd-8j
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQj3H-0001EJ-PX
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631766671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDFiQfCzYBj4ZGTTYDZH0j2vxflJyMsT8E0b1Qr0++8=;
 b=VPJwPJR+Mj62uziJNP6uRNFKo/SQxWkoHuVDeuKd531KZ5NaVURhqNQ1jlvv0+oEplvhFz
 V2epzLIpnKf/EhdvrtUc46VgtfZH5dsKXq7Px9uqA6zRoL3nCHDJjpdebrcMNeJ5psecq3
 0uwmxAqBs0VmPeF/10o63cNi1pPw5IE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-TBxg42n8OSydmjKvNuIIQg-1; Thu, 16 Sep 2021 00:31:09 -0400
X-MC-Unique: TBxg42n8OSydmjKvNuIIQg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c187-20020a1c35c4000000b00304b489f2d8so2543678wma.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 21:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nDFiQfCzYBj4ZGTTYDZH0j2vxflJyMsT8E0b1Qr0++8=;
 b=wTVDmTH8BiQEDmfGnGb1ASpH1+Xl9nrnrxCiiEDDd5MaljyNnwt4PriCwd0omCydJk
 Ax2/Bxluo/k4BRSHwkdvm/KZnSRFqycZarbXajaMPzXW0evnZVW+2ZkzeoG/pULAROdi
 Gj8UNV80pk/CGoiK24uYwXFs0ng8aL1zMdgQMCnEESocysYEr6URRfqH0O2wvkYQnuuq
 sNCaBG0MXFYD1S242dbIHUq1WX9dR7L82CMlx5023+KC7GRn4k0W+SEqYStMg/3WML8k
 bubMDyhWojGfTI77rZ80KUX9vw5RxWT8RcMlyC5a/B+bxaE1IjuEVdLCCYdziGVb25ot
 P2/w==
X-Gm-Message-State: AOAM530sWZb4hCfqjJRkx4ETASIsK+2QD2IFKTJ25CwdSfoTRG9D2SOM
 T5cKz+P54JeP+snH5W8PckDOJXngE5FekDVodsgaZ0etVjV/rR30PtJFioyPMtd20Y1zl6N1OwT
 05H2WXXEO5gLGKJk=
X-Received: by 2002:adf:ded1:: with SMTP id i17mr3534182wrn.83.1631766668810; 
 Wed, 15 Sep 2021 21:31:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhveZmfvgexfqwosccvSMHsruMOTGmVvUCZU57MLXtGdjbLXeWrYizNTP8SL7I8wfS8DCGpw==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr3534158wrn.83.1631766668633; 
 Wed, 15 Sep 2021 21:31:08 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id i9sm6155358wmi.44.2021.09.15.21.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:31:08 -0700 (PDT)
Subject: Re: [PATCH v3 08/16] iotests/297: Create main() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-9-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8c24103b-f3a3-7807-ca80-37fd0d14aeb0@redhat.com>
Date: Thu, 16 Sep 2021 06:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 6:09 AM, John Snow wrote:
> Instead of running "run_linters" directly, create a main() function that
> will be responsible for environment setup, leaving run_linters()
> responsible only for execution of the linters.
> 
> (That environment setup will be moved over in forthcoming commits.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/297 | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


