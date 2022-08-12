Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6E59152F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:02:45 +0200 (CEST)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMYzb-00026E-TJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYwO-0007LM-77
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:59:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYwM-00053H-Js
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:59:23 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so1597604pjl.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=xIZxyPEcVNxzlWwb/ROE99ceXSCjc1BRbUMBIh9l3SI=;
 b=f0gPFCae84dPdx5PQXIDQh4CNn1w0zn2A9ZDDlejfagVawYayeA+Jt8Q+btZjQ9aCb
 SACe73lPbdCXZi5/QGrXeGfK7cgbPwoyVMVbyzEWqnKpouLJOAPHwenxasZ1esSqAVPN
 WraqYcQyTxvue1u6ITWGWZ98XGB8MpnfTITv1yIqHM+Ko6KWMS++FsSEvRcp1RCcJISW
 zoW1k1V3vNi3N0xK1HNJveLjduJzKaV6h1aojnXbTff+iks1iH8ivRq7PEjuOnaUu9jJ
 Gw+v7Ev8Bz9cUKLT39PcO9+f/nZmGHBabTXrh5rP7/PfcGs1IUgbuF5fVzz62O/F+rTM
 Asug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xIZxyPEcVNxzlWwb/ROE99ceXSCjc1BRbUMBIh9l3SI=;
 b=79OOglAkorXabSV1icK4gqeyps/FZKiWO7PCtH3twELIWZcyZYj7Kvkr+k8lR0N3JY
 HHZACWEaA7HsU4dj2h2FjCd9vjV+0hylNKDxhF4eWnCxth+LlqWYi9033VVSJhjc8WdT
 IyIgL8EF5jQkh4ihhX6I+vBmRBedIBrYAA5dxLs7mdnXqy9ciLrHAJXghJ/sQnBWjl5M
 SSB5CslwZRkgDFIBAGt3MLb7mmWvmGxqrpjhYdQFEqIE9IXJM7tBvw2WVcjObwWq6aDf
 r8DxhsipfeokVF4YPz4Sht/zP08hAP7v+45Fxu651it+NvZybKCL/2mK+AU1yPwNyIB3
 /1+g==
X-Gm-Message-State: ACgBeo1bDG4fcetMmq1HJgzB1H9LiTA5WZxcT2oS/KeJ5GAj228XJ1vv
 5S7Jog/pGzj5leK0SCSrJOG2+A==
X-Google-Smtp-Source: AA6agR5DoSbBAyx1GIE6HD1uTklVEe1QxpK1RPzjfsM69XjwFYHHGmQNBH+wn8LJPBqWtYjaBn1PAw==
X-Received: by 2002:a17:90b:4ac7:b0:1f5:3441:d11a with SMTP id
 mh7-20020a17090b4ac700b001f53441d11amr5145908pjb.182.1660327160918; 
 Fri, 12 Aug 2022 10:59:20 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a17090311c400b0016bffc59718sm2094109plh.58.2022.08.12.10.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 10:59:19 -0700 (PDT)
Message-ID: <26301be8-ca14-290e-06a2-0ad22f525048@linaro.org>
Date: Fri, 12 Aug 2022 10:59:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_EXEC
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220808171022.49439-1-iii@linux.ibm.com>
 <20220808171022.49439-2-iii@linux.ibm.com>
 <6e3e5974-15eb-05e8-a005-942884732fef@linaro.org>
 <23d43d7cda9293eca9afbba91c50f613d004a407.camel@linux.ibm.com>
 <0070ac70-9c86-b360-e877-3d7e01d176ea@linaro.org>
 <7f42b244079087f3a2e53e67871dde377d8402cf.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7f42b244079087f3a2e53e67871dde377d8402cf.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/12/22 08:02, Ilya Leoshkevich wrote:
> tb_lookup() skips get_page_addr_code() if tb is found in tb_jmp_cache.
> I assume it's a bug?

Yes, I think so.  I've rearranged that for other reasons, and so may have inadvertently 
fix this.  I'll post the in-progress work in a moment.


r~

