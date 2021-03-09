Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8FB332829
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:08:41 +0100 (CET)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJd2O-00088t-33
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJd0g-0006pV-99
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:06:54 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:38222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJd0e-0005Bx-If
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:06:53 -0500
Received: by mail-ot1-x333.google.com with SMTP id a17so12908582oto.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qjYr+NL2troHixLxwPC3sTsZg3dtj+qwTR3MSmHkhPA=;
 b=l3nZujvB+FHzMixKnzovKZMGDhHE/PDxtMR0Fci59dcsdBZhUjpFRLihzYSpOjbEiI
 W/ZDyQy426Kq71PVO0U+/vDKOchbcG9t2CYoJz5geZKAsn+5i8+NsDxWG/i7mt0xLzsY
 8vAEpGW6W897gqq/3ZaABpYTGQ3qydwSKA9Wawohn6hChVdtm08mSCN7tLk2LWY5mWww
 OLNN9RyNJv5ghEKdzrUVHqIrN2NdnEpfLYzHXXAU3JhXOs6jbQ/Dt5gj8pZfrOk/s6ke
 tck/ULD5zh8IxXIjIQ049mboQIOJ0sFVDTaVVzFU5JuV4m6lRceoFG97u7cRwhFj2cwD
 GNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qjYr+NL2troHixLxwPC3sTsZg3dtj+qwTR3MSmHkhPA=;
 b=Hb1NtPSY9TlXHIcAzE4XyC8zTCI8QFputk0c9Fq7cvcVH0KkjcZIJ9uK3/6mHrLTVd
 xbzQQmuF/auGH3h2KUuhvZzJGU27GAfVCtt8ternUpVOSp03mfyEPhiZFkH8rlfMm1G8
 xbmjrVaHiSlyLiCMxJnU7N6G4+FgN5DeDRoBSOT4n+NLWTYvDtNMEKtB/y0bZnoACSLT
 /EHQoAIB2qYwiEy32YlOPlm81SbI/BFtwvo91O2XE3eTxM6nsMEnM+jL0hARNzk8QVar
 pxa0PTkkBOdJTU1p3Bs3r9JmSu7tx0oQMwYLCfgCFyiU+dgIZ+VZQcPP5DiYGTSI5RGF
 L0ww==
X-Gm-Message-State: AOAM531ODKbZV5NHOVxzW7sHGvaa0s714x51vNngpFZ2BdumYeao5Rm8
 6qZSua7qlOC1w5krkmWKvlIkM1dGTidVQnl+
X-Google-Smtp-Source: ABdhPJyXV5f4Oat87EGbgXU5cfiVxg7v3NaVRYmMEwMFPAcPO/AMhPoHm0rDrNxQjJ1KlL0tmLq5uA==
X-Received: by 2002:a9d:6c8f:: with SMTP id c15mr23406976otr.22.1615298811385; 
 Tue, 09 Mar 2021 06:06:51 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s11sm3153360oia.33.2021.03.09.06.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:06:51 -0800 (PST)
Subject: Re: [PATCH v2] linux-user: Fix executable page of /proc/self/maps
To: Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Nicolas Surbayrole <nsurbayrole@quarkslab.com>
References: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
 <c74adef9-fb5f-06ee-9dfc-083576a5a607@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbcc608c-a188-5a14-28dd-6109c90b850d@linaro.org>
Date: Tue, 9 Mar 2021 06:06:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c74adef9-fb5f-06ee-9dfc-083576a5a607@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 2:47 AM, Laurent Vivier wrote:
> Should we move this directly in read_self_maps() to have the guest values in MapInfo?

No, because we also need read_self_maps() to create the guest in the first place.


r~

