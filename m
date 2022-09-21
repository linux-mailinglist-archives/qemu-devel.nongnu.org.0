Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2B5BFCC1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 13:07:54 +0200 (CEST)
Received: from localhost ([::1]:43614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaxa4-0004fJ-PM
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 07:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaxRt-0006VO-2H
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaxRp-0007TX-Tv
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663757960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNOgukp/LX8l9nUtfaIwS4laLt2+c7WhBRZG9EWv8sY=;
 b=NRyxQ2WxcZfKL73mbiKLUXdAV2JTTDCnt2EyfmfRh7pYBalfM3Zdolf70B43DCii7ExUJu
 DMjoMv5GTmvFoalgw5/mIwP4TE3LtZyAX5t0N6Rmwlpmnfq/wKN56htYS2myjmg6UGZRji
 b63O33+FDYPBDweTfIySzrlCH81BF7o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-iWvah62rNGe95ukdMRz6Gw-1; Wed, 21 Sep 2022 06:59:19 -0400
X-MC-Unique: iWvah62rNGe95ukdMRz6Gw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i129-20020a1c3b87000000b003b33e6160bdso7737588wma.7
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 03:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NNOgukp/LX8l9nUtfaIwS4laLt2+c7WhBRZG9EWv8sY=;
 b=BnPhbur+p8kRFTbFkJslPNNPLK5BDeJGJGLR/47SUM7piA8mamx0A82IK7Mx8tb3q7
 spmwUo6WoaQI9slWRI7W6cYubbFcZcQAyhnGhdSUUw8eZkqM2glRJWUvYJdRJNIbKXnl
 fPQ651QmWJTcmswpd8oivrRZDr9RmAhvsQsSHZrBn883kCPfM9HtU7APNnPMXHDSP89E
 NS7bhCWxaxKODjmbxS8dqrJDkFCKNvYYHuxW0x3QdbPRYBwVnoVmd/nf42hqJJpBsKMY
 D6X7BGFNXEFJYGTGLOGHrOBSKxXVFFnSTx1EpOZIFcWo8VR7edKUdt6psTXk9qtoS/n5
 t6eg==
X-Gm-Message-State: ACrzQf1Dl6LDiLzL4S+YXF0Fbc50sPerdefNwGv218zGib1uArSjglVH
 cRJPpKAQS3nTuFcyewFKkpaUtwXFxSJUorBJsPB9toJcVTGlcKG2SMNTv1zzD7oSHRO4HBT7FEG
 aY+Ggl/WW1HunyN0=
X-Received: by 2002:a05:6000:1085:b0:228:da84:5d31 with SMTP id
 y5-20020a056000108500b00228da845d31mr17210278wrw.712.1663757958383; 
 Wed, 21 Sep 2022 03:59:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KJxxOAGJyN3+rlwhhXHFZg+Mz9RWDX0AjzCrL5Gx+su7rPPRkFlxTYxOdrUI2+ave1XhHkA==
X-Received: by 2002:a05:6000:1085:b0:228:da84:5d31 with SMTP id
 y5-20020a056000108500b00228da845d31mr17210259wrw.712.1663757958158; 
 Wed, 21 Sep 2022 03:59:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-131.web.vodafone.de.
 [109.43.179.131]) by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b003a601a1c2f7sm2827366wms.19.2022.09.21.03.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 03:59:17 -0700 (PDT)
Message-ID: <54b9d848-8ba4-216b-3267-69958f363c0c@redhat.com>
Date: Wed, 21 Sep 2022 12:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 2/2] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Yu0UtNzyb81O0ND2@zx2c4.com>
 <20220809150331.84296-1-Jason@zx2c4.com>
 <20220809150331.84296-2-Jason@zx2c4.com>
 <4b1352d4-4dff-7ab7-4c96-3fed4f52dd77@redhat.com>
 <YwzpYUspRFJxoZlD@zx2c4.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YwzpYUspRFJxoZlD@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 29/08/2022 18.29, Jason A. Donenfeld wrote:
> On Fri, Aug 26, 2022 at 01:28:11PM +0200, Thomas Huth wrote:
>>> +        qemu_guest_getrandom_nofail(tmp, block);
>>> +        for (size_t i = 0; i < block; ++i) {
>>> +            cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
>>> +            *buf_reg = deposit64(*buf_reg, 0, message_reg_len, *buf_reg + 1);
>>> +            --*len_reg;
>>
>> I know it's annoying, but technically, you must not touch the upper bits of
>> the len_reg if running in 31- or 24-bit addressing mode. The Principles of
>> Operations say:
>>
>> "In either the 24- or 31-bit addressing mode, bits 32-63 of the odd-numbered
>> register are decremented by the number
>> of bytes processed for the respective operand, and
>> bits 0-31 of the register remain unchanged."
>>
> 
> This is what I was trying to do with the use of deposit64, following
> David's guidance. Did I mess something up?

Sorry for not following up earlier - I've been away from keyboard for a 
couple of weeks...

Anyway, that was likely a wrong comment from my side anyway - I thought that 
"--*len_reg" might alter the upper bits, too, when there is no masking here. 
But since "len" has been constrained earlier in the function already, I 
think this cannot happen, so please never mind.

I just saw that you also sent a v8 now, so I'll follow up on that version.

  Thomas


