Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE934807C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:29:20 +0100 (CET)
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Fr-00071U-RS
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP88j-0000uF-JR
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:21:57 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:34361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP88h-0004rh-Pq
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:21:57 -0400
Received: by mail-oi1-x230.google.com with SMTP id x207so1014442oif.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KEbh1LqIqxkSLujMBS9BAOMyb5eenEl32ni3amT0JOU=;
 b=p9jVzqP6dj4gNwVQiJvijKk/RBqQDmIFu5OkQOSXcsEHDibp787qQMUJku/j7gC95T
 C/LQi6J6rPkTOYlGF/P5k1YQ854BQgISJ9214UfqclP/MVwd7fQtBoKQiFvBaaxdxIRG
 ekb0ap8ZbHTlCpfSBNs6DiCMzoild0jilynjCR3nKgHS9ueP0ec9C0VZhnp/mqKqTxdx
 3PaCB6VUE4L1T8gc/Cw3RM58fBwOgslh8GGvo6HS2aW66RnkMan5QR3JNdNJN3IDOgfO
 AIfFdda09h5nIHqOcuo50NmslihxmAnItbt9Fsw9nwVqReBnvayb7z+/GQM3FrNJI/sv
 KKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KEbh1LqIqxkSLujMBS9BAOMyb5eenEl32ni3amT0JOU=;
 b=ROjzcxx7x3MT5EfIjNBBqmDTPcgL64PcK1omGMqm+HQ9NDZyy0daFyuu1Vbld5Ufjv
 9wyDMAGzUVeVziG4+mwzOyXcCZGlB0oyKGbEzGvBnVNYez4zkgZc/tut9sXkkqwEe8aV
 sWDY1/VhU6pxL0i996yn+HHVwcyitifrdqz07rncC6NYTAYhYLNYI173c/KMB9qbL08E
 3X6SPqVLGVI/LTT1Tsbt2oxd8koizDEVedUa5B+yTa3G0oR/tD+ilTJ1gjrSVThFUpr8
 /zWOfTfstQjm3o7DzpM69Gbhg+5BZeN24p9cx0u/BTqJ9Pqx7x5yFr7dChbMUCtl4RWI
 GosQ==
X-Gm-Message-State: AOAM531rFQ1eb+EXPXsXdrjRcgkT9bjLIVcDJNCXCzmp+ysaD10D/UoM
 BvH4DymN83g7XcQIScd9sN1aRQ==
X-Google-Smtp-Source: ABdhPJwb6P17tPipTssTQgckDI5i7Jm7bcoNOnqKV/UeDFa1arRhl6Y5O+5ifre18PT+jOefYuz/9w==
X-Received: by 2002:aca:4d4e:: with SMTP id a75mr3266770oib.107.1616610114476; 
 Wed, 24 Mar 2021 11:21:54 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id t22sm717664otl.49.2021.03.24.11.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:21:54 -0700 (PDT)
Subject: Re: [RFC v11 08/55] target/arm: tcg: split m_helper user-only and
 sysemu-only parts
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce40e73b-3334-c6d4-7bb4-03f258d3beae@linaro.org>
Date: Wed, 24 Mar 2021 12:21:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:45 AM, Claudio Fontana wrote:
> in the process remove a few CONFIG_TCG that are superfluous now.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/m_helper.h         |   21 +
>   target/arm/tcg/m_helper.c         | 2766 +----------------------------
>   target/arm/tcg/sysemu/m_helper.c  | 2655 +++++++++++++++++++++++++++
>   target/arm/tcg/user/m_helper.c    |   97 +
>   target/arm/tcg/sysemu/meson.build |    1 +
>   target/arm/tcg/user/meson.build   |    1 +
>   6 files changed, 2780 insertions(+), 2761 deletions(-)
>   create mode 100644 target/arm/tcg/m_helper.h
>   create mode 100644 target/arm/tcg/sysemu/m_helper.c
>   create mode 100644 target/arm/tcg/user/m_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

