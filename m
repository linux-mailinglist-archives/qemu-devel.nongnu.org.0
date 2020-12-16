Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B42DC8E2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 23:21:45 +0100 (CET)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpfB2-0000ZK-EV
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 17:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf3I-0003xg-H8
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:13:44 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:36301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf3E-0006Gj-Tl
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:13:44 -0500
Received: by mail-oi1-x22c.google.com with SMTP id 9so22491294oiq.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 14:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5VMRnPCHQjJ5COdZEIdrPq/DHZCFTiSOPGd3McASaqY=;
 b=GtLKWlTrg8+b9lQ0OD49dI7MohrjWNSdS+JZjqC62pWgQPF6Y7bSuT//jlLPAmk4Wf
 WMq5YZHyBQ6lrtgv+KsaXnZRpGq07PXgW9GQquG39gr3cxZbBw0OsTIRWcLZw5OEpweN
 xI2epc54JUetOIdBCQxRztgVvRL3JUphHxs/DAdezdh370/AIvEDBbgjfci9OhC/QwJe
 CjCtbEBrnmgCkMtJWu+UPO1HA3ei+Q1x7JYc9xRtDrx9mZ7DicHpUTj5H2dZ/wHf6NWj
 lpOvjlELhA8mz31dN7TvwGOt4PKKb6z53gE2ZG/IBBKdlyJkb6U3ofxszveKLZRgK73L
 fjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5VMRnPCHQjJ5COdZEIdrPq/DHZCFTiSOPGd3McASaqY=;
 b=AxmdrNVHUZt7L3q8ez/YfybtL9/Ux4dspIU4FQM7bnnznbWoyF27VQvMOzkDHAX6WO
 61ys8ECEklRRE0crFm5gncdDRbh3HP9A0MBHhv3e5lhKI83usdM0VwAGXxumf+/tDrrd
 BCeUYxQhfGCXi9a5DfcefBfSfdfA5MI/lfEr7ba9a+Dlxh7F7iZ+x47Ruj9/O/WyhTjN
 VPcVo9JpCvfXODlqZKC6bHMiNKa87jcMzANmilBtfpehapeBVO2pHCwIqx3hHqjBxwSg
 xA57UhUC25cfY/pxNyqaCrcg64H9LkKCatBGpYbYBqkM92zS97TQZ3LZqC5RmausaLAe
 XhkA==
X-Gm-Message-State: AOAM532c6LV0k0t6fsC8MXaVEBZtT0iQWIpvgPJ2YYNp8cS8MLKlzg+V
 ODW6YnQWhtDJHOsZaFx4W2q0sQ==
X-Google-Smtp-Source: ABdhPJzVMVdFMGz6HRzmnwzGSO5J0eBzXqXDUFJ6drF5SPNfYuSvQLvefaMGo7QD61yJxxgU9KbjNQ==
X-Received: by 2002:aca:892:: with SMTP id 140mr3259719oii.44.1608156818830;
 Wed, 16 Dec 2020 14:13:38 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x20sm797901oov.33.2020.12.16.14.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 14:13:38 -0800 (PST)
Subject: Re: [PATCH v3 0/3] target/arm: Implement an IMPDEF pauth algorithm
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200814213938.369628-1-richard.henderson@linaro.org>
 <bcab99e8-f738-4d07-d42a-7dfbe9ac2b49@linaro.org>
 <CAFEAcA_3MXa+h7Wum6x14wgic4V2hh0zAn2NfB72_UB62je5+g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b590298d-0cd2-6d6b-0bf1-ab70d7057056@linaro.org>
Date: Wed, 16 Dec 2020 16:08:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3MXa+h7Wum6x14wgic4V2hh0zAn2NfB72_UB62je5+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/20 2:35 PM, Peter Maydell wrote:
> Anyway, I tried to rebase it on current master, but it
> fails 'make check':
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-aarch64 tests/qtest/arm-cpu-features
> --tap -k
> **
> ERROR:../../tests/qtest/arm-cpu-features.c:439:pauth_tests_default:
> assertion failed: (_error)
> ERROR qtest-aarch64: arm-cpu-features - Bail out!
> ERROR:../../tests/qtest/arm-cpu-features.c:439:pauth_tests_default:
> assertion failed: (_error)
> 
> That's the "can't enable pauth-impdef without pauth" test, I think.

Odd.  I can't reproduce this.  Hopefully it's some difference in your rebase
from mine, so I'll just re-post mine.

r~


