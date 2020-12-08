Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E13F2D3670
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:48:43 +0100 (CET)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlmh-0005gN-JR
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmliH-0002NC-K2
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:44:05 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:43955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmliG-0008Jx-3H
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:44:05 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id h10so4405277ooi.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L17oNcXBRTTCCGpRUtdnyNjoCl5eOOcHjOXx/B1OEzE=;
 b=onbMu36MuXjzie57mirxtKl6hdiPNJMYZ1TTcssjVCq0TztDNz6w5VzHbRlgpBCyGQ
 K3PHdoZLYjzUNgvwSPN7hJzUQ+9fWVw+m9Dr9EMgM5mHge3HVD1tlw/1g4Fl1GxC+5TE
 u+BEFlQXILLtS1VtkleHwBGXAsp+w+eAPhbvP/wdIpOYQiA6JiJWtWtGWVTg9lguszg1
 aGq2ap3fCDzNIcEsbsqeWP1hRRwFcYOJzxomYbK/Ac0Kh1WlUd2XumVASCWpVQ7mT6eR
 09Tc0WtiO0QxNZAJvqkoD3hH8uBCjc2cNOf5CC+NpE9woB6Z47u9GZNyPy0OXrKr7Wpn
 f6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L17oNcXBRTTCCGpRUtdnyNjoCl5eOOcHjOXx/B1OEzE=;
 b=H1YrSV8E5TYJj5WGnxWAQyI5sjNqo5QiQ8PvuM4ceUYFUEWRqR9AMtKh0R6hN+7lIr
 0602XgUdagt73FfvMyJVpZNThpzw4dQ2Ei9AIQODJKpX0I2NqCaszpVUByM4ggt0DjDk
 4mBeVWRoD0FvcnMX7oh2aCM6i99eXuCKm48IOuc2iGst/R6cu2EGGt76jZtz8CvkkgZY
 RrZHgdP44NqNwKMluu/ojXtwTKoVegjoxQ/wSQdZzw7jQOq/akqY8HNLgxm4hQb1HgJi
 f0geSaqgZlYGt8HRU3U/422viv9vH7+Z7rwnhpi6qRXqGPe57UcyhzJjfHTr5VsJoPhV
 50FA==
X-Gm-Message-State: AOAM532W+j0YLqnZjHgA4KvsxALtYiZrWO0Rqz9ts9tlQSVyfMjmlRC5
 4pz/CcEGuCO8V1bLd2hbcqKlYw==
X-Google-Smtp-Source: ABdhPJyU8FwHgTQ7ZPzZkh8EqzNRu5S988+H8slI51aQMHTLJ2s9Y3j7EfbMEuoN5pqX5FClSUj82Q==
X-Received: by 2002:a4a:4046:: with SMTP id n67mr166887ooa.91.1607467442685;
 Tue, 08 Dec 2020 14:44:02 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z3sm42514otq.22.2020.12.08.14.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:44:02 -0800 (PST)
Subject: Re: [PATCH 0/2] target/mips: Let cpu_supports_isa() take CPUMIPSState
 argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201207215257.4004222-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b722e8e9-c100-8000-c654-7c5bc8be953c@linaro.org>
Date: Tue, 8 Dec 2020 16:43:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207215257.4004222-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 3:52 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (2):
>   target/mips: Rename cpu_supports_FEAT() as cpu_type_supports_FEAT()
>   target/mips: Introduce cpu_supports_isa() taking CPUMIPSState argument

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

