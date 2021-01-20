Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040742FD72D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:40:17 +0100 (CET)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HSq-00026u-1f
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2HP0-0000Ev-0K
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2HOn-0002n8-IN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611164164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XV0KmF8W4U37fPIYFvO40XZkiG47pmGWyrSNKYPDEY=;
 b=VXLPhRK1mrNjW/cmtA67W4ZgRURlhL8n91kajNpuDKjN4qArprWKztcx1blaQiZhbBelMb
 NixX30bKVgwlsjT3du95uOo6r+RJNb8u7FTPciO8W5CNFp2+Rotf3olgA96rQZCUTDDf7O
 O6dKwHzocEWErRKFz1P+OtYASrRvwEU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-7yzSKr6fNXeJzj5c0Qmv_Q-1; Wed, 20 Jan 2021 12:36:02 -0500
X-MC-Unique: 7yzSKr6fNXeJzj5c0Qmv_Q-1
Received: by mail-ej1-f69.google.com with SMTP id by20so3103556ejc.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8XV0KmF8W4U37fPIYFvO40XZkiG47pmGWyrSNKYPDEY=;
 b=Zsp6H/CYsmUPfrJ6nACRjV7c3+kpwpm3ANmlIzHa16us/Ar7e1vgU1M+LhEpULAZCJ
 YJfI+xjPRhEGE3w2CL/NtGvNCtUDnOO56x36S5nx6UPA8uWJ6rCWDmyAphXeI2PVpqz7
 lVE7PnqqXJ7n6zl6oCPsO0XNTRH8uLsACuuoFKYD++aMpLo6jXnbDO+J+8VWrI7eyRd1
 4B3/cxUaCa4xxQMLwZ61iADFUUwBfFxYQNOgW9xAZeFwvlYcTm0GqD/Exji3LgaKMua5
 B17+eA0BVTzBGeQNGCal/0yUrcXkEMFG0euRbvUP3XGTWKyXkpz1MriV6udniC9YyYkc
 xPNg==
X-Gm-Message-State: AOAM533o/elqsWkNIpnkzdJYS/XC5BYuOlTGnxm1BIrNSzw2OkRPpFsC
 laS5/zF1KwB6V/OHe37ub57x3wORQimjwrkufWQfupdx/Ux8S+pap6YkI+eoLQg8Mbe1PsP3mYm
 z7y1q+KObKXPgnVc=
X-Received: by 2002:a50:9e8b:: with SMTP id a11mr8009818edf.276.1611164161188; 
 Wed, 20 Jan 2021 09:36:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMvJmXq30RNirxeKMSnbNirF6JRqFigwdf6zCvvIXpTIshK2Rh4I5D+6nZDwLejtIHCKC4jQ==
X-Received: by 2002:a50:9e8b:: with SMTP id a11mr8009800edf.276.1611164160988; 
 Wed, 20 Jan 2021 09:36:00 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p26sm1490143edq.94.2021.01.20.09.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 09:36:00 -0800 (PST)
Subject: Re: [PATCH 0/3] configure: Do not build TCG or link with capstone if
 not necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210120151916.1167448-1-philmd@redhat.com>
 <260346c3-e1c1-5cb0-20d9-fb8a285e38f9@redhat.com>
 <8ff38dab-06e3-e250-7202-f46f613031c3@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f404421e-d2e0-17e8-735f-098c55cc9181@redhat.com>
Date: Wed, 20 Jan 2021 18:35:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8ff38dab-06e3-e250-7202-f46f613031c3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 18:02, Philippe Mathieu-Daudé wrote:
>>
>> For patch 1, which files are not compiled with the patch that were
>> compiled without?
> softfloat.

Really?  I see this:

specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
   ...))

Maybe

-subdir('fp')
+if 'CONFIG_TCG' in config_all
+  subdir('fp')
+endif

in tests/meson.build is enough?

Paolo


