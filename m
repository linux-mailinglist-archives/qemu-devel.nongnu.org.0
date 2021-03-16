Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE033E254
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:46:44 +0100 (CET)
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJOd-0008Vf-In
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJNQ-0007t6-MR
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:45:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJNN-0005ED-Uz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:45:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y16so11386875wrw.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JIAIERBgMbHBzaUJT932FZhgvcG8b8d62YbfghP8rmM=;
 b=Ix+ZlH8rIbqeCeMz0CYcw6zBRDTQ0fGNQ4KN5O2gyxGrr6t2uowqJPdwsHhUk3Eon/
 Q1ptfFW2Eopt/kzVUPNXbXDTwqcWgxRUayaaNat5aoBGPWgvnMVSSXe3UblYzESvX4JF
 0CBE3io8fHv7+MW+B/1CYXl6awdI3EnuCISXJod+2J2wvKGdFkOKLOR0gjAGl36l3C6C
 ySiMRN19U4bfdO0wPOAKJ7xRLGzVc0rgOHtbF8wElRW/wiqZE9SBMISRgdKvcWAsU1zE
 JAGgrSq/QWeuRBsxH7/Y607oFzQ4/TbUWc48vdgUGGiW8xtXXC/lmN/goKRNoGqDRQaF
 UJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JIAIERBgMbHBzaUJT932FZhgvcG8b8d62YbfghP8rmM=;
 b=UPCz547p4bPaBjui4+j5IgFGCOWtl1gaMxnksxJPOQSGbFAK1H9LzQhSukjSBXlBaz
 5xRi4+u+x4aXXPYX84iclvFIHhzsIfXinj8mAZi/q4BQEaWuy660614luOfaoRUJg4+C
 b8FoGh74x2jc+4xoyXvXVpimMXco8qtqw0Y8jFjbLP01XA6t1IHpGxHagfkRYbwhHbgR
 9JGmnyw/U2jHGwQ3GpLi0mDE0nrmwyU+9jQ/TmuMXCHGg8/v2+OtgrX7nHm65ZxsARzF
 uvttvHVS5sddAfPK/xfnOV+oe/2RItlcUhGwu8rqezNayBJlyaKu560bMiGZUFoUmNis
 TqcQ==
X-Gm-Message-State: AOAM530Jjvr1nFTk5v27ssrXw6Ydc3FsTzIRdlNKILGBfdsfHv7WMhG1
 9ElARBbD8+sTKkrek/o2NGk=
X-Google-Smtp-Source: ABdhPJyFdnUUeyIEQ15tWyWJ5BilzUXingO/2QBYk1Zi5k19Otzz4KH/jCPRCVRHOEPnBFN+bz2VbQ==
X-Received: by 2002:a05:6000:147:: with SMTP id
 r7mr1402984wrx.25.1615938323045; 
 Tue, 16 Mar 2021 16:45:23 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u3sm23239354wrt.82.2021.03.16.16.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:45:22 -0700 (PDT)
Subject: Re: [PATCH v5 30/57] tcg/tci: Split out tcg_out_op_rr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a64191fc-c7c0-aee5-28ea-825250666805@amsat.org>
Date: Wed, 17 Mar 2021 00:45:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> At the same time, validate the type argument in tcg_out_mov.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

