Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C252E44D969
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:47:13 +0100 (CET)
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCIC-0001Dl-Tv
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlC6g-0006NH-R8
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:35:18 -0500
Received: from [2a00:1450:4864:20::436] (port=40737
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlC6d-0004Dv-Mj
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:35:18 -0500
Received: by mail-wr1-x436.google.com with SMTP id r8so10427764wra.7
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=R0UW8enXx20QbaSwXux+IqRsShLJDJ6llQPMjrroXCw=;
 b=PWHPTjJbftoIo/kezCc+5qHg1UQkx/P8/8xJ81cbVT0sW6qmTEs9dOzGf8qWyOIFq0
 v+JmdQZi1wXg54g/MeFF+GqrDMDNqA+BZAWMIylyf7YtWHpfGlLJp+5mm3juzh5r/YdW
 YyJB8dtK9cDFHbuNcekMi68ICciHtrx/o5gJPiGJL4nu5z/LNuZ9sNMtSW53ylkf+uH8
 75zSIBM3akHmBOVMI9Twimaun+KKQxwhSt+ROLEm0kftc4vfeZNSbzhKGwJ1IA6cu26p
 0oaN/WeV5poK+vOBvysgLgL3RVkH3W5e9A/Qb2ZD7NqYUfSDZ0caZLAPrfrj4w95X6/M
 fX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0UW8enXx20QbaSwXux+IqRsShLJDJ6llQPMjrroXCw=;
 b=NtC3iUTCvf9YNvV5q8oIwYfCMfHD5Z3psKcsxQn+oaCwdpin+trlRTU9vsktNPZvjT
 60XwEv+h2EtZjswrOZ9WlYt/s4fayYfeR0XEMIEqRJHM/Hff0hxAQ9GdZejJOGal+Xzw
 zz1t9RdTb19D00ZyYasusDUs1mplWP4lzKL09Y7kOW+cAhs3yTzvlWCjACiBxzb0/hIG
 XFeB1U15dbXQBIqElVImPMTIVagIrL6EClTCwA22+/bQ4rw6WXqN+AX5uMAbhe24Onsu
 oMfExznL2CHqmgltpg6T0FG0Tbpnp3aIeR7GWZdhEWlM2CFZ4XVyBApoO36VicoStRNC
 3A/w==
X-Gm-Message-State: AOAM530fWR3GXMQC6QSjzjjj1ufW0zTR+pZ/9xjjByhfhkg0iW10PbNA
 xHXPQdYU4r0dzIypWkCwAgGeQFXN1lb08wvO9UY=
X-Google-Smtp-Source: ABdhPJw4Khw5FBdlCcC2PYhhJAIWsAkID2rwQsjgwMBY/WAo2Cuszj/iEzJHh5zqQw47eR1xfdc0Ng==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr9698717wrs.136.1636644910198; 
 Thu, 11 Nov 2021 07:35:10 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id l4sm3137579wrv.94.2021.11.11.07.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 07:35:09 -0800 (PST)
Subject: Re: [PULL 4/4] linux-user: Rewrite do_getdents, do_getdents64
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211111110504.1574242-1-laurent@vivier.eu>
 <20211111110504.1574242-5-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e3245d2-742e-9122-89ec-2989d517206d@linaro.org>
Date: Thu, 11 Nov 2021 16:35:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111110504.1574242-5-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 12:05 PM, Laurent Vivier wrote:
> +        QEMU_BUILD_BUG_ON(sizeof(*hde) < sizeof(*tde));

Oof, this triggers on i386 host, aarch64 guest.
Sorry about that, I'll revise.


r~

