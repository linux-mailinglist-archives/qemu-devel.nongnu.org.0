Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A50696FE8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:39:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS31B-0008LT-Gw; Tue, 14 Feb 2023 16:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS31A-0008LE-4k
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:39:16 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS318-0008EF-9d
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:39:15 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so90585pjw.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zCUwvI2P+9z3lgZBmdg0P/m6+xxK/QldYrAnZFAFnEg=;
 b=aqOnuuY4ILIN8SnFSktLFpsEB7cX8pdFvz2c4gsXTaMXDKEwclUxN3TkHIEMHwSbyl
 pNW1hur2pnn/wYOZ3gIs8Z54h0ZYlF289wxLUjnyPfEkLH9/R0O4aqwAuXRHqUo5yWgH
 st1ZqE2sGReEnK9L+oe+OhlvS/NqW6Sb+fORu2ZmzkWRXZVZHGj8h/nHWzFaMHLfJ9T8
 aaCivbdOE3wfHaSccLNo3OCK8VFcddOACY0SGCXcRRu4YbeBAA8Qfv7Q+1IwJtU/lId9
 xEuspsiI6mSlIJc3a8f9uxtpIJ9KfwXMsyk6uFZO5wnZ6EeN8MVqMEoEau4COvhQwWmW
 FNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCUwvI2P+9z3lgZBmdg0P/m6+xxK/QldYrAnZFAFnEg=;
 b=MgrpnUe4hsPnt0J3rO9maExpr0cXVp/kmwGq7CYIC8YNB443AY12zT8jrrN64UEbJy
 2JFa2dSoXnQ5cyyfx0izV2d9LcL+q2qMQX8FAxjin4jzq9QgjGV2CATiRkZdyJ0uF3F3
 nNXqhMHoGBrirC9L/91tEQpv8ghizPB9F0wMBL0rabDFO1khcCehZUDGE73ZMJkWWT9d
 wdGHauwlN7c5X8THOaug6ZgEgpv/x7r7GwZ5zV376tvvZ/hcDsem/kVq6X07lDMSJ04P
 notJy+TJebqjlO+3lJXLdG5Lpfb+D0JVSkJZb7gCORpVc6JapVXO1cX5tf7oYnRIn9nk
 CwkQ==
X-Gm-Message-State: AO0yUKVR345O2ES3Vx0c3Mbp/JlQjnbuuXXYjKDSaXzKZVaa0vK6uzLD
 Rcci0YyOiAOSPbvycQyMB9jaZ43q2SwAjQKR5b0=
X-Google-Smtp-Source: AK7set/ADBXyRV49hykByx6m7zHISKzXRYohc+qnj8kzBRSjLoHXtXtlYM45MJQ06XcB0FX26dTLTw==
X-Received: by 2002:a17:902:d486:b0:19a:b033:2bb1 with SMTP id
 c6-20020a170902d48600b0019ab0332bb1mr99904plg.44.1676410752466; 
 Tue, 14 Feb 2023 13:39:12 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902c1ca00b0019a97a4324dsm5339155plc.5.2023.02.14.13.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:39:11 -0800 (PST)
Message-ID: <26e0fa42-b100-d502-368a-49668d4390d7@linaro.org>
Date: Tue, 14 Feb 2023 11:39:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 04/12] bsd-user: various helper routines for sysctl
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 kevans@freebsd.org, f4bug@amsat.org, Thomas Huth <thuth@redhat.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-5-imp@bsdimp.com>
 <a36ae3a6-50fa-d969-e9b2-6fe1ff9db9e1@linaro.org>
 <CANCZdfpXnVHe4cq4mFJ=KPf+t4Sc9_2vqh4tdG+PgpfQQBvp1A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfpXnVHe4cq4mFJ=KPf+t4Sc9_2vqh4tdG+PgpfQQBvp1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/14/23 11:31, Warner Losh wrote:
> Right now they aren't used at all for ABI64...  But that's in later patches...  We only do
> special things for  LONG or ULONG on ABI32... Otherwise, the normal paths wouldn't
> call these at all.

Yes, I've just seen patch 9, and agree they aren't needed for abi64.


r~

