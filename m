Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C43A74F3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:21:29 +0200 (CEST)
Received: from localhost ([::1]:34060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lszdo-00009s-FE
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszci-0007gg-Ep
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:20:20 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszcf-0001Qe-QX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:20:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id u18so12169518pfk.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B/dQKAsktJUd6Gp9XBmSZdbig+1Lzij3S4ZNIYtTb70=;
 b=Cil0Xum9LA6uvS3jtv9OjDOEpYeBW7fjWwspMVhGu6/9khqimLCjeTbyE7jeFJ2Mqz
 EF/UsKmYdpLlrXCRoAs6XkACJuEpoNURo2iDV5AXnZ4RHQmQj0t8Z3OdZq7E/BfAd3R2
 HWW2YIogCfe7mtIc2OCL59fEi+YoRhpL54qHweXO+ZYH7Vczaf0B7VVh3rrpmw2Iko0e
 J0AHu2F0ly03wA03V6RM6rr+r0EAuV1FJnAd4yzxiSbAj3eUyqXp68Qr1V3aRspqP/Iw
 7hJYRt6iRbYbqgKzjuXe43tpU4PrI1Kr0jgp91Oyd4qIWXplLHiuTcP5AvyIExyHG+gO
 rdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B/dQKAsktJUd6Gp9XBmSZdbig+1Lzij3S4ZNIYtTb70=;
 b=cLDy4rbs0zxSbn5ZIDjgMRY+iEIEo2AH+3zYVnebxi3S8vUWd0FSCvI50as1scDg6i
 3GwJzf9jCUOAy+3MgtAoIp76HwYoFRWLO15dxn7JMl0f2O6CiqNTjj900s5z0q/uo39q
 UvxoHewOTFYxNSAvqGgRFndf/0fgIu77e/8ClQGAd53EhDo8YWWdO49J/AQbCMR7zFSY
 ifrKUVcCF6eltqaE4qmiBjxkLwE/aWDvL5bBYgJssYyxgUUaJTCWp7eVeWUoxtw7Wi72
 kuRkq/fUR/cEr+c9JQW3RQw5r1gVnH1apg80S88c5UI3nF1sEyr75vhQHJB0D4LrOtfo
 OqHQ==
X-Gm-Message-State: AOAM533CGELFOWOyChoi7YCDoDK91Ggc5HsReDIO02E54Nw49HGEXBIH
 qQc4YolVYyK5SrJBufWA3SLwyA==
X-Google-Smtp-Source: ABdhPJwmikI0zRrq3k3YRZ5ql8DxOIOFXKAxPKDfFAWo6rueUFBR1FWAX/F5iNd4HCwp7PkWOHl7SQ==
X-Received: by 2002:a63:1324:: with SMTP id i36mr20009434pgl.44.1623727215891; 
 Mon, 14 Jun 2021 20:20:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ls13sm12650559pjb.23.2021.06.14.20.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 20:20:15 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for radix
 mmus
To: David Gibson <david@gibson.dropbear.id.au>,
 "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <YMgFO37SzY1KkwQc@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61359cca-19fc-8f2f-0cf6-ee520fc356c2@linaro.org>
Date: Mon, 14 Jun 2021 20:20:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMgFO37SzY1KkwQc@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 6:41 PM, David Gibson wrote:
> I think move these to mmu-book3s-v3.h, since they're correct for both
> the radix and hash sides of the modern book3s mmu.

They're also correct for all non-booke mmus, e.g. hash32 and 6xx, which is why I 
recommended internal.h (or some new mmu-internal.h).

While neither hash32 nor 6xx have HV, and thus there is no second tlb bug, it would still 
be More Correct to use mmu_idx instead of direct references to msr_pr et al.


r~

