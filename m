Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D216B2DB0A0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:56:59 +0100 (CET)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCh8-0001Ak-TG
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCeY-00082N-0k
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:54:18 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCeW-0006gZ-6j
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:54:17 -0500
Received: by mail-oi1-x244.google.com with SMTP id d189so23795370oig.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9GZ0f4BMyNXtaDCy2qxcA9xJxVvpQlug64UKRhyHB88=;
 b=cSffTdYr2pRLZHCsybLA97XRS5Zxx3z/K8iKLYANEeeWxDsPN4CsUI8Pe1xA+7nQ6v
 WDUlXgM+sV5JxujlUK+6EVIQJOf4zswkJvrcVIEm/jK9SkyVvpR37OJtsewMEZ5cIOPi
 f2zyX4JT++uwnZHILdHusUxq1lOor5iCAOg6vvLEHZLc8nIJfIw7kquhfuZGFBVj3Wks
 Oo0E2X1l5SElrRquhqIvoV9YnxRzUogVxY1SCgoxX8ZoDjF2Q3dLqJnDjTka1EBkbiyE
 jLNgCv0r6fgMSg1+qepN5qSQlOJIWO64fGiBJ+buYoMZCHtsjW1sIw0w1cvw6PJ6uxCL
 Z90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9GZ0f4BMyNXtaDCy2qxcA9xJxVvpQlug64UKRhyHB88=;
 b=uWPA+BBqsHRt6QEdMN5tEt0ERzLrTiwo7fiRpMazq4Iy3tebh0GhZKCOrnrUiuL165
 fjQBo0mllZmf+syfUNdJ0KQruObaZfSZbhHHBSMCa0qago7sVrXZwBzJ0ui/IIvgajOk
 miSbGxiwt7y3yZzoRKAVUNrfpA6yW389UMxUYTmptAAVakTuJ0kZm/gwi39eNX+BoywW
 Ry+tyKeamqBg1W9wL9UXVF+mHio7nUv4KltcVOixFliIq2w4K+c6lV+CnGFFEeXu1iT0
 L7Ov97WVNDo1m2MntN3R/8RcPcw978SmenLnxO5+Bmw2VCe2wXw3u/1DbegVoDgZ7eSZ
 80Gg==
X-Gm-Message-State: AOAM530OVv+3S7yyZ8yfsKJG+c7Biup9UWCdUJiTpFnfkfedaJNJiBLF
 4IYcg3v4eKgFRPTEb+m3BAKt7Q==
X-Google-Smtp-Source: ABdhPJy7yMlGySfWJeAmdGuzb4YkvANaLPZJs0Bn5xhhZYW0DlTaf8Bw5VI4zpVr/ilcraixGQDVLQ==
X-Received: by 2002:aca:720a:: with SMTP id p10mr21137489oic.81.1608047654814; 
 Tue, 15 Dec 2020 07:54:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s17sm196262otg.16.2020.12.15.07.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:54:14 -0800 (PST)
Subject: Re: [PATCH v2 1/4] util/qemu-timer: Make timer_free() imply
 timer_del()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201215154107.3255-1-peter.maydell@linaro.org>
 <20201215154107.3255-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2982d998-408b-1bcd-fbf8-d55df871f305@linaro.org>
Date: Tue, 15 Dec 2020 09:54:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215154107.3255-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 9:41 AM, Peter Maydell wrote:
> +static inline void timer_free(QEMUTimer *ts)
> +{
> +
> +    timer_del(ts);

Extra whitespace.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

