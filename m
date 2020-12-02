Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE982CBA89
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:29:21 +0100 (CET)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPNw-00034e-Lm
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO7f-0001BY-I4
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:08:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO7d-000670-Ud
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606900105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=653BZUSPdfKfV3dAT9AmdUOf4me4uJ33SKlQNnBl2xY=;
 b=iE572AA0PDPF6CrUlnwCqkFk4QxTFP95AFjWF7q1wbg68o0oA5kI4hkKtd3EOlbT6XaT7B
 pCsCO9+0lxZWhNb0ulBJL3QACOyRiEn/YWuGP1d9BOitC0tFiLDlTnkPhKy8Y3Sspgd4kO
 6Vgb/Jaa553aelN6Q2ByU2/Kl6CXbKw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-9fHpjGp-P9-DbSz3-PPkvQ-1; Wed, 02 Dec 2020 04:08:23 -0500
X-MC-Unique: 9fHpjGp-P9-DbSz3-PPkvQ-1
Received: by mail-ed1-f70.google.com with SMTP id b13so2128364edy.8
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=653BZUSPdfKfV3dAT9AmdUOf4me4uJ33SKlQNnBl2xY=;
 b=MpVLmMB58u6JWfhSmXJfU44rDWjBtQu3QZo8tGL92wU5bV+RefuK5no2HALX9P1EsT
 vGNL1jf64892Lv5MHdRbB4pdJfY6JN0I7Oxt6Rj60DRGu86ZNOP48Wltx3fwbxgScJ9U
 1Vq6/2iVRys2Mh4s8lIKQXMQGCH8ZS2CvZy6jU2b9ha6sp9ecvkWFFO9TQv14PeLQ/95
 xwUC7boeCCNoYrzQ4ht7uHp+cYS+B6ZC0mzMnNoUcP6/yTDOdOWSuDhiIKC3w6Sl+i5N
 srOOvHKraVJyFmGLNJczVOBZXcXovL+Xn/pU3NIVTjkXDQ7a2yK9gAODaTTs92+Z1OzQ
 7d1Q==
X-Gm-Message-State: AOAM532SbIB62GKi/MhTIivZMJCt/tlpzh0C8owiCxxk9+7UA+HR/DeJ
 GvMNPlkw4By67oCd0rWlYUggMOZom3h80KAPLQTmW4ieDA+jEF//nESV2RnbpJf5cBQYIbVcirE
 4518NbMnOBsVbEdo=
X-Received: by 2002:a50:d888:: with SMTP id p8mr1629945edj.147.1606900102213; 
 Wed, 02 Dec 2020 01:08:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt5mTbJgnYTRCvoz8KzdFQikh92caoqylccd9Vagpt1ft2YVI083fssfMWoeSLFKJsvdtohQ==
X-Received: by 2002:a50:d888:: with SMTP id p8mr1629933edj.147.1606900102041; 
 Wed, 02 Dec 2020 01:08:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c5sm711624edm.35.2020.12.02.01.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:08:21 -0800 (PST)
Subject: Re: [PATCH v2 32/32] scripts: kernel-doc: remove unnecesssary change
 wrt Linux
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201103502.4024573-1-pbonzini@redhat.com>
 <20201201103502.4024573-33-pbonzini@redhat.com>
 <a826644a-699a-517e-b7d6-deb81df6d878@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f8869bdd-d699-8317-19c0-5170616fd6b7@redhat.com>
Date: Wed, 2 Dec 2020 10:08:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a826644a-699a-517e-b7d6-deb81df6d878@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 10:03, Philippe Mathieu-Daudé wrote:
> On 12/1/20 11:35 AM, Paolo Bonzini wrote:
>> A comment in kernel-doc mentions QEMU's qatomic_set macro, but since
>> this code originated in Linux we should just revert it and stay as close
>> to the kernel's copy of the script as possible.
>>
>> The change was introduced (more or less unintentionally) in QEMU commit
>> commit d73415a31547, which did a global search-and-replace of QEMU's
>> atomic access macros.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   scripts/kernel-doc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Typo "unneces[s]sary" in subject.

Oops...  I have already sent a pull request, but I'll fix it if a respin 
is needed.

Paolo


