Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD06503AC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:08:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6x8a-0005BQ-PI; Sun, 18 Dec 2022 12:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6x8X-0005Ac-Dq
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:07:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6x8V-0000sl-8I
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:07:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso10865656pjt.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hy/XP5DtHTksvBzc+ozD8h0ZAzo338rdDAQt7ZNvLbY=;
 b=EnVZh/W0jh/UNkX4oAhjVIwtfDHajKQeCOY1EUr9EQZM4ndfUos059cA3h87+qjgCI
 +G3sgU//NnCcipTqXO2wBqOIERO2XZdgZQ+0gzwpxBlEHcXuZpio+PnBt01836YbyDtN
 i6on5S/EHUDaibNvfxEcHDYBc/TzS8u6Ts6wDP6P+AcJWgAu0VZ9/CidLxfCLK5QY4et
 krcG6Wz1zXZDZhYqZMYZufv5dRf+FGgXegsjTVAdXtvrflpweICt68rbvOn+vhitQ0bk
 GJ4E9Xw+IIn9AttUTDSayY6V3md4hHLw9d0kA4YMPYrfeigmBkBCoFgC3HHOeqVf+59H
 DCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hy/XP5DtHTksvBzc+ozD8h0ZAzo338rdDAQt7ZNvLbY=;
 b=g+GAbwvGCDPgoiIfZahYsfi87CxPZaacixTgeK2ZCpLCqOrGecUiZw14drI96cxyw0
 kf3aFpvNJXPDSfZB6hndadRJG+YtRYgyWQQKC6RRCzCkBlGr1irNfQzxBxhClyol/IMI
 Q5uwPZwEVsNqg5ZxRLneKXvsfQwIEupQakXvMHfx89R5v90oZoj1/f+vRdiSjDDKncg+
 SjOW2wSZXCqhtOQ2YKciW1huEczG+cJTSuW2Z4aSbRp+0K7dKItg+JCe9VSCFhSo4wxh
 7eeZbBTsvHTFsJXuhW2TaNXN9v31E5gG4H+l16wINMGPNwwJTgCOZpVms9wKaHLzBEiE
 4axQ==
X-Gm-Message-State: AFqh2kp7iVKTbHjNUW6iWfXYUJQlOFlVPWUQJKjUPOq+7x1y2yN+SNuR
 dgoZcnhY09FV/78ZgxTx90aYpA==
X-Google-Smtp-Source: AMrXdXs7Ik54ulQIgFKoKBF0jQM0t5s2qjw+Yu2re6iS+3K/X3MurQ/je7sARl6Ve/cJ8fO/+5EgKA==
X-Received: by 2002:a17:903:2592:b0:191:10e0:b928 with SMTP id
 jb18-20020a170903259200b0019110e0b928mr5381384plb.9.1671383257551; 
 Sun, 18 Dec 2022 09:07:37 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a63f858000000b0047829d1b8eesm4643043pgj.31.2022.12.18.09.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:07:36 -0800 (PST)
Message-ID: <47aa87b7-eec0-de1e-470c-d700c7511f1d@linaro.org>
Date: Sun, 18 Dec 2022 09:07:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thread-posix: add support for setting threads name on
 OpenBSD
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/18/22 00:22, Brad Smith wrote:
> Make use of pthread_set_name_np() to be able to set the threads name
> on OpenBSD.
> 
> Signed-off-by: Brad Smith<brad@comstyle.com>
> ---
>   meson.build              | 12 ++++++++++++
>   util/qemu-thread-posix.c |  9 ++++++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

