Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E433E1D1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:01:43 +0100 (CET)
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIh4-0008Rm-EL
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIfl-0007XV-1u
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:00:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIff-0001db-1a
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:00:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso2357819wmq.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jyWdCXGIGSTfxmoGD0lw+9j7TiM7f3UImni6MID1LAI=;
 b=XOkM56mkJB3oxWwYr9LWJx/YzMvHv6k8QEhbRIW9acGWKJsUFnmIlrkMYXvZ+OFATf
 3mz9ET7raxP3gSoN67eSdPpdHnxgP/Ul5sECajT01U0ikgeJtFomELpD3UGN9+wybtfk
 89JRD3KOw7CUegDHy+Bchfk84n2pNzpNDQeKaAvhg34Dv6HQk55ZPBaYi/ifA2r6HLG/
 B7GdIvX7fXO5WO8akgCWJeAy7tl0gBuJrSLVNZa2TpzcdTiqwhp+WpIIK2jUtWNRJMgx
 6lnCiaBcsG6StFb1dip2X7/1TfgmqhDY8MlUSXnRvc0NqzeX9YbTMTlK2KTt+4miTTG7
 4hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jyWdCXGIGSTfxmoGD0lw+9j7TiM7f3UImni6MID1LAI=;
 b=fXXf5Tpfii7h9sNgIwhRXsbijnUhDIsBkkTAcXAYikdGWigMZP4MyMn+JinSIIp+E7
 F2D6TdIQvH57mrav/+7+RUcsSzgnMSTm4TmZTXr+AGgUEBRhUJ6cCLqtMTjwKrSVyUuS
 zUh+0aAPJdSCsyOjniSRdQFw2eBWJn2A/pJGM6oHgtdf4wLBwSxSZQeou8/TN51NxRZR
 KbjCckOW1jHmR0/mKoKVvpKquKGh66kS/irKxBDA8YYMjrBV4QEUeH3g4dWyLKJBHbWC
 ZjZc6kRiqzScmAVZFD22qZ73DglTvQBVw6w+NSYOSrFk6X3Z69Vp1ZANr+HFgt4sNmy6
 gX5w==
X-Gm-Message-State: AOAM530t6ckOIsKUDXDCqn9Bd+zwGsuVd0Aotp4Zd7DcMlQ4TVR9NFOy
 /e400yqvhtnUOM/PJRBPkM0=
X-Google-Smtp-Source: ABdhPJxahY6r9wrwZLX4pdRUKNI4U5lhcul3OEEw62XG1HzNM8pLweMic9yyC+BrpwTXTM+QeQCqdg==
X-Received: by 2002:a1c:a985:: with SMTP id s127mr910315wme.158.1615935611300; 
 Tue, 16 Mar 2021 16:00:11 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i8sm26363474wry.90.2021.03.16.16.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:00:10 -0700 (PDT)
Subject: Re: [PATCH v5 09/57] tcg/tci: Split out tci_args_rrcl and
 tci_args_rrrrcl
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0c701940-4bba-06c2-62cd-1eac46d730c9@amsat.org>
Date: Wed, 17 Mar 2021 00:00:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 52 ++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

