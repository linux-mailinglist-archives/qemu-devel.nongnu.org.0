Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7D161B90
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:24:18 +0100 (CET)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3m09-0008K2-UT
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lyz-0007NF-5s
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lyy-0000Is-5v
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:23:04 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34148)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lyx-0000IE-Vs
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:23:04 -0500
Received: by mail-pg1-x544.google.com with SMTP id j4so9727136pgi.1
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eoh8lxK5glSwtH3COtac6Vdo/dP7EkfI8CRI3g6iWYo=;
 b=IIFAJcu8BL6jdyuw6YvADoP7ul8bc1OIWDARclv1DHW3Pjdf72/x0WNsK9VnpjRbFg
 9Op1UKNl80npSChIO7AixOT/UK4Fr8RGZe0Qo03hwQ9j5YKBtcj3yXBIy1PjF/P4G8R/
 ijt0P/YXNdkAbBdRM78KjLtJU7rSCSv9VQFg2bCx6WQqBHdqlm0FXwxSWcny7LsnOpb+
 65ntfLwLW9qypWHg+RjVdM0nnrmzT1toauOQAXNv22/KC3TKjSDNF6pOfFPZdRzmQ/6e
 PSv2h/yE8rivyOeyF1JXtWvNoO7oBU4ojDxa8+KUNW55n0a3lsu5pdO4V4OOaIO+QPdB
 yo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eoh8lxK5glSwtH3COtac6Vdo/dP7EkfI8CRI3g6iWYo=;
 b=VhC7dqGyJsx1RWboVsYq3zYSDjdhpgG4uPGBPoo5QM0MjWwuB2iTB4YSYJ5wSS6p20
 VwopvpFR1nskfB3WGANPtO/9JQFYpOLOav0J/a5RdLPL+V8oUceFlJATLZ3hcabr0VCz
 r711vilkpd3DsHcL/61rqoABlXG6xVtVg2yIrzrMn8HIYEQVgtbDB2c9TFbZuUFbji77
 3LKk1WP1jnm9Vdos99NocJF6s5m+0EvFzNis0bfi4+zru2/mx7gJIelxqkhtWomxRw9H
 H0edveuiJn+49OOrgICDrrO5K7AeoFyN8BAF7/UHIljiqwvy7apat3/C1K5Pie4jxJVZ
 Z9qA==
X-Gm-Message-State: APjAAAWPYuu+bTnbKhBBXfDklJylPzRTxteoYUu9AGR7bzUrcpxXpL0v
 cYD8T51giIWOidJvq/dkr4r00g==
X-Google-Smtp-Source: APXvYqw4OGuYcU/IYlwaFRo9rrX7j4PlQubB5HgSHNgedF4F5SMCiHnmDvSZIshkXu11BXlVj7bcMQ==
X-Received: by 2002:a65:52ca:: with SMTP id z10mr19516147pgp.47.1581967382563; 
 Mon, 17 Feb 2020 11:23:02 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r198sm1300939pfr.54.2020.02.17.11.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:23:02 -0800 (PST)
Subject: Re: [PATCH v5 34/79] arm/xilinx_zynq: drop RAM size fixup
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-35-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a226b0ff-0efd-8d48-7708-dcbebc8050bc@linaro.org>
Date: Mon, 17 Feb 2020 11:23:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-35-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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

On 2/17/20 9:34 AM, Igor Mammedov wrote:
> If user provided non-sense RAM size, board will complain and
> continue running with max RAM size supported.
> Also RAM is going to be allocated by generic code, so it won't be
> possible for board to fix things up for user.
> 
> Make it error message and exit to force user fix CLI,
> instead of accepting non-sense CLI values.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    /* max 2GB ram */
> +    if (machine->ram_size > 0x80000000) {
> +        error_report("RAM size more than %d is not supported", 0x80000000);
> +        exit(EXIT_FAILURE);
> +    }

If you have occasion to re-spin, I think that a common function like

void machine_memory_check_max_size(MachineState *machine,
                                   ram_addr_t max);

akin to the machine_memory_check_fixed_size I proposed earlier, would help keep
the language consistent across the boards.


r~

