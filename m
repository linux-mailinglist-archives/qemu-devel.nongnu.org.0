Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE57507982
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:57:45 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngt2m-0000bG-L3
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsuy-0000rS-Ow
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:49:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsuw-0003Ls-93
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:49:39 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z6-20020a17090a398600b001cb9fca3210so2803334pjb.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oAJe754T+Fehhdud5z5dWGfQZxV4AWnJiSVyz7Nnrc4=;
 b=H8v7PHD/2nMibHIBPUW8MHtDFkfbyKHdrBOUbq1M+/Ar7QjKWP9ki8ns0iZq+BxBtT
 4DsROolDf0ckktHX6TO4ph091l7gqUhFfjskQgsDA/JzAW2AZvP2PSaH/E7WsZApEu8/
 rDrj9G6XQxGkTwtAZPYYTKJtU4p2Incc9NHBlA6yT2jvfOOO4tG/iN2rJ6e3HnBKVCC7
 SXI1Gz8uBAEZ/URV5NgkpWrpVxTxRNrba7070tAGGcbr1IrZQRwbneF9JXjPWKb2+Qrb
 33+zx0UGK4p6M7x57EOBujKTcocOYGUJNLrI/ofWCtqHyvnSoWzxL9yz95wtRcb7qt+W
 371Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oAJe754T+Fehhdud5z5dWGfQZxV4AWnJiSVyz7Nnrc4=;
 b=S1Pgzg1gGmPZrwzgBlk5qQnEoFpMGCU8YGbkQONiEInEEHc2XrMMXRE6iMCkRx3bYx
 fyypCPF5MDK/hWTX1fr8ji8kVRZ9guGb5SL4lHzjnNLrfesVC7Sv4M7MzAOVJlGeBrUw
 +g9g0PgaXd1a56dFrcVRRDaCfX8/8rbM4vanJCdIirz5fA1gW59Cd8kRlF5XHKThILkD
 mCQJCQFmDP8Odj9m9BMgGqEOTMBCH8LlRBBQTYQtsx86jMTUBg1oBPPUSoNwYRxMCAGW
 IBdLYEjDYoXecR/2uCa8hNwQsKE5y+XnRQINaBf+RzqkU7Xk8iUtMb1EgILBgxEidk+m
 +CQQ==
X-Gm-Message-State: AOAM532VRXIrMQgjETUTjZ0YavHOuane7nfpz2xmvwNPIePS8iigfk+F
 Qj6WupuUIYuLaSnglST1jUZY6w==
X-Google-Smtp-Source: ABdhPJxGQvqj3d3qkx9/vGh1phVE2jKk5F+OGFp3L7sl9/Tlq+LXyDjWeuHZOmwBMeaGh6DQ2pMb7Q==
X-Received: by 2002:a17:902:f115:b0:158:7d42:e2ff with SMTP id
 e21-20020a170902f11500b001587d42e2ffmr16769634plb.106.1650394176851; 
 Tue, 19 Apr 2022 11:49:36 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a056a00168300b004f7e60da26csm17953032pfc.182.2022.04.19.11.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:49:36 -0700 (PDT)
Message-ID: <fb02efb7-ce39-54bd-914b-f3a7b768027e@linaro.org>
Date: Tue, 19 Apr 2022 11:49:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 13/25] tests/tcg: remove CONFIG_LINUX_USER from
 config-target.mak
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Just check the target name instead.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Message-Id:<20220401141326.1244422-11-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/configure.sh              | 2 --
>   tests/tcg/multiarch/Makefile.target | 2 +-
>   tests/tcg/x86_64/Makefile.target    | 2 +-
>   3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

