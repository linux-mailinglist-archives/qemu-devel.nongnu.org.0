Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01916D156A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 19:21:33 +0200 (CEST)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIFeV-0001XP-9t
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 13:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iI6zJ-0004by-2g
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:06:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iI6zI-0005lb-67
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:06:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50130)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iI6zI-0005lN-0h
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:06:24 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 272348E582
 for <qemu-devel@nongnu.org>; Wed,  9 Oct 2019 08:06:23 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id 190so681531wme.4
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 01:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q74ha9OdyhPm3qJhgJ85+EZI2hqHBo4gZcVQeqH6MgU=;
 b=fKXvE6R97bvw4IhKteabQqM6Svh8nf4loAaCczLOxXN7rvIs2Gln7Bgv933pu79nPz
 jc+Rt4WYT8H/UjFF8hXjaqc/R04pb5wGUAhhe9Lotnw+KJ6fugv0PTfZ8x6Y4idyw9ZV
 o56sn3RBmFHcKnZqQ/chHsS+0UTT0mJPSileUg20Kq4/3PEHxfUdti2OUdksnV+YCi88
 aSXFb8jFislYvOoIo/42sZf2VPAADlWo37wgO3ShvvWSA3XbHR6+ox1N1TlMMMrFjodn
 ch5CQZuCoISCt2BMMYqLhx2YYYoF2HVZzUvuOEYJc7ACBTCXnZvdFmW6AJoRjUneuXwp
 cYAw==
X-Gm-Message-State: APjAAAVUwxd9A/FeoyPvYIXhFOMI4xoHhLjCT4Yj0BWmQXWkZ4QEjLvt
 x8dpTuv6ePZQ/rO7XYRNUqZJImIt1nupQ2QDK64/dBvr6MDoAdUSzG4Xf7d0cER1WbX811iLjo3
 Yui6raD98HICkdYI=
X-Received: by 2002:adf:ef0f:: with SMTP id e15mr1837657wro.385.1570608381750; 
 Wed, 09 Oct 2019 01:06:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzURMAJ7vAXRdu3FKhkm40vp+KgdXTuqatIpx9qvS0DnbB4Qk3LeYwCpkEIQLwlwh+bStTdQQ==
X-Received: by 2002:adf:ef0f:: with SMTP id e15mr1837629wro.385.1570608381497; 
 Wed, 09 Oct 2019 01:06:21 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b7sm1446184wrx.56.2019.10.09.01.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2019 01:06:20 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] x86/cpu: Add support for UMONITOR/UMWAIT/TPAUSE
To: Tao Xu <tao3.xu@intel.com>, rth@twiddle.net, ehabkost@redhat.com,
 mtosatti@redhat.com
References: <20190929015718.19562-1-tao3.xu@intel.com>
 <20190929015718.19562-2-tao3.xu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6762960d-80a6-be31-399d-f62e33b31f28@redhat.com>
Date: Wed, 9 Oct 2019 10:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190929015718.19562-2-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: jingqi.liu@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/19 03:57, Tao Xu wrote:
> +    } else if (function == 7 && index == 0 && reg == R_ECX) {
> +        if (enable_cpu_pm) {
> +            ret |= CPUID_7_0_ECX_WAITPKG;

This is incorrect.  You should disable WAITPKG if !enable_cpu_pm, but
you should not enable it forcefully if enable_cpu_pm is true.

Paolo

> +        } else {
> +            ret &= ~CPUID_7_0_ECX_WAITPKG;
> +        }


