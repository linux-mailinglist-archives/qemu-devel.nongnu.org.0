Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D431B43D830
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:38:35 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftRC-0001Xc-Nj
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftPU-0000qC-Bz
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:36:48 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftPR-0004c9-DT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:36:47 -0400
Received: by mail-pg1-x533.google.com with SMTP id r28so4721470pga.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=av+F79+Zrn0VcUKl+fiOL5Ja0QSZrLknsu/l/fQKlLw=;
 b=kOjR+3sp8bFAhwCR8Ief1EHh9z9Dzd1RkQV8HejYUtLIQKqAwTWKuF0dmK/WSANOlN
 BIVRxfKGfVOB0lsIw4i5CGbDt+iJggYH4+We2xnpZXsGhvIAFdI2ycR0qMsTENvKyU86
 kn3mopFUZu9APmL3sM7q43BDw/3P7lTEN4FBhyFOHJQdes/sjo0aLflychzEsq1SUWPi
 9dhJO2sIzmtuCHpUrIFcfzwQzCGJMN/xuxXnMAIPSxl6TPKEvuoWCIcKiS7nbIW9bwtg
 hW+EJtCECUVKXF0LQuDiWTS26qExBijN0Nzhh5OarOr31WAKOLXBpdFF9JvOxVOlI7W2
 qXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=av+F79+Zrn0VcUKl+fiOL5Ja0QSZrLknsu/l/fQKlLw=;
 b=EDSQMaWjzgtmsc7fG3sXfXV8ATMwSO7m4jVmi8Zh1XcK0TOqH5twCzx8dKNB6uEWqd
 3cQkyj0SQDP3Af0ga9vQ4aT6XqRcE84QYlMfT9UKw2x91mJcTuVEoS0hSpyW1ndEHmws
 OzKnGsVG8kfW3O2Ep4miUEbAbxuK+sQS84LKj1GAEfATY3OZvUPESDEAwlylUGcsw7Yi
 hlUCGVogyzh7WC+OpG3EkSPwpHVlcYtOuo8NB85p+1GXpPVxBM8Jhzd/qohHWnRtSbD5
 wukTx57na6PjITb8l+nSyW4ctP0QXbaLJBhPHJ93ShQRyd8jq8UR9clvaPOpB8XzQSSj
 KkYw==
X-Gm-Message-State: AOAM533OB5gh8OzJA74wUqSjWIzltL6RB5Bz9ZK/R7e/WdIdd3g8yXcP
 l1g3Psmjnywk6QMiG3rNxNymVg==
X-Google-Smtp-Source: ABdhPJyps6tLhqh5F9XiDyklIpmBwKAFAuZw7tHQZm7qST71N2F33nw+OwDjgHSmAKdXS5Y2iqVaow==
X-Received: by 2002:a05:6a00:1a0d:b0:47c:34a0:e2e4 with SMTP id
 g13-20020a056a001a0d00b0047c34a0e2e4mr971379pfv.55.1635381403245; 
 Wed, 27 Oct 2021 17:36:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id on17sm5547815pjb.47.2021.10.27.17.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:36:42 -0700 (PDT)
Subject: Re: [PATCH v3 07/18] hw/char/sh_serial: Add device id to trace output
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <44d15f5d19e1f5c364d3cd29882345e117baa998.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80c088ac-ba86-b415-e565-8ab5adcbedc0@linaro.org>
Date: Wed, 27 Oct 2021 17:36:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <44d15f5d19e1f5c364d3cd29882345e117baa998.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> Normally there are at least two sh_serial instances. Add device id to
> trace messages to make it clear which instance they belong to
> otherwise its not possible to tell which serial device is accessed.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/char/sh_serial.c  | 6 ++++--
>   hw/char/trace-events | 4 ++--
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

