Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77F2492753
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:36:48 +0100 (CET)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ofI-0004sj-0w
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:36:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nyr-00028N-66
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:52:58 -0500
Received: from [2a00:1450:4864:20::331] (port=40621
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nyo-00062H-LG
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:52:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so5515789wmo.5
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=No3OeGy2Dg+3OezDTl9QFHVXdYq4FobJ4DmJ7y1ibFw=;
 b=jtF3kVXMA7jzFke3QQWjs+/gv8ZorWIDnTD5XJldhmukpW99h7V6/vumzvOtr/MIig
 8X72T+EGVJ5p4pyqr2NgqlnYYV/haO7uGItZfv+e5OEWxAGuTWe/IV2VKMHeaR/Tn5Uw
 G2FBVmrhKT1f3U8Kpp5YBzJnVwWoKKyDD4EqWtmj1jaawv4Ml5BxCvXeXcd1lcf3wA9y
 V0kJ/WibQMJR0oMFnyHpI8JtCDfxszplMZnIbEF4SUeTmx+AVouFb21fa+B96CZmXgAk
 2b2kNMYO9zK6hPwI57JPD79zZydm5BcEK2aTv3wtzOoc+q1tqjxz1Av8OWt/Ar7HHVOR
 UUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=No3OeGy2Dg+3OezDTl9QFHVXdYq4FobJ4DmJ7y1ibFw=;
 b=LMW0cKa8OJusQgGU4XdPOv/17iLEIUSGqYzuC2gKI8B+BZDBQgPyxXGbZ9geOlYREi
 0X52Miy5r7Vk735nUDycY1vC5XtBiQI2mKl8Z3FK9bYiRfNwHhCRYYevBWWyxX94M8aR
 tdM3z9yGMWBEZyowzZwV+uBWe/qi7sKgXc0pkQyza2K9yGWs3OREYydDyO8SudYEz3X2
 ySvc6wnNvrTHp2oEGycyEQsS0TLgbJFdm7lVlGASUwTQ0kyJD11AWi2MnVNlRrTIREIP
 +xhlcbbJOcffCx+gGIFgBL5nIhXfUQ4eBUS1M+1ZLnYzjFl27OT8TheMSkiCYPDjgyhh
 Y02w==
X-Gm-Message-State: AOAM533BEGggFVrwCg4VrRHqfsnZOVLlR9x/DMBeRv9Wn84FwH1QtVPE
 VWUr4nX8lPK9azRADqBqvwc=
X-Google-Smtp-Source: ABdhPJzxGn9nMExEpEh4cbKJH04upNOpg00U8m8+tFbZtru8W++PdgXzGD7oGawKDPnIbsRWxPhLGg==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr24861539wmj.135.1642510372478; 
 Tue, 18 Jan 2022 04:52:52 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id e4sm7508197wrq.63.2022.01.18.04.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:52:52 -0800 (PST)
Message-ID: <c494456b-42a7-d591-02e0-dbdeecf2c36b@redhat.com>
Date: Tue, 18 Jan 2022 13:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 4/7] x86: Add XFD faulting bit for state components
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-5-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220107093134.136441-5-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: seanjc@google.com, kevin.tian@intel.com, jing2.liu@linux.intel.com,
 wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 10:31, Yang Zhong wrote:
> -    uint32_t need_align;
> +    uint32_t need_align, support_xfd;

These can be replaced by a single field "uint32_t ecx".

You can add also macros like

#define ESA_FEATURE_ALIGN64_BIT	(1)
#define ESA_FEATURE_XFD_BIT	(2)

to simplify access.

Paolo

