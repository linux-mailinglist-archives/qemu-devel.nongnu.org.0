Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1A3C15A6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:03:34 +0200 (CEST)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VYr-0008QP-U6
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m1VVn-0005z4-Vr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:00:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m1VVj-0002Pp-1q
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625756418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9DFYBHVqeM8y1o3TpW6Q+AlsUpCjDJfOCE9zdsSnrc=;
 b=LZjyZRLUG49hR1oxQdm0R1Nezc9tQ3LmBjaAaNQp+0+2t1GJKdf/cdtQzJCfgmcruhDPGs
 v/aW7k6gxK3P9CAmQXtrPeQ9osQrQD8u1pG239KiasmZ3pYdYrg1jrNTW8cjvHUJGtnm0i
 X4mgnk2UM0PeAKJg+NBgYvO0G1KlU44=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-5UICseA9MVmfChA_oSy9sQ-1; Thu, 08 Jul 2021 11:00:17 -0400
X-MC-Unique: 5UICseA9MVmfChA_oSy9sQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f16-20020a1c6a100000b0290210c73f067aso1163799wmc.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=K9DFYBHVqeM8y1o3TpW6Q+AlsUpCjDJfOCE9zdsSnrc=;
 b=s2d8Kr0EzBV1hZZ76DNmyyinqhrIHq7uO1kGwCsTkkN4whprxSkVhW3Q8Z+/wOULjK
 JLn3dp/d3pFfYdnBRm9NWXZJ/b08IeEXS9YXQJc8npfpyyUIiPVYk1q7IPImy5ZW05XJ
 i85Z95oI1VYg4w9yUBjNeTj1ZdcmlB0zymYzgZSYSzDKgvXnNeJOa4Fv9WlAl5+qscFI
 Du4SvvChlkrb6F/C0bVtFB58jo/WO4XnPkp2S0uCD0weJTWl2veIuGqwhSfsKYU1zuYc
 Y0rbQqRWF5uJe8zgeirn2qY4wzJ/5sWUSfCc++idr46ii98ckRqASHaxzJTO2gEJ3pwc
 /19Q==
X-Gm-Message-State: AOAM530hRoqdV6Zfp42CYp768Qk49R45g5Lq6iCNoPKzvjRtZqpfNyEO
 ZxQ8+vqHmt84QOX+05/A997BKgjYZYbvxY9g4oDJTsooc51CaQn1FqOZTjhDBVdBSAaycYB7kgX
 +USwa3w2fY/cH7rY=
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr5664227wme.43.1625756416237; 
 Thu, 08 Jul 2021 08:00:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6GxGVHWVyfSKELjj86ymmVZlNGESFHImUUvdXE8orwlc1oNkPKwdfJDdrrnjG4vZ0+Q69DA==
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr5664200wme.43.1625756416112; 
 Thu, 08 Jul 2021 08:00:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o17sm1370265wms.32.2021.07.08.08.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:00:15 -0700 (PDT)
Subject: Re: [PATCH 0/3] Acceptance Tests: support choosing specific distro
 and version
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
 <812f1d67-5fe4-bfde-0d40-d1c8cc5e651e@redhat.com>
 <de414c57-eb5c-bbbc-be17-8e7b3f189e72@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1ce02129-fc82-3da3-d777-c2299caa7201@redhat.com>
Date: Thu, 8 Jul 2021 17:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <de414c57-eb5c-bbbc-be17-8e7b3f189e72@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 7/8/21 4:51 PM, Cleber Rosa wrote:
>
> On 6/9/21 8:11 AM, Eric Auger wrote:
>> Hi CLeber,
>>
>> On 4/15/21 12:14 AM, Cleber Rosa wrote:
>>> Because Fedora 31 will not suit all tests that depend on a Linux
>>> guest, this allows for the configuration of the guest distribution.
>>> It came out of a suggestion from Eric Auger, and it was actually a
>>> feature I planned to submit for a while.
>>>
>>> This is based on the following series:
>>>
>>>   [PATCH v3 00/11] Acceptance Test: introduce base class for Linux
>>> based tests
>> What is the state of this series, do you plan to respin. My SMMU
>> avocado-qemu tests depend on it. Also I have added some intel iommu
>> tests on top of it.
>
>
> Hi Eric,
>
>
> Again, sorry for dropping the ball here.  This series has enough
> reviews, and I can queue it on my upcoming pre-freeze PR.  I'll just
> wait for your ACK on patch 2/3 about keeping the KNOWN_DISTROS info,
> for now, on the same file.

No worries. I just sent the ACK for 2/3 of your series.

Thanks

Eric
>
>
> Thanks,
>
> - Cleber.
>


