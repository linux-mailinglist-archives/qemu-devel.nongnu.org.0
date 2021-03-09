Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAE332833
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:10:32 +0100 (CET)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJd4B-00011b-53
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJd12-0007Qz-Lq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:07:17 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:36343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJd10-0005Lf-Uk
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:07:16 -0500
Received: by mail-ot1-x32e.google.com with SMTP id t16so12885406ott.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hAl1BLHCcN1CwVZ8PyAt1gMXLhGKB8ckAc29CNoGBxw=;
 b=rJi15Hf6BfvnsqLDRCNxKFu0ihX/18BMN5QQmiSBpKCqaj7yiEQo933m5lHwxvbOao
 gU1rhKiMNcHL0Yv2j08zlufKKskPezgtF8p2HhEFqnEkeeYtR6DrOxnq2uoZ+gKRCZls
 KQvHwgDPDSH2MGAAqYzJuwDOFuwCPBP2OTagCwo9U0pHII+4FozdjnKdN2/UjtuqBVlS
 +xd304s4o/OxzBr5GF6i5gTei65+yDSkiXiQR5xRgn4IBaL5oyDph5dAV2OIEdfkDiTl
 U3qnrPOB4lCzTzfH6S7ZvZqdfJ61YFvNseuUJbe05CjcY7vcrICcSSzxkxqKdujtmtyT
 8+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hAl1BLHCcN1CwVZ8PyAt1gMXLhGKB8ckAc29CNoGBxw=;
 b=q2i/WIHQSkEccKDiYRyPVlaDMjnceKn6RLjdK5C3tMEu0pcZ1E0Lz0uGXYSpbCnK5Y
 zYH/5A0K46Kushn07Nsx745dDmxrt/C5JovbAfnW5DFJ3+a0xCRVguTIwBL4HwOFZS2K
 /7ts5FA6W0bX5cnnkIvCPFNHSMWLOCwPfa22vaO0WJeF4aK2ilTz4SMbtjH4UGZoLZSV
 qrchj2YY1AYoXJu+1MRCUYaLsq3OJ0KN9L1MWCy8CD3xYPpg2EFIzZ2fZ8k2SkO3VWmO
 mAgwPbmyVOCtctYaVGbCTLLWu4pB1nFvrnEK5hpkhmCR4DpJydIwnEATznbv0Rl/AjfG
 yD1g==
X-Gm-Message-State: AOAM5320Vq7L6FWRhxNYuSAKDXEbwKD/fCvvZC/ZD0VB9rCGaxH9LDoj
 qFWA0IyjHN2mbA6Xy5tK1SAIGw==
X-Google-Smtp-Source: ABdhPJwvPzGUTzi/uq1EG3dsMH6d/iuA3LZjRzDVAn3gLfmZWNQOHy71y2gza20Cq5sNRnqpTzPa3A==
X-Received: by 2002:a05:6830:1e03:: with SMTP id
 s3mr13663383otr.321.1615298833244; 
 Tue, 09 Mar 2021 06:07:13 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c20sm2934737oiw.18.2021.03.09.06.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:07:12 -0800 (PST)
Subject: Re: [PATCH v2] linux-user: Fix executable page of /proc/self/maps
To: Nicolas Surbayrole <nsurbayrole@quarkslab.com>, qemu-devel@nongnu.org
References: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e4ff419-d2a8-5dc0-3c7e-e603ec89eca0@linaro.org>
Date: Tue, 9 Mar 2021 06:07:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 1:19 AM, Nicolas Surbayrole wrote:
> The guest binary and libraries are not always map with the
> executable bit in the host process. The guest may read a
> /proc/self/maps with no executable address range. The
> perm fields should be based on the guest permission inside
> Qemu.
> 
> Signed-off-by: Nicolas Surbayrole<nsurbayrole@quarkslab.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

