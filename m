Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6FC52580E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:03:23 +0200 (CEST)
Received: from localhost ([::1]:60994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npHq6-0008V4-60
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npHoP-0007dD-0u
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:01:37 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:46890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npHoN-0007ON-7X
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:01:36 -0400
Received: by mail-qt1-x82b.google.com with SMTP id u35so5614521qtc.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 16:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EoeVGH7SMNFGt318duT4rETNtspLE3NyaUMgENPoZoQ=;
 b=k3LcFlW9ketSCelikBO/KCNuh6dvU7tAcBbMNyAuD+iZimIXshKfKdETq3lvM58hx8
 k0I4ywq2jPxcXYi+9DbfcBloVqW6/QgIBDFtuDFktSmwFvzVe03sj8pk9Y8HvTTutjjg
 trJIjlwSPa0B8ZHVBmn0dhTrFb8FdA0MSPgopdDqSWYuzqLyVSm+jTc6WyIds3oj+SSY
 ZhaI1raK/Wdii4xGP0oQ/2A55t2fYrBOUGdwGfZrr2lAY/zFmNCdkl5VGTaWuu5b7drl
 gY4pLAThEsXKlPweWLjNclWSOb0U8U+ofsFKqFsS8bu0ZxIDPZZiNBmEx/qC7iE079oF
 IJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EoeVGH7SMNFGt318duT4rETNtspLE3NyaUMgENPoZoQ=;
 b=jtLO/3VrN5KmXGaFhCjBO3q2JQbYAS6VvFhLwhTQrJZe7CSQdoyA9zDTJwispaOouS
 9KYEhMciIupRbwEr6ge8e24twSSRq/XglDUaGitfi+85IEQX2mqEui08cMq2somGtlZt
 B4r/Uw8s+EAKEPe7Pv0GpK0bAOea3rVh0jxqiiwYEtknbxfPeSlKyPTeuSdlMX7k9cBP
 +pMPJK9+JVWw5H541KJs6jzOcBX32UxtNecdVRVtRoLX4xDDt9SHDum0jS2V+b1rxxgP
 j6B8C+z4GuBd2pyzlf2nmNlHgwiPKB2Vl/qbJ9Pv/rKhxX6AFB6CfjoRl1KHReFa9yij
 OLvw==
X-Gm-Message-State: AOAM533eAj4vcE8qdsfCVu6PW0QKvW3/BmIHqJGf70zciURuOcMcVDre
 7VQh/4m5BdX+RklMywkauYbN0A==
X-Google-Smtp-Source: ABdhPJyUg9TbRMWadrUcHVGQwtL8KHdVdVrOtmzo1GsSjaQKGUrqmIUnmFwOYcc1sMvGQ/+JRxGT5g==
X-Received: by 2002:a05:622a:13d2:b0:2f3:d2aa:7c5a with SMTP id
 p18-20020a05622a13d200b002f3d2aa7c5amr2191496qtk.155.1652396493316; 
 Thu, 12 May 2022 16:01:33 -0700 (PDT)
Received: from ?IPV6:2607:fb90:2824:aae:bf4a:55ec:36c:afd1?
 ([2607:fb90:2824:aae:bf4a:55ec:36c:afd1])
 by smtp.gmail.com with ESMTPSA id
 g124-20020a379d82000000b006a10c8d5d96sm198762qke.3.2022.05.12.16.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 16:01:32 -0700 (PDT)
Message-ID: <7759c450-1003-83db-e276-30cb3fad9e44@linaro.org>
Date: Thu, 12 May 2022 16:01:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 1/2] target/ppc: Add invalid imz, isi and snan to
 do_float_check_status()
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220512194250.138244-1-victor.colombo@eldorado.org.br>
 <20220512194250.138244-2-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220512194250.138244-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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

On 5/12/22 12:42, Víctor Colombo wrote:
> Make do_float_check_status also handle some invalid exceptions:
> imz, isi and snan.
> 
> The idea is to try to concentrate the handling of all fp exceptions in
> do_float_check_status. For this RFC, move only the 3 exceptions stated
> above.
> 
> I chose to create new '*_defer' helpers to propose a gradual transition
> for the instructions helpers. The 'defer' comes from the idea that the
> exception raising is defered to be called somewhere else, as oposed of
> what is being done in the original, 'non-defered' functions, which
> immediatly call raise_exception_err_ra().

This is not correct.

You need to go through section 4.4 "Floating-point excepions" and note what happens when 
each exception is enabled (e.g. VE=1):

(1) Do not modify the FPR,
(2) Do or do not modify FR, FI, FPRF.

The mechanism by which we avoid setting the FPR is to to raise an exception before 
returning from the helper performing the operation.

I believe it's mostly invalid and divbyzero that avoid setting results, while overflow, 
underflow, inexact do.


r~

