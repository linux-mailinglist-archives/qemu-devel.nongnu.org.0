Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1A6981F7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:28:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLZ7-0005Gd-S8; Wed, 15 Feb 2023 12:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSLZ6-0005GU-88
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:27:32 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSLZ4-00076K-Dy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:27:31 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 kk7-20020a17090b4a0700b00234463de251so2901564pjb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yR5OMDcSzeYpqHBum7X7AgPMOkmrEV8ZQszBGNMbnnM=;
 b=iLGoC4Q/+9EoYYyd6SEMVCcYqcPBK1Kvts7tDjBM45nH0PZK112UvEkpzH1aa1rQul
 0T6ku7lsn0lGXSawZloRmFLKigZW2zFWTFe8sU8MNodQAUQ3RzbwmS6StL41R1ichs87
 ErOnfKExoh/+PA/B1vR3wPlaHITvlk/XeekARBgl8R0mWuIrKpuGHynXHnbLl2TFEz98
 mapf8pQbgDAxEjDt2l/pmkYJWohm0/Z45lZ5m5kr5xcju/Hz8v7+tg8sG7oyhrpX2CoM
 yJBeKzwb2w+nBVcENuCt8c3TbazwLt/8kgXRuix4BIp+A4WRakBRCaNxlizsdro6RgCz
 b5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yR5OMDcSzeYpqHBum7X7AgPMOkmrEV8ZQszBGNMbnnM=;
 b=NW4GEekX4cocvOZdsXOpg1Si5L9qdVoVgjglj6aH3P9TFZA84tNEqFMES3ycwEyuOB
 y+SIymVGSXi/0JHho1K8A4xi+7FKHb8GQVywpF8DNd6h2qyCtuRkA3e13Qmqp1MzZp+t
 FV3pNKqPs5mKj6deOeST5po6XpGcwvAvbhlWAtV0bY85o6P5sGYcQTIhUfo5zTuqHWQY
 FAuGdCRSMVTTUuz2wtf49xkMYEsAhVwY0wLaF9Aqva+RwjwhTAj4oUCz+jN3qF6SEGPj
 zCbXf9dVnbIR936ARL5IwO+hMLknJPIseqdXF1CAMuVPUo8JaYPCJACZc6ZeKijWWSc/
 uWDQ==
X-Gm-Message-State: AO0yUKUjgp1z7w/pl3Gdm+TInETunDLZkVKy3Qpw7kkCaycvDWqpFzuU
 SCyUfYpyTrRhiJBTrgPdCU+sjQ==
X-Google-Smtp-Source: AK7set+tvqkydYzicM1yPKaUNiY9imoNzrGkYjzOifZEfnHX3z1AuivakBmGpdc8svC4imD0Sj7ohQ==
X-Received: by 2002:a05:6a20:a299:b0:c2:b228:e36 with SMTP id
 a25-20020a056a20a29900b000c2b2280e36mr2215874pzl.13.1676482048639; 
 Wed, 15 Feb 2023 09:27:28 -0800 (PST)
Received: from [172.20.100.240] (rrcs-74-87-59-235.west.biz.rr.com.
 [74.87.59.235]) by smtp.gmail.com with ESMTPSA id
 p13-20020a63fe0d000000b004facf728b19sm10855679pgh.4.2023.02.15.09.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 09:27:28 -0800 (PST)
Message-ID: <b2c5dd7c-5c90-9104-5477-b76ed22ea799@linaro.org>
Date: Wed, 15 Feb 2023 07:27:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Does the page boundary check still necessary?
To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>, qemu-devel@nongnu.org
References: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/14/23 22:39, Kenneth Lee wrote:
> Hello,
> 
> I hope I send this mail to the right place.
> 
> I'm porting a new guest arch. It jumps of out of physical page
> constantly. So many TBs cannot be chained with goto_tb. I'm wondering
> if the following check is still necessary?
> 
> 	bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
> 	{
> 	    /* Suppress goto_tb if requested. */
> 	    if (tb_cflags(db->tb) & CF_NO_GOTO_TB) {
> 		return false;
> 	    }
> 
> 	    /* Check for the dest on the same page as the start of the TB.  */
> 	    return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;    <--- Is this check really necessary?
> 	}
> 
> Now the chained TBs have been link with tb_link_page(), the chain will
> be rebuilt if it is invalidate on page. So why is this check still there?

Even for a guest which doesn't use paging, and therefore does not need to worry about 
memory maps changing, we still enable breakpoints and watchpoints on a per-page basis.


r~

