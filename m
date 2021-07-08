Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4BA3C157A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:52:12 +0200 (CEST)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VNr-0002Oz-CB
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1VMs-0001g2-9E
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1VMq-0007kK-Cu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625755867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7E2RIXRcpEeK/EpIsVt+hbOJDfHWUSlCkZH9+u7Pyo=;
 b=fNKIEVbVb74cfxhqbJtLH2z+Uq1X5MPPCQGptxH3+Vju/xuxk+C1aRCpMGvsxFDN6WqpwP
 vGHs1H3apXamwPZuJhuVo33fAhiokjwAXx0754y3b2YqhG0I7bVyazppqzmNPMfASFrfcX
 fXD+5+bKOmTG9DOLQFl6aLA7Ghgbs7c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-PD5PRG_VOiqd2kt_3AR0fw-1; Thu, 08 Jul 2021 10:51:04 -0400
X-MC-Unique: PD5PRG_VOiqd2kt_3AR0fw-1
Received: by mail-qv1-f72.google.com with SMTP id
 f16-20020ad442d00000b029028c5121bf35so4247404qvr.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e7E2RIXRcpEeK/EpIsVt+hbOJDfHWUSlCkZH9+u7Pyo=;
 b=iJ7RXTfHy5ajgT1/CPSTcML/h7c702fon+z+dXOgzn0A6ggxMm9I4podornFoDaPVL
 lmIqi5JS73vq/JDB0/xdz1dg34vDgG0im0wMuCWKwT8nRI6acAl8WFUGWmr0oJod5+f+
 Y3KteZkLCzySJQZGtb0d8Q+2JvUXES7Zl1qL7a//CUynh/2/FPSUdQIdCvFfhVPFMUwp
 O0d0o5LJkOm/engcjhUA9nXPvp7mf4rSYPjq37BJA8hbIxiNw5Knb7dSg5mqdnhDE+vM
 2+SY/9p3IJfsO8Mk/+v27+g3+fURMjo3+/iCfBxu3WMlOV7oEauOrId2SSGTfSaCViMq
 CmjQ==
X-Gm-Message-State: AOAM530Ongfa0IcwVNDJhWrthLstU+YUzMor8z45TISsnzqYoWksWdDI
 pMa/Iyi2BdUzJm5kBiMf9a3LMWZLTN7V2MBMO4XTYoPjujheoyErakYyOcO3rpgafgWFgwmEGdH
 CsU+9QBxZGHN8+9I=
X-Received: by 2002:a05:6214:27ce:: with SMTP id
 ge14mr28057049qvb.5.1625755863395; 
 Thu, 08 Jul 2021 07:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBr9vp27tDhnsujLD291tLjpS+/x0EYiihfzajVcpVb+AtS38SLM3YLwLxuOwFXwnWqg5AUw==
X-Received: by 2002:a05:6214:27ce:: with SMTP id
 ge14mr28057013qvb.5.1625755863001; 
 Thu, 08 Jul 2021 07:51:03 -0700 (PDT)
Received: from p50.localhost.localdomain
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id x15sm1062404qkm.66.2021.07.08.07.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 07:51:02 -0700 (PDT)
Subject: Re: [PATCH 0/3] Acceptance Tests: support choosing specific distro
 and version
To: eric.auger@redhat.com, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
 <812f1d67-5fe4-bfde-0d40-d1c8cc5e651e@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <de414c57-eb5c-bbbc-be17-8e7b3f189e72@redhat.com>
Date: Thu, 8 Jul 2021 10:51:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <812f1d67-5fe4-bfde-0d40-d1c8cc5e651e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/9/21 8:11 AM, Eric Auger wrote:
> Hi CLeber,
>
> On 4/15/21 12:14 AM, Cleber Rosa wrote:
>> Because Fedora 31 will not suit all tests that depend on a Linux
>> guest, this allows for the configuration of the guest distribution.
>> It came out of a suggestion from Eric Auger, and it was actually a
>> feature I planned to submit for a while.
>>
>> This is based on the following series:
>>
>>   [PATCH v3 00/11] Acceptance Test: introduce base class for Linux based tests
> What is the state of this series, do you plan to respin. My SMMU
> avocado-qemu tests depend on it. Also I have added some intel iommu
> tests on top of it.


Hi Eric,


Again, sorry for dropping the ball here.  This series has enough 
reviews, and I can queue it on my upcoming pre-freeze PR.  I'll just 
wait for your ACK on patch 2/3 about keeping the KNOWN_DISTROS info, for 
now, on the same file.


Thanks,

- Cleber.


