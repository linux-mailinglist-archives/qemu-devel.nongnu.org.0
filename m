Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1498926A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Aug 2019 17:57:47 +0200 (CEST)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwqE7-0003CF-3v
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 11:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hwqDO-0002kp-GW
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 11:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hwqDN-00037r-F2
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 11:57:02 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36788)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hwqDN-00037K-7n
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 11:57:01 -0400
Received: by mail-pl1-x644.google.com with SMTP id g4so453458plo.3
 for <qemu-devel@nongnu.org>; Sun, 11 Aug 2019 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZuWbFWmgqAWMkxfhGzv8L4uAtCYgdyk5OR0YxlBIJdY=;
 b=g2pbPQEbpC0WzU0q3m7fr8IC+/uURYHCF0xwXnvB/Q+bUtscZHFz0gBqowg4nP+eGA
 IgBDFFy6bYDiLdRz/7yBcR2xYbxzeC0yJdJIwkRNHWUFFuPvvy6zo5Q1Lnzr0wHszko9
 TwbmCSVfPJaEa3lxiSApJGAvFCRu12r54zCPeQ7NLTOCmhKJMkekmnfU/wlI5/yoloRV
 jSZamQoImKOH88bx2NV825/EcvLmXRAWSCw/fzig5pqmDZNu4Q7gY/GQf5o6uj99+iED
 yerfAJdRD7f1P0RovMnL3WPJ15DWV4v9zlxSDcGoHdvF3Y/ZFIdJHKfsdlozMnIaAVxi
 qpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZuWbFWmgqAWMkxfhGzv8L4uAtCYgdyk5OR0YxlBIJdY=;
 b=MrmAAfT40trngEtCpUQlBRsRoZuEl/Bcrgut8y9GagahlpbnNW6QJbxQLbmoKGZMgB
 Yae5eCk0RUiOShSnJrCU2H9xpjXnyEdI17UxND6CwIDrBnPYh+FtJJjhu5UF7Qz9M1WJ
 eGgwnXXHyskiFo49hSVNtJNfYDG6mkQQxT8feO0VZ7bqrCloFXofG+74M18zu/API1ip
 ToVzkowaRWuIvzGZQFAmR/cZw47jCK/iiQw5Ipk+MT0rLFlLSiKdTpa2zyo+vgQAYqAs
 mn+ldHU5bKMGOm9mQgNw3Y+01sNcXohCAGWKLfBIPVp+GPw/FGNA6q8dInhGxe23gUQw
 vMrg==
X-Gm-Message-State: APjAAAWpGEMNvfi4sd7pbb2x1BV2Jo7CUhtXRCkvXsxYCHTH52hmGjg6
 pSEcyWesGPjlBqWCqV7yy/Wfiw==
X-Google-Smtp-Source: APXvYqwcls2XdF8sJqjtoXbLyUr/Q/tQEPdElt83CN1DWDCCb6C8zrMck1IGneklTSxQ0c7DaDiCpw==
X-Received: by 2002:a17:902:6847:: with SMTP id
 f7mr28466996pln.311.1565539019990; 
 Sun, 11 Aug 2019 08:56:59 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v14sm110684082pfm.164.2019.08.11.08.56.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2019 08:56:58 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
 <1565510821-3927-6-git-send-email-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <27a965a8-59fd-b1f0-d73c-16dcb844c3fc@linaro.org>
Date: Sun, 11 Aug 2019 08:56:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565510821-3927-6-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v3 05/28] riscv: hart: Support
 heterogeneous harts population
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/19 1:06 AM, Bin Meng wrote:
> +        /* heterogeneous harts */
> +        while (tmp_type) {
> +            if (n >= s->num_harts) {
> +                break;
> +            }
> +            riscv_hart_realize(s, n++, tmp_type, errp);
> +            last_type = tmp_type;
> +            tmp_type = strtok(NULL, ",");
> +        }

You need to create clusters for each cpu type.

In particular, E51 does not have the fpu that U54 does, and so we need to
generate different code for each cluster.

Because each cluster generates different TBs, you'll minimize code generation
if you do more than just create one per cpu, e.g. pop these cpu type names into
a GHashTable as you create each cluster.

The only other example of clusters in tree is hw/arm/armsse.c.  Note that board
has one cpu per cluster, as each cpu may be configured differently via other
property settings.


r~

