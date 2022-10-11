Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588675FB3F7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:56:56 +0200 (CEST)
Received: from localhost ([::1]:56580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFkd-0000db-EW
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiEdM-0006be-Lm
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiEdG-0004l5-Is
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665492313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XG9oxW/vu5v7LnayEXTLkkIDFu5m5bqJMDnfxUv/g9I=;
 b=FAWrGOI8g+UcLOPgdMuSyhO6BsZK7TmiaM6hasZiS58D1IgCTSqVLKrBzQyVkWjQVPPTSh
 ycLcrrfxLm4VXime20JfrQY5VWj/InKBmFdr0zGI0iBSdlEHxjyC2lxeuUsjRg00rFtBRn
 QaMYZIBME7IBHWaoimPDQmJzqFp6Sxc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-33A8wvWaNsKGBMsfXvJVWQ-1; Tue, 11 Oct 2022 08:45:12 -0400
X-MC-Unique: 33A8wvWaNsKGBMsfXvJVWQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f9-20020adfc989000000b0022b3bbc7a7eso3828173wrh.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 05:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XG9oxW/vu5v7LnayEXTLkkIDFu5m5bqJMDnfxUv/g9I=;
 b=ohIJM3sm2oJDi9MCGFRY1JlE4P5TyGVVJSDwrmCKuZO4TSvShfzqPEJgNBWN4G/lbT
 iScUhWIJpRDPBJ24CA0lXX/np/b2uSEfqi6mOB4Lhz3D9fdP8epBne2nZWDZZP4dEXDC
 UPPeDGhWtaCqcBEJ7jE8WCsKkZRdZ+qrBjacQE9GIoqqk6dy94WjW5qRtTv4m4w5xsqw
 t0zY9MeNPMo114Lsws+0Qx+jWghd6H240neuNVEIU/TBbFSnlWI9jlKXlztnCIN5eV12
 Yhkbe955dmLR2HDGSwxwlu/j8sE2FX98hScNttGrxd+cn3ZujWxBdzUxL4NygUwk8Y07
 hzQQ==
X-Gm-Message-State: ACrzQf2IuBQpyQsV3SFqGO4SOl/VZdOJvc+0jqAarXa9u1uy2W/b7eHq
 F4wJ4GgDm6/ovgHvEd019mPp1O44Lgxov84ZZbYWTcRoAdxrGN8NEN7UH12thQJGz98wPmHqTMT
 mjm50XbX7aFe++sg=
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id
 k4-20020a7bc404000000b003b4facacf50mr23016263wmi.67.1665492310675; 
 Tue, 11 Oct 2022 05:45:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4D854kMBgQqolUDYVvKwtk4AKslRuJUGG+VWXGIfNkjagU5V5+CcK3mNZKpNIYHTgWXS/hHg==
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id
 k4-20020a7bc404000000b003b4facacf50mr23016249wmi.67.1665492310433; 
 Tue, 11 Oct 2022 05:45:10 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003b47b913901sm2607046wms.1.2022.10.11.05.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 05:45:09 -0700 (PDT)
Message-ID: <c357577e-f8e8-0b1c-7c12-80c0528ed50d@redhat.com>
Date: Tue, 11 Oct 2022 14:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221011101401.81849-1-thuth@redhat.com>
 <d7873010-8d15-360a-39c5-d94acad5d4bc@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] target/s390x: Fix emulation of the VISTR instruction
In-Reply-To: <d7873010-8d15-360a-39c5-d94acad5d4bc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/2022 14.30, David Hildenbrand wrote:
> On 11.10.22 12:14, Thomas Huth wrote:
>> The element size is encoded in the M3 field, not in the M4
>> field. Let's also add a TCG test that shows the failing
>> behavior without this fix.
>>
> 
> I'd suggest moving the test to a separate patch and adding a Fixes: tag to 
> the fix.
> 
> Should be
> 
> Fixes: be6324c6b734 ("s390x/tcg: Implement VECTOR ISOLATE STRING")

Ok, can do!

>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1248
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/tcg/s390x/vf.c                | 50 +++++++++++++++++++++++++++++
>>   target/s390x/tcg/translate_vx.c.inc |  2 +-
>>   tests/tcg/s390x/Makefile.target     |  6 ++++
>>   3 files changed, 57 insertions(+), 1 deletion(-)
>>   create mode 100644 tests/tcg/s390x/vf.c
>>
>> diff --git a/tests/tcg/s390x/vf.c b/tests/tcg/s390x/vf.c
>> new file mode 100644
>> index 0000000000..fdc424ce7c
>> --- /dev/null
>> +++ b/tests/tcg/s390x/vf.c
> 
> In general, we use "vx" when talking about vector extension. Maybe name this 
> vx.c

Ok... or maybe "vecstring.c" in case we only want to test the vector string 
functions here? (they are in a separate chapter in the PoP)

  Thomas


