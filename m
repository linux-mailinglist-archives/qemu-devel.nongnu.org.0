Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F8371ED4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:42:34 +0200 (CEST)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcaX-0005a2-A8
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldcAk-000457-0D
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:15:54 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldcAh-00056r-KL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:15:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h7so3193248plt.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uT2bndmM+VXxmy5KWkuOo0k1wgEeev2C5i25aQdPwRE=;
 b=yOm2lYZSUEdfBL/Ok8wDY0J0CLCOy1Lbrj9p/XRMCFxH0cRvn4ft7SxT0TXXQG5k62
 8h9Ra/G1We+VIznflzUvXDbdLo+W+2PaciY3/AQjG0golqSTOjlW8qbL12Nu+AfGFew6
 4jgr3jiEm318rUDQdubYtz0N1c5nU/2q60ynnR7UtHQAGqEw3J5B9SAIv0C1ah3JhI36
 Is2wLe4tm8btABhZrXt3WuCrd3H7dgbvDtujFHlxa3FrzAQ90oiB0WaHOx6QU0Fz5MKK
 Uwt5v9RmKL7XnK+zyXfGBw7/LOKRcgE9El5z0I9GErjbImMhVkNLyA/q1dB/CaQvaNnN
 6b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uT2bndmM+VXxmy5KWkuOo0k1wgEeev2C5i25aQdPwRE=;
 b=QgepP3Gr3RTPwmzouY7UQlVBozdGBrPgk5B8a4+6fJjnxyvsj0sOaOM9lDNpMOQJJg
 V/NiU1xgAlka4tMWc1uSfmAuAbZclboF6RUp6K+TH/9hlzaqO1GWFrOLHpT/pd4FlKnq
 /JS7YlBjI/3WRhpmV1Od7DQHTpRPT6TtWLclw1PDaLAco12z81anxFetKAn8sow640oS
 8zdDbFb6sLyL9UHrlGojJzfj4eAwz32Hdo6hWwNbHxRFRSnx6Km9VGBY9V4vWgHR9QjK
 u8C1Z71qwvR57Gg+uy5RpbHAhH5E05dyES9B+38GSvfArKhwmj2XDpOyVmzOHKZMZ0J/
 Y/MQ==
X-Gm-Message-State: AOAM532iv2qRGCEFP3DVqR4Iytj0vYB9vLYm+MCWi4wUFHdY9AhC4zc1
 TBOKhwlYXLyrl58rpwMotc5/gw==
X-Google-Smtp-Source: ABdhPJxLOU0jRcukHDF2zAODTHGaSBcafWKlJ5Guyy8hH22qw+lyK4Oy2dynkOg1qVO6f288voEykQ==
X-Received: by 2002:a17:902:e807:b029:ee:c73b:9fc4 with SMTP id
 u7-20020a170902e807b02900eec73b9fc4mr10466915plg.72.1620062147903; 
 Mon, 03 May 2021 10:15:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e20sm46682pjt.8.2021.05.03.10.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 10:15:47 -0700 (PDT)
Subject: Re: QEMU tests, Coverity, and g_test_set_nonfatal_assertions()
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1fd864a-3fdc-1bdb-04a6-9c847eeba59f@linaro.org>
Date: Mon, 3 May 2021 10:15:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 9:49 AM, Peter Maydell wrote:
> (1) Expand "assertions always fatal" to test code, and add "panics"
> models of the g_assertion_message* functions. Remove all the calls
> to g_test_set_nonfatal_assertions().

I vaguely prefer this.  To me, "assert" means can't continue.

If we want tests that report and continue, we should use something else. 
Though of course could mean quite a bit of churn.


r~


> 
> (2) Aim to expand the ability to use g_test_set_nonfatal_assertions()
> to other tests than the handful that currently use it (perhaps by
> providing a standard place where it gets called for all tests, though
> there isn't currently an obvious place to do that). Treat Coverity
> issues in our test code which flag up "this would crash if the
> assertion fired but execution continued" as bugs to be fixed (though
> not very high-priority ones, obviously).
> 
> (3) Something else ?
> 
> I think I vaguely favour 2, though it is of course more work...
> In any case, we need to make a decision so we can decide whether
> the pile of coverity issues should be either dismissed as intentional
> or gradually worked through and fixed.
> 
> thanks
> -- PMM
> 


