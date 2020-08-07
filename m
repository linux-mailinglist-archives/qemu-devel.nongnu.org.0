Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDA23E95A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 10:42:06 +0200 (CEST)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3xwz-0000Gt-MK
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 04:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3xvS-0007d8-D9
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:40:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53293
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3xvQ-0005OY-Qp
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596789627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+JLy5xX6OVDavxL3tM+bxZlshlAcxdazMm90Fn02FY=;
 b=B0AJT27rW8VF+ktuidWq12x0fK+f8vkyOQGnKRmpH5NZQjFZRtzlpx/GE/u/x48sgZaVXZ
 MMfUQH5g/MQJN5fvNUom4aBxeZXwSW3dj9RNtQURNi91nd7hIdlRXyFXCB5rn5eGcAmQG8
 oIJG+okhnF5txxIMulebAFEGxdIDie0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-73m7Dk_MMO6htkLkVjOFEQ-1; Fri, 07 Aug 2020 04:40:25 -0400
X-MC-Unique: 73m7Dk_MMO6htkLkVjOFEQ-1
Received: by mail-wm1-f72.google.com with SMTP id z10so495753wmi.8
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 01:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F+JLy5xX6OVDavxL3tM+bxZlshlAcxdazMm90Fn02FY=;
 b=Aaj78BMb0xE4T3Lj1TmgRR/StMQGCKKqE+vogBHpYibap1GfL5UMpuwq5vRfwOgoT0
 2HjYhdzPD6Eupea1sebHTSUKOighPJtVcseBt9gzR90sA6P/S7WiEqi6dtAzq5gHX25N
 zS1LoDsEtu85JdwhwpZUkK02Ugiua48ENyaeMCx+JKOdYvxMUb3GiMBTK9O7XCgdFacd
 IxfysCO3GpuExOzRVxYMy/q3bjgDXwjQziL3YE+J8Y89Tk9lsrYjFTx4NbB52RY4+frI
 UpM3zhr2P15NitLbIKtVIFxTeDYKDfISTXf0U2yaWxPIjfGHS60pJLJU2IiWwDFuqjUE
 hy9A==
X-Gm-Message-State: AOAM533FlFfqc0Uge1KmKebSMrO3CUS1Gmpze+Ql0YCAmMj7wsJC4kvJ
 czLTP5ERlASEh1PGcNYGlNk4MBMVo3stgnQXuQ7AwZrkNot9z3qfRz2bg765wF6ACQQdf6a62S0
 dSG7aASLDL9hUdDM=
X-Received: by 2002:adf:e84d:: with SMTP id d13mr10891102wrn.126.1596789624247; 
 Fri, 07 Aug 2020 01:40:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwielekQFXaADvqJolBnnHJLYxp6OsJWXiRNthnDbVr6ALr8pcZOAXvHWXfDwN3m+RfCxYPOg==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr10891090wrn.126.1596789624074; 
 Fri, 07 Aug 2020 01:40:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7841:78cc:18c6:1e20?
 ([2001:b07:6468:f312:7841:78cc:18c6:1e20])
 by smtp.gmail.com with ESMTPSA id i82sm9734833wmi.10.2020.08.07.01.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 01:40:23 -0700 (PDT)
Subject: Re: [DRAFT PATCH 000/143] Meson integration for 5.2
To: luoyonggang@gmail.com
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <20200807085302.7d7616df.cohuck@redhat.com>
 <CAE2XoE_eMv_=zoEe-v1HiqcKX+FNobKSKzV=9eLkJNivnuYg-A@mail.gmail.com>
 <4e8addca-7400-f1a1-ee56-991def2959ae@redhat.com>
 <CAE2XoE9HzvHOQ8odXwiOw+nsYOkwTK+jue1i-mQ6Mo29T+9Rog@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c6059e0c-ed50-399f-111b-4d4b96c80e85@redhat.com>
Date: Fri, 7 Aug 2020 10:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9HzvHOQ8odXwiOw+nsYOkwTK+jue1i-mQ6Mo29T+9Rog@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:53:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/20 10:31, 罗勇刚(Yonggang Luo) wrote:
> Any IDE works with meson properly? Does meson have vs code plugin?

I'm not sure what the plugin would do.  However note that even with
Meson, QEMU would be built with "./configure && make".

Paolo


