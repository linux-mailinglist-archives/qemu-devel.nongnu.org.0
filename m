Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9B31B156
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 17:58:10 +0100 (CET)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBKim-0004K4-UH
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 11:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBKh4-0003QJ-QS
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 11:56:22 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBKh3-00042V-7t
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 11:56:22 -0500
Received: by mail-pf1-x42b.google.com with SMTP id j12so2745835pfj.12
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 08:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Md1KSD+K3eAUmmXd9iK/RLN0eTuFVO0Wr0yWXFJDWno=;
 b=IbdpVLuLljv9WTsq23S+UKUPm4jEmoAqbRX1y/Jp80vt9N78Zzn1954DZ4VfSdenD3
 TzxiuTz2Lcjt1IL9skaImr6StsgCZaUNr7hxaMQ8XRFr82R1vuW3zghIuyykVcy/rInt
 o+qRR7wHb6WFt1kSk4TkDYzhOwjwBpcP0sPoYd5fxt2R9d8uda/uR6VQySrcotvr3wLw
 AUOhi63b75jSZ9/69QqZ6xqgmBaU6BU7y1VKl40Er5eKCBEajGDlnN5XgvJE8P2P35pd
 GCOWAvBwnOb9U3wNuxkK6JfJ71U9v/JqQyRV138Pcb9DcZDrII7NlzXQi4d6TFDyM1sa
 op8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Md1KSD+K3eAUmmXd9iK/RLN0eTuFVO0Wr0yWXFJDWno=;
 b=jQ2Fi/MrHZBrLGKn8KE8tGjUGijmPWYg/8mKkLqFLe8YHbVITclbclWs+kaBzDPejo
 8OhBC+XQnTCEoZfzs8cMM8Fn6f7Tx94NqBJghI+Xza36tIq085xoyx3BKLs6gabFdCoz
 rJGb4TKgMUSRs92bzntAcFyq7okBBau1YCBApbgm0fwh0mRXFCXBRMg9UXWRSStu1U6U
 Pu290aBB67t8y9CW02cqs21tThQi94zzOBvjUDGre6B8MR6G6NGHSNJor9FX6FCdTrID
 UXr3TF/65HlHJd/7k50fit57/mbK2o5h7ndDZEQ7JQFRuF6uzWPWECoR/UQ3X+sXmEYD
 rZNw==
X-Gm-Message-State: AOAM530TCdz85011Ow2LZyDyDDTqktVOIdR4Fy1Uci91pbIJYyBLAMlI
 gmc5Zh98oLpsFycsqpKjzB4amg==
X-Google-Smtp-Source: ABdhPJx8nFymPcLpc7UzRLKu39sH3EnXtIVnXR7HnCn/m8HTmOVMdSf3En0fbIDTh65apYsm13/Rxg==
X-Received: by 2002:a62:7a50:0:b029:1ea:8374:229f with SMTP id
 v77-20020a627a500000b02901ea8374229fmr8614764pfc.68.1613321774713; 
 Sun, 14 Feb 2021 08:56:14 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 c18sm16179218pfo.171.2021.02.14.08.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 08:56:14 -0800 (PST)
Subject: Re: [RFC PATCH 08/10] target/hexagon: import parser for idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
 <20210211215051.2102435-9-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85018b3a-bf9f-09b9-2415-fc68868f0cf2@linaro.org>
Date: Sun, 14 Feb 2021 08:56:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211215051.2102435-9-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 1:50 PM, Alessandro Di Federico via wrote:
> +%define parse.error detailed

/usr/share/bison/skeletons/bison.m4:1033: error: invalid error_verbose value:
/usr/share/bison/skeletons/bison.m4:1033: the top level
/home/rth/qemu/git-hex/target/hexagon/idef-parser/idef-parser.y:35.1-28: error:
invalid value for %define variable 'parse.error': 'detailed'
   35 | %define parse.error detailed
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/rth/qemu/git-hex/target/hexagon/idef-parser/idef-parser.y:35.1-28:
accepted value: 'simple'
/home/rth/qemu/git-hex/target/hexagon/idef-parser/idef-parser.y:35.1-28:
accepted value: 'verbose'

What version of bison are you using?


r~

