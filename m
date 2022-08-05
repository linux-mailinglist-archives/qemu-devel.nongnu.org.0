Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774958B122
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 23:29:56 +0200 (CEST)
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK4tG-0006IK-SX
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 17:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK4rO-0004VV-ES
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 17:27:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK4rM-0000PF-H5
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 17:27:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so4005054pjf.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=xFzGOyk//nIonb2B1LhbCaZRPKM8lAwywGYLPJTQS3w=;
 b=e5wAFsc/fQ83TuHuHPN14F2N72O2mPuTVpINPuDgmAdxIFPYdWHayZ7TCGAjG+9AlE
 o5zQzQo/piY/fWrX0huGt84lvCypZe2uElsQwbh3i8m4F1ZNRgrryWISDW56VfXPGDbO
 TJHA2D6/ejGTCCh35CI8/5GpjkGtDAlCd2QYy/XSV+QYN/T8JIE/eVHMIO+yfFpiTwsl
 Z9CWDekA9WMvBnszHWF0fdn3+vapavKOKNna5F6VLkQeRSDqOO9hrFzXjoJboVSdXONM
 OzG0Y7CSYV5YGwWlWHWTJvfcUylKiPFXKD26zK1sja3MKTgCZtb8PBm0cJETJX/sm9py
 rHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xFzGOyk//nIonb2B1LhbCaZRPKM8lAwywGYLPJTQS3w=;
 b=iX4iQhPvxFKtfKNKRH7MUW/oDGaB04fyLxjiWnnUOV4jsL0oqok3KlHNXd1KIZGCCc
 yHobZQeKwDRIE4oU2U0qCfgzUgsrStYcjCTqz54AhY0y90XL8bQItGdRFx/yQAqylwxo
 6pWazduT6ukw3Y1lIdXjiPA7GF+44jtj0WpjwA7MRN0/1Dhcp/eRjA0cSI1WB7eR/ouR
 TOfn7sy/exAamrOnEKSOvFg36Q/CRzu7jMK/sI5lJUePzTNnOsirbQwVCjwK+B7lNbJw
 EZwhEMWPtaLq50vB31EvOS2fRHEMV6vjTiw9wIt6U25kJdV1powaYveCNOoDS62ZRuAB
 3x+w==
X-Gm-Message-State: ACgBeo04aqH0pl5k8j3Jo4HADCr+jpeEodpC0gIaXumKhosOJz2/zuua
 B4AqwiEA9BX4J1JpVbGfEQLiBw==
X-Google-Smtp-Source: AA6agR5lHTO4ISX2kFj0sk2E5Tp3eLPYk9cGq0V20oaTFK2Q+lzbmatswfdze+uXrPrQnhwMdqKX0A==
X-Received: by 2002:a17:90a:fe07:b0:1f4:203d:d192 with SMTP id
 ck7-20020a17090afe0700b001f4203dd192mr9634121pjb.145.1659734874807; 
 Fri, 05 Aug 2022 14:27:54 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b0016a0bf0ce32sm3612520plg.70.2022.08.05.14.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 14:27:53 -0700 (PDT)
Message-ID: <b0e384df-0836-a097-0eac-2acb4d5f9133@linaro.org>
Date: Fri, 5 Aug 2022 14:27:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/6] Misc next patches
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220805152014.135768-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/5/22 08:20, Daniel P. Berrangé wrote:
> The following changes since commit 09ed077d7fae5f825e18ff9a2004dcdd1b165edb:
> 
>    Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-04 17:21:13 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/berrange/qemu tags/misc-next-pull-request
> 
> for you to fetch changes up to e3fdb13e8851be570db41a50589ce82d11d61c12:
> 
>    util/qemu-sockets: Replace the call to close a socket with closesocket() (2022-08-05 16:18:15 +0100)
> 
> ----------------------------------------------------------------
> Merge misc patches
> 
>   * Display deprecation warnings in -cpu help
>   * Fix zerocopy IPv6 handling
>   * Clarify platform support policy on minor release/backports
>   * Fix closesocket call in error path

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> 
> Andrea Bolognani (1):
>    docs: build-platforms: Clarify stance on minor releases and backports
> 
> Bin Meng (1):
>    util/qemu-sockets: Replace the call to close a socket with
>      closesocket()
> 
> Daniel P. Berrangé (3):
>    target/i386: display deprecation status in '-cpu help'
>    target/s390x: display deprecation status in '-cpu help'
>    target/arm: display deprecation status in '-cpu help'
> 
> Leonardo Bras (1):
>    QIOChannelSocket: Add support for MSG_ZEROCOPY + IPV6
> 
>   docs/about/build-platforms.rst |  5 ++++-
>   io/channel-socket.c            |  4 ++--
>   target/arm/helper.c            |  7 ++++++-
>   target/i386/cpu.c              |  5 +++++
>   target/s390x/cpu_models.c      | 23 ++++++++++++++++++-----
>   util/qemu-sockets.c            |  4 ++--
>   6 files changed, 37 insertions(+), 11 deletions(-)
> 


