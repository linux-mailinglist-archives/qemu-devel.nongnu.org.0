Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10BA6AC347
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:31:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBrm-0003ZZ-Ca; Mon, 06 Mar 2023 09:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBri-0003Ym-3B
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:31:02 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBrg-0004s3-FU
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:31:01 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so8327295wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678113058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dlczQi/zNDpzVwcp/19VuPISHS7abyJ0Ut8jH6pbTLs=;
 b=puXAhdOFTt+rh6jGO6Q8l0pEMdevOIRixcOhdJDJSnRKhFoj4QzVp1JFVobh955htD
 aKfxjAr0ZlBk1WaRsIimK62IptNWZPJ183qMGCVPxSXxmOdQXUmn02uWf9A5XuXuhDhj
 ee3lYbwnYM5Hn1LW8TKAH3jB/qj192gKxAdoFLKwUqICKXmGYbDAmBFVBbR8xIgetDwz
 tGhXf2mD7RTO0eWSsSfQ+x4xZMxwzI9HnftkhKA/Wle7qPHqJ6O6QQnghElXqGWSgCKJ
 f/jX38asbaHw892jTTUO/176apijA9WvaOewXG1sR95gRlARR5Y3Cln32ULnmQcXbd+c
 skkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678113058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dlczQi/zNDpzVwcp/19VuPISHS7abyJ0Ut8jH6pbTLs=;
 b=0lKXhXDoARq5J5kH6eUsotOaVBTPiWhtQfs8BpWZivk0GesuYhScE/TQOu71O/rG+Q
 j5gVpywVGaQEgLzLW0Ck82b6H6UyeyL+xQ1y6UWqsmdBdupzcOUyEC2FcMFf8gXRYVX5
 MHORtgAaCTyTypz9W5ogHHSwNy5Xmdk9c6I5Df3ZtjO8Ajza87e5w82K0FrRRJ1OkLXs
 tSLOPsUbZs8gXf/YdbAjuGF5HRShbtzktl8t4oCuZx24rZ4v+xaJYOLrkSqQ2auG2xOd
 7aH4q4Ze3HrAYy8cfQIB1j/OvuHUKGlRaJaYFIW6Fo5yLscv2xjuRGc6Dc4VElSW9NKz
 zTWQ==
X-Gm-Message-State: AO0yUKVA6fuK1IMgMqudmNdo1471/AVYiu8+CC8bIBiNelMz3lpSBVAM
 sS8lDF7OQngIpiaUhUTBEQybibJenhsaK+7+wUE=
X-Google-Smtp-Source: AK7set8Rs6pUuLh/nKY9jGvXOlCIEQl49jTfzQbl1FJFCPRrV5giWfloHiKrmW6+iLwh5I8v43jsRw==
X-Received: by 2002:a05:600c:470c:b0:3ea:f710:bdad with SMTP id
 v12-20020a05600c470c00b003eaf710bdadmr9414738wmo.29.1678113058597; 
 Mon, 06 Mar 2023 06:30:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i47-20020a05600c4b2f00b003eb5a531232sm10400213wmp.38.2023.03.06.06.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:30:58 -0800 (PST)
Message-ID: <a29b344c-153e-457c-4cc9-06838c4670da@linaro.org>
Date: Mon, 6 Mar 2023 15:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/16] hw/9pfs: Add 9pfs support for Windows
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz
 <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <5311946.tteGgEznqY@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5311946.tteGgEznqY@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/3/23 15:15, Christian Schoenebeck wrote:
> On Monday, February 20, 2023 11:07:59 AM CET Bin Meng wrote:
>> At present there is no Windows support for 9p file system.
>> This series adds initial Windows support for 9p file system.
>>
>> 'local' file system backend driver is supported on Windows,
>> including open, read, write, close, rename, remove, etc.
>> All security models are supported. The mapped (mapped-xattr)
>> security model is implemented using NTFS Alternate Data Stream
>> (ADS) so the 9p export path shall be on an NTFS partition.
>>
>> 'synth' driver is adapted for Windows too so that we can now
>> run qtests on Windows for 9p related regression testing.
>>
>> Example command line to test:
>>    "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device
> virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
>>
>> Changes in v5:
>> - rework Windows specific xxxdir() APIs implementation
> 
> I didn't have the chance to look at this v5 yet.
> 
> In general it would help for review to point out in the cover letter which
> patch(es) have changed, what decisions you have made and why.
> 
> In this case I guess that's patch 4.
FWIW the overall LGTM, but I'm not confident enough with Windows to
add a R-b tag.

