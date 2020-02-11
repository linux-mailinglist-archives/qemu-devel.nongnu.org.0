Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D21597A3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 19:04:15 +0100 (CET)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1ZtO-0007Sw-Jx
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 13:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ZrH-00065V-MQ
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ZrG-0005mj-Lb
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:02:03 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1ZrG-0005kl-Eh
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:02:02 -0500
Received: by mail-pf1-x443.google.com with SMTP id 185so5869093pfv.3
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 10:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YsWImipAvgW4TOXCgskKtylVXRFnECKQuNYjClVVMNI=;
 b=TMCE4kxFCewVGQH31wraSqaub25N11w/VTSFYQy5jscYjuwIJAOfb+r152uhNLLz+u
 k/YXaDZYfsfrrsGFqojHVzyC8trG2ZOI1KspOUujUeJ3U9H+bNhIv1UHgfXKGEiATHcW
 3+K1mE1aoB425DJz2HxnYlzEv38hiXqRka7vheyvSzRLOG06oDMNaTr2PTIos3pkzITe
 E0pIgRFSnWsZrVxk4Pp9Q7iHsp+1bW+yQO5ualjwDE26kqKfq9Q0v/Axevgyh3cx9Oxe
 zj95nUc23RKjZJ1sCIY4YuBrrGTdeDOBkYJezVlHUTLr19v2bKz8Ya2ZAmkRf038flMP
 Zv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YsWImipAvgW4TOXCgskKtylVXRFnECKQuNYjClVVMNI=;
 b=QJTAO7VUXDpCVDAIKRqdOF56uhSYhNB4A858DXhs89V9YeYH7ECbhXExSNNQCIXGC2
 iXeBJZ31J3631tBBrn7CdFTkJD2NK02XavnsWY4bc+b4eLmTUI8soyLEpAl35IVjJEAo
 EKzVxzxMakD4m8qxORwUSHgwt2j6/t4WHX0DpA9BK1n4ApRzBRqmIH8nZ9rl8+TpmOkP
 NQtrU7YRSF5IGL9bQ/9xcdnDNSJNG0Sx4D5IayNXLEP61Xw+98HMIvcjeHZnteYEUXQE
 B+3Xtvst0ouUouyWhbaXFZVmb33l1MaD6LHxVOpXeIHzgBAuV0uEuEGhL+QgQgCTDhT7
 PCag==
X-Gm-Message-State: APjAAAXxXyOK0Uz5A90S9BUpNtGuFSSC7eyWjk0gLcSge2o2cvyloesY
 t6c2Vyxld8677JTTlRdb+V56Kg==
X-Google-Smtp-Source: APXvYqxHvpA1cwp966rCElFB+yqxn4JkMhrroNSKCDxgSAqRjUlEmrGlixPJungp9/1P0HGIKDxkQQ==
X-Received: by 2002:a63:30c2:: with SMTP id w185mr4478820pgw.307.1581444121231; 
 Tue, 11 Feb 2020 10:02:01 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 10sm5194042pfu.132.2020.02.11.10.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:02:00 -0800 (PST)
Subject: Re: [PATCH v1 5/5] tests/plugins: make howvec clean-up after itself.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200207150118.23007-1-alex.bennee@linaro.org>
 <20200207150118.23007-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <507caf2f-3dce-2733-8f30-7b9414d2b1f2@linaro.org>
Date: Tue, 11 Feb 2020 10:01:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207150118.23007-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: robert.foley@linaro.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org, peter.puhov@linaro.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/20 7:01 AM, Alex Bennée wrote:
> TCG plugins are responsible for their own memory usage and although
> the plugin_exit is tied to the end of execution in this case it is
> still poor practice. Ensure we delete the hash table and related data
> when we are done to be a good plugin citizen.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/plugin/howvec.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


