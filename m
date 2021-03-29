Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6422934D53D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:37:34 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQutR-0000mk-Fz
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQuqe-0008Jn-I0
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:34:40 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:38694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQuqb-0005t6-QG
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:34:40 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so3111279oor.5
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zNaFtUcFaq1fBiuJOy/fUOUN9CPagE/w1yavsjna5AI=;
 b=DXenCjWa1YJXG3k44WDIGrs4ZBFdBEvwXay4C4zlyAKg2asuHVjWyKbZcM6pJnTe1P
 5PXB9nLiZ4WqUMIYVV1hl1ZMPLh1DfA+i3b/3gAlyrnVq5GXRlewWxg0HXDrlpRO6TXY
 PfU3ncrBr+ZIFtEGzqQvMKKHtb436z96dVEfzcP8B4Hg4LFS49PPrlgKRxpqemTkP6yo
 qXiMK2bLTiJu1weqvAKJ5oYnfOhCW/IOfVZc7QKF0pejoeNVT3unb+sJ362InUVoUBlJ
 Bn/dfyE4lIW7OV5B+Jo6pXhTWQqsd/qTiVGlznwMJaOcGI0l/oVOIHQ6CZELAmzNyJh7
 g09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zNaFtUcFaq1fBiuJOy/fUOUN9CPagE/w1yavsjna5AI=;
 b=PINn6op4g7ZsgJVPrDppzw2wtoWwQFPcIzJPrMt9gVE5jZFUbgBK/Si2/KsBm3nA9U
 koKh7F2Uurb7zU5hYUuNrfiLUPziFM1/2FgpXfWNzIGxzFoLXPvQ3xzBgJRspLe0Y4oP
 9cXxUnTi7ekGE9QVCD2xDAoiHgRbuMERGcOh2nSBHNPNHiOFF2EX3SHtACTZXoV6YFSP
 zglfSxImt1MaRgYt/+PBG4ZioKAvWFC5/FDIrdg+NWWOrbE1fOBSg9/mLqIDkyLrNB6D
 uFItttISfULsa886PMKfH0oIEMECEfSr3eU2bN5zlY0o7IoaM6YsWNxz3ZSgcG5ghHjB
 iVzA==
X-Gm-Message-State: AOAM531DrZpPu8onup3oT5ALLs+sAuB7vyiXlDevGgBJaYJED02Kfq7w
 DsBG7cNBD5ArQ++LhSrBl1aqSj3df/rMXAKs
X-Google-Smtp-Source: ABdhPJz3HGqowldl8q54TlinDD9AG+rHyzPCBnyYfrCSsKhYd8eVz32DmtNxJ4tirasFeGWap1V3cw==
X-Received: by 2002:a4a:c316:: with SMTP id c22mr22106929ooq.65.1617035673749; 
 Mon, 29 Mar 2021 09:34:33 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id p3sm4450900otk.9.2021.03.29.09.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 09:34:33 -0700 (PDT)
Subject: Re: [PATCH] target/alpha: fix icount handling for timer instructions
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700373035.1135822.16451510827008616793.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b6750b2-34e5-badf-020a-44b0cd5f6763@linaro.org>
Date: Mon, 29 Mar 2021 10:34:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161700373035.1135822.16451510827008616793.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc34.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 1:42 AM, Pavel Dovgalyuk wrote:
> This patch handles icount mode for timer read/write instructions,
> because it is required to call gen_io_start in such cases.
> 
> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queued for 6.0.


r~

