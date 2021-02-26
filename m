Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C494C326539
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:05:57 +0100 (CET)
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFfcq-00088u-QC
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfYz-0005Am-E1
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:01:57 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfYw-0004lv-Gk
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:01:57 -0500
Received: by mail-pg1-x52d.google.com with SMTP id t11so6459178pgu.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yMp+PPGVmTwFFscwXFeNjWIBUJh1ZtN9T2W/4afmWWA=;
 b=r0rkAqvAxs3nJ21gDOFmYirNKnDdnmiCr4HB6KBC+l2d4PMMFPx2h8HU5L3YN1q1Vw
 5WV4olSNU3mPv/iwwOaWXekd2qo5cnPY3s3Mm7fC9jh5PdFzjnj9q3eky6LXxyzkbiYz
 H39w5aNS4FFrtA9//gV8yrnHtZPs69rlpg43AIhxUmd6V3rFHv9yEeCbZfW7hLom4+Km
 PtoZ8w0zfJzjy3mbawxfvdg8P0Vx7+VdEtPRqrzdB396ch5ASVs0tts3sA/ZnKu80IUy
 oGldIW65gZ1Z/mhdoy8bXzKs/7KD2HrBF1Ysx2gVLQPZHcl/Y2Icyr8bWPbxl6CSS6nl
 hwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yMp+PPGVmTwFFscwXFeNjWIBUJh1ZtN9T2W/4afmWWA=;
 b=iayFChn7hOvJeBVDkOQVR9cWVxy7hNgJFBtuF8e4TwlX/SLhfWSXL1KAH2KzIavuHH
 pOU8E2Pl0iqXWQXKDoeVfirNGFcVkT2YdQEQH07TCyuE6i9jLupKSNfJcn6HF4/QOXze
 s3gEcNSyH6rHJF14DMFp6WgdByhLCka77BTzfOsytkL2TWTd8wya1Q6kypQt5R12eIlK
 3f+UMhfBNjTF25dtXiB1ohB7nr8tgxUmZApqrG3bPsh5kyTCGR1B9bOQQJs4zyZNK9ue
 pUVdotPpEdWR7xpnX0EAqip5lLgVqpt+gC17mBTbcYfsowRWUulfmIXfJZzdZ1Jzv1BB
 G2kw==
X-Gm-Message-State: AOAM531O6TLKJqOtVlNyKPZYsf3jRxyzKR2MVATMMRFkuCwHTBbGHmy6
 LpUaY8R6Afmguxb5QYN3QrtqHOSZethIpg==
X-Google-Smtp-Source: ABdhPJwLf+OWNlU4RjhLIcUJC+yqCqcGtGJsZjcpwfp1Pa2ppEZN2xtQcPv6X00dwXkHHPK8G3DC5g==
X-Received: by 2002:a62:5291:0:b029:1ee:939:140c with SMTP id
 g139-20020a6252910000b02901ee0939140cmr3911284pfb.76.1614355313053; 
 Fri, 26 Feb 2021 08:01:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r16sm9553290pgj.45.2021.02.26.08.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 08:01:52 -0800 (PST)
Subject: Re: [PATCH v24 17/18] target/i386: gdbstub: only write
 CR0/CR2/CR3/EFER for sysemu
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-18-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5de8219e-4323-9081-8993-9a2daba2c123@linaro.org>
Date: Fri, 26 Feb 2021 08:01:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226094939.11087-18-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 1:49 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/gdbstub.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

