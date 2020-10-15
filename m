Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94028ED1E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 08:36:33 +0200 (CEST)
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSwsJ-0003U4-RU
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 02:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kSwqk-0002vi-ME
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 02:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kSwqi-0005Yb-VK
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 02:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602743691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMhHgMMIhH00RReBHif3hEARrgwDZA0cM8L6BQ3Xwrg=;
 b=hIBDYhfKHEr0KQCCWczxqBfY3iRrXBiMjfclfB80dO1vzlXcVa84cR/5Rb0x+teoC6syNz
 5FrffrQ3dTuAyAumNPPEMilUUDxt+toN/E4Ec8ZhPE8dgDJttFmRRU7wTw2x6J1CutTi0D
 pMyINrYuUAJhjs64XkLBX5uZ47cVQo8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210--m2yTZdcNdiDo93K4__tAg-1; Thu, 15 Oct 2020 02:34:49 -0400
X-MC-Unique: -m2yTZdcNdiDo93K4__tAg-1
Received: by mail-ej1-f70.google.com with SMTP id u7so676920ejb.4
 for <qemu-devel@nongnu.org>; Wed, 14 Oct 2020 23:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RMhHgMMIhH00RReBHif3hEARrgwDZA0cM8L6BQ3Xwrg=;
 b=dtbFg00j9D9kJp80lBGgdFREPXMWq/XHYr7xXmGCMTh+TIBfJNvfCyu55zfhMp+SQS
 RsKl/r6LMJU0eKx8wGHaeV6raFBZY7Qybi9GCTIhrPOrsCAbdqwx4fOQUknRjmeJs6cV
 PREOiPbsE17bXagg24Kj4eQOkTq+xCfdVkx1CvICi4fb0+Di41GSjA9i+YEfwTN/h01t
 5xvVEEYfL1X1A5uzbIDrcLTbUHCw6vLJw0MWqLETBVJNdX1BU+o1OK/69I6iwVh5aw4E
 CJa9rU1gC6vAY0pi+l0TWoA0cM1OFd2Dkg4I+TwBozJlehX6WmDVjXQw6t5lXLtsHYN2
 rfTw==
X-Gm-Message-State: AOAM530hv0L0h6otxe96QyW/ggx6v3e1+dUiLcPgr1GUdKUGf9oQoyTt
 GPCH7dZBemhvL2vuZFjUExXghy3QdNa4rDUbISNt5tI88+yYkxg4VYUKVqtl5Y2TBLMp8PQ/Dw0
 8GsEtJVne1PljU2E=
X-Received: by 2002:a17:906:b88f:: with SMTP id
 hb15mr2832260ejb.45.1602743688401; 
 Wed, 14 Oct 2020 23:34:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTTvwVvZlUduZ3W3PNC0LJKgubUHaVHh7MvB2A0uJamNO6sGH5/caFbhbazjbZlAoNm0XI5g==
X-Received: by 2002:a17:906:b88f:: with SMTP id
 hb15mr2832244ejb.45.1602743688177; 
 Wed, 14 Oct 2020 23:34:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:83:5a63:f601:3a08?
 ([2001:b07:6468:f312:83:5a63:f601:3a08])
 by smtp.gmail.com with ESMTPSA id sd18sm880670ejb.24.2020.10.14.23.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 23:34:47 -0700 (PDT)
Subject: Re: [PATCH 0/7] build: replace ninjatool with ninja
To: Howard Spoelstra <hsp.cat7@gmail.com>
References: <20201014135416.1290679-1-pbonzini@redhat.com>
 <CABLmASGJOFbYUhSAbKhc9s1G00Jh0vN--WaFPtaoHqsL2WuvbQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <44d3eccf-3c64-82cd-b5b2-641de6960ab5@redhat.com>
Date: Thu, 15 Oct 2020 08:34:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CABLmASGJOFbYUhSAbKhc9s1G00Jh0vN--WaFPtaoHqsL2WuvbQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/20 08:15, Howard Spoelstra wrote:
> ERROR: meson setup failed
> 
> When I set --ninja=ninja explicitly, this error does not occur:
> Found ninja.EXE-1.10.1 at C:\msys64\mingw64\bin/ninja.EXE

That is fixed by Meson 0.55.2, I'll add a submodule update.  Thanks for
the reminder!

Paolo


