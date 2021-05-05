Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0197373EB2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:38:52 +0200 (CEST)
Received: from localhost ([::1]:50168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJbv-0000A6-RG
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leJTS-0001Sk-Kf
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leJTQ-0004f2-Pc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620228601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wCJMJ2lCPjZm9Hqyw1puL+ARP1hTov3wVmVyo8GMuE=;
 b=d1UMDQjf4kJg8AaLooSFG1pbvrMSP4uXr2Ko/t5LHqOb7v21Y5J+TvEoYP2IF/1H/MWTbg
 5NE2txD86kEepsv9WNdZvLTsmFvLFlrLKtL+bAmUP5BcnISDWH/NyZNnirp1Qh3SnIhUqK
 ZdWFieJtgsJBsGKJJS3uA0gofFbe50Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-vauOim9fPyaJX3CTTujV0Q-1; Wed, 05 May 2021 11:29:58 -0400
X-MC-Unique: vauOim9fPyaJX3CTTujV0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so834736wre.18
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2wCJMJ2lCPjZm9Hqyw1puL+ARP1hTov3wVmVyo8GMuE=;
 b=Tr95s+2yf552bhnb//RbmNvB6yrqDNelYSq5VABOoQKhyASp66WSUB/L0mGdZFglZU
 SghITdBjKchI6n7vO4JB45jQi2OyY3P4oUxkZLlKiK0Mpfy5eG3AveEiMK7Gx/UUCa6P
 DMlS1EOo28pff1SgEbWsE4fJwMIoWGXhBgowfWCeTtIg6b5SMw5EA4IuJg7h/mv8NRiW
 E9ct7VI7imH5iktv6ja4lxJuCIRBMYwb81HQrD+6j+fjIA6GCn9eFXzksPyGhlhmb2+s
 pYlEM0gvdLPiIaoVJsypZIfitjgSczZiqMDTILVgMjWN9AxLh03HAsfXR3wJbnlw2+MP
 yonA==
X-Gm-Message-State: AOAM533XcDnZaZhG4BgWSMYOoOehbef8TBrg7qHw5rlHqkUZC1bgBqqL
 YiBx1WrWypoSi/7sjnmqkVdiUKI4FP8ByxXPzCuIcuglpG2/2xDVZzYHiQzKedsuar2081iXBHk
 Z0zZckvIPKlUORc0=
X-Received: by 2002:adf:cd01:: with SMTP id w1mr39302693wrm.425.1620228597635; 
 Wed, 05 May 2021 08:29:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhGFo6KPe5ajHU12d/xGlkviInFV/sBho185JQciWH2pzW7fxqTW0brGscNiJndILSCmZUkg==
X-Received: by 2002:adf:cd01:: with SMTP id w1mr39302662wrm.425.1620228597425; 
 Wed, 05 May 2021 08:29:57 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id f22sm6085974wmj.42.2021.05.05.08.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 08:29:57 -0700 (PDT)
Subject: Re: [PATCH v7 00/12] qtests: Check accelerator available at runtime
 via QMP 'query-accels'
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
References: <20210505125806.1263441-1-philmd@redhat.com>
 <362383cf-0e04-96d7-f950-a1ecf377f1a5@redhat.com>
Message-ID: <a372d6f2-a5b2-dfa1-50f4-a354175e4b65@redhat.com>
Date: Wed, 5 May 2021 17:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <362383cf-0e04-96d7-f950-a1ecf377f1a5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 3:20 PM, Philippe Mathieu-Daudé wrote:
> Hi Paolo,
> 
> On 5/5/21 2:57 PM, Philippe Mathieu-Daudé wrote:
>> Series fully reviewed.
> 
> Igor made a comment on the last patch (qtest: Do not restrict
> bios-tables-test to Aarch64 hosts anymore).
> 
> The following patches are the one helping Claudio's x86 TCG/KVM split:
> 
>  2> accel: Introduce 'query-accels' QMP command
>  3> qtest: Add qtest_has_accel() method
>  9> qtest/bios-tables-test: Rename tests not TCG specific
> 10> qtest/bios-tables-test: Rename TCG specific tests
> 11> qtest/bios-tables-test: Make test build-independent from accelerator
> 
> The rest are for his ARM TCG/KVM split.
> 
> You might queue 1-11, or only 2-3 & 9-11 for x86 and I'll resend the
> rest via qemu-arm.

And Markus made another comment, so please disregard this v7.


