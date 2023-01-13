Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FD668EFF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:21:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEMx-0006JV-ON; Fri, 13 Jan 2023 02:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGEMo-0006Hx-VO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGEMn-0001wX-8s
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673594443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRXNLfmEVbSxoirzCczROgPsv2Rt7VQGMgFchHpmsmU=;
 b=My7a2OPbAp2SeS0a9zf+uasTeI2h0buBAcdMpkZyKJxvGSmdcKnOBiwr3aHMRxOu+Fu9cX
 2eTRpCaNFFtOJ214q2tZM13RgHcXpuGXDIVNhP/G5TsrEB2SV3XpkOD7CqZw8qCmitANi+
 Bq//owo5csLFBmGwNsUyEFeQ9tQKVIU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-7dCyroR6N2C2wwZDWcGtXg-1; Fri, 13 Jan 2023 02:20:42 -0500
X-MC-Unique: 7dCyroR6N2C2wwZDWcGtXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso13773687wms.7
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aRXNLfmEVbSxoirzCczROgPsv2Rt7VQGMgFchHpmsmU=;
 b=7k4RK7kxCJDDfi19Nfdafpuhgw1jzan+uQdgZESRP2UeJ9Lme80rPQmCXXvCT7rn37
 iyDU+v5jDEEmcpy11+a0pcQn6vKYTNDdRYdImOm6Ct3lnwZKtjRu9XwjFYIZ5ieI3ZUo
 ingOdMCNnrN+HFIA3DuSerh8VmsRRlpwn777U2CM/aVXwmsJJHVahaJVo8FavVprti4t
 WzMWQvx8NdUBCJNmvshKGxz9I6YRhv2Af1ACLB3ZGJ3X4FkpKhutMqUvI2QTq0yK3CBV
 O0jYL6yg5FAa2t6IbBy/Ld2K1zadmAZ9dhBND0U3j1JgAKmlZvwmRqOmTE/ZZHysjldx
 5IUQ==
X-Gm-Message-State: AFqh2kqjjmUHrxcpFrxfbGRSGWWxD4BKhp/pvhi4z+31lMQgF39u5Kx+
 KU30PqRnvtTpPBJUQMKI13dSVbukPXBWcGM7WohgKWxgOVJKlyHKLzdD4mDTFcsPYgK2zQDbJ6Y
 1oZNSJg6NNUTgBfo=
X-Received: by 2002:a05:6000:1042:b0:2bc:804e:4c78 with SMTP id
 c2-20020a056000104200b002bc804e4c78mr10442571wrx.59.1673594441368; 
 Thu, 12 Jan 2023 23:20:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsukWHKYUt6OPzhaKfT/AVGrxYOuJ4RI3vDEEiUvKVbO+0QF9k6SNLzxULoQYTXVYCNDamTFA==
X-Received: by 2002:a05:6000:1042:b0:2bc:804e:4c78 with SMTP id
 c2-20020a056000104200b002bc804e4c78mr10442562wrx.59.1673594441194; 
 Thu, 12 Jan 2023 23:20:41 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de.
 [109.43.177.39]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d6686000000b002bb3229a03csm17031721wru.34.2023.01.12.23.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:20:40 -0800 (PST)
Message-ID: <22763761-403b-6eff-c4fb-8287971468ec@redhat.com>
Date: Fri, 13 Jan 2023 08:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/6] qemu/bswap: Use compiler __builtin_bswap()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>
References: <20230111163147.71761-1-philmd@linaro.org>
 <988c2552-f378-f028-d11f-1261c0be1281@linaro.org>
 <26c3c3c8-61f5-8f56-9094-1699fcd516ed@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <26c3c3c8-61f5-8f56-9094-1699fcd516ed@linaro.org>
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

On 13/01/2023 08.05, Philippe Mathieu-Daudé wrote:
> On 13/1/23 02:05, Richard Henderson wrote:
>> On 1/11/23 08:31, Philippe Mathieu-Daudé wrote:
>>> Implement Richard's suggestion to use __builtin_bswap().
>>>
>>> Convert to __builtin_bswap() one patch per OS to simplify
>>> maintainers review.
>>>
>>> Since v2:
>>> - Rebased adapting ./configure changes to meson
>>>
>>> Since v1:
>>> - Remove the Haiku/BSD ifdef'ry (Peter)
>>> - Include the Haiku VM image from Alexander
>>>
>>> Philippe Mathieu-Daudé (6):
>>>    qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
>>>    qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
>>>    qemu/bswap: Remove <byteswap.h> dependency
>>>    qemu/bswap: Use compiler __builtin_bswap() on Haiku
>>>    qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
>>>    qemu/bswap: Use compiler __builtin_bswap() on NetBSD
>>
>> If this passes on all the odd OS's, great.
>> Failure on some oddball is what blocked my patch set years ago.
> 
> OK I'll double-check.

Please note that "make vm-build-haiku.x86_64" is currently broken - we need 
an update to Beta 4 from Alexander first.

  Thomas


