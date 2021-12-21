Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9E47C99F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:18:06 +0100 (CET)
Received: from localhost ([::1]:52496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoOT-0005Tb-Je
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoMI-00035u-Dq
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:15:50 -0500
Received: from [2607:f8b0:4864:20::102d] (port=52149
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoMF-000700-Vw
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:15:49 -0500
Received: by mail-pj1-x102d.google.com with SMTP id v16so616387pjn.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5BSdRVlat+IjQ4mnodSeJI31WdxkmI2IoT8cWZuaDDE=;
 b=cwPMus3kxkXg1nePPmH3g3sE12b9z3AgJJn5LVvR/UGadbEm9YFts01DU6429+FRWQ
 yCGBW4ywJV8KQ5zf/BCw6QcfEDF8fa+hab+MN3WeCmRbU/dcC6bzdnZkZaicn3PKSoxs
 M9Kvy76cE+j8a8/pVe6Eoh/AyEyLJsm37FgxsGQmGmpLM6mu9xOy8V/pifoZE9uWDmCj
 szX9lVGT1vD4mbeyK76ur0MWKtuozy9uCElEWCV+gzAfhC0ZKcnsb6Uzj0P5ne1kOoJq
 o3Wqlc4qv2+S1oGtsVxLAE7n9ofUXRNqVp9vMgwcMD7GcUnu3JBEERxmgwQlytEESalf
 ebog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5BSdRVlat+IjQ4mnodSeJI31WdxkmI2IoT8cWZuaDDE=;
 b=cr+857pVB37w7bDHmOiNtqn/amgDjGWtkdo0fzPUr1IkcHBVNFKpzb4vJX6KqQG14E
 jsSzBKM4IYm0lgjRSW2riNbKd4RG56j9QpKLoIr0jvs6cf/Hi+YJ/fu9099/MV6fLB+Y
 gVzawmCEnzfgEAy1/CulFrd1kW96EnWw5H7J6CD8NN57LqeYP3v0agGm2Ilv0y13Tc/0
 X6OdMpbYsMOpHndgk6c1XLoI8gl4IO+jMvk00x0bjLanuk8PcTD9LLrlNwtj+YS5rxCI
 pS/j+MGdz8YN0d0ETKzNJrmaKAP9xSg3/3YIu0WwQn8fvhkI3HYZn6etzW15kjsg+xsT
 9t4w==
X-Gm-Message-State: AOAM532dtxpuksXPboyZBJaKb8E44oDueQjyP3LZugqm0RB42RHVBX8r
 3Hw//3wD4TrYjSzKgxljZ5T3nA==
X-Google-Smtp-Source: ABdhPJytrEQxoJW7Wlv0swbys5GFCoSHG+OjIhX28WawIaTPODw0I3ZOJgn9CDLxlCnGH+cwBp57nQ==
X-Received: by 2002:a17:902:8b8a:b0:148:bd36:94ed with SMTP id
 ay10-20020a1709028b8a00b00148bd3694edmr560954plb.44.1640128546798; 
 Tue, 21 Dec 2021 15:15:46 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id k141sm157766pfd.144.2021.12.21.15.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:15:46 -0800 (PST)
Subject: Re: [PATCH 3/5] dma: Let ld*_pci_dma() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218151053.1545962-1-philmd@redhat.com>
 <20211218151053.1545962-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0fd383e-4d7c-a034-d497-b376a73a5654@linaro.org>
Date: Tue, 21 Dec 2021 15:15:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218151053.1545962-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 7:10 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling ld*_pci_dma().
> 
> Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/pci/pci.h |  6 +++---
>   hw/audio/intel-hda.c |  2 +-
>   hw/net/eepro100.c    | 19 +++++++++++++------
>   hw/net/tulip.c       | 18 ++++++++++--------
>   hw/scsi/megasas.c    | 16 ++++++++++------
>   hw/scsi/mptsas.c     | 10 ++++++----
>   hw/scsi/vmw_pvscsi.c |  3 ++-
>   hw/usb/hcd-xhci.c    |  1 +
>   8 files changed, 46 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

