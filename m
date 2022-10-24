Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A59260BBB6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 23:11:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on4Uz-00022l-OY; Mon, 24 Oct 2022 16:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1on4Ux-00022P-Az
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:56:39 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1on4Uu-00016H-Ti
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:56:39 -0400
Received: by mail-oi1-x22f.google.com with SMTP id n130so12111548oia.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:sender:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NycT9cGgEBxhDISeih3HNaV4g2OOy1XvoDWELdPPO5Y=;
 b=P2vBXIsPzA67JfR6m66JY0SwLMxVdDJX0RjivGcHY5uKyuVTMSvhG6PhtMAO+EI2Ta
 w8fjYbEddpVFul9PX1qIMw4LrulO8BFDPKDWMMY4JZOJCc5QwM2RT3JHKk0/PKLJbwQx
 zTLwIN5tBU9tMZ7pRtH4aicAh7aOCZApQGIo0XJ9PgEkD5W5OsGxDDnQ5xhjLpBJ+6jT
 rvNjihD3R96r0crSeFuMOP2yucSqPRfZ+TvCH7l8wI+1wjn3zfQWBaSGkdZ8NqrO1DvE
 577CWNhlKjwPfr8/UT+WzuXrzBE8F+wiDQWDtVp8dsoowgR/UY4c9JLG20lnbk5avGjg
 H4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:sender:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NycT9cGgEBxhDISeih3HNaV4g2OOy1XvoDWELdPPO5Y=;
 b=IqeklLOLCR4jVvi7vGqayDCOnQ8qmKGP6q4XAC6YnI6d3bVrGu5UYmPbThB4KuL3IN
 FljIdIjS9WcUK79u3Htz9ZvR5dfxwdYLamtUU5milqvIaQdacozMxQKdiK+TtjJBJbAV
 u+lab3XoOLDGMRAdnkIaZ2ql3tSwPqvtXlZw/a5747IqhcnVRK1mtLMQT0DVVTA6ctEh
 qTGYrM4043gB+r6rwhfG2R2hCDWAV8fj8UfKONJOnhXvyzXW9mHtS3t/vMzGWZDAoUD8
 bZivMTdhnAWHYCyRcNjh/wMZgAhqdmKAMBP4dQOZg6UHwSMvWDJmS6mInxpRwoNpQIcN
 BysA==
X-Gm-Message-State: ACrzQf0u+luHSBMmHYhl8/uEqqEa7Z2VveaHQV7URApfzhwywf5Lx2Gt
 ukSXd7Rsg5GYPzvkGSDsCDHVYaVE0rU=
X-Google-Smtp-Source: AMsMyM6w0i4ue8nRuDShPflfxvwBVvW/dL+tdgDuElO30dMmUx6vIGxbjXRWLU6E7xasRXUWFeBsMg==
X-Received: by 2002:a05:6808:16a3:b0:351:5153:a6e1 with SMTP id
 bb35-20020a05680816a300b003515153a6e1mr31295654oib.56.1666644995082; 
 Mon, 24 Oct 2022 13:56:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a4ab044000000b0044b0465bd07sm415042oon.20.2022.10.24.13.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 13:56:34 -0700 (PDT)
Message-ID: <f9a80497-bdfa-f3e3-1e32-75687d5f7256@roeck-us.net>
Date: Mon, 24 Oct 2022 13:56:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Erik Smit <erik.lucas.smit@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: soc_name for supermicrox11-bmc machine: ast2400-a1 or ast2500-a1 ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

I always wondered why I am having trouble running Linux on supermicrox11-bmc.
Building the kernel with aspeed_g4_defconfig results in its clock running
at ~20x the real clock speed, and kernels built with aspeed_g5_defconfig
do not boot at all.

I ended up spending some time on it last weekend and noticed that the SOC
is configured to ast2400-a1. However, the Supermicro documentation as well
as the devicetree file in the Linux kernel suggest that the SOC on the X11
board is an ast2500.

Indeed, it turns out that all my problems are gone if I change the SOC
to ast2500-a1 and use aspeed_g5_defconfig to build the Linux kernel.

Was there a reason to select ast2400-a1 for this machine, or is that
a bug ?

Thanks,
Guenter

