Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76676D4E3C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:43:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNGa-0002k5-8M; Mon, 03 Apr 2023 12:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjNGY-0002jw-Qm
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:42:46 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjNGX-0002zF-BC
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:42:46 -0400
Received: by mail-pj1-x102c.google.com with SMTP id x15so27791382pjk.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680540163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i9k8pn3cwdesRoE4mCCAmWzjzqvnxb2+X+pY6exbt6k=;
 b=JRqcRVn3UiDbPCddLylhYLtPNaQxJAwhoRhya8iKP9q+5gQWbiDoy0/2DbkysJJnNg
 7dQZmjTKl0TajpdrgngAEVDl4iSJLgX3L+S1ZqH9YU8PYtlLXrvc/fDsOEQRO2sp2B+x
 A0KvbhBlcpEiy/cPc+oToq+8UnyPtNXfuDpTZx+qXYjFK0Wz4ij6OqwxFgq2/29cWcRS
 974VHcZoMup8NTUwApgfRFZx8ZBHOIPjtoCdMz8o8440IJ9AcYiu353OdvCAZ3zygPXL
 Z8g4kETxvN3m0pX1l5+26tFGIXRXedGoYQr3yF7hqKLqj2VTYT5xTHhzIVMrNjdZR4SR
 E6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680540163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i9k8pn3cwdesRoE4mCCAmWzjzqvnxb2+X+pY6exbt6k=;
 b=d9QS/0LRugwQneNrxxzy726Mu9tUBYrbhcod3Sw20H41PSo++6IcAV0GcUBZtbzQaL
 oupBcdJpp0RmIz8d3RLLcrASaRn2ap1/ornAgiJjha8zNKY4DpF2Ml7m8GEGSU5FAvQc
 FKs/aOSC3gCulCp2yBofaSWb9G+uudkhbWGfO1mmbJxHxmX+KvyYelodLiNcu4Ernyoq
 +tjAvgnWN4ddDMs0+WF1S654ZBEyD60trvmgm/PpPXOOCoKARTu+6cLMA+tIqxHIvZkS
 p2Nm8PKAbvW8Vi44/U0m05QAO+ppSja5/8m5miHY36MHLlkyNW+35FWlhynASGwkdNS5
 VwVg==
X-Gm-Message-State: AO0yUKUYb3WOExcFpCME0WBOgvFIPqQnpjhf6yXiN6vqV7nrSwGzTn/b
 8OzcndwDNumJwfYj3k512LFc6A==
X-Google-Smtp-Source: AK7set8Y38Yq4A5/hmuzi/KYWIi8Rs/r1IGHBgHyXPxdxJjnZ2SAEfSSHSz7dsqiNvWY5E0jI9hjjw==
X-Received: by 2002:a05:6a20:2d94:b0:da:4d25:8fdd with SMTP id
 bf20-20020a056a202d9400b000da4d258fddmr31913510pzb.38.1680540162828; 
 Mon, 03 Apr 2023 09:42:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a62a509000000b005941ff79428sm7391173pfm.90.2023.04.03.09.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:42:42 -0700 (PDT)
Message-ID: <ada20576-940e-31b7-a762-14113539469a@linaro.org>
Date: Mon, 3 Apr 2023 09:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 00/10] Deprecate/rename singlestep command line option, 
 monitor interfaces
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 07:46, Peter Maydell wrote:
>   * I have written patch 3 on the assumption that curr_cflags()
>     is not such a hot codepath that we can't afford to have
>     a QOM cast macro in it; the alternative would be to
>     keep it using a global variable but make the global be
>     restricted to accel/tcg/internals.h. RTH: opinions welcome...

curr_cflags() is quite hot, called from lookup_tb_ptr every time we time we end a chain of 
directly linked TBs.  You'll see lookup_tb_ptr near the top of any tcg profile.

With a global variable, it might be worth combining with CPU_LOG_TB_NOCHAIN, recomputing 
the global if either option changes.


r~

