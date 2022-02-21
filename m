Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C44BD96E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:32:01 +0100 (CET)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM6v9-0008UH-El
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:31:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM6qn-0007Bj-EX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:27:29 -0500
Received: from [2a00:1450:4864:20::62d] (port=35632
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM6ql-0003J4-M6
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:27:28 -0500
Received: by mail-ej1-x62d.google.com with SMTP id qk11so32479287ejb.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 03:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QfeSKBfr69eMqbyFaTz5YnZJH5NzZ8fhqbreHY3byjI=;
 b=MSznNC5HegD8Svgn4sUDS4Bu4iNOlm+gxU537OVUCVYrWtsWodnHSYSWmGoDZZDDqi
 1vEISyfUkc5LgW/NyTCo9Hjm1rEHSRWmObCSZxnAKC1Gl+D3fkEzewf+pbDdiOde+zq1
 EgmLSwJNC3EZJsXwxz6liaAtv19ws/xHUa95hblxD8ghqz35vWgLv2ZOAATxjU2349HA
 VI5GV58ueOBDMLo/VOtIu9Ku92TQdLzMn0vpUExTr77JzHHi/CagwLHEL8BvZXDsmzKO
 1FXn4qi7f33Zhkoh/V3HdzIogFdoVyQIuddVfhwasqBBFT8bkzbH+Qg7H7wN8KX7VATs
 sRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QfeSKBfr69eMqbyFaTz5YnZJH5NzZ8fhqbreHY3byjI=;
 b=dCt4lP8Rr8MXrdhTfSLrskHwoCjMxuBjpePJkj7LmLsbe33oVid6X4VxYfhkyRTMvv
 hXKoZ1trNFkg3vVvkZbcblyDgBtcZRFvsEhNw4PsvgeRTLoFRmAx3RB9IrHBzU1gEzzE
 sj9qI35Ur2pg4xVjb24DjYTq2lP32R3Y9CTa8Iuv8+2QkAXLjBLaTm4CJ/lWKQfclK6S
 8JYnG4jesehbhknEEL88kCB2o93q0STnFo9qwGVr6xPUWzzA1Koci7yzBz7Wuib3kKhi
 dGhhad8MplMDFET5b897/PG89tatmEu/+Hxtznd+5E29yjHQ317AOdQcMnXiOsTF04G1
 rOGw==
X-Gm-Message-State: AOAM530/gU4eOdgSq31b+9vmQuFz1LCBgE9ukZF3vWsw/DVyGC1zoX9n
 YPsLLQuA3Mghhp6otMO0BR8=
X-Google-Smtp-Source: ABdhPJy1a1fr5rvP1zV+9Elve2Asci5szrpa6j1SxCnD+WZZ57oIEbX9PKf3IB3Lgi0fMneOzLQDaA==
X-Received: by 2002:a17:906:4d8d:b0:6ce:8c3d:6e81 with SMTP id
 s13-20020a1709064d8d00b006ce8c3d6e81mr14875391eju.205.1645442846235; 
 Mon, 21 Feb 2022 03:27:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id r8sm8223822edt.65.2022.02.21.03.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 03:27:25 -0800 (PST)
Message-ID: <1b38c5ea-d908-fe36-05e1-022d402cedbc@redhat.com>
Date: Mon, 21 Feb 2022 12:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
 <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
 <ad4e6ea2-df38-005a-5d60-375ec9be8c0e@redhat.com>
 <CAJSP0QVNjdr+9GNr+EG75tv4SaenV0TSk3RiuLG01iqHxhY7gQ@mail.gmail.com>
 <d2af5caf-5201-70aa-92cc-16790a8159d1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <d2af5caf-5201-70aa-92cc-16790a8159d1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "libvir-list@redhat.com" <libvir-list@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 10:36, Michal Prívozník wrote:
> Indeed. Libvirt's participating on its own since 2016, IIRC. Since we're
> still in org acceptance phase we have some time to decide this,
> actually. We can do the final decision after participating orgs are
> announced. My gut feeling says that it's going to be more work on QEMU
> side which would warrant it to be on the QEMU ideas page.

There are multiple projects that can be done on this topic, some 
QEMU-only, some Libvirt-only.  For now I would announce the project on 
the Libvirt side (and focus on those projects) since you are comentoring.

Paolo

