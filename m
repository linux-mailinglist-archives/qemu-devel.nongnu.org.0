Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72877463F0C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 21:12:28 +0100 (CET)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms9U8-0002x5-11
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 15:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ms9T5-00024F-PD
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 15:11:11 -0500
Received: from [2a00:1450:4864:20::433] (port=42800
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ms9T4-0002tg-At
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 15:11:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so46990653wrd.9
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 12:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wOZnwCXj2X0NlgAjT7KD5YOlXXtDNKmnw7TIGPoePbU=;
 b=Q1wvA2fFL772mvpGcvXFob7dtxshQe8xH1GGD82EgFYt2AlB2YQvvMy2OZT0ZZMXPq
 8WKxK/rR6d/+Pm9BUe/l75Lj6F9bKbVtoALhmEWdZWebisAuky0k06TT9i1CeW4bNodD
 q968RQ3wsxM4A5pgR1ggjL0VLQoAA+3/KdTQgMRW/xzNGmpFzDyRYPdPoF9/SsgKMGDC
 QkgtZ2Obngd1fluLv8THXAFB93MUvpttwN9kNsaRITyUZG4Bjmgcg4hj63jpW99Pr8aH
 WoKGClSaPuqGgoWiGk5UGLO/eW8W00epQSgDr8ENHeVw1D+D5STlYVlGoGnZlyeEKy0A
 392w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wOZnwCXj2X0NlgAjT7KD5YOlXXtDNKmnw7TIGPoePbU=;
 b=LJ69eJt1IP2fPHJWcrc0M/WJ0JiK7cYCdctObDqpcmKseIP4Oaw2ArRXCtNB85fbIb
 yPNLqbk9cxDHvKAv8ms/VOMRVIR7m8eoXTpsE55pzHt0b+x00lRzBrIm+WpWMCQUzDJ/
 DYezIGH9GoncKKlgcE2REv6A8X8jiIMHVdep/+9wkwcehLHdpTIqhC4y5AqU+KSzGJMA
 ZoufGt537fH4Y/Ck/EZPxld+3JmkPAoJw3CoqrQWm5L2MB/Syjf52niQvhwRbiu/dOOI
 qOfWGJIHhpvbfrTsIiTQSI79XmoRMmO0EoBAANWO3NSOs6vwybDTUHe2mRk3UaG4TRvk
 bCMg==
X-Gm-Message-State: AOAM531PAVSNiVgD5lQ+UB0l5wdFFZOEyAVIAY0yHbMVLKx/RJEmd5V+
 DZQiCJwHB1LpUSxaJXnmi3qDww==
X-Google-Smtp-Source: ABdhPJyHjmfGABbU4RYo4LAWF0EruSuL9/f9QbexH0Dqg9HtxA3KqAU7oljqqoXeHjNXjqGGl77roA==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr1186845wrd.369.1638303067677; 
 Tue, 30 Nov 2021 12:11:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g124sm3070135wme.28.2021.11.30.12.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 12:11:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 872F91FF96;
 Tue, 30 Nov 2021 20:11:05 +0000 (GMT)
References: <20211130173257.1274194-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Correct calculation of tlb range invalidate
 length
Date: Tue, 30 Nov 2021 20:10:28 +0000
In-reply-to: <20211130173257.1274194-1-peter.maydell@linaro.org>
Message-ID: <875ys9z9nq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The calculation of the length of TLB range invalidate operations
> in tlbi_aa64_range_get_length() is incorrect in two ways:
>  * the NUM field is 5 bits, but we read only 4 bits
>  * we miscalculate the page_shift value, because of an
>    off-by-one error:
>     TG 0b00 is invalid
>     TG 0b01 is 4K granule size =3D=3D 4096 =3D=3D 2^12
>     TG 0b10 is 16K granule size =3D=3D 16384 =3D=3D 2^14
>     TG 0b11 is 64K granule size =3D=3D 65536 =3D=3D 2^16
>    so page_shift should be (TG - 1) * 2 + 12
>
> Thanks to the bug report submitter Cha HyunSoo for identifying
> both these errors.
>
> Fixes: 84940ed82552d3c

Fixes: 84940ed825 (target/arm: Add support for FEAT_TLBIRANGE)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

