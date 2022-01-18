Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA1492763
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:43:11 +0100 (CET)
Received: from localhost ([::1]:57770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9olS-0008D3-0d
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:43:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nmO-0006Eu-N2
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:40:05 -0500
Received: from [2a00:1450:4864:20::336] (port=39745
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nmM-0003qy-5p
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:40:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso5417921wma.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NwiE+GDcerGhyhHytDkmThZ/zjw+FHYBww3fFvyZS28=;
 b=pkJdHe0c7yrye6bADlXoN7/zh8Yngt+nKnz2E+RhxD4m3vVSc3jWPsQ3GCQdGkqVi8
 zH7Vdbq9h4GB9qlOTFSyb5X7xPnNrNUp8Z/fSuhzBZ4rJHXxoTo54FMt1MX+rmbMtoHo
 JcCxf5GBIqIGDeYrI/sYeeTmOtG355b2X9TUK5b5RswQuiIwRt4cRRg3g/vyX8Hk+jOX
 5mQAduw8Oftm3WqCWJ5E89Z7Ipot4pP4q+BfJ8woSYS/DQXNDtQ4/C3cqKfuyFfM0BoX
 cLFysIlRRYKxdykOrbsTJLvs8Hk1AdO8mk0HT21T1aEuDYzvdrUX1keJ7EVLGUmFHn5D
 jFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NwiE+GDcerGhyhHytDkmThZ/zjw+FHYBww3fFvyZS28=;
 b=ValLQtDpLQsk11uAt9sL5ZTqO7kqzkG/3gWBpznF1oEsv7cjmj0bg0wBMr6WV+UYzq
 3eNm7SqhVRLEXXhyEI15kA9/duaf7qjSQlLL/CYg5a2ofAtdeSDsohqJ4jRosMdQZbQ4
 ngkjc0fUHRXRAV4n6PdIhF4uRheJqsZe6X9F8Z/iCnCL3Aj+8ax5cdOTbcCSF5uEo6vj
 3yYSxLBZ+f1MOyH90+pJEBubgMTMNlNa4FlftEWLE+MgVGTpHcW5F5M9rjMFSKS0UGfA
 fRAU7huoAlHyk192pR7VZg8ygEyINDrqQcOtKa8W32EKv6OyOS+NIy1FTqx8kfSyk8dH
 XbZA==
X-Gm-Message-State: AOAM5325zcTbwONIBpc5X0ZcHYOmCwCaHUeGYdalXduQ24OonS7r7DuO
 DjY43GrQ3U/zo9tOtXd9pps=
X-Google-Smtp-Source: ABdhPJyM8rCbu5/Q48dnolh0aym/L6wXAHrybqb/eBLOVrjDiNhC+NEzLAUgKIYmwgJVtbMBuXiHqA==
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr13087577wri.214.1642509600398; 
 Tue, 18 Jan 2022 04:40:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id az29sm2698557wmb.31.2022.01.18.04.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:40:00 -0800 (PST)
Message-ID: <6941a519-3a26-e57c-5582-7238da90d263@redhat.com>
Date: Tue, 18 Jan 2022 13:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 2/7] x86: Add AMX XTILECFG and XTILEDATA components
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, "Zhong, Yang"
 <yang.zhong@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-3-yang.zhong@intel.com>
 <BN9PR11MB5276EA0D1E39DDA511B0A9B38C509@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <BN9PR11MB5276EA0D1E39DDA511B0A9B38C509@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "Zeng, Guang" <guang.zeng@intel.com>, "Wang, Wei W" <wei.w.wang@intel.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>, "Christopherson, ,
 Sean" <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 09:23, Tian, Kevin wrote:
>>
>> AMX XTILECFG and XTILEDATA are managed by XSAVE feature
>> set. State component 17 is used for 64-byte TILECFG register
>> (XTILECFG state) and component 18 is used for 8192 bytes
>> of tile data (XTILEDATA state).
> to be consistent, "tile data" -> "TILEDATA"
> 

Previous sentences use "XTILECFG" / "XTILEDATA", not "TILEDATA".

So I would say:

The AMX TILECFG register and the TMMx tile data registers are 
saved/restored via XSAVE, respectively in state component 17 (64 bytes) 
and state component 18 (8192 bytes).

Paolo

