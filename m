Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A437FBD0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:53:17 +0200 (CEST)
Received: from localhost ([::1]:38996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEaK-00013F-2x
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEPo-0005zb-3k; Thu, 13 May 2021 12:42:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEPl-0002bG-T3; Thu, 13 May 2021 12:42:23 -0400
Received: by mail-ej1-x636.google.com with SMTP id k10so9531148ejj.8;
 Thu, 13 May 2021 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XaUewCuYdDkkPYVD7Il5c/sB1jFlTRrCYYYPV7aDMKw=;
 b=Fd+bZMgklPEGNf6bXce4SmFDB1DgNMIj+73YwJO8a0emfXOekwvlF8K+5aGJFEEi+3
 iIhwKcK4mD3XhY8kpf9odz1yZwe6rk6kTIKZTi/rLt7wKxeojJRmrLz/M0FMWWyk6Es4
 In+4tqfzhmDIZwxB3ciNjqhRyKZcAwujpy5Lw/R2oH/XGp6z+gKHK9vxAFBg1YQjQGi4
 bDW77UJ5N3p6gNVDD2Q7SK/QllmTLoXNnhK17Pjix+G3ROINMrV0+9F+/KwQnpK2I5dy
 noqs3Bmx3KAGLAc9bbmB+vqPAr4ioaBf2v0EUJIjAxlVhKH1qjNqqpdL4S6I5GgFFgsv
 0uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XaUewCuYdDkkPYVD7Il5c/sB1jFlTRrCYYYPV7aDMKw=;
 b=YueLwtzUI9LZLXUrWvK8Vn5dbkpt/do9OelfYuSBd/UC+cJrvJwQivVvqiLvuvpnjB
 ZPpVFOd4SB9n5/1mB3kvYl+djB4A98ettSCWi4HcClJKhzrPABc9iFw+Nj2G4lZ62iIX
 2MigXZog06cHfXth4/ioGmLnkN692bFJ9DWUt3ytP9GuTxqYLCunz9BcflwUgN/LiZpP
 rrWAlNKz6IKpevw9PtnxzUWXZSwu14XsObbbxuioRnkRhpNNk0cKzBo9ySX7UlhGJGt7
 TwLeZPkO0UZ+Al6BHbL70yk4OnXge6fsiaJxsqzOAm/cvIngKqY/5kSq0ZhQew4YVqu5
 n66A==
X-Gm-Message-State: AOAM531jVDYTQGxyayWjoJxzm0+dR/01DcqKp8lK6inzKiJ73hZc5hgU
 u9GspsfnV3FwjVKR81JQ9t4=
X-Google-Smtp-Source: ABdhPJzbtUXD4xr831YzfBeGTT4vTOTat2Dw+adXXueJtros0LDY+v/SzuWQvzZIqZ8tlK1wEo1PyA==
X-Received: by 2002:a17:906:6854:: with SMTP id
 a20mr43286894ejs.329.1620924137349; 
 Thu, 13 May 2021 09:42:17 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m13sm479827edc.60.2021.05.13.09.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 09:42:16 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] hw: Convert mc146818rtc & etraxfs_timer to 3-phase
 reset interface
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210502163931.552675-1-f4bug@amsat.org>
 <89ae6ce0-7959-0d74-2f14-f5943a74bec2@amsat.org>
 <7421b58c-d777-3295-4139-cbc95a63ce2b@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6de80350-cbdb-caa5-f968-db7781c05b2e@amsat.org>
Date: Thu, 13 May 2021 18:42:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7421b58c-d777-3295-4139-cbc95a63ce2b@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 6:03 PM, Laurent Vivier wrote:
> Le 11/05/2021 à 05:29, Philippe Mathieu-Daudé a écrit :
>> Hi Laurent,
>>
>> I addressed your comments from v1, and this series is
>> now reviewed. Can it get merged via your qemu-trivial tree?
> 
> Yes, but next time cc: trivial to be sure ;)

OK, thank you :)

> 
> Applied to my trivial-patches branch.
> 
> Thanks,
> Laurent

