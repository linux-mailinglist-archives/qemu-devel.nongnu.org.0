Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7AA60F732
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:27:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1xh-0005rA-Pt; Thu, 27 Oct 2022 08:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo1ws-00043B-0Y
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo1wq-0004pU-9G
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666873522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYlxBxXcqsNYGiJfUjYZ/xfJ3WWzBo7FRdpQT4YD9WM=;
 b=AFCuj5Om1bmIeHcTDq4MP91GqER1wjO2Do0Zgv3woK9jsAPdldhU+HerQhPLZLxWKih8lk
 XmgUoafyWmNdGtFvMV9nK3tO6EL6T0V2uezLrjulLGYJYUe+3EJQ7wzFkY/hOCVpDoCGCN
 EHFBPrn7iXUFN695vh2jvKs7i1Dw5Vk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-omxtzAZMOoSsC9pLVqKZLQ-1; Thu, 27 Oct 2022 08:25:20 -0400
X-MC-Unique: omxtzAZMOoSsC9pLVqKZLQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so327601wru.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gYlxBxXcqsNYGiJfUjYZ/xfJ3WWzBo7FRdpQT4YD9WM=;
 b=JFabhCF/fCPxX0eRG7iBhNXk7XRdRnOYkH+ll1CqN7ql2QPXb15HygeKXpZWGhDF9d
 HfO1Wh9RB+ai8/mFCTpwgpMQtNJ0IOnohMtt1aPwysUkGh1QRWGLpecEMRPULaYW1KHh
 sUH8hEqjK1VTLZ+MRfSX/8/ZWLp5UPNO/UPGWseVXlSNEaASjOvtDruOlJdV+7BOboZv
 JpvxLhslvpNAL//a1Z5fE8tnZ9RHC6rGfiP4wigXaeFP4OGQ1S4VnGf+eDrJiSVSWxbV
 UybbsRExGGIaqCS+aV3+llAoaqikV0VOKow6dzz5dABSaHYYaJzLNbJwwFH4Jfsc25nB
 9d/Q==
X-Gm-Message-State: ACrzQf0VhVMBjxOD/+S4/RC+zyYLo6fZbr635Cxz74phxGUs9ZnQjAmB
 YG9FbkwAIJM8Pbhu7GiF7k9oo38sp5FU+xaWAidjNe1CtwONqU79ZL0uNuM+023egUbZXXyk/rY
 /lA+0dgQisIyj02E=
X-Received: by 2002:a1c:acc5:0:b0:3c6:eebf:feee with SMTP id
 v188-20020a1cacc5000000b003c6eebffeeemr5708259wme.122.1666873519623; 
 Thu, 27 Oct 2022 05:25:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Lwgy/50q80wLNGIO5Lt839X/9+PptJeI7IpHyy3QB81JtVPmDc/GeFdtdgaNeYr+XTsI6NQ==
X-Received: by 2002:a1c:acc5:0:b0:3c6:eebf:feee with SMTP id
 v188-20020a1cacc5000000b003c6eebffeeemr5708241wme.122.1666873519406; 
 Thu, 27 Oct 2022 05:25:19 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c191100b003b47b913901sm11302132wmq.1.2022.10.27.05.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 05:25:18 -0700 (PDT)
Message-ID: <df8502a8-3ac2-8912-2fb9-3743198fc3d7@redhat.com>
Date: Thu, 27 Oct 2022 14:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests: Create fifo for test-io-channel-command
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20221025105520.3016-1-quintela@redhat.com>
 <87mt9k6owd.fsf@linaro.org> <Y1ff32V9WXYH/hva@redhat.com>
 <875yg64kxp.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <875yg64kxp.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/2022 18.18, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> CC'ing Marc-André as original author of the change
>>
>> On Tue, Oct 25, 2022 at 01:57:23PM +0100, Alex Bennée wrote:
>>>
>>> Juan Quintela <quintela@redhat.com> writes:
>>>
>>>> Previous commit removed the creation of the fifo.  Without it, I get
>>>> random failure during tests with high load, please consider
>>>> reintroduce it.
>>>>
>>>> My guess is that there is a race between the two socats when we leave
>>>> them to create the channel, better return to the previous behavior.
>>>>
>>>> I can't reproduce the problem when I run ./test-io-channel-command
>>>> test alone, I need to do the make check.  And any (unrelated) change
>>>> can make it dissapear.
>>>
>>> I was chasing a similar problem with this test although I don't see it
>>> timeout while running (I don't think our unit tests time out). I'm
>>> provisionally queuing this to testing/next unless anyone objects.
>>
>> It won't build on Win32 since that platform lacks mkfifo.
>>
>> The test normally works since socat will call mknod to create
>> the fifo.
>>
>> I think the problem is that we have a race condition where the
>> client socat runs before the server socat, and so won't see the
>> fifo. This will be where high load triggers problems.
> 
> Ok I shall drop the patch from testing/next - we need a better solution.

Could we maybe at least revert the patch that introduced the problem? ... 
the failing test is annoying ...

  Thomas


