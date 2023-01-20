Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A84C674E04
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:25:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIllW-00020M-69; Fri, 20 Jan 2023 02:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIlkv-0001ub-AW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIlkt-0001Uk-CR
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674199446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hij39TenzvHzbMcn00v54PqY0bRS8nLnB94MIVXjjMM=;
 b=OkUYumuPOLtHSuRTp6keM7J3wA5o1w3Zd4I5d5CSQuCcGx5E003n83gQ3PZ+UQB3mVRscK
 dzpHsDci6Y5QtgfZ7cCR9a4psRP0/myLI4I/SM61m+2ipDapfzb93RfUnQlS78U8nv2Q5C
 57so5T9Fli8J5OOalohP3nWOZmd1HrY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-hZSO3s_JMvKKqA5TMTAZLg-1; Fri, 20 Jan 2023 02:24:05 -0500
X-MC-Unique: hZSO3s_JMvKKqA5TMTAZLg-1
Received: by mail-qv1-f71.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so2146467qvb.20
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hij39TenzvHzbMcn00v54PqY0bRS8nLnB94MIVXjjMM=;
 b=zC+PUOWDUJRzePmkVt64zlYr3jTHnthbnpXsyrShZhISm4JaLO4rbhlhOWL0xUwR/E
 FUiOgTKVREcu0NwRUzvnDCEmBUKrrMoHycuui2G04+ZttJDTtmXHchVDbp5iWqQhCcVL
 WLxSbicln/b7HvoVyf2Usld0ktP46XWS6+M440a88QBI3Pk/Bg7fEtxJnZTgYrJWn1ws
 fBodLoJdkms1EgXGEv7mEYbKJ2Up7s2qjAynR2EVnNv8H51euB7i/kMIGVXuZyzW/bK1
 6ufieIWGwyf4b8Jnmwm7Jl0VfLCbe6cE4V9U15QwQcfzDnHMOkh+egGAmW3WKVoMpek8
 pMAg==
X-Gm-Message-State: AFqh2kraoLFJwNC3OjW7apEMWt9y+G0O3kzJokAtGWSvs63xrGKMkfY/
 9j2lQWyEyrIr+tZfv4JaiyrhZVID3/5loIJ6vpoCIsvz64YB73jAslThvMjnZZ5GMk8Up/UsmyV
 lcMw7YPOEnX7mRAE=
X-Received: by 2002:ad4:4f24:0:b0:531:af57:3109 with SMTP id
 fc4-20020ad44f24000000b00531af573109mr48987964qvb.7.1674199444874; 
 Thu, 19 Jan 2023 23:24:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu1yCyvC89bvjmWW70bR/b9bFBAm521T1Tt7PVnmR+9L7c2HmVKlZGlVuAZnVM8CvPDhEL65Q==
X-Received: by 2002:ad4:4f24:0:b0:531:af57:3109 with SMTP id
 fc4-20020ad44f24000000b00531af573109mr48987943qvb.7.1674199444613; 
 Thu, 19 Jan 2023 23:24:04 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a430c00b006ee949b8051sm25457987qko.51.2023.01.19.23.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:24:04 -0800 (PST)
Message-ID: <9494369d-a498-81f7-0cd8-1cfe31029c2a@redhat.com>
Date: Fri, 20 Jan 2023 08:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20230111083909.42624-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/4] bulk: Replace TARGET_FMT_plx by HWADDR_PRIx
In-Reply-To: <20230111083909.42624-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 11/01/2023 09.39, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Fix checkpatch style violations
> - Use HWADDR_PRIx instead of HWADDR_FMT_plx (Zoltan)
> 
> Supersedes: <20230110212947.34557-1-philmd@linaro.org>
>              "bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx"
> 
> Philippe Mathieu-Daudé (4):
>    hw: Remove hardcoded tabs (code style)
>    bulk: Coding style fixes
>    bulk: Replace TARGET_FMT_plx -> HWADDR_PRIx
>    bulk: Prefix '0x' to hex values displayed with HWADDR_PRIx format

Big sorry, I picked up v1 for my last pull request before I saw that there 
is a v2. But IMHO it's ok to have a separate macro with a %016 included, so 
I'd rather tend to keep HWADDR_FMT_plx. Anyway, if you consider the other 
changes in your series important enough, please rebase them. Sorry again for 
the additional work that this might cause.

  Thomas


