Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C843C47B54C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:38:19 +0100 (CET)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQMM-0005jK-VA
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:38:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQK2-0004vz-4E
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:35:54 -0500
Received: from [2607:f8b0:4864:20::1033] (port=36744
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQK0-0002NV-H8
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:35:53 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so468539pja.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=o2hfFaIb/BeH6G0NVmLZDJKlxEIGSRdSrhR9kZ6yFZM=;
 b=svxXNG7K0N02bgi42++8bahfa/dEpwLOcu2yto0NTBkbqmrRqzdvK8aiGbwkwZ2W/o
 4rTPocAofZ0KkdOIYtVz35tZDnQACDhkbVO8JHTWnAPE0VNeBGhGCoEByCOGQ47AuzT1
 vQsV1+ujQYAeRPkuDmFR3i+NGzjxm+wH0B2VQU57nsGKLH5DgVthnam6a9xIy1d1X0tF
 1ruaGtAYowNZVEWIlSk9aKetedCRhIUyBNjST0RKIjbmD2HAyzhjjWIdi8fLoFt+xugR
 bKMvtJrSuYhKt+WIpvZC1MZPRdGfudpQRkaP/sWqhZvNv0eC80wP4d/HGtV0p3cbzHuL
 R/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=o2hfFaIb/BeH6G0NVmLZDJKlxEIGSRdSrhR9kZ6yFZM=;
 b=PZ1tM613vfhvZfcZZbXqRgCPVVZ/FPW5lauw9WxTBxPMSewfm5wDs9yQoJHf6HRl0W
 Fy17UutZTDaYyGC5MVoAtCi4IEwmEA72v/9S0mjYRLy6TYLeT/ecn65X//MDsYazIEvS
 Tt4wj0tzhCgfjt38aQ6OjrPMhRkLmG39MO0rc3J5yHS6pOUZa+JlzQeXFtms+j8UUnh1
 sgChdYneo1Sak/KRMiO9wjY4+wDkn/Ewh4hIr0KXc3r8PCbU2LH6VNUIyTvyHegV2Eqv
 dX3eO0Uf6NL/f75AgOC9b2malcdve9ax+oVgHX238JeXwXRpFgwwh5CiuvzLzBbnL1Bo
 9f+w==
X-Gm-Message-State: AOAM530M/gTL6Y7PlkqYXMVRec6CueDUVuU6dI73Dm/hZiZeGVWf0+66
 LAd/Ryj2FYcYIgt4k+ah8GvKPw==
X-Google-Smtp-Source: ABdhPJz/B/EembSE7EH4LOB9qhH6nntRLB9PCU49ThSsvYM5kPvUMkf/+HbGeWFQnv6rppRlmGo2eQ==
X-Received: by 2002:a17:903:32c3:b0:148:fb8d:c44d with SMTP id
 i3-20020a17090332c300b00148fb8dc44dmr11452461plr.0.1640036151010; 
 Mon, 20 Dec 2021 13:35:51 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q5sm8183712pfu.96.2021.12.20.13.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:35:50 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-devel <qemu-devel@nongnu.org>, clombard@linux.vnet.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: powernv gitlab ci regression
Message-ID: <461a77d6-a5d2-0ba1-de95-bc8cfa5fb83b@linaro.org>
Date: Mon, 20 Dec 2021 13:35:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi guys,

Somewhere within

> Merge tag 'pull-ppc-20211217' of https://github.com/legoater/qemu into staging
> ppc 7.0 queue:
> 
> * General cleanup for Mac machines (Peter)
> * Fixes for FPU exceptions (Lucas)
> * Support for new ISA31 instructions (Matheus)
> * Fixes for ivshmem (Daniel)
> * Cleanups for PowerNV PHB (Christophe and Cedric)
> * Updates of PowerNV and pSeries documentation (Leonardo and Daniel)
> * Fixes for PowerNV (Daniel)
> * Large cleanup of FPU implementation (Richard)
> * Removal of SoftTLBs support for PPC74x CPUs (Fabiano)
> * Fixes for exception models in MPCx and 60x CPUs (Fabiano)
> * Removal of 401/403 CPUs (Cedric)
> * Deprecation of taihu machine (Thomas)
> * Large rework of PPC405 machine (Cedric)
> * Fixes for VSX instructions (Victor and Matheus)
> * Fix for e6500 CPU (Fabiano)
> * Initial support for PMU (Daniel)

is something that has caused a timeout regression in avocado-system-centos:

>  (047/171) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '047-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8', 'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2021-12-17T19.23-... (90.46 s)
>  (048/171) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '048-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9', 'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2021-12-17T19.23-... (90.55 s)

See e.g. https://gitlab.com/qemu-project/qemu/-/jobs/1898304074

Timeouts are especially tedious with gitlab, because they're not usually consistent, and 
often go away with a retry.  If I don't see the same failure on my local machine, I often 
let it go.

But in this case, the gitlab ci regression has been consistent, not passing a single time 
since.  Which makes me think this is not just a ci artifact, but that there's a real 
slowdown.  Could you please have a look?


r~

