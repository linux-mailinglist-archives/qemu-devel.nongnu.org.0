Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C3681A35
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZh7-0007d9-9j; Mon, 30 Jan 2023 14:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZgv-0007cg-Gi
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:19:46 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZgt-0005I2-MB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:19:44 -0500
Received: by mail-pl1-x62e.google.com with SMTP id jh15so3667068plb.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ID90pf8XCxGMj6LkN5GvEfvYWfbgowV9RDb/vPtqK8s=;
 b=eMaD4LfII65pcMb+wGG98lRFmXlRwZPASIQjgaW+IDChCCdsNN+fxNG7cIyrkQPpHf
 7lSNRmwFgyqVjokMvzD92mF4ApFXCBiumMyNcC3AAQz+9GCdv/n3lpEITw4SLizsS6sm
 CSCuOGTYkd4IiyMs3ws8s2Cjix5XrcoATOyOXCG9RlT6aC6EjFiGP1GgZV9k3f4gHN9N
 v503APVntWsl9/tAzZXry7RtfvhFCx5udUrLQ9oHDiUEKQvQowrtn2Orv087ZOz3iufl
 IH7RJAD5eCIp+f3LBYffW2j58Wt+ACQZ2IfaCcTYuk2iRz0JpnrhDG/7vWX1uezbVsJ3
 fCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ID90pf8XCxGMj6LkN5GvEfvYWfbgowV9RDb/vPtqK8s=;
 b=0MXH0uIzPYvPE4HB+VSmsDMgSUZ9KXYi0cI+DHud6HsIJMNO4kovY7nY9LUMbKhH2K
 lTEoAMFggYmnBFT+jNKso11PiWjOET81UKKFVbaMbMIEIXfHR0kh35Yy+K2HMFBqcUsi
 iCXqA8nMaQsjYhOMkZHtli2Rp13i86JdxSHjZg4R7wuJlsKLm3OlnOXITIlUzdAUGVCP
 wuB5E5H2iBSjO0nBHggZZmdYRny+LbdcHBvBDtTbRO8q32cq/CYQg1AgqJa1Wkp4yfxv
 3s3cOnAutEgggHFGi2T//mUTnX9LC0WL3/6NRqcxsJ/Fl1iGFJuVhwc9Dm+LkTxE32u3
 urzg==
X-Gm-Message-State: AO0yUKUq3//R+eBx+V7sWgRgnF9OpC3kX32kNK1PGH7GwcMKsiIWoi2q
 uTcFRYGK/WkVCSyiKN0l6QxN0w==
X-Google-Smtp-Source: AK7set+R9vuplekYL12Tf5v70CbiBn6Ik+njZbxonNuXo/v6r3qOeDrWlkaTlxiAajEoGN7y9bej2w==
X-Received: by 2002:a17:902:c943:b0:196:5787:d73a with SMTP id
 i3-20020a170902c94300b001965787d73amr14458041pla.53.1675106381063; 
 Mon, 30 Jan 2023 11:19:41 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 y10-20020a17090322ca00b001947c22185bsm8135457plg.184.2023.01.30.11.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:19:40 -0800 (PST)
Message-ID: <9c529b2a-14bd-fd50-c0d9-87f2253ee0bb@linaro.org>
Date: Mon, 30 Jan 2023 09:19:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y9exrDWT2NUoinu1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 02:01, Daniel P. Berrangé wrote:
> I vaguely recall someone mentioned problems with atomic ops in the past,
> or was it 128-bit ints, caused implications for the codebase ?

TCG_OVERSIZED_GUEST, where 32-bit host running 64-bit guest cannot run the guest except in 
round-robin mode.  It's not *that* much of a support burden, since we're not going to 
eliminate round-robin mode.

But I do question whether we need to support 64-bit guests on 32-bit hosts at all.
Retaining 32-bit on 32-bit allows arm32 to emulate i686, which I suspect, but have no 
proof, is the limit of what users actually want.


r~

