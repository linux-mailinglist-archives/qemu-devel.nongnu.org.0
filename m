Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B340D28B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:28:12 +0200 (CEST)
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj0N-0003Xy-LU
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQixR-0001Jm-Im
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQixO-0004YV-IZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631766305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g794J8A0K7xmg+cvfnRZWzdWQ7DjIRXVZpO/9bDgPBA=;
 b=SvR1nJebFjLD7UrVcawePV/n+szhfvbOTO45oy1340Fw1kzUZQg7mMGsZdSpx4bOTO3kWf
 935ota2doAj7maemf5syTY9RnOJTK5op4rIjhPyyvpSgs33daYBpY9Px+uiujJHdOD+AXs
 XF49YGUqS5nROlmcypDF8Led28kTsJM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-pBgz-ob1Pay-vUnX2jL_Pw-1; Thu, 16 Sep 2021 00:25:02 -0400
X-MC-Unique: pBgz-ob1Pay-vUnX2jL_Pw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so1888617wrn.12
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 21:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g794J8A0K7xmg+cvfnRZWzdWQ7DjIRXVZpO/9bDgPBA=;
 b=NM5jhciSaWXMzj0ReuAqBpzkvj9dIVAWTtrWXzmhdMuhBSkHg3KbGD0r6jvfoioRos
 LYyCTiEjexVosh9s2XSLp5BArEPWK7vRWDiPHcutCdywSWo4XCLQ/pFr2/f1auDEjVIu
 Rna/6Oyoy3Y2CMg6G4jHNiWacIpChpPDHDYnC9D3ANiyna9TLv5x+8AbJWWJ4EMyWapc
 +HOpV835sZ+U/VH+Au4GH8wTAI6lrI6GlJILR8HnGNYEa91AlV1qaCtgrPGGt2rLU3q/
 mYUUUj9v+90+VP4XNM12ebWdgQ9Av5X6kNsjcb21wQ7kDITT5Y6tz1C0FMptSSkugh2o
 dxrw==
X-Gm-Message-State: AOAM531+OPO34wR+jOkoU11/C2+swmofe+S4oOOZnEAD6k/EphqG+0yd
 35QuPhbW6s/kRygjZDQ5TtkgbdYDu7ktur4NJUayUshYQLOHpn0KFqC0wg7FrHDhYPpiCVFrWlg
 0MdP1ACSwgemO4J4=
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr2898011wmb.112.1631766299907; 
 Wed, 15 Sep 2021 21:24:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+Wj1eJ391+FVYwtDBKIa2Y7MKztqadG78u04hIQm5RkAxjzc7WJ2WOh/D81e7Gx8HLE6aSQ==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr2898003wmb.112.1631766299705; 
 Wed, 15 Sep 2021 21:24:59 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id i9sm6141770wmi.44.2021.09.15.21.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:24:59 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210913182927.1022862-1-philmd@redhat.com>
 <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
 <YUBbjbJwpcpxjDmt@redhat.com>
 <574a9927-9a2d-f606-5192-3b66a1847b12@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f2ea524-1718-a454-050f-af558ad380c0@redhat.com>
Date: Thu, 16 Sep 2021 06:24:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <574a9927-9a2d-f606-5192-3b66a1847b12@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 12:27 AM, Paolo Bonzini wrote:
> On 14/09/21 10:21, Daniel P. Berrangé wrote:
>> Yes, this is needed to fix Ruby 3.
>>
>> I didn't propose it myself as I'm not sure if it in turn breaks people
>> with Ruby 2.x ?
> 
> Does it pass the GitLab CI (which uses 2.5)?

Yes:
https://gitlab.com/philmd/qemu-web/-/jobs/1594757246#L466
Installing webrick 1.7.0
Bundle complete! 5 Gemfile dependencies, 32 gems now installed.


