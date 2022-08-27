Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97785A34A7
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 07:02:55 +0200 (CEST)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRnyA-0003Yd-9y
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 01:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRnvM-00020s-I6
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRnvJ-0006We-G4
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 00:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661576396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7FJVWozdwl1iIpkEd58dt2aapoyLdWv+CgrknIljzw=;
 b=XuYqt+/D5/L/OPFgZFwdHsmWSN2cl+UAXCnlvt3sVLeqIS5jop82s0CtabjtS8RmOGaWeK
 58PBb4ZoRrhah7Wt39ze8WbscKaU1hKLHER/Nwj9lRyrFSuPCdEcIimUoKXTG5i3Cd8WFL
 MP/dIwv/UsU5pDPhc4b07bWmS/OMM50=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-MwrWtbliPM-IMQDJNTHndw-1; Sat, 27 Aug 2022 00:59:54 -0400
X-MC-Unique: MwrWtbliPM-IMQDJNTHndw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v3-20020a1cac03000000b003a7012c430dso2286845wme.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 21:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=P7FJVWozdwl1iIpkEd58dt2aapoyLdWv+CgrknIljzw=;
 b=siycoDS4VHFexQQYujXA54Vr883J6l1+pFdDUw9GGRvVU0RJloq5oZghQ110pVoe7o
 Z2FdYaQlG1gF69hSQIVm86py1sk3oWaKKm2MT15d3ay9TA/sxVaorS3y08LO1qStEuIW
 wjcWOrJe5xhucuLJsFzzn8d7NjOcvWjoVt7mU4dr4+lbpREzWyWmdJ+HXME60VSnqUxc
 i3o5v+w/Kqj2Lv5HYfWNTJdN01AawE5dt5dam0FO7uT8AGg35EIfUFMFblCETOT8m0fY
 MyEyvq43cuPCefySP39EEZtpxgbjC/fI27sRi0KNZij8Okml5bHtanrU+yUjUit9YxwL
 q0Qg==
X-Gm-Message-State: ACgBeo2ZkcmggMGAgDdFeSZnHWggCdZzfb1vJSIluYmnPk61qsDVHLUB
 MTc4i3VZ9YqHQRPjLNiuP2ElgQQWSF/WARhj/r9L+xOf3vSMY0j5hVRjajgB2YMKMEb83kHE+Kz
 3sWAJgOFMEy+hUWU=
X-Received: by 2002:a5d:6504:0:b0:226:d1ce:3e87 with SMTP id
 x4-20020a5d6504000000b00226d1ce3e87mr583263wru.434.1661576393814; 
 Fri, 26 Aug 2022 21:59:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ZaMnjfvfKXClSlESY94jvFWM240fm9BtV6Lw9eFlxK57YNt9LU6X8vQ2wnTiiMlRVOao+cQ==
X-Received: by 2002:a5d:6504:0:b0:226:d1ce:3e87 with SMTP id
 x4-20020a5d6504000000b00226d1ce3e87mr583249wru.434.1661576393612; 
 Fri, 26 Aug 2022 21:59:53 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 i12-20020a1c540c000000b003a2f2bb72d5sm1546927wmb.45.2022.08.26.21.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 21:59:53 -0700 (PDT)
Message-ID: <c8af3193-53c3-4c8f-f397-83f14f13bc6f@redhat.com>
Date: Sat, 27 Aug 2022 06:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 11/25] tests/docker: remove amd64 qemu/debian10
 dependency
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-12-alex.bennee@linaro.org>
 <1c34e1b4-118a-29f1-d3c3-b62343d136f3@redhat.com> <87ilmeptga.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87ilmeptga.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/08/2022 23.47, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 26/08/2022 19.21, Alex Bennée wrote:
>>> We missed removing this dependency when we flattened the build.
>>> Fixes 9e19fd7d4a (tests/docker: update debian-amd64 with lcitool)
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/docker/Makefile.include | 1 -
>>>    1 file changed, 1 deletion(-)
>>> diff --git a/tests/docker/Makefile.include
>>> b/tests/docker/Makefile.include
>>> index 5c9398bbc9..c3375f89c5 100644
>>> --- a/tests/docker/Makefile.include
>>> +++ b/tests/docker/Makefile.include
>>> @@ -73,7 +73,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
>>>    # we don't run tests on intermediate images (used as base by another image)
>>>    DOCKER_PARTIAL_IMAGES := debian10 debian11
>>>    ifeq ($(HOST_ARCH),x86_64)
>>> -docker-image-debian-amd64: docker-image-debian10
>>>    DOCKER_PARTIAL_IMAGES += debian-amd64-cross
>>>    else
>>>    docker-image-debian-amd64-cross: docker-image-debian10
>>
>> What about the "DOCKER_PARTIAL_IMAGES += debian-amd64" that comes
>> later in this file? Do we still need that line?
> 
> Yes because this stops us using the image on non-x86 hosts. It's poorly
> named but I don't want to further complicate the Makefile while trying
> to simplify it ;-)

All right, thanks for the explanation! In that case the patch seems fine to me:

Reviewed-by: Thomas Huth <thuth@redhat.com>


