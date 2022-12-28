Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64DB6585C8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 19:31:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAbCQ-00045K-Uy; Wed, 28 Dec 2022 13:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAbCI-00044X-AM
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:30:38 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAbCG-0003ME-SW
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:30:38 -0500
Received: by mail-pf1-x42a.google.com with SMTP id z7so5539417pfq.13
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 10:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z85kuQGkHGrtxBYdkIRQKTanM8aEJn0A0GAzZqwFTik=;
 b=UycZoRPBVx6OCutNDQ4BIXwdF4YMukFpI7fO7EZpfSsGjsCrF50t1ypf4ULX9HLhj+
 G1f4hZ6oX3iLS4wXaHd/TjXTE1r7JxEv57q4jtbkivh2X32hOTQbApxoyDH9jeW8UpSn
 VHKrfr8/EAMBBnQg+UOkaGSatTU+UxzwZJ0vOOV5/N6PfuqsdkiZO1ukYXK+8Dv47B4m
 inG83J/bNniNznq1TkucYU2t8T0X/Fw8IsM+ySD3lw61pH+HTSL2ptpw5XDoDfEV4Z+b
 uhUt3uDl1iMAlfwFUNROjkppsIZNPBjHdZ3e673ECDKrMkuA/Joxdd0z5Qu+kijreFux
 yj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z85kuQGkHGrtxBYdkIRQKTanM8aEJn0A0GAzZqwFTik=;
 b=RhfyoNM1BDw4GC0Aik5eJTSfB3Y3u6DWmp0JLIyLUjhq5H1HpDhyniFYE7M1AukqPv
 ff78Cc0RQUBpJHb0I+DkTDBeWFLZAbMwILf40Byd1D5EsqGUca5MfqynQR/YYZ2O6A7h
 9yrRxnx31R1wDrkavQbxzD41kjt4ZiXPCqxdn7Ai3/hozD/R8QuBXohv6AnhaKvqdFyV
 B7WndRYPmwqIcMOZHAH4M1TIbhAnWci/4RB/AHy7geIG3TN7ixWwPeLemU7O/NhfbbSS
 ZhZSBDTapQ1ynCY//M4/yGkkuaO2JGpyVEHzyVdLca4FHrcN8WDPtAD35Nwox5Cw5QSD
 NlNg==
X-Gm-Message-State: AFqh2krRBLMQDiAkIkoqwN2DUKJOzn9Q+o9cc6+Airrtl5qRtsaKgAfM
 AEjm/1qqa36p1jkxDVfDHbZKnQ==
X-Google-Smtp-Source: AMrXdXsB8sUAeW3l5SasAD2u9uToHe7e+FL2qnDvHUdjr0cFMvx+/Pjh25OcwIbbRJMWiA1N54nhlg==
X-Received: by 2002:a62:e303:0:b0:576:d946:604a with SMTP id
 g3-20020a62e303000000b00576d946604amr25293451pfh.27.1672252235194; 
 Wed, 28 Dec 2022 10:30:35 -0800 (PST)
Received: from [172.16.2.190] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 d188-20020a6236c5000000b0057a9b146592sm10615719pfa.186.2022.12.28.10.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 10:30:34 -0800 (PST)
Message-ID: <cfbbcf46-7e3c-5f52-390e-ea5f39829716@linaro.org>
Date: Wed, 28 Dec 2022 10:30:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] accel/tcg: Handle false negative lookup in
 page_check_range
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-4-richard.henderson@linaro.org>
 <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
 <eba7c0ee-96dc-928d-b2a2-19fc46dbb8f4@linaro.org>
 <376567a3-bf28-4faf-4ca7-11d467c826ed@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <376567a3-bf28-4faf-4ca7-11d467c826ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/28/22 10:27, Philippe Mathieu-Daudé wrote:
> Oh, so you are using this variable as tri-state?

Yes.  Perhaps a comment on the -1?

r~


