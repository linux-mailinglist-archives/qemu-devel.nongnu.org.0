Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08722679271
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 09:00:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKEDY-0001lP-Pj; Tue, 24 Jan 2023 02:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKEDW-0001l2-Au
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:59:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKEDU-00032t-Nz
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:59:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so451983wmq.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 23:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=giuVkWM4pnf3AfXPL/YPflgFfJ9cOojmxhzWclFmAhQ=;
 b=KYYJDjVrpFgxh/tCvA0TIWK7j5cbuErDlUhHTIUE69h1etCE5xmj7+uwsy8LdgLkQO
 IY2Wt01D2Zb/HYRXfHfTWDxM3rGrg3l5cwVuI/Qx1nzxz6A4tcki/Dmjp0NLbkDhTXtf
 fERlwVXtxC82UkH10RLotm5YzM9AAXujpSRHov4uGiTRcvzu20h9xX2bKmQxWctKOKeO
 gfLpHQJ6GbEldLwPHLi3NTjY4nSFPxjFC4LfM6QHnECkaQiHcKUc/A1Dq96sjVVjGJX4
 mox92gpLVzSXi3yqROKWk1sZ2KuZETideDdFvwBUXJEMNU1lTbQ93GPDpabfKWqCKGlY
 /5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=giuVkWM4pnf3AfXPL/YPflgFfJ9cOojmxhzWclFmAhQ=;
 b=gAfvEBMPfPMAiVa4bhbAjiNas+QSyzryDoRc42ncYlyjBGHglBFOtX8n+vEd98Hc+i
 p2vg831DEMtUUJu9+qUKq6r84Lctwu/ozR+ZD/21PxW5wvmacryjfLD3NQQ+/xRfvULQ
 0sb4rvT5rGTm2N948ZwErX52qAWRnRYmsyBJBC10IY8Kl6zVW+raS0gm+yOnZ/FHso4V
 EkHL/TGH8FGQ1X/1vHfqyqtrBxZJOIuo59757GHY3KLnTI9GVhSmAP0YpQHFNtVYCU3t
 Td1Jze/dyexft/eiOQ6T4WLPSf8B2b7euXiT134w//CBWuUz/bR5/PNLDklPcqZqsOF2
 00ww==
X-Gm-Message-State: AFqh2koOOUXGd7azgsxUqP3K8DTKmr+6jgcMKedQNfw4IoKxcTJcveU6
 t45+5Tl8G/GNE9BfhzIbBM7NbA==
X-Google-Smtp-Source: AMrXdXt2QOcncb/Yr2GpUhVgpZR8QZy50Wq8B/Ptj7do4Uw+6DTF5LFxH8+cISBGt+7/fyxy+L/drg==
X-Received: by 2002:a05:600c:1695:b0:3d3:4ae6:a71b with SMTP id
 k21-20020a05600c169500b003d34ae6a71bmr25665888wmn.2.1674547179411; 
 Mon, 23 Jan 2023 23:59:39 -0800 (PST)
Received: from [192.168.159.175] (92.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.92]) by smtp.gmail.com with ESMTPSA id
 q5-20020a05600c2e4500b003dc0cb5e3f1sm1185094wmf.46.2023.01.23.23.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:59:39 -0800 (PST)
Message-ID: <27d059e1-cde6-5b5d-fc6d-9bf674ba3e02@linaro.org>
Date: Tue, 24 Jan 2023 08:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] modules: load modules from /var/run/qemu/<version>
 directory firstly
To: Siddhi Katage <siddhi.katage@oracle.com>, qemu-devel@nongnu.org
Cc: joe.jin@oracle.com, dongli.zhang@oracle.com,
 christian.ehrhardt@canonical.com, berrange@redhat.com, pbonzini@redhat.com
References: <1674499693-9863-1-git-send-email-siddhi.katage@oracle.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1674499693-9863-1-git-send-email-siddhi.katage@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 23/1/23 19:48, Siddhi Katage wrote:
> From: Siddhi Katage <siddhi.katage@oracle.com>
> 
> An old running QEMU will try to load modules with new build-id first,this
> will fail as expected ,then QEMU will fallback to load the old modules that
> matches its build-id from /var/run/qemu/<version> directory .
> Make /var/run/qemu/<version> directory as first search path to load modules.
> 
> Fixes: bd83c861c0 ("modules: load modules from versioned /var/run dir")
> Signed-off-by: Siddhi Katage <siddhi.katage@oracle.com>
> ---
>   util/module.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


