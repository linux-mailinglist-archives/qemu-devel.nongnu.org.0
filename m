Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C34302B37
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:13:06 +0100 (CET)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47IP-00068f-8T
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l478Q-0001NS-Rw
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:02:46 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l478O-0006t5-Fc
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:02:46 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so9572983pgj.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 11:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hO+hOry7tk46aPJCYp/QNHoA7Z2uItuZzqUzRJ2N8kI=;
 b=VREa5/2J/TV0LW8vdZSxUOkmCeS+CCR/K4hR6vVRbpaLmNaEBVmNDpTpkvTeWZn3kq
 VClSDLT3ZkvD8MhS27F2jGU3mUjUUeUrkVj+7FSRHE0HNoIzqLzMnfOZg8CLd0GTouaB
 5lW2O+4i7ToBHsl+DbT9C9ftAz9dLXR/dk02DpOf2mCStdmzg1MUQJDNS+xqYPa7PKiI
 8HmuQ7vWNNEaDeIFhM+qd/8PLEwwheAMSTB6I9LEqqZJPTH1qpvJzlkqaiGdSFbP6cWu
 Hl46usHrzXFBxy4ak0xH6upuo1mqF5P9zs0YkUXjYkanBzX0rEEGlain0gwQlEp547jc
 3sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hO+hOry7tk46aPJCYp/QNHoA7Z2uItuZzqUzRJ2N8kI=;
 b=bnHwF2NDilXo/6ZHW0GvSYcDE04UT3Zks+9XiKLREwMe0LLK5wh8kcX773AUKlYvRD
 LHKJxWnwLPf+mf3clrOSmTazt83dF/il9zabU17BlceT2oxJ1rKjkpw49p8Cc6c4Q09a
 /XKBUcW4k31q3pllQUwBjiXN/7dxrX0I1ay52+6JP6dgaIP4/9Drcl546uCZFM39wU0/
 k2e3jC/FRtWN7X4NpsYP4LiJDzd3qAFlP2Iihe1dvCvFKe8Jg0evDDDB39cEIR3WX0dH
 PwAUO8M6+imhcBkZCNecs7yh7bxIITTR23y0VUf6rZ3ls6wJVHmS4qNhL5WgoWK6Q2u5
 5xaA==
X-Gm-Message-State: AOAM532+wODYvpcfbCTdXPBGN4RUzEkH1Znk0oD0PGI533Afqt8Cu7vh
 LUo0gZO4VfSJKGCtGsb5QFuf6g==
X-Google-Smtp-Source: ABdhPJwgKQUo85hdE/hdY9zsouqDilVAmzP07YmhZkVfMG8Airgouqbz4w3cvMgWyrThBx97884kKg==
X-Received: by 2002:a62:7b90:0:b029:1be:9e89:1db5 with SMTP id
 w138-20020a627b900000b02901be9e891db5mr1585120pfc.35.1611601363135; 
 Mon, 25 Jan 2021 11:02:43 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 197sm17917140pgg.43.2021.01.25.11.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:02:41 -0800 (PST)
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
Date: Mon, 25 Jan 2021 09:02:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 8:58 AM, Stefan Weil wrote:
> I have no evidence that TCI is less reliable than TCG, so I would not write that.

It can't pass make check-tcg.


r~

