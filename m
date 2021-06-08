Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B838239FD90
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:25:58 +0200 (CEST)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfUD-0008CJ-JI
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqfS9-0006Cw-Et
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqfS6-0005HP-He
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623173025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=is8SWdnXuRkabOwAS8mVMm8J5WzMhq7cJ8a9RVI/vJA=;
 b=QSK7X2kq383BemLQO6sUHr+yY8+08mFNvYOx8TMBTUb/xZEFmGr3SgU5b/6YvXKDBtSajE
 AHeJ+euuBkvCdFyHuhGEcS1Qfe7z+J2gR0Vr8rIhaMewDepMry3BwEFUD08+a7ON5iuC2q
 uZNzmhqOxwZexLQNTIpPc5+PH0ufdyI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-cTOekAOqMAKyOm_Demv9_w-1; Tue, 08 Jun 2021 13:23:44 -0400
X-MC-Unique: cTOekAOqMAKyOm_Demv9_w-1
Received: by mail-wr1-f69.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso9725847wrh.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 10:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=is8SWdnXuRkabOwAS8mVMm8J5WzMhq7cJ8a9RVI/vJA=;
 b=HGM5OegA2gkW0JkHowujFz1om2/6zpWSwrVDx589QhSw8WTQfO+FWeHaRXAY6q5Rfh
 eMQMNBbbLAlOH/FxMJGcMpdg4mMeNr/D3ZwcNIA9yVHRuyJq90M7yNLCfuMcm7d/VQ6v
 0PTnJFraJDUjl/W2m0/9DVMTDD1/loCYYPemjS3ZSF5TJQ4UrjIt+MAN/FX/aVb8Qypk
 nQbaK9Ci23qoHIN8dV8p3XBv3NivurwnN+cCFBSW1jYIdLp2PM34YxzAbYAltJfGxIev
 pGjM+C2Q4sL9c+kVUZ1r8y3lMjIWuoSZiW6jVIjQhC1toXr4L7JpYfTiX5woZSHGnLJ1
 JzKQ==
X-Gm-Message-State: AOAM5316ICz68n5sI2oJn/c4FLHlvbxsGk0Dcl/2E5iBs8C+HZqFXs3N
 X/xqn0xOQwWUfNZ+gWYr37ldgy+dcerPPSHThcW/H+QbZjVhlkvj8hHxYFoeQSUlfO2oz6pDW4c
 XjT95+AskSc9xt2o=
X-Received: by 2002:a05:600c:1c8e:: with SMTP id
 k14mr14197712wms.61.1623173022965; 
 Tue, 08 Jun 2021 10:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE9pe6i+pmVGzKCCeFcH2MIQNThzPlE0uYUk8LlnmE65gWCEHJB18weCs34RJXG6MLrwVv3A==
X-Received: by 2002:a05:600c:1c8e:: with SMTP id
 k14mr14197686wms.61.1623173022716; 
 Tue, 08 Jun 2021 10:23:42 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id z3sm22011815wrl.13.2021.06.08.10.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 10:23:42 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
 <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com> <87czswl672.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Message-ID: <c467c2dc-3db7-2e2e-ee05-540a258cff04@redhat.com>
Date: Tue, 8 Jun 2021 19:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87czswl672.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 17.35, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 08/06/2021 16.27, Alex Bennée wrote:
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>>> machines is about to be broken...
>>>>
>>>> Um, what?
>>> Really what we want is to probe the -M (machines) that a binary
>>> supports rather than just barfing the test because we've built a QEMU
>>> that doesn't support all the random 32 bit machines.
>>>
>>>> r~
>>>>
>>>>
>>>>
>>>>    and besides it's not likely this is
>>>>> improving out coverage by much. Test the "virt" machine for both arm
>>>>> and aarch64 as it can be used by either architecture.
>>> I think this point still stands though, I don't think we get much
>>> from
>>> running the cdrom test with realview et all on qemu-system-aarch64.
>>
>> In a lot of CI pipelines, we are either building aarch64 or arm, but
>> not both, so I think it might be good to keep the tests in here.
> 
> We do test instantiating the cdrom with -M virt, exactly how many extra
> lines of coverage do we get for the rest?

$ grep -r block_default_type.*IF_ hw/arm/
hw/arm/tosa.c:    mc->block_default_type = IF_IDE;
hw/arm/cubieboard.c:    mc->block_default_type = IF_IDE;
hw/arm/virt.c:    mc->block_default_type = IF_VIRTIO;
hw/arm/spitz.c:    mc->block_default_type = IF_IDE;
hw/arm/orangepi.c:    mc->block_default_type = IF_SD;
hw/arm/raspi.c:    mc->block_default_type = IF_SD;
hw/arm/realview.c:    mc->block_default_type = IF_SCSI;
hw/arm/realview.c:    mc->block_default_type = IF_SCSI;
hw/arm/xlnx-zcu102.c:    mc->block_default_type = IF_IDE;
hw/arm/highbank.c:    mc->block_default_type = IF_IDE;
hw/arm/highbank.c:    mc->block_default_type = IF_IDE;
hw/arm/sbsa-ref.c:    mc->block_default_type = IF_IDE;
hw/arm/versatilepb.c:    mc->block_default_type = IF_SCSI;
hw/arm/versatilepb.c:    mc->block_default_type = IF_SCSI;

... thus these tests check quite a bit of different ways to pass a cdrom 
drive to the machine. I'd rather suggest to keep them, but you're the arm 
guy here, so if you don't like these tests anymore, feel free to drop them.

  Thomas


