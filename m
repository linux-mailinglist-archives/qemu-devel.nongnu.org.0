Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE93A7159
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 23:31:46 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsuBN-0004LK-9X
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 17:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuAR-0003TN-SL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:30:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuAP-0004NV-1M
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:30:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id h1so7341870plt.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r4uJWsLbYvQv47EHrT2fkkf4OQxSCE0zCDoH+6SbtAk=;
 b=mMhRgM85hswayxKBUnsKaFfYB2sr+6PIlxnBMLVmdPcoa9X7EfYSvVZyVzwSpWe/2Y
 gsWkOD646Z8P688r4jYtTUofuRyRZTjn/BxZVfjRmVys0xbAqFsGFoOXHdHXmysG7MFi
 z9+rgKxckDOrZ8o8CRy1CtE91OrZsmqP5lVoVv1sBj02sLwlHW/9GUn6xYheLDUUBY0Z
 RcxSuNUF8g2NIct8AZWJCIWv5R0ofpiYW4miv5uFEBxgU3t7xztqXz3qYIsh79wlU5Om
 L2rLz8WcAKVt2Z3OFIkpGQOcjpHM/oKjNVtICrz+wfxVXKawHrJenTqoARo+4xYAdFzx
 6bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4uJWsLbYvQv47EHrT2fkkf4OQxSCE0zCDoH+6SbtAk=;
 b=TEOAju4qAnXEB9f5MDZ6Kf6EEGEhbZQW9sPFWrB/KqsgghwFhdOkwwEcLFoaRsvsNU
 cdxC5pAJOlRZQ4Wjhy7/CqlZ/Rjm2WgP1Afkg3WXHoVlnKgmRuG4x+griayBmcCFnPZn
 cnCk1dY2oQosT9q/SGDvbzCf35n13OV5jOuoIh3pDqNCewFbWXj/GExkowrDTrjia67m
 LPM/1QA3H1zP6H5bFgHIreuuE+VmdSpY6tzV+IKoUXLKbXy0u8KMwYori+FMSuPGrTb5
 A1zHlZ5G9ctwTjwf9k9vSza9+Kp6bQAVHbidzKK/B7NBtsyOiwBcc4bhCeil+c3nJFqU
 N9/Q==
X-Gm-Message-State: AOAM531pX+O+T9Mnb2M0KZmZMXmWDYYWC/RAuXW5/SHgHrVZ0Nwxa1mw
 KbRcKMpRDAgRipoccWtfMqi4ln1mFiNDWQ==
X-Google-Smtp-Source: ABdhPJwQVe+kUIbUWerXo+pHDD7ID4gVNQYshhERJGgryYjzCBvNJVqlKfaZ5t7Pe9M4rsluwIcAGQ==
X-Received: by 2002:a17:902:e986:b029:110:d7c6:add8 with SMTP id
 f6-20020a170902e986b0290110d7c6add8mr1121363plb.68.1623706243749; 
 Mon, 14 Jun 2021 14:30:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z22sm14002543pfa.157.2021.06.14.14.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:30:43 -0700 (PDT)
Subject: Re: [PATCH v2 35/57] target/arm: Implement MVE VADD (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d54e7ab4-c80f-14ef-2143-455cea15e3be@linaro.org>
Date: Mon, 14 Jun 2021 14:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the scalar form of the MVE VADD insn. This takes the
> scalar operand from a general purpose register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

