Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779A2CFB50
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:46:12 +0100 (CET)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klWx1-00080v-5v
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWv8-0007Za-BL
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:44:14 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWv6-0004fO-Kw
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:44:13 -0500
Received: by mail-ot1-x343.google.com with SMTP id h18so4012000otq.12
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7pqtYgdwXmYfAHYPXWQqFh15eA/495et8ob7D3TO0UU=;
 b=gx9da9HbvMFtqFhUy6bKOcSiI87OSeNPqa+cqypPQCcT8qTZdsJPRkxpzUoI+hIr+S
 kytNGJVLb+T7GWd4HOaXCuSVSiFpNb6+sVNIBQzFspY+qnZ09YXIbSDYhSWLZmeta5Tx
 xCjc/6ax5SzH3TVmfMjuWgv7aF0Q6IED/XK98QaIzmyFIW4aljxoB1vyZPX7NW10CBfy
 FmG3qt1yTXlhZobBXNRL3QKaL06nksN6TrzGJxqrwkHphP6AdiHtyFCt2/LM72KS45wk
 sxjhPVN63c3Lj6ZjUJbOgriLojNNKrs9odKzmBHt/8KCGL3VqXg8MQruC4kOLEdkh8ob
 11lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7pqtYgdwXmYfAHYPXWQqFh15eA/495et8ob7D3TO0UU=;
 b=W31QYeyOUDqDCHbu+izQJ+Gzn+AFQbPtFQ1Eqa2At08KFO80fSkMPRGcbuR7uQGCVz
 2jZiYzbClFJbhIEcAW5Ms+vxh+GF8MhErpWsLa0/8bOSkFYzvb/qCdMCtUDW5X0/Metn
 c6k1fMTdmvwviQ0VeONLV9qL/moCKMNwhMgcXYxHMgfw0fSVtJTkPtrAcyV1txX+t1Q+
 zxj9arKmGxBlNObwALO9Snfz6y/SpJHPA5op2VuvhdrXz6d0U6vDrdFInXnarxlwwdLw
 TldGRn//ldh1UjynEBhInMFH+JzyFsku/GoYXM/Oz0H9xs1qVTmKKMsXSG696sJmyUyV
 WnJQ==
X-Gm-Message-State: AOAM530RH59Iqc9bM5HzNvbRqkr4fHlcj7jPn3rx1Gf9vSjsr7ILrjOB
 JftVbnFr/oWVvPYYmI9MWDYjqQ==
X-Google-Smtp-Source: ABdhPJynM06YJZeVUYZ6qFfHrP0O/aYP5k5Q6uvu6UKtv4bIy+hOxezr/UifeM1Sq0xD4+bpryLflg==
X-Received: by 2002:a9d:1290:: with SMTP id g16mr6970247otg.69.1607172250239; 
 Sat, 05 Dec 2020 04:44:10 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g188sm1383708oia.19.2020.12.05.04.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:44:09 -0800 (PST)
Subject: Re: [PATCH 6/9] target/mips: Alias MSA vector registers on FPU scalar
 registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-7-f4bug@amsat.org>
 <ac68e51c-650a-55df-c050-c22a1df355b5@linaro.org>
 <f528a49d-2476-8e8f-e6e8-afc115864b1b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <666cfaee-9663-0550-6cff-2def63f0664a@linaro.org>
Date: Sat, 5 Dec 2020 06:44:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f528a49d-2476-8e8f-e6e8-afc115864b1b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 4:40 PM, Philippe Mathieu-Daudé wrote:
> Back to the patch, instead of aliasing FPU registers to the MSA ones
> (even when MSA is absent), we now alias the MSA ones to the FPU ones
> (only when MSA is present). This is what I call the "inverted logic".
> 
> BTW the point of this change is simply to be able to extract the MSA
> code out of the huge translate.c.

Yes, I see that at the end of the series.  Have a

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

