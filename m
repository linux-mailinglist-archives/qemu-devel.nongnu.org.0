Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1356367702
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 03:50:45 +0200 (CEST)
Received: from localhost ([::1]:37008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZOUJ-0005vq-Jl
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 21:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOS6-0004ql-Q0
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:48:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOS4-0007UW-C3
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:48:22 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso91645pjs.2
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qz2MRsTWlPL2yiwSgQiBWdUdUfhdmwUYt7ts9wEHwZs=;
 b=uIe8l4s6/HU5qJ97RTenYxaA+fxuUaohX1nfzKpZArrVswyabIzKFEi3FJP4oGuVB0
 KtErFrL5Jr9QmLZmjzT/FIptS6ROz7LHwlIb/xKzNCujwlKgfj/HIVMspqUHGjb0l6wL
 SAcbsLUSNABBvJRygUqYvoRCEziM4y0PL0/O5Lg5Izi9FRA+JQQYpE5xivl+okM5+RAq
 9GcQk1PXM7KvjJq4jIUdyLIyXB/q1yO29/Gt8AZBzy0nVHM3lW6w9do5z+vlv8JfVxiE
 x7Iw6DnuTWdGA1rmfZi9VBeDfkpFDVHi6xdcjl8wXGPleDSpnbR1YbgTixZLFYnpOewJ
 XY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qz2MRsTWlPL2yiwSgQiBWdUdUfhdmwUYt7ts9wEHwZs=;
 b=Xj6EogvA6lYE5/V25W469jPgNu3ff9k3lllW9TMC6j2jDW/o24QNTQTpv3D35zCMjO
 AXNdEpAMmkUduECMP/0hDNFgnn35S8A4GuU+vvmDdAyTBNTXc3mHc/ng2PW7QCVRzNxF
 YZuGC2CTx0CvduSTNl812JXxrEzgrZWAkiPX0BEc/vlc2RrdXzXjZXDDtgQcxMKIL1+o
 B9YTQ8c6SYOfJx8+/7jBba2mW0qH7nQ4tA+zUhSNIjrsXWK05yFEVgV/8GplOM3v2Noi
 MPpRNpBsOkm6SxGJllLQhvZMgvKXEWlSjPW3FYnUoInYJ3/3/9eau4AnUtRiXo2Sj7Nn
 RvIA==
X-Gm-Message-State: AOAM533XOFJ0cb2ESkzZzMLThgP/V4fcrW/5LTk2bvamVlPXSSQ3nlHJ
 m+ke+g7khPo/CxIGrWVBLpCgHQ==
X-Google-Smtp-Source: ABdhPJzMmbgoL5nYd+xhfVd8kjBgo0PUq3INQw/VmskxTtfh16OsLDveVsDy6ooHG5Iq5b7aDfKcCg==
X-Received: by 2002:a17:902:bb94:b029:eb:7a3e:1fe with SMTP id
 m20-20020a170902bb94b02900eb7a3e01femr1098659pls.25.1619056098917; 
 Wed, 21 Apr 2021 18:48:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id ge22sm516262pjb.53.2021.04.21.18.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:48:18 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] hw/block/pflash_cfi02: Simplify
 pflash_cfi02_register() prototype
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca0edda5-4a06-c9b8-c841-f3d3ad2467ce@linaro.org>
Date: Wed, 21 Apr 2021 18:48:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:405" <qemu-ppc@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> The previous commit removed the mapping code from TYPE_PFLASH_CFI02.
> pflash_cfi02_register() doesn't use the 'nb_mappings' argument
> anymore. Simply remove it to simplify.
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

