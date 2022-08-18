Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35B598AD7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 20:03:31 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOjre-0006yN-In
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 14:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOjq1-0005I2-5V
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:01:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOjpv-0004rp-FP
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:01:48 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo5429578pjd.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=uwEBj2vYxvHEh+vOQNh0UOespMFR/S2waDifvnO6DG0=;
 b=f9qS3y3WYNjLLjQIDV3aJ9qYZyEiqySihYIYbH6OagpUwKPrguh5niBBhT+hVrAnzk
 IfGGb8hjF5H4prSRQB2p7AavyaBtzDCIIm7XLLiEwoQwRZRR3Mle5WIQvxkmMwy88uQJ
 I2LjAaUQ6f2RlL+DFUt7I1Sum7ZAUIe8zZWa9/90rxKkISHFJAKjjmd9jITh/RmeJHd8
 DpGJkun+Q7R4Xoy4h9y9da/vcyLj1hgEcHkwg5sKJ7sWUxC/2LVnTLmGAkCPnczR37RH
 +3kjyNMg8DbE0K1PpsI1iYnvKN80/BlE8z5I04BtNRGNBtdgsSPyVII5hzI6/gO8Rtj7
 Od9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uwEBj2vYxvHEh+vOQNh0UOespMFR/S2waDifvnO6DG0=;
 b=EXNPRap5D7QT62UQK3K9OcMNFXgkqD/kO/u5PCq2PLsOyWpxtMq95zDmqaiPIn5yn0
 /Ko0yxf0X07K4SXkSaHKTEXtXlBYZeRUi0dIucb8BE2YUyf35bW1zS3vLXAUWIKET0+1
 kX124KoKawsXJCi4JkhO1tGnomyrevYhGjmPdlTQujLW3ZCS2J1E1F8+Daq9IlUYYEuQ
 eSpwDNgWKqVMz5bSKXRfXISGWkYJx209K0p1ESDPlfEJBj2kwtqms8Z3iGU4rQ+B28EO
 o2Cr5LWDS3elRpkVCJjn8KTgkPHg9JEL94Mw+eBt8oQRlv7hlUrMSKwILTw4YdLJdC0f
 k3Dg==
X-Gm-Message-State: ACgBeo36LfPMZMf23P1pJiAgUpJkifsaX+uWpx8elCKuSD1F+YHr9MAU
 h6irjVxWthgaddS7tKLJC8/iAg==
X-Google-Smtp-Source: AA6agR4shv975DDZWsDO72IkzCKHjlPqRH9odzPUzb2oVxdZA10T5PkjoDoo7X9vHGddAZ1u6Of0Cg==
X-Received: by 2002:a17:902:db0d:b0:172:925f:3c78 with SMTP id
 m13-20020a170902db0d00b00172925f3c78mr3758781plx.157.1660845701520; 
 Thu, 18 Aug 2022 11:01:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e?
 ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 s185-20020a625ec2000000b0052e82c7d91bsm1917645pfb.135.2022.08.18.11.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 11:01:40 -0700 (PDT)
Message-ID: <566b37a5-757d-7283-12e8-3729a8cdc759@linaro.org>
Date: Thu, 18 Aug 2022 11:01:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] Fixes for QEMU 7.1-rc4
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, David Hildenbrand
 <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-s390x@nongnu.org
References: <20220818065631.324170-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220818065631.324170-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/22 23:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:
> 
>    Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/fixes-pull-request
> 
> for you to fetch changes up to 88738ea40bee4c2cf9aae05edd2ec87e0cbeaf36:
> 
>    ui/console: fix qemu_console_resize() regression (2022-08-18 10:46:55 +0400)
> 
> ----------------------------------------------------------------
> Some fixes pending on the ML:
> * console regression fix
> * dbus-vmstate error handling fix
> * a build-sys fix

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Marc-André Lureau (2):
>    build-sys: disable vhost-user-gpu if !opengl
>    ui/console: fix qemu_console_resize() regression
> 
> Priyankar Jain (1):
>    dbus-vmstate: Restrict error checks to registered proxies in
>      dbus_get_proxies
> 
>   meson.build             |  2 +-
>   backends/dbus-vmstate.c | 13 +++++++++----
>   ui/console.c            |  6 ++++--
>   3 files changed, 14 insertions(+), 7 deletions(-)
> 


