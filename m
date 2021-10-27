Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3843CE75
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:14:25 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflZI-0004Fy-34
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfl0c-00038d-Ao
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:38:38 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfl0a-0002rE-1M
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:38:33 -0400
Received: by mail-pg1-x531.google.com with SMTP id 75so3307015pga.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nU7IfCWFzZa2N0c3DJVlgxxc2HK0HWAXUNQShqV2Bn0=;
 b=VDVkh1maTCDnVDp5J0OyAVwNCTzD2sFe0mlUnr8KBwKOSf8Qk5QXxNNhe6MuujbhtS
 HCd5MrAcNt29W7wzmKG1AOy+4muTR79mh88y5mZaTKsttBqrBo7aKcjaqGWwpRtNm7v8
 37FYry32uTwrGFHq9q7dC0r5czl7RSh35jFQfsB+DVOj86wesjRGTxNwR2+WPgTY4vYc
 GtYkF0X0Hyvpd+gk1rjZX4fLJWsit467yFMlk5+334de2twkiT0CjVQGwGm/wNZNZ3da
 nOUyyCTFaRaMsm/Hx3PyuB47Htgvo0XdIwe3js6GaT/fL4hW6qkk/TzZ7//N8FGVtO3Q
 Ptfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nU7IfCWFzZa2N0c3DJVlgxxc2HK0HWAXUNQShqV2Bn0=;
 b=b2dqHeqinC2yAPvHK2jrnskaZzwwmqLaelMTOanoFvX+mlwhqDeR2kIvuQRoG8CSPD
 5m4SAIQ+HBpL0mG3UUkzrB+iWgQsTxpPn3IcR/+Y6mx7awMRdks13miUZcj7zo95f8Dg
 wkXByqBVX5DizS8b6kZSuY8CC0KtTjcvVq0NYE5wflaQqP5N/0qeZXX/8hflD8KLOgRl
 QpFqVWTwpldOewyb6Xxtw+ELbjONMOWagjDzFoU0fEK9/Lv+7Megvl+LGQTTOgYsyfV4
 7rM/Zfg8e+MaJ6ym4eAm5Abvtno9YgPl7oa955h+HqyAZo/+N+wi9CWnSBu+WqY6ifVk
 ksQA==
X-Gm-Message-State: AOAM533XdFYLeGyiDAPVRk1wZbOdMYwGtdBJ0zSLquLOHFTPnKgilru9
 CdaPicVj/QJ8dQt6V3LUdOfBPQ==
X-Google-Smtp-Source: ABdhPJzj+w/LzGtpjE2cWII/2nY/bmG5oLh//lDEelXJfMTyoP43lidkY66rwp66TJYOG0fLiG9IBA==
X-Received: by 2002:a62:5304:0:b0:44c:719c:a2c with SMTP id
 h4-20020a625304000000b0044c719c0a2cmr31988479pfb.13.1635349110521; 
 Wed, 27 Oct 2021 08:38:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c11sm4390050pji.38.2021.10.27.08.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:38:30 -0700 (PDT)
Subject: Re: [PATCH 3/6] hw/sh4: Change debug printfs to traces
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1635298341.git.balaton@eik.bme.hu>
 <031a5111bb1ef1e66fd8f05fbe4a5ecbbcb25396.1635298341.git.balaton@eik.bme.hu>
 <f595e837-4245-1492-8abd-16dabdb06571@linaro.org>
 <a942fa0-5cb6-b8ae-6dbe-47fc94db417@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10f55b5b-becb-efab-3aec-dc15c5101518@linaro.org>
Date: Wed, 27 Oct 2021 08:38:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a942fa0-5cb6-b8ae-6dbe-47fc94db417@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:40 AM, BALATON Zoltan wrote:
>> I suggest two separate sh_serial_{read,write} tracepoints.
> 
> Thought about that but it's unlikely one would only want to trace one direction, more 
> likely to want all access to the device. But if it's a requirement I can split this into 
> separate _read and _write.

Sure, but it's just as easy to enable sh_serial_* to get both tracepoints.


r~

