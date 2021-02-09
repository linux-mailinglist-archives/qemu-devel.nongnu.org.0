Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729731561F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:42:11 +0100 (CET)
Received: from localhost ([::1]:60054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xxh-00082u-0p
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9Xqb-0002hH-O9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:34:49 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9Xqa-0001Bh-7V
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:34:49 -0500
Received: by mail-pf1-x429.google.com with SMTP id b145so12454352pfb.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oC163BOYpIPTlq9cDNHmfgmoFul8zFiB/HEb2fMJqCA=;
 b=eKg6+I8hqvSHtI43WDdnPk6I/gDPKcGI0tcTsWguFkiv3JfdQhR7Sh2lum31zWf061
 Ien7CrWaXLoaXhvj+tvLyyjLswN3WgNsxbXRiV0d7YVvgyyZy9P6QiHXkfYNRDYhIzMB
 mJcC29m8bLXMegHQIz4K/mKtgn/aVJOCwWh5JQAJWmBWJCtha0yZCJ9sDYjfp2spYIc0
 j7Am3dTnk/NwH5EUS9klIldwlOCyh6uoJarmF27Q3fhXRi/CkW9yeGhDSnyXcL1CNSw4
 5T0HOT5Ho3MbygXnkfbgws+Q9FS/btkEc6cNhgLr+rJ4UxSeXzAlYNn2LwQwdENOcH7t
 IofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oC163BOYpIPTlq9cDNHmfgmoFul8zFiB/HEb2fMJqCA=;
 b=q0SaHGhZy0MzOiqBwVFSwwekn9TfLWV9Pr73KgBwF8msPDDwO1t7sLjgu8nQ0dp/sg
 4xlEpbs5O+s+/bTkrVZGbpB7+fWa/aWbutnvZOTRhTBzxP01dln0GCOqedZHVEpJZaVy
 KyfsFScXxGFTGNa6jyV3lnQo94O/x6rC3FehQPveVkcILyIEC8IvUTdtNSUmMLdHMIgD
 l17Xht3vux4vzwXYyOA/exAlscNqwvVot5L1yUoy+9MMWPDnqexMVuN0m2eJXSgBdEF0
 HuG7eRi9SP3RDCChEnBSldRq5MSS3phqycXFXS9S8BGb1IDWhwlhfLF87kLdqBKX0Mrg
 oCVw==
X-Gm-Message-State: AOAM533PYoDaaPx4GNKQ4pIy+mbcOkcAfhsCM5JLca0fiZYqLN6Cg6w/
 YqPSPKUuh8ojE1v0CcIvm73I9g==
X-Google-Smtp-Source: ABdhPJwyANNArdMyPvY7i4mdNhRl8zea0nvnX/xu/SQUbSAc+NE3ylDs8Aug2l7hom0tY837yFDYyQ==
X-Received: by 2002:a62:fb0b:0:b029:1d8:fdca:60f2 with SMTP id
 x11-20020a62fb0b0000b02901d8fdca60f2mr19978037pfm.70.1612895686670; 
 Tue, 09 Feb 2021 10:34:46 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 j9sm3066770pjn.32.2021.02.09.10.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 10:34:45 -0800 (PST)
Subject: Re: [PATCH v1 05/12] tests/plugin: expand insn test to detect
 duplicate instructions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210209182749.31323-1-alex.bennee@linaro.org>
 <20210209182749.31323-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <68de96f4-b3ff-d975-5055-2ba60cd8576d@linaro.org>
Date: Tue, 9 Feb 2021 10:34:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209182749.31323-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com, cota@braap.org,
 robhenry@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 10:27 AM, Alex Bennée wrote:
> A duplicate insn is one that is appears to be executed twice in a row.
> This is currently possible due to -icount and cpu_io_recompile()
> causing a re-translation of a block. On it's own this won't trigger
> any tests though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> [AJB: well not quite, the x86_64 test trips over this due to some
> weirdness in the way we handle rep insns, e.g. rep movsb (%esi),
> %es:(%edi) in the x86 bios code]

Ah, but that's not tcg weirdness, that's architectural weirdness.  Multiple
executions is how "rep" is supposed to work.


r~

