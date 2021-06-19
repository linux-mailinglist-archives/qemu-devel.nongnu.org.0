Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918813ADABE
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:52:12 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ludGV-0001LJ-Kk
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludEl-0007um-KB
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:50:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludEj-00031z-Vt
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:50:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c9so14327730wrt.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QUuLj/7+B3vZExjdfuvxfg1zKYBNK090eaI4Qp2sbqY=;
 b=QAmYYjJIpG5QatrHBqCcUd7nZIZamm9Y2VdG5ukHqV2fDGZnx75w5/cCSNj1HCcvE9
 5PZqoXiIc/AMJukaLyp7hBzthd6wZv4YCD3DuwOuzPWhpWxXlNII3N3ASJ+TXmWdwcIj
 KH+VCQCUQWws6fUFTbCNNG6bhRNl6fu0678JznXr0+i4hycFb5q3twaPEtbd72mYliDA
 +PjPLDzocNhe7Zqs4ZLEFNs07lUPqXdcd8pX1YOsmNpoUS3CY7f9A6YN3dTjRph8prFL
 5r2lLWrKqAJGaI6jz8f0hiCsodk9JUFb3gx0CVYc5Bj0LbryJ9RDRLj1T7ZMkZyuJUZB
 9nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QUuLj/7+B3vZExjdfuvxfg1zKYBNK090eaI4Qp2sbqY=;
 b=HTjyrTmx3GFmvPLcAnjSTBHXLcEyXh+2m/c7BJokKyvhInW30OuWDMePTaLiWZJohz
 7lII+q1MOKyhBDQJxzeZB7eYq3cYXWCmkGxytnIq/MagR0IrbN3DnZaLPhKM65YIglGl
 D0OTtDvTCSzrg9ZGhDob7tQztfdzaoMHqamygQLe2EggNeLg8WgoFNHYy510FhHgixRq
 UaSG0ziPeJdpzszuBnzWaG5aTV/+ovKh1aZIqhtbHbb+/bFdN24VRFcFBzVvc+e/hIqE
 NOjn+GvL6R44tNLjILLyHE3SQFD9NfaQXEe63oo28GfWFVWYCJ568iMpQM3sl7MWYJhs
 3fwg==
X-Gm-Message-State: AOAM530PuwIAGxJ02EJzRp5W81ys1e2oFPnqkP/vQz1AvUtBSXGEeg+e
 VxPFAnMIs5i6nO6mi+RuGInRyyrkUNO8Uw==
X-Google-Smtp-Source: ABdhPJzGdn7oJdw/ItLm3YQJ1qeWSupUw2FdEeNSYxkETzCBirS9AZTYbqN976tIwsgbqe152pPIPw==
X-Received: by 2002:a5d:6a91:: with SMTP id s17mr9245151wru.364.1624117820363; 
 Sat, 19 Jun 2021 08:50:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x1sm10378161wmc.31.2021.06.19.08.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:50:19 -0700 (PDT)
Subject: Re: [PATCH v7 12/27] tcg/tci: Reserve r13 for a temporary
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <38d9ccf8-157a-0fba-7e63-df0599276b66@amsat.org>
Date: Sat, 19 Jun 2021 17:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 6/1/21 5:00 PM, Richard Henderson wrote:
> We're about to adjust the offset range on host memory ops,
> and the format of branches.  Both will require a temporary.
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     | 1 +
>  tcg/tci/tcg-target.c.inc | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

