Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA5F68B154
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 20:17:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOkVc-0002I6-3r; Sun, 05 Feb 2023 14:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOkVZ-0002Hk-I5
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 14:17:01 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOkVX-0006q1-QD
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 14:17:01 -0500
Received: by mail-pl1-x642.google.com with SMTP id g13so5297357ple.10
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 11:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gWsuVODVHQNRq2RCFu5yqSb8BAT5ULJNVCSV72nqf3g=;
 b=jtQ89ZmD2J4aDpzs8bc/mqq5P6mUYwAXo66Kr0lue3Ls6/y0gCchcC6wYupY/GpJOY
 nHNZTXcHW1nDIzplpyRkp/CRVBcfdIZvJAubwPaxYwF/T0m1ndLAWlGldHcnRn6uHnsW
 A/J9+SjovvW9QJe6xCT1YYXLP0mU9JuxoPnLRMwpKecU5dvIoQWLODTf4Mdc32PQWWEd
 /k+fwDC9Uz7ccZLGzu7umf8AKH7v8tY/Iw3l3Mh+x1y0fQwZ3tUaHQcKPWvmYJ/DJTh1
 7JJzW8FENvY7A30U1ojdRd3raZ+Qx9tJzFbELMHXMgOWjpVFXhCZL0ft2pnCFXwKRlLW
 6r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gWsuVODVHQNRq2RCFu5yqSb8BAT5ULJNVCSV72nqf3g=;
 b=lr8rphJmmwRpgVVZWnzMe6u/EV9lX4x3YZ/hwot+CU+73DKuQCL+PY4d/Hapk7PN5n
 gm5Rr1/vpkEIIAHrtrrv+AKb2Z4G/Tyv2YWTLLRVeGxxaV6Z57Q+vy3x+4SIDozo0P5f
 2/fvFrnlSL9VC9OdTombbd+m10IIoKDAD8Sec7wo6RW2pBCInlnrT2qgT4mDDU45kdPL
 tNVFlxRPXDpZbuXeWbduxtor0pYwpCyOTiEuartODyO0cHKPvsr48Fp+jH+bb1tF1kMR
 tIoEVbypeIgOst1DVxUrtQYC0VpCuKMxi/jzzLMFSIJVjAZCY3hMQ3wtcZsRqry3K+OU
 cDFw==
X-Gm-Message-State: AO0yUKUpMImK2PpurAUDOYkEv5OE4PoHtALEbfEkgEzvZEDdfuviXUDz
 gAKIx/BoIYkaYZcmMcsdwl+vSw==
X-Google-Smtp-Source: AK7set9+cQFAkL//eWx1Arz5G/cFH13D/RcyzaEVDhpuS/DwvfWgvTldJf3vd+sOLUmvJ+Vxe513ng==
X-Received: by 2002:a17:90b:1c0d:b0:230:bb46:787d with SMTP id
 oc13-20020a17090b1c0d00b00230bb46787dmr1329549pjb.37.1675624617288; 
 Sun, 05 Feb 2023 11:16:57 -0800 (PST)
Received: from [172.20.101.2] (rrcs-74-87-59-235.west.biz.rr.com.
 [74.87.59.235]) by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a4f8100b0022bbad75af6sm12977932pjh.1.2023.02.05.11.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 11:16:56 -0800 (PST)
Message-ID: <a8ca919f-c6fc-70cf-0574-261fdad81d96@linaro.org>
Date: Sun, 5 Feb 2023 09:16:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: pixman_blt on aarch64
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
 <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
 <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
 <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 2/5/23 08:44, BALATON Zoltan wrote:
> On Sun, 5 Feb 2023, Richard Henderson wrote:
>> On 2/4/23 06:57, BALATON Zoltan wrote:
>>> This has just bounced, I hoped to still be able to post after moderation but now I'm 
>>> resending it after subscribing to the pixman list. Meanwhile I've found this ticket as 
>>> well: https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71
>>> See the rest of the message below. Looks like this is being worked on but I'm not sure 
>>> how far is it from getting resolved. Any info on that?
>>
>> Please try this:
>>
>> https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general
>>
>> It provides a pure C version for ultimate fallback.
>> Unfortunately, there are no test cases for this, nor documentation.
> 
> Thanks, I don't have hardware to test this but maybe Akihiko or somebody else here cam 
> try. Do you think pixman_fill won't have the same problem? It seems to have at least a 
> fast_path implementation but I'm not sure how pixman selects these.

For fill, I think the fast_path implementation should work, so long as it isn't disabled 
via environment variable.  I'm not sure why that is, and why _fast_path isn't part of 
_general.

Indeed, the fast_path implementation of fill should be easily vectorized by the compiler. 
I would expect it to be competitive with an assembly implementation.  I would expect the 
implementation chain design to only be useful when multiple vector implementations are 
supported and selected at runtime -- e.g. the x86 SSE2 vs SSSE3 stuff.


r~

