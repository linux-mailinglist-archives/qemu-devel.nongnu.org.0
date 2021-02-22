Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552B32107E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 06:37:07 +0100 (CET)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE3u6-0008TR-3T
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 00:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE3t1-00081X-PW
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:35:59 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE3sy-00034q-Tr
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:35:59 -0500
Received: by mail-pj1-x1030.google.com with SMTP id ds5so463038pjb.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 21:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pAfxwNtVVxVRcBTSL+PEGU54pKdiE74BAcy5JXjGMcE=;
 b=k3Fs61eiyw+J6vSnP0FBeQECHdRmfOsp2BMb4Z6rRDmkxpXQmAMXC//MLj9MFfLwoL
 CLZ+vqrjif57W2C9CkMQcz63vKhyrjV5pPAe1CRRiEzlzr5u0HZ04ojli1Vc45Eza154
 eePe9liNJ/MM7WGYeVsrcBV5sh6kUIHKHDHF0p9gb8/J8EQTdD8oqEZSza63YQTGOSaF
 OqlbVF1avYeNyejLOyceaymgxmWyFEnYKjc9NoKD99PF2Jef4LNrcpDmNc5LVBMLh8A1
 1DtZEQKkxrNEkgIApEh1slZ+d6fpqIBsvpFKwWyvQ04zEZ09Jh68KIWLUQWbK5nkNb/P
 cXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pAfxwNtVVxVRcBTSL+PEGU54pKdiE74BAcy5JXjGMcE=;
 b=mYe3Mq4E28aaU+vCxZ/UgC803T0oemCug8uYGz4aZUyagC5COlEmcwV8t/JG4EuuMV
 3piiUmiB3eIDHE1bPcmZql5pst4FDEFr8uJQz8vjoAwVtiyw5x2J9zZEInxpNqsm7dx5
 fI3JKPUpyadYthvwaJcR2wMabEssx0sdoqOSBGhHqg3f0iHqrLiX5U6PEPSnL/qJcqHL
 9g5KY3Xg9TesSdcuiuR+m5iaho5NaNFHOI8LvZiU0+nw6wn7Upy7AEHjBdz2xgpXwLGZ
 JHkJdWDJHmt6CGDwl0ZbAjAwsOlIZVNXd56/Xcc7+r65/A1djfbkVnxiNSM1L8MSql9p
 gPsg==
X-Gm-Message-State: AOAM531A1adPNh+rLT24tRq2SrqHpLwYjQUZVFQFxqODNGD5VBFmInzx
 x7iQCuOqywqD2XxCBsNw29r8Q5mOApj5BA==
X-Google-Smtp-Source: ABdhPJx80672IF6XH3dsrsQr7eBe2HQj2dJpl85U1JDpk5xMsf9wEMvYWYOPD9HSgb7m7Pg+Vr/FDg==
X-Received: by 2002:a17:90b:4acd:: with SMTP id
 mh13mr22008253pjb.229.1613972154825; 
 Sun, 21 Feb 2021 21:35:54 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id f13sm23107089pjj.1.2021.02.21.21.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 21:35:54 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80a645c4-866c-2791-ac9c-91118018a44c@linaro.org>
Date: Sun, 21 Feb 2021 21:35:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
>   target/arm: move psci.c into tcg/softmmu/

Terminology: the opposite of user-only is not "softmmu" but "system".

One glorious day in the far future user-only will, as an option, use softmmu.
It will fix all sorts of problems with alignment faults and host/guest virtual
address space mismatch.


r~

