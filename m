Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FDA6EA423
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:52:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkck-0000dr-Cj; Fri, 21 Apr 2023 02:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkci-0000dd-NM
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:52:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkch-0008VS-71
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:52:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f939bea9ebso1240945f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682059915; x=1684651915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HiGLWG40+zn+YC6OhzEHGvcpf5MqRMpIKFn0PmcBa6o=;
 b=t++y5Zf9hrfcL1qhzB4juPGsTbG0Aa3VCyw3/iSn2zhj2bm876KBjA3BREDquC3D8N
 5tGorjhCUrKKlSHBYKBdRzDsdFxSoGxZcTRajqZgUo+uHCnJhFPqoul8YTZhimsgYkal
 Uzi2q37G6DzxFeJujxGqVaRm49JxuQBePq7ioWeeOnpBE60QGdf94hmeOo/3sirHshkm
 0N3TgLc6+pQ4lbOyAnpOQzh0TXcmy1kf4ZCqS9U8loQyy7wI0pYIYRR3Dj/WyuVHtZen
 H+janrOOjCafRs9s6GmElXuCA2urAGboFZnT1PNNfIctb2oavazf33vayPguhf8sJR4F
 uq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682059915; x=1684651915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HiGLWG40+zn+YC6OhzEHGvcpf5MqRMpIKFn0PmcBa6o=;
 b=GwzjhvO461dIOh//MStQDI5S7Mo/iyZusgKPF5lM7TSMQU8ahoI8lYRusINuX9dR8y
 RHlAXCGm8lJEBnlBeK7n5j+VFrOdA/fjjaX7C2CFAon8HHICL8qvVQeISE+aQR9QPAPr
 FB6+LNM4ytJcBo5aIDRIyeBA+tCN5bBqQH4ceDS3/VbvpAhO2mb1LoyT8IxB+O0y5HlU
 n6IKqvZ8BZE5dURtlPslV2qTqEUmRQd2osvHFd+wdhDnE6rKShcr15n9pTykFWDCIwTy
 bA112vuNQerVhcUghyWpgkCFVM6DU1m2R/J+y4N/Q1kZ1VloZXO5ebMO1Frj6WU6ioUd
 FCvg==
X-Gm-Message-State: AAQBX9ehCQsuu+A11CqPWawARZFJ2ZW608FaqXw+RJd2M2DJEqVi2KHg
 cS5GcVMkOVSb14lAzEkgrEqjpA==
X-Google-Smtp-Source: AKy350aOKuVy7tbR3Hv6ifuwsWjrd9unFlFTRB3rPJ7dBby8eRV9ZeMBavyPYeoV3BzjISTkDbJ/nA==
X-Received: by 2002:a5d:4fcd:0:b0:2f8:a17c:dedc with SMTP id
 h13-20020a5d4fcd000000b002f8a17cdedcmr3114514wrw.42.1682059915289; 
 Thu, 20 Apr 2023 23:51:55 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d6306000000b002fed865c55esm3694966wru.56.2023.04.20.23.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:51:54 -0700 (PDT)
Message-ID: <747b7e38-c348-cc4a-daad-93b3b36ae8ec@linaro.org>
Date: Fri, 21 Apr 2023 08:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 09/10] hw/9pfs: use qemu_xxhash4
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
 <20230420150009.1675181-10-alex.bennee@linaro.org>
 <1860032.XFESxothFF@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1860032.XFESxothFF@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/4/23 17:35, Christian Schoenebeck wrote:
> On Thursday, April 20, 2023 5:00:08 PM CEST Alex Bennée wrote:
>> No need to pass zeros as we have helpers that do that for us.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   hw/9pfs/9p.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
>> index 9621ec1341..9bf502c45f 100644
>> --- a/hw/9pfs/9p.c
>> +++ b/hw/9pfs/9p.c
>> @@ -741,12 +741,12 @@ static VariLenAffix affixForIndex(uint64_t index)
>>   /* creative abuse of tb_hash_func7, which is based on xxhash */
> 
> I guess this old comment could be dropped then.
> 
> Except of that:
> 
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


