Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4851D049E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 04:07:23 +0200 (CEST)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYgnq-0001o1-7A
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 22:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYgn9-0001MV-0F
 for qemu-devel@nongnu.org; Tue, 12 May 2020 22:06:39 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:54900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYgn8-0006vb-2G
 for qemu-devel@nongnu.org; Tue, 12 May 2020 22:06:38 -0400
Received: by mail-pj1-x1041.google.com with SMTP id s69so2129660pjb.4
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 19:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8b9fpcuJ6oVaoHTbgJD2FTGlfEUYk/UcMkckrsvWnOk=;
 b=QUl2tVwHeI4tPxNOUjhZu6UzRP6hz/2IL1r3wj1eKtnWYNuxNtp4gj9BvEoaoWHFkX
 1+B9b2psFgd5WOu/r98zWnpCn21gxpe4fgtdv1qnS0gZlLJSqygP93Tc+EVfWwz567pL
 HGVn66FEArXHmcYhe8mGScSB0wywWjCGOqd142k1IH9+TQ0pNJH7JFr0oI4zdyEueurF
 2UJhYdSWxNPgpcx3EXkGk38dpHNerAO5GKQAR3ZmZYP1+JyxL3ESxlP77aBMnM5hpQOX
 uFI4Izv6ByPnRM9FXowsfOYcYYwubYgGonZk0YIqg228s7rgaNeYRpGnDGIe/6H0Bq7K
 W9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8b9fpcuJ6oVaoHTbgJD2FTGlfEUYk/UcMkckrsvWnOk=;
 b=C0BGpYY74PRpOThZiBw/sh1F3Y4AQQMA8z2q41qf7P7CGNwJIn3pSnrafS1GKM56NR
 HgQW/rrQH+UQzQR1g1ym1Vcy5lxxIDsbsPFHoLKZFiefkCqEBSNZpZODgmqK/dwnjcXL
 dYLxFZk8bXRYsPeGb1i1L4xm5eDbcbAELL5nr5FLJJZh8S+E0eBtKxUHfMWlQSNcnZPb
 wyANelZa+nlXZ7gwhxTYtk4aYPHtt7QAQPRGZ0U0pCvwFNxr/bh6OqtICMZvqeH7wr/Y
 WzuBAseuyDIZCwrWv8adZNm4U2PhRoRk28YnQJgkmsL2yykcyP1LEv29Nw73fOXtFvw8
 0zlQ==
X-Gm-Message-State: AGi0PuYlK3ZAiauPQR7begm6vsKZU3SD7GilrPjoQJfI9p5poRuor3DR
 0jlQ54eoCQwEeM7O0KWrTA1zS9ysdwg=
X-Google-Smtp-Source: APiQypLI3U0LjWsti44jRYuDUOd3RzDndYtud3rmw6fJbYKeTvpVe3B7c21Vc9c9O/Uauc+cJ7r1dA==
X-Received: by 2002:a17:90a:8a14:: with SMTP id
 w20mr32809499pjn.176.1589335596154; 
 Tue, 12 May 2020 19:06:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id p5sm3519484pgk.28.2020.05.12.19.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 19:06:35 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] target/arm: Create gen_gvec_{u,s}{rshr,rsra}
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200508152200.6547-1-richard.henderson@linaro.org>
 <20200508152200.6547-3-richard.henderson@linaro.org>
 <CAFEAcA-JOwTRz1ZHEBrH5iLG3Qwf-7FvWUFvWvhP769aK-iEiQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c19aaaff-1add-6aae-bee2-6d1dcd54927e@linaro.org>
Date: Tue, 12 May 2020 19:06:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-JOwTRz1ZHEBrH5iLG3Qwf-7FvWUFvWvhP769aK-iEiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/20 6:51 AM, Peter Maydell wrote:
>> +        tcg_gen_gvec_dup_imm(vece, rd_ofs, opr_sz, max_sz, 0);
> 
> Knew I'd forgotten a review comment -- should this "dup_imm to clear
> to zeroes" be using a fixed element size rather than 'vece' to avoid
> the "dup_imm doesn't handle 128 bits" issue? (Similarly elsewhere.)


No, because here we cannot have 128-bit elements (not 128-bit vectors).


r~

