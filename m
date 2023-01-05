Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDAA65E4D5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 05:49:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIC0-0007w8-0N; Wed, 04 Jan 2023 23:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIBx-0007rj-HO
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:49:25 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIBu-0004PN-QJ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:49:25 -0500
Received: by mail-pf1-x42a.google.com with SMTP id e21so14939768pfl.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 20:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=276j1AFIC9ANWMWvtJ8vawwrLxA7CpYnWoPkO5FDqYo=;
 b=jukOdnorvN4D6BHRWtW09jhZhifUwTp0saRdOUw02NwhgvcCNwCurSiGVJszen5RJ4
 SR+Y2U4wRagyB8V1AChoFrtTWed2uiRuyYOCBLChMtVDt3iJCu+5wmnw7ChLGpEK8ue6
 JU9+Eh/5YeqSCxr5FJL2KhT3R+yvf+qagLaNk17btdoSFEajBmh78qdESOYJOQOb4PX0
 QK2QHOhtTOmUPylcfUAu1iAO92VZOhnXQMY7U6ZCr7h5vckcGZhhRqLKlen7PjwCa8x0
 vp8yJJZWBINvgEdH+P2220LpAkueMwWNN09SomLPoshliBCQtKSzsYbJ3l85+w5TxJzV
 FqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=276j1AFIC9ANWMWvtJ8vawwrLxA7CpYnWoPkO5FDqYo=;
 b=1QFT/fK7KIW7wypWOcD7cPebGfiRGObfzcTns/u4MYiv4kSZPax4YieHo4TmpiSqY0
 1C/dFx91zOugV39HMcFV/c+KYm0QAb0p7uqITqBW1sE1sZ0QJgdRl0dnJUJn52mXXlwP
 qa6p04SsIHPB9soBfSKgGC1G6W0piKgtWD8GkGeTm1ycFhTjODKT8YnP2aXei4Rf5I0o
 etJcO/lw+oBxgeh+netKbxRomxXsMO9E5Qb7cHp2JZuUUXy+oIKGlVMtgySY/DDVZ2F4
 awsgAlQyqMCZkpGqvHgT0xbxzUd5yWE1ho7LMNYxYq8R+jHjijHFI1e6Ws52pvDee/vj
 Go6Q==
X-Gm-Message-State: AFqh2kpRPJaKYFYA56bo+gljeJyHlZo1xcHgF7eLifoxe1An69DcPpOx
 SymHq/VWV++84vOABv6kg2BgyA==
X-Google-Smtp-Source: AMrXdXvIqfJQEC0YVY/Tl+oOFFs2RyWWYEpp7GFZv3jy3pZQmCrv3x9plnACkC0HgcdA3dwpzFSBXw==
X-Received: by 2002:a05:6a00:1ca1:b0:57f:7d69:8d95 with SMTP id
 y33-20020a056a001ca100b0057f7d698d95mr51829287pfw.21.1672894161221; 
 Wed, 04 Jan 2023 20:49:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 h4-20020aa79f44000000b00572c12a1e91sm2051964pfr.48.2023.01.04.20.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 20:49:20 -0800 (PST)
Message-ID: <cd763ea1-36a8-c399-c3ec-ea887637206d@linaro.org>
Date: Wed, 4 Jan 2023 20:49:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 15/27] target/arm: move helpers to tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-16-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-16-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Included {sme,mve}_helper.c and left a couple of files behind that
> still have non-tcg code to be removed from them:
> 
> helper.c (and op_helper.h as a dep)
> vfp_helper.c
> 
> Originally from:
> https://lore.kernel.org/r/20210416162824.25131-3-cfontana@suse.de
> [RFC v14 02/80] target/arm: move helpers to tcg/
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

