Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3612FA99C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 20:07:09 +0100 (CET)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Zrn-00034X-N6
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 14:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1ZqD-00028t-M3
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 14:05:29 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Zq4-0002BJ-F5
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 14:05:29 -0500
Received: by mail-pj1-x1032.google.com with SMTP id l23so10454651pjg.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 11:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Mq5GdHkM4nrxlHnnHKdG3C1TUt6wRiGtu1FOznq8zRg=;
 b=q4cAdKoij+rVj76SiXyw+nSAgwAVLwS7AJTSm2O1r1l9mJCVknR1nc9OKnojBfrBoh
 8wzjz0KUanYndUv6LS1qZGcp+tIut0AHHxUWKhngQub2AcoazOVghI0uGVUkzIuZWCpJ
 Y+KWCmIhx5+iTheub1ZDXJtnf4obTNbxHAk/E/Teu0f72Gk+cX2RHWFxVgs2iaFOPsKh
 f1OSwBiG3G+1/YPlRJ/VKUXRYJSDVQLLH7cDiHa4Hd3BaavC6+A+JvVscH03lqr+ms5v
 nicdPKienC0OoMP2NHJRMmlYFtlU7jyR59fNQGA4Cm2qeKzqsChIAgJbY+RL4AzYD5dS
 ZNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mq5GdHkM4nrxlHnnHKdG3C1TUt6wRiGtu1FOznq8zRg=;
 b=ffYdHUeeCCDB2YjeAAcgmKB9F05i4NXQJB77oxUwhscxm+gZ4J51JqMHw1LHe4iunV
 GOlBedXghYDtDoX+o3pQoI9ZBM3mB7mnNKY2JhInpDUqDkHjyKMFMeBpgSh/Gfwu2KHV
 QcX9dA6H41fucub7s3NVv2fkPGHimPaCtzRPykwta5Z0KkDRLEGdsYOhISvl2dhqM6Pl
 +xrWOzyJdR6jxOSZm7+pGEzSa0ALqTQfZK2dbxJKlqYmHWpm5H50U+jXlpxDuMW6KiPy
 9ZrWpEjpRo6q09SbegSQ9/JUy7GzcU0iJHBGRiKCv555YBvxiFZA7Zo1gdzVIsob5uLw
 6NXA==
X-Gm-Message-State: AOAM531fqMqSdQw9ZjJkGfDnPyyR5qX3i1C76xCqUyVSjCH4lXUcX0Mk
 +s6K4LaN+WxdhvkcAOvW1Gs/Pw==
X-Google-Smtp-Source: ABdhPJysB2yLXCZXvh8RpzUDrghtcpYPtoKMwtDDGTBxTfYah4zz/jEN243byphojXEC+gvDnDsdgQ==
X-Received: by 2002:a17:90a:d181:: with SMTP id
 fu1mr783176pjb.188.1610996717739; 
 Mon, 18 Jan 2021 11:05:17 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id 30sm2659522pgl.77.2021.01.18.11.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 11:05:17 -0800 (PST)
Subject: Re: [Bug 1912065] Re: Segfaults in tcg/optimize.c:212 after commit
 7c79721606be11b5bc556449e5bcbc331ef6867d
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <161099284929.24279.8861936732715099651@73fb1a5943b8>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a56a4c8-2a2f-3dd5-abb9-da55d3bdde8a@linaro.org>
Date: Mon, 18 Jan 2021 09:05:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <161099284929.24279.8861936732715099651@73fb1a5943b8>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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

On 1/18/21 8:00 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/161099084144.30067.897245088295398204.malone@chaenomeles.canonical.com/

Can we get patchew to not respond to launchpad threads?


r~

