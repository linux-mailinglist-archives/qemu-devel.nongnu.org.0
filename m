Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E665AD8A6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 19:58:04 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGMF-0007Ks-Ky
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 13:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVGK3-0003pS-Ar
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:55:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVGK1-0006ev-LS
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:55:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id bp20so11780753wrb.9
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 10:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=aqXB1TuLJeqSKW8qDjRkEFsGSRnx4tkWU1pi5Eq8rnk=;
 b=vwbjtZghq69bEQfoXzMHTw4izEMCU5hibf+2q8gZNjfDXAv6tSEfp5wimhnvVc1nZu
 02YWPnvPJuea6FifZFJ3F+FQRd21N1fyivGtZDopHIxmNRV0i5dgrD3EUV+kOgQMC7PT
 k3d0wBkTIjaIVUAd+KJbObhoT0wXVPKY+2WvwVXGb1VBYuSXQpseKl8irs8utpjIGMdc
 KsH8WrTkyPCupTZkc7NQj2Kx1IzuQIkYWCvwnl9N1W1t8unI+WULfF7Y9AKGw5UBGky3
 b465GgV8d5Yi5bfRnpklwuC7ZinOfLwckne3tS4lgadjiwzy81PIl2R13GciDsim/SH+
 rK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=aqXB1TuLJeqSKW8qDjRkEFsGSRnx4tkWU1pi5Eq8rnk=;
 b=JcWip6HhjRJ87VAMN49JfBNcMsAqPkMyFLSUBVPvLHvzc0ZlGOuCGSWop72KF42oiD
 kcm3Z0v0mzprH5XrutEk6v8XnrZK2a2RDu6Kfp06N2BPFxEfo7ONCOfS8m76r43QYfxj
 5wwgReEZuluHv5BHjiaBm7yMRbr0cfWQJdXCBDsBgRqLuH/EL5cN9YLTMIEhCC4CPrQv
 Sefu0FobtSrbAsiIjDYHsXYMgQo+oKijgYziQx0rf5IgU0l6NaIDeypzkLjz+kUXpRzQ
 fgIKTr3Ub6KVV8e0UMLRS3pgVz9QnQ8g/cVRu+48YJsVnRsjqJ2nvDO82qMcLilXflV1
 193Q==
X-Gm-Message-State: ACgBeo0FURE6Ix79ZDvPvIs39Gl8QcXFZLEPmngbudcFsDaLESFUt+iB
 ayOLumFP4/ST3egY99SQ7I5Vk9W357JuhP15
X-Google-Smtp-Source: AA6agR6ePcjAy3++Hwl7mHCV3pMtdABhu3id91IThnrYW3a3G2InI9WZeRHg9DlLoBY2nZDgRoIpQQ==
X-Received: by 2002:a5d:69c6:0:b0:228:c119:987f with SMTP id
 s6-20020a5d69c6000000b00228c119987fmr2047049wrw.268.1662400544074; 
 Mon, 05 Sep 2022 10:55:44 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c089400b003a30fbde91dsm17077493wmp.20.2022.09.05.10.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 10:55:42 -0700 (PDT)
Message-ID: <6361729d-22f5-d308-46e4-79bc223d762a@linaro.org>
Date: Mon, 5 Sep 2022 18:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1? 0/2] Re-enable ppc32 as a linux-user host
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, laurent@vivier.eu
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
In-Reply-To: <20220729172141.1789105-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/29/22 18:21, Richard Henderson wrote:
> This is, technically, a regression from 6.2, so it's not
> implausible to apply before rc1.  Thoughts?
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    common-user/host/ppc: Implement safe-syscall.inc.S
>    linux-user: Implment host/ppc/host-signal.h

Queued to linux-user-next.


r~

