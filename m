Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9276CD5A8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 10:57:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phRak-0000vp-I0; Wed, 29 Mar 2023 04:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phRai-0000vh-RR
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phRah-0005jo-11
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680080133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndZsAuNS/jNdMzyOPE4HM63vJyLe4/yT8UQxx0/lThY=;
 b=DpqL2AOzEPpT556YHDu1GivgpqfowRmMJEAUN7JDvgyswjo1tT3R3W+XFlXA2N4qke8k5a
 gUoBYjCgXMR0Uvt5XIMfWrfaYAAdaYhy8eeG+NE+GXzt3xz9LECiPo5oWKZWjHbqMxLs0I
 eg4/xadS8/Z7nxLVrF1jeefbdzIiHd0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-dcx1MzrNOGeZSQkfnbxPUw-1; Wed, 29 Mar 2023 04:55:32 -0400
X-MC-Unique: dcx1MzrNOGeZSQkfnbxPUw-1
Received: by mail-qk1-f197.google.com with SMTP id
 o63-20020a374142000000b007467ef381beso6990039qka.16
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 01:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680080131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndZsAuNS/jNdMzyOPE4HM63vJyLe4/yT8UQxx0/lThY=;
 b=FB34aLWWVDGstsBVXR9F7stw0WtTNQq4UcgZ6VtFZLSLUjaeKVujIEGSGfn1uu791j
 TmLkaElSUeXyVoofWGo0lYWRgyjwHANJ9SAMiRYJtPvh9GJ+tg2WGDcfIPZvQXAN5lDy
 wFY2tv3UWTyQ6cO8ac/JkLTIfF4MfQGid41LBfSQEp2rSbvWfdXtXqZha35gqkUTw57G
 niR1+5nsuHtozoy+1GzApLx8RFtUeVv0junjxxr10jmUjqg3t0cUWjx7n8y9POw4djSE
 N0eTycD/GB47AoYHlp9fjaDoda9RjKDLPM36Dj8oKRf86q8H7QKXT2FFp1ZFBwzyTQ4T
 vQTw==
X-Gm-Message-State: AAQBX9duThFzWKyJi9AO/ACFp8zfCoJDJFRaeVnnfhSuFjMbTo44aqbw
 LueWcNJUzSFbdqnlHXSg8Sobs7dRnqp2c2bimFpqpY/10HuBJaCBeBIlxl7D5OmDEeS6QzJcCDC
 abFgaw1xkrvTaigA=
X-Received: by 2002:a05:6214:5094:b0:5df:8661:567f with SMTP id
 kk20-20020a056214509400b005df8661567fmr430474qvb.24.1680080131665; 
 Wed, 29 Mar 2023 01:55:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350bLKbcq8GtL+GPldM30SDugTTehqXWi4y0J528RjBbZK0k9cv+zdP5AgTwfrQx8+gIPU9oY6g==
X-Received: by 2002:a05:6214:5094:b0:5df:8661:567f with SMTP id
 kk20-20020a056214509400b005df8661567fmr430463qvb.24.1680080131434; 
 Wed, 29 Mar 2023 01:55:31 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-100.web.vodafone.de.
 [109.43.177.100]) by smtp.gmail.com with ESMTPSA id
 jh19-20020a0562141fd300b005dd8b93457csm4375503qvb.20.2023.03.29.01.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 01:55:30 -0700 (PDT)
Message-ID: <88ab35fc-9226-2ba6-03e4-c8600933dd2a@redhat.com>
Date: Wed, 29 Mar 2023 10:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Rob Landley <rob@landley.net>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/03/2023 19.02, Philippe Mathieu-Daudé wrote:
> On 20/3/23 17:58, Nathan Chancellor wrote:
>> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use 
>>>> PCI_HOST_BRIDGE's
>>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
>>>>
>>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>>> bit, it follows endian of all other ISD register, which means it ties to
>>>> little endian.
>>>>
>>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to 
>>>> disable
>>>> endian-swapping.
>>>>
>>>> This should fix some recent reports about poweroff hang.
>>>>
>>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using 
>>>> PCI_HOST_BRIDGE MemoryRegionOps")
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>>    hw/pci-host/gt64120.c | 18 ++++++------------
>>>>    1 file changed, 6 insertions(+), 12 deletions(-)
>>>
>>> So this works on little-endian hosts, but fails on
>>> big-endian ones :(
>>>
>>> I.e. on Linux we have early_console_write() -> prom_putchar()
>>> looping:
>>>
>>> IN: prom_putchar
>>> 0x8010fab8:  lbu    v0,0(v1)
>>> 0x8010fabc:  andi    v0,v0,0x20
>>> 0x8010fac0:  beqz    v0,0x8010fab8
>>> 0x8010fac4:  andi    v0,a0,0xff
>>>
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> ...
>>>
>>
>> Is there going to be a new version of this patch or a different solution
>> to the poweroff hang then? I am still seeing that with tip of tree QEMU
>> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
>> a release version.
> 
> I couldn't work a fix, however I ran our (new) tests on merge
> commit 3db29dcac2 which is before the offending commit 145e2198d749,
> and they fail. So I suppose Malta on big-endian host is badly broken
> since quite some time. Thus clearly nobody tests/runs Malta there.
> 
> Is it worth fixing old bugs nobody hit / reported?
> Should we stop wasting CI resources testing MIPS on big-endian hosts?

This rather sounds like a blind spot in our CI ... we still have some big 
endian s390x machines there, so maybe this just needs a proper test to avoid 
regressions? Would it be feasible to add a test to 
tests/qtest/boot-serial-test.c for this, for example?

  Thomas



