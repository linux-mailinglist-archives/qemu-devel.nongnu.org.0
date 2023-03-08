Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06296B1595
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:49:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2Zy-0008Km-Sl; Wed, 08 Mar 2023 17:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2Zx-0008KV-RA
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:48:13 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2Zw-0007Ow-6w
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:48:13 -0500
Received: by mail-pl1-x62d.google.com with SMTP id n6so81005plf.5
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 14:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678315691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1pmyFb/Vg2laQ76iU6XBgWA6lQ33YM8+Mwj3t6uf8OQ=;
 b=zGUVJlHB1KCOHRkgXLK3cjE2MqBKodcZTQF/YPkCjzGMZXoYjzut7ZwNw+mlpNRR3j
 RAg2syqNgINFUp47RIPF0mt77+tXIQ+RdiXaT0H4bXi0jDeCbyDdpAQaIZoU/2VZnxgq
 H7qEKZYXzlQ3dyx7JQ8MkHBukmi+VcbiKh+RtjKaFAWMzKK+S3WmtLOuLyDLd8GnJxGy
 ADOqZKncmwucVn/gsgXr4EnTY88sSliHRYsJRdn392fHWenIJoPjeLmUzBLOUSM08CyP
 8Zw9OSPNEoZ+RWDOYfET3/wG36gnpKVor0TJU/pXo63dlvpDI+pJmNKflAntE/5O3ntW
 TTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678315691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1pmyFb/Vg2laQ76iU6XBgWA6lQ33YM8+Mwj3t6uf8OQ=;
 b=Dh2SGO5KHDFj1GFNxrYBMWDbN5KD0vK3NhIFCih2oiR4gw+1Ik7d9mX+fuC1zsPTi5
 3TZMmpkyIE/PEVt9cXPSbgMcLERh6GIIi5BHc9GrFji5ObjvES+LuCC6vecLp/iH6TyX
 g8sMDBwWpjvPdMTL54fIL7d4F/wIOIQ9yYtLIMBO7CxXIbLqnvAZj82aKiv9D/YSASek
 HlEyxc1l3JK19xU5VXL46s9CUy3Pnn1+htt5Gwc+7zeI48xVCMqYqZoFt8kJRy8QUVBn
 Ekly4zJzC/koS+kIhlUKj29TtsgBCY2AP+3Ht/qnf5ccymaethr7ob6PA6PsvdhKnY8j
 k97A==
X-Gm-Message-State: AO0yUKW/sDpAr921GOBulCUbxmsHjRxv3eStZs+HRmiQqDU9aH6x+BAC
 dBzq/w2qzFdfXivw2Y1fPgeT6g==
X-Google-Smtp-Source: AK7set/p+50lJVzuAmOXY4J24K/g36zS4AA8V32boBiyTWQ5Am9+rnIt1BmQJPkCcuK/65FwP451Bg==
X-Received: by 2002:a17:902:c24c:b0:196:725c:6ea with SMTP id
 12-20020a170902c24c00b00196725c06eamr18176804plg.19.1678315690641; 
 Wed, 08 Mar 2023 14:48:10 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:acd:bde4:fbf6:cc41?
 ([2602:ae:154a:9f01:acd:bde4:fbf6:cc41])
 by smtp.gmail.com with ESMTPSA id
 lg12-20020a170902fb8c00b0019ad6451a67sm10274500plb.24.2023.03.08.14.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 14:48:10 -0800 (PST)
Message-ID: <a870c3d7-7584-2a48-213a-d55310c1f9eb@linaro.org>
Date: Wed, 8 Mar 2023 14:48:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] target/s390x: Fix emulation of C(G)HRL
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <20230308210226.2847503-1-nsg@linux.ibm.com>
 <20230308210226.2847503-2-nsg@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230308210226.2847503-2-nsg@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/8/23 13:02, Nina Schoetterl-Glausch wrote:
> The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
> halfword, it does not have the same size as the first operand.
> 
> Fixes: a7e836d5eb ("target-s390: Convert COMPARE, COMPARE LOGICAL")
> Signed-off-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.h.inc | 4 ++--
>   target/s390x/tcg/translate.c     | 7 +++++++
>   2 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

