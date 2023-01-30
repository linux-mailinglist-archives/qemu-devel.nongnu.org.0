Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C0680D8A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTBJ-0000qw-5B; Mon, 30 Jan 2023 07:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMTB8-0000qG-8q
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMTB6-0003HT-CG
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675081347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACZ9ngThRX9RFDgG6INJFIIaBIw7XRh8GvP9UzyrqLc=;
 b=a7Vc88Yz+KhEi3o35R62FMSWsviuUo0s2p0luYEw8zMMv2RemRKR4UTmIqfzqQwyEZo6dm
 rixp6AH1o/56P0sjkRtmMplOa4HQx85qxbj06DG0B8+I+i/rqcRNzjDjDpKGwehbKHddP/
 xxiRFoGBPbD0rLVG0IqpbjVA40PxYu0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-xF2xbREUNxyJr6TYJLdbHA-1; Mon, 30 Jan 2023 07:22:26 -0500
X-MC-Unique: xF2xbREUNxyJr6TYJLdbHA-1
Received: by mail-qk1-f200.google.com with SMTP id
 bi7-20020a05620a318700b007091d3fe2d3so6940654qkb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 04:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ACZ9ngThRX9RFDgG6INJFIIaBIw7XRh8GvP9UzyrqLc=;
 b=VzsyPvCIjDDaCFwnawiTHmRx9auONmm7B8ZLojxWhsewSopQFUQ/OkaHjZJ5ydtM/s
 OY9oXnT7kfrf8ye3n0XvFqTDygyve4GSFsgMN2ruHMpK1a7KACee/P0gaeWBEqoHmheq
 p9JiOxBgkRUNIjy7q8oKj/FJCzd+DdXMtq3WyYeq/AmsZNy9VOeTO3E8jbp3E4mO0Ncu
 Vup+SS6gqmc77EYiPNJHhFWlAfHOpzOAVYX6ow5caX/KUXzpeEoaLjUNfW68ezfoxCNg
 LNyTLMQazLxi01D4IT/0GScb8vPOIHdU8xZi5h0LQGG3g0neqbItms+ycRL8YnUZOWlq
 Nqzg==
X-Gm-Message-State: AO0yUKXM6QlMJbqM9fJfz+wSAjXpXL1AyDMRWJII/7o1dpkE84WmaAhH
 0CntLxEU4lRKh2UfYkotDO+ONw5rwWWTgaKSmok33efuDHiAk9sdF/+EM38aLqXJj/fDhaVJywi
 GP7NmsqXNNeez2NA=
X-Received: by 2002:ac8:5bc1:0:b0:3b9:8885:296a with SMTP id
 b1-20020ac85bc1000000b003b98885296amr1250638qtb.11.1675081346175; 
 Mon, 30 Jan 2023 04:22:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+h8g+oh/uFTdcm5rR4nBmmQ6D85+tVRbRlj5WCRzSVMm1fAs4uEIJiFSdFAJU//RnKIOH57w==
X-Received: by 2002:ac8:5bc1:0:b0:3b9:8885:296a with SMTP id
 b1-20020ac85bc1000000b003b98885296amr1250602qtb.11.1675081345925; 
 Mon, 30 Jan 2023 04:22:25 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-179.web.vodafone.de.
 [109.43.178.179]) by smtp.gmail.com with ESMTPSA id
 h185-20020a376cc2000000b007069375e0f4sm7952788qkc.122.2023.01.30.04.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 04:22:25 -0800 (PST)
Message-ID: <f94ce115-b962-b19d-269e-4f593da61c6f@redhat.com>
Date: Mon, 30 Jan 2023 13:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <Y9exrDWT2NUoinu1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/01/2023 13.01, Daniel P. Berrangé wrote:
> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> Testing 32-bit host OS support takes a lot of precious time during the QEMU
>>> contiguous integration tests, and considering that many OS vendors stopped
>>> shipping 32-bit variants of their OS distributions and most hardware from
>>> the past >10 years is capable of 64-bit
>>
>> True for x86, not necessarily true for other architectures.
>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>> I'm not entirely sure about whether we're yet at a point where
>> I'd want to deprecate-and-drop 32-bit arm host support.

Even mobile phones have 64-bit processors nowadays, Rasberry PIs are 64-bit 
nowadays ... which arm hosts scenarios are still limited to 32-bit ?

Also, as far as I know, 32-bit KVM arm support has been removed from the 
Linux kernel a while ago already, so it's just about TCG now ... is there 
really still that much interest in running emulation on a non-beefy 32-bit host?

Anyway, we could add the deprecation notice now to find out if there are 
still 32-bit users out there who will then start complaining about this.

> Do we have a feeling on which aspects of 32-bit cause us the support
> burden ? The boring stuff like compiler errors from mismatched integer
> sizes is mostly quick & easy to detect simply through a cross compile.

The burden are the CI minutes of the shared CI runners. We've got quite a 
bunch of 32-bit jobs in the CI:

- cross-armel-system
- cross-armel-user
- cross-armhf-system
- cross-armhf-user
- cross-i386-system
- cross-i386-user
- cross-i386-tci
- cross-mipsel-system
- cross-mipsel-user
- cross-win32-system

If we could finally drop supporting 32-bit hosts, that would help with our 
CI minutes problem quite a lot, I think.

  Thomas


