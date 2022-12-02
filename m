Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5D640129
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 08:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p10fm-0006u6-HV; Fri, 02 Dec 2022 02:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p10fk-0006rk-1X
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p10fh-0001Ze-NW
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669966880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaVTqDrcuHFWS07vLkm5TxwGkEqMF7baE+u6BMDH63E=;
 b=ZEP9IQ1mLV5Qf6wiy68NZs47eLChs5Y8yJuqwRG4TLmEh41BEWs7LOPQJ3bx50F8Hg24Qi
 rwwU4HeSzR0aNfP8PJu4zC1/msTNWQhngfmkIGYNa7V0ps117a3bH+H3Pf/bT2Jl4J/vCj
 Gajbsohyfc1ZjIIoiPrWswFNI7f9SvM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-pyBBZkcqOTex4jmANUQq7A-1; Fri, 02 Dec 2022 02:41:19 -0500
X-MC-Unique: pyBBZkcqOTex4jmANUQq7A-1
Received: by mail-wm1-f72.google.com with SMTP id
 u9-20020a05600c00c900b003cfb12839d6so1544720wmm.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 23:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kaVTqDrcuHFWS07vLkm5TxwGkEqMF7baE+u6BMDH63E=;
 b=dn92WQkBKkqzcjKHgK/FLZ0M+Jk+RhgpGLI3Qn8RRmlPf450E682gvlI4LLhTNBgpA
 p4irIeqEXhX6XWyFPQ0Ik0fMuZFiZmjwjoPlu8TbcOjajdYD0aQP2Hg4Dmp0lqVKogtU
 Mser07mw9eSVKDbL74+luLpWW9jnKkBf5gIfNvRnmB+UDuxKfzDGc6X+XWdwFHyPjvsL
 74616riJDeQ8u7QVcN0AHjVOzqFk9gc9iRBP1gwgz2D6lHb62/fP6c1mZqCGqJzIcMA5
 iWow1JtnbiHbyGTq0gDBiu+nNValozwRIFQqlwZ8wA7UM22R2wOUgs0WHxT1Jgc0C9Yp
 GsFA==
X-Gm-Message-State: ANoB5pmJZ9PxwnvCkCzicuwf2k8zWGn1H2x7/4/bsZu1iiLxeoYz/jlJ
 qMgHwaWFVSr7k3A8MLIFMBUTMrj9aPz+parC0kjgjson6tWxTCq30Y0Y1dCTFDN/7Jlaac0Zh5g
 bKgQp/BvL8XZ5oeQ=
X-Received: by 2002:a1c:790d:0:b0:3cf:935a:aaab with SMTP id
 l13-20020a1c790d000000b003cf935aaaabmr44506905wme.159.1669966877978; 
 Thu, 01 Dec 2022 23:41:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qd/ChFNIPCdj96zh+3aTOXr2SyXMGedesvNVggRqTwhxnLNgEZHooJr6HQBHgtMUa6BwhlQ==
X-Received: by 2002:a1c:790d:0:b0:3cf:935a:aaab with SMTP id
 l13-20020a1c790d000000b003cf935aaaabmr44506899wme.159.1669966877773; 
 Thu, 01 Dec 2022 23:41:17 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-86.web.vodafone.de.
 [109.43.178.86]) by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b003c83465ccbfsm10467504wmm.35.2022.12.01.23.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:41:17 -0800 (PST)
Message-ID: <04b7fbcd-c753-2863-23bb-59ed3a2cbd43@redhat.com>
Date: Fri, 2 Dec 2022 08:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
References: <20221201184443.136355-1-thuth@redhat.com>
 <2ab9d798-4feb-62d3-3713-aa12235a7034@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 for-8.0] target/s390x/tcg: Fix and improve the SACF
 instruction
In-Reply-To: <2ab9d798-4feb-62d3-3713-aa12235a7034@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01/12/2022 21.51, Richard Henderson wrote:
> On 12/1/22 10:44, Thomas Huth wrote:
>> The SET ADDRESS SPACE CONTROL FAST instruction is not privileged, it can be
>> used from problem space, too. Just the switching to the home address space
>> is privileged and should still generate a privilege exception. This bug is
>> e.g. causing programs like Java that use the "getcpu" vdso kernel function
>> to crash (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=990417#26 ).
>>
>> While we're at it, also check if DAT is not enabled. In that case the
>> instruction is supposed to generate a special operation exception.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/655
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
> 
> Looks ok, as far as it goes.  We appear to be missing the check for 
> CR0_SECONDARY, which is unpredictable for SACF but mandatory for SAC.

Yes, but if I got our sources right, we do not implement SAC yet. Looks like 
Linux does not use it, so nobody bothered to implement it yet. Since it 
should be very similar to SACF, it should be easy to add - I can try to come 
up with an additional patch for it later.

> I'll give you
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> for fixing the incorrect IF_PRIV check, which by itself should be enough to 
> fix the Java issue.

Thanks!

  Thomas


PS: We might have a similar bug with the MVCP and MVCS instructions ... 
seems like they could be called from userspace in certain situations, too.


