Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC7930FBEF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:52:19 +0100 (CET)
Received: from localhost ([::1]:55140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jjm-0004uS-WF
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7iq0-0003Qy-VS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:54:40 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7ipx-00046u-S8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:54:40 -0500
Received: by mail-pg1-x531.google.com with SMTP id b21so2633372pgk.7
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=efF3VYa88SCLkvALmuzX3tXI1a2BU86hx1lT2FOTaZM=;
 b=sgDoLA1NuReIq1V51XXDMLoMt3DlHm6HBRNeJ4KMqSnwiqc4CpcYeskE/7SQmn5qYe
 CjSOV/JGngkVl/apg439FjEa6Yf/iqtfVKA+J4sGtUsLetNwnSsCaKAjqPMP1NvfAylR
 H91GNSvaTFUfGDqSTvZakpiaMb6grNnFMCAtSU+NYxakcFMG3hubXfIA9Ca7HXavoP7o
 wsrZ5kW4tTKmvV7yRjOmeWSNk9Fzyjdg9PUDHnbOlDdTTkrZIpUTWK9428fof7TTQTu1
 pbO5+1F+S8J8u4P35BwWUODfz6s0jPmp/BxAGhQVEGohsyHFc2Rx0Hc3sDIuB86Bm3GC
 uYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=efF3VYa88SCLkvALmuzX3tXI1a2BU86hx1lT2FOTaZM=;
 b=TRNOLz0zJ2LUKrlszZecBVN3u/8Fk/SJrKusJdm7CxXUA2Lym4SsdNIynS2SjWYY0k
 0rxWyZJmOAq/0YAV4vmLh3Fxdtso+TTcm1tbYBOce6Gb6fdsYARnwnQ3xzADyQPCtyK9
 4PAKk3+u26gOY29H1xCUFNH2MmXuAHK87Bl+O27+03LFnVVlnqsXZ0QCfAuOsW+64Z5/
 MBjjUKGQSovSn8qFYdsmU6syGLMLeWkoSckgaqOPTHR1PYyg6uA2lkHnlEgjYRSRU4in
 MH1ZGW8vEc/ykQCfoYxMkLRpgd0lJZiQJTXCTV4rFjSabmXlIQqcF2luvo/mOd+C3tba
 Ui8A==
X-Gm-Message-State: AOAM530pMNyz50EYRyvTcwlWJ0PeKYJVV+B7wyMEzElINjg6OpzEkBDc
 e1GL92vlPDaHq3jCF44RM0mj65C0wIKWG1ag
X-Google-Smtp-Source: ABdhPJx178ZpRm/gf0CmaWFf1Bpn9ekaTrm9O5redF5iiTdJejNtE1wKOGsB1W3hiwqkdxK3y/A3ew==
X-Received: by 2002:a63:ca10:: with SMTP id n16mr130416pgi.105.1612461276461; 
 Thu, 04 Feb 2021 09:54:36 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d18sm5935503pjs.31.2021.02.04.09.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:54:35 -0800 (PST)
Subject: Re: [PATCH v2 79/93] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204015433.885239-1-richard.henderson@linaro.org>
 <87wnvnq3w7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b84219ff-4540-081f-5bb8-a643903430c7@linaro.org>
Date: Thu, 4 Feb 2021 07:54:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87wnvnq3w7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 4:54 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/tci/tcg-target.c.inc | 70
>> ++++++++++++++++++++++++++++++----------
> 
> Hmm duplicate patch tripped up my mail tools, did send-email have a
> brain fart at 79/93?
> 

Send-email borked out at patch 79 and made me think it hadn't been sent.  I
then restarted with 79-93, so 79 got sent twice.


r~

