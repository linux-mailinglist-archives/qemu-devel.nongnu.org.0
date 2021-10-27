Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEEA43BF6C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 04:14:15 +0200 (CEST)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfYSE-0007pt-85
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 22:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYQs-0007AN-8q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:12:50 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYQq-0008MO-OE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:12:49 -0400
Received: by mail-pl1-x62a.google.com with SMTP id r5so928395pls.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 19:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=85ddGGj3GLOwrOq5IiAfJuWiCq0FxPYTf6z2fEi1g+s=;
 b=uk/nL3adiryMBb2foTpriu3/Kpgze1tQOvT9JMeA0eVDJbBNjtOmw945iNQ9IrG1+j
 jiifJ2KwaXgG8nAO4qcXZEAcP/Q2QW56jkAUQjEcgvW6w2cy11f2pU7899cZPAlfDIZq
 AyO0IUWFzkbWmo8+Tx7PtyCB6KdGqHEMVZVrP5gC28VLswahEdxubEHgSC2nrpHur7Q+
 gzWWUj4WOwioC0xmLzoxR2wQxzFzHOYo9v9Wa00//1j+rhfVFBLqAQuZoiZfXFB5lOGb
 fqstmsJ40X4dT2cRs0bu2oIGBRDpteJQKzGfSlZDWC/+ePkTEhwcSEbc6j2jab/0Eo4v
 UCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=85ddGGj3GLOwrOq5IiAfJuWiCq0FxPYTf6z2fEi1g+s=;
 b=iwcqUqL6VPSeuvaZ5ThEL55Y3nuMMV5k1Lkc2/uKTmU8a4iIWUTstTZpy+FUFOXaHd
 YGHjtGiAu923E0r99IpTuV860kq9op9X+e9Mtt5/W8JltBKpUw5GCknAo3reoxI1ZBpK
 i4Jr2bTJQT0fJFjK+uY9SHY9L7QaoU9sG65tZ6HPw/ppVrcRd2qrxahhtG12deDQ8u6u
 8q+ockszi8qvUgWV0TA5vRJ+hGsXdPFJKLs6nFC3dpqKeGZ8MKX4lBGZNV6FDUr5rJ2r
 ksCtn4oWT5yto+3KEwYqnHBSgg5t+18IEi9TWwm10Gyimx3jBL+QyCbB4NF2ZME9W7tC
 B2PA==
X-Gm-Message-State: AOAM5334cRSVCJHYMXq8wpSo86AHEMWwkacVd/wCpi2c7lGBayLRgcxv
 Wsgt2qQuOAgdUb2yQzheb6qaLQ==
X-Google-Smtp-Source: ABdhPJwvjJ9OXTdubLKcf4rg3MWaYgx46y6ml6djug1lj4XSOOlZqJRh+P8aROfktBxzPRn3/YWTRg==
X-Received: by 2002:a17:90b:4b48:: with SMTP id
 mi8mr2727567pjb.94.1635300767397; 
 Tue, 26 Oct 2021 19:12:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h7sm357857pfc.29.2021.10.26.19.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 19:12:46 -0700 (PDT)
Subject: Re: [PATCH 2/6] hw//sh4: Use qemu_log instead of fprintf to stderr
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635298341.git.balaton@eik.bme.hu>
 <c788cbcd379e42908b55df5785c031e437f81a5b.1635298341.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab161bcf-9df1-58e9-fd23-8c5cf524ad09@linaro.org>
Date: Tue, 26 Oct 2021 19:12:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c788cbcd379e42908b55df5785c031e437f81a5b.1635298341.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 6:32 PM, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/char/sh_serial.c |  7 ++++---
>   hw/sh4/sh7750.c     | 13 ++++++-------
>   2 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

