Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CE25C31
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 05:32:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTHzC-0006uT-PR
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 23:32:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTHxe-0005hQ-GE
	for qemu-devel@nongnu.org; Tue, 21 May 2019 23:30:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTHxc-0004UJ-Q0
	for qemu-devel@nongnu.org; Tue, 21 May 2019 23:30:38 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:45258)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTHxc-0004Sl-FM
	for qemu-devel@nongnu.org; Tue, 21 May 2019 23:30:36 -0400
Received: by mail-yw1-xc41.google.com with SMTP id w18so276918ywa.12
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 20:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ySDkliWlE1kyDr5KZZZU6xJaPfJ9Q+YlDGkST3IXHCM=;
	b=tyctUt7kS4XDuuwgNRrfzymGUTNHlYP1roTCB4lgI175xVRnMVN9nlw0SaIG6UPzt+
	MOU9QEk7gJ6macYyzOhWLKkf1KB4/5+2pbPm+q6iSIXEquphJtx0xRPwT7VVqJqX2Aqu
	6K0XxWVFHjmvv2YUISmCzVtLMGo2xVeGtUP1hy4yuo/8cd372o3661X/xLN8KPNNYUVg
	7DKBeWtGacnvue9pEgnvT3+VpZ1BDsxg///HdZGMlbIYPc/mnkzn5+El7+YCU5QJNfdZ
	L3Nq4/59qNFTNf12w6HJC4oSKSaeS7R4mui3rzthZ+bI2cpQIp+XUtq1HZAF7+gPpgoL
	UA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ySDkliWlE1kyDr5KZZZU6xJaPfJ9Q+YlDGkST3IXHCM=;
	b=nnnS26XfrRH1L3uLfRMYMHgoVF6QLkdLoR4OpP54nsb9OqUthLMSBZKdVyTT0Oyr0R
	79PqKGhDysc5hdk5urESFB66d8TCwvxTLc0Wt61MXQPfOHWjYheJ6rK0HKpVNJX57Cai
	3j/UBAQ3uqIvr3UQnX7Fg/cKqJMOceOfYZ4dhmh6dP1GWB1UAMcSXfBqi5DOQcsHE1Ex
	3mwP11O62qg5QGWRgro7oeIlYdXffHsnmAxiP+NloJ0GrAQ6pkginUqCdeiS3ZLGyZDG
	JKnKjI//baZqF7fCMbkH/mwgqN5BTz9Vdtj8G5to0QlefD22t6ic7VD8ZgLrLffMf7uf
	693g==
X-Gm-Message-State: APjAAAXeTRdlENrn2EkJuTOCOs+ZcNW919rX1xLKDvgRYsvS3rytfjPp
	7gCubPPg7VOk2q7F2xW8cgv5ZQ==
X-Google-Smtp-Source: APXvYqyxHlK5VILkFrTWfttXeXKbxXOQguibzFmrVxKxrwHmMG3OJ8lBZpg/8UxGKCkLQdIQBpURMQ==
X-Received: by 2002:a81:2894:: with SMTP id o142mr41663243ywo.55.1558495833923;
	Tue, 21 May 2019 20:30:33 -0700 (PDT)
Received: from [10.243.114.74] ([71.46.56.7]) by smtp.gmail.com with ESMTPSA id
	196sm4652990ywg.103.2019.05.21.20.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 20:30:33 -0700 (PDT)
To: John Arbuckle <programmingkidx@gmail.com>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, rth@twiddle.net, david@gibson.dropbear.id.au
References: <20190522000617.21945-1-programmingkidx@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b90278ec-ee66-76c6-32b5-d5aca1fb8d24@linaro.org>
Date: Tue, 21 May 2019 23:30:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522000617.21945-1-programmingkidx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c41
Subject: Re: [Qemu-devel] [PATCH] Implement Fraction Rounded bit in FPSCR
 for PowerPC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/19 8:06 PM, John Arbuckle wrote:
> Implement the PowerPC floating point status and control register flag Fraction Rounded.
> 
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
>  fpu/softfloat.c               | 15 ++++++++++++---
>  include/fpu/softfloat-types.h |  1 +
>  target/ppc/fpu_helper.c       |  4 ++++
>  3 files changed, 17 insertions(+), 3 deletions(-)

Please split the target/ppc part away from the softfloat part.

Also, we should note that there are more places within softfloat that need to
be adjusted so that float_float_rounded is fully supported.


r~

