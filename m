Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8569EC37
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 02:12:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUdeZ-0007k3-G3; Tue, 21 Feb 2023 20:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUdeW-0007jU-HM
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 20:10:36 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUdeV-0002hn-1j
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 20:10:36 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so4735549pjb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 17:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ck4P83PktqzDV97evYX+OJN2PZ+KMF4FY3aPlXreF8=;
 b=zaU8pCa0SLH+zBmNazSnr24KJSAq2HNz3M3eGsGxnjdq3DtItX+DlvL6yoM4hnSA4r
 CbEGYeG1X8rkZebf0hP70BTnLro39nsCg7PeGFjg7pjzkPW+MSNsA7Ye9W8fs5kRLzvO
 DrenzNKYiObks+cyjF1obQmWO1KadcIoHmLPGsoxpddkXxBv6giYONj6V4WJDM5j5fTX
 7QBGw8oOOg4xX9WVPvn5wo3Pt00uL+q5wubCxDQEspXwZ188T+L5h9XKCwZ/klR4PNXn
 YNWnUmDBmsv0XbQcJsMfHZK51GMOc9I7ngg3gV8cVIVuLUKYgjuFf4iJv8AWKtr4OX92
 wTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ck4P83PktqzDV97evYX+OJN2PZ+KMF4FY3aPlXreF8=;
 b=OF8j8PTxMxNm4u/oeVpp2vb3DwbcXSZGjN0vEuAqljf5jYPcKAIdpJ2UWPgiweBKsq
 cJ9p3oi/Do+3Zrh9Qils8Qo/J1ULTwNFIW5xIAzIF77bgITcQ+yQAYKs218NpZ7FxGVT
 iTsFmAcARgrt2tDcqmPlz1w/hOsByAnRL6jWlXTR0IAmavEIFeqQa5vLRJYkGa9gmKrY
 0MXa2WbqNg+lOiDNckm/8PkDa9qU3C7VvzFnLJe/9LXfN9eHzG6dRGzxTrYMxQmU/6ub
 857p9ZHlDydcgBy/2FYxKZdhXu8prawMM/qq5bIqhJu0PsVgGkoLP0hIR1QBTvs14u4O
 2qog==
X-Gm-Message-State: AO0yUKU1Kk+FA856uC4JyP5RDCyGplr2Zc1HnUBUFI7kTlPkvDlnf+4n
 AxcmYaZO0q5QMeyJR2jGtwVo8Q==
X-Google-Smtp-Source: AK7set/UHHR3bJfz8j5RQ4oEQop/GFLlhOArbC7rhS484ccZtw77FLE3S9qLvvSuAn/jzRoPTM7gAg==
X-Received: by 2002:a17:902:e5cd:b0:19a:bbd0:c5c7 with SMTP id
 u13-20020a170902e5cd00b0019abbd0c5c7mr12255939plf.64.1677028233160; 
 Tue, 21 Feb 2023 17:10:33 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 w17-20020a1709029a9100b00198fe021f93sm4314836plp.77.2023.02.21.17.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 17:10:32 -0800 (PST)
Message-ID: <c6257b6d-678e-e1e0-9824-71492a7fdf5e@linaro.org>
Date: Tue, 21 Feb 2023 15:10:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 22/24] testing: probe gdb for supported architectures
 ahead of time
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
 <20230221225227.3735319-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221225227.3735319-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 12:52, Alex Bennée wrote:
> Currently when we encounter a gdb that is old or not built with
> multiarch in mind we fail rather messily. Try and improve the
> situation by probing ahead of time and setting
> HOST_GDB_SUPPORTS_ARCH=y in the relevant tcg configs. We can then skip
> and give a more meaningful message if we don't run the test.
> 
> [AJB: we still miss some arches, for example gdb uses s390 which fails
> when we look for s390x. Not sure what the best way to deal with that
> is? Maybe define a gdb_arch as we probe each target?]

I think we need to have a complete gdb -> qemu mapping.
Seems like this would be fairly easy in python...


r~

