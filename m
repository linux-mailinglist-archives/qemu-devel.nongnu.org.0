Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530853CE2B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 19:37:53 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxBF9-0000Ol-Ud
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 13:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nxBCk-0007jx-Mc
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 13:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nxBCh-00043Q-Sv
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 13:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654277718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RSZIFmkwsmWoaCv9Of6oRtXrS2HrNOlvzF1A7Ns+gs=;
 b=NDEflHJWyAMurQXOVxw94ha/8SMl6PTDmPiSBR6o5/OWuFO44dU08F9awnnJDlbVliuR5T
 EWi1drTtzEZMnb8exr1lvh8BaSx5KPsaKnU65zAWHxwpEtxNrRd9jqtepwaaN1qQwsVXoQ
 IGndK6Xt5GVPSrxDX3sB9yzC9HwNwFs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-8twtYNUxOC6q-FBgcet0cQ-1; Fri, 03 Jun 2022 13:35:17 -0400
X-MC-Unique: 8twtYNUxOC6q-FBgcet0cQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi22-20020a05600c3d9600b0039c4144992cso819715wmb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 10:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=0RSZIFmkwsmWoaCv9Of6oRtXrS2HrNOlvzF1A7Ns+gs=;
 b=m/HTmEMEZL30qyvtnvPrpMO2iSHLdCV1TjuN/9+T1QXMHdqiP/oUMHuuBiz4m9yj3F
 EMP69O1unhQcRP5jZjwFB/bmEcjAMFEuL1NWyjbGkXo4QHfVdZpXHG0QdGNDHcDXNpyJ
 yTkZxBuYWiNOz4yGsLdezdTv636FBWsMXtlNNzDHR9w3JkLyPp93jsY11GPWLnMnd35l
 scn/lGg+q2i9W2k5Czi/Sr/bBcY0xEoH8briIfLfLQmbnScxLkXDT7Cm4i0rXiiXcgae
 +IgRuES91sSMAQF+b1PLyqY76X7XEsKmcypddfTT5YliSQ9Q7Ak6mQ7lyCuMR7tqr5Wa
 bKPA==
X-Gm-Message-State: AOAM533cRoTFN8ZIWF35S6hl4kE3QVswVdaIiH/Tr/2XrgsIbg1R+7aT
 13Xn1UlCvrWGydj35J+BlDDuVEbuwZsQ624WCZmdKt6MC9qL8CuDU6jbyJcuICsv0ATsxlkhK33
 8O0500QftH4Ph16g=
X-Received: by 2002:a05:600c:1e14:b0:397:476d:1602 with SMTP id
 ay20-20020a05600c1e1400b00397476d1602mr39643908wmb.65.1654277716082; 
 Fri, 03 Jun 2022 10:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpm0oqFci1Fp+v6E//TV0ygQLVoAus8/2ERlKTChYwJS7ueCCEtvDb842AN+nYoNfE69Tfxw==
X-Received: by 2002:a05:600c:1e14:b0:397:476d:1602 with SMTP id
 ay20-20020a05600c1e1400b00397476d1602mr39643871wmb.65.1654277715652; 
 Fri, 03 Jun 2022 10:35:15 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com.
 [80.187.98.213]) by smtp.gmail.com with ESMTPSA id
 m14-20020adff38e000000b0021030c9d5c5sm7793679wro.91.2022.06.03.10.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 10:35:15 -0700 (PDT)
Message-ID: <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
Date: Fri, 3 Jun 2022 19:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] disas: Remove libvixl disassembler
In-Reply-To: <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 03/06/2022 19.26, Claudio Fontana wrote:
> On 6/3/22 18:42, Thomas Huth wrote:
>> The disassembly via capstone should be superiour to our old vixl
>> sources nowadays, so let's finally cut this old disassembler out
>> of the QEMU source tree.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> agreed, one thought: at the time I added this thing, I had to add C++ compilation support,
> maybe something we can now drop if there are no more C++ users?

I thought about that, too, but we still have disas/nanomips.cpp left and the 
Windows-related files in qga/vss-win32/* . And I think Paolo was considering 
to use C++ for coroutine fixes - not sure whether that still is planned, though.

  Thomas


