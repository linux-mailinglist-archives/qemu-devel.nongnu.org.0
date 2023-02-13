Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9069473A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:41:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZ4m-0005ab-IE; Mon, 13 Feb 2023 08:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZ4k-0005aS-F8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:40:58 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZ4i-00026t-Ud
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:40:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so9059478wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xdamjLJrlbXpZLICrfHJ2Kwy4lfsSXxWMNtPj3AaVsw=;
 b=c3ZiwB91uCAXtgeY04zUOfSMf3Yb3ZysSgGBv6WQrI6EdrbTS+PKKlp4LUh2HubfVN
 jyRX4DJXKdiqWYf15tnHmMxf4u2xMc14+fo52Ym8BkxtOy5a4DzVJ2cI5tLRGnUK5HXx
 kBfrqhKLpCacHXNDbt9D3J1dbeLQl0FMnkVf+somBXZRuA1l2OazOdldlO50S/2Pkb4B
 JD1cCLfsRRakZMVjitMaBT+Fug/DBpWL9cKYsX040UvQzCPVipFt7Wd+2mq0r7nwvpsH
 oqtKfhZQxsVxZ8C9Fep9iqC70FZ5XmVnxzDE33iiAs0p5FnX5LeHqNJ8v9PE7FmUGPav
 /g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdamjLJrlbXpZLICrfHJ2Kwy4lfsSXxWMNtPj3AaVsw=;
 b=aU26KWDH6s/wXa1xriOOYGv/TykNUG6JPQLcGjgFuDH9D4raeWsYW3VWpU/4rJnDZE
 NwOER/HaBULF0jhqMmxY8eeO4mEdi4BVFP2xxahq5Sk5jpGq64taNKFzx9zcHCqkr74V
 Pm8k4EYClRpXBFQByHb31/n5VVgXYqA8qzyqj3M7eaRpBH0TqC2X0xtDOJ2hkYoyyz7O
 WpPwo+VhQ9PYm+f2kVm+M27iGnSkwKdPnE7A+ovqhl55VnLkqiMEbvgCNcX4scIPe1qI
 b3y57LiEXB3nQRYaP6xlo8qPjVsewJUxi2wZYMk8WkrkHSZidIp+RZr+fWCNnypMHhAo
 HfHg==
X-Gm-Message-State: AO0yUKUHyR6odUgIG4XhEEoc1jFkA47u5dArSeJZM7gfoAkb/4PatQKE
 tDhGdzGQHLFnWjy+jCiMSmC8nw==
X-Google-Smtp-Source: AK7set81t+l8MBIJ09pdiEA5YSgxMbh2uS8kPU+GoDGLUFWZGT1bAuanqlkXIx2k0j5hQ31N7vjG9A==
X-Received: by 2002:a05:600c:810:b0:3de:25f2:3aee with SMTP id
 k16-20020a05600c081000b003de25f23aeemr20724465wmp.31.1676295654979; 
 Mon, 13 Feb 2023 05:40:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay42-20020a05600c1e2a00b003dffe312925sm17038515wmb.15.2023.02.13.05.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:40:54 -0800 (PST)
Message-ID: <7214d952-2a12-7ab2-f8c2-51cffc25aa2c@linaro.org>
Date: Mon, 13 Feb 2023 14:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH RESEND 09/18] i386: Fix comment style in topology.h
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-10-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213093625.158170-10-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 13/2/23 10:36, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> For function comments in this file, keep the comment style consistent
> with other places.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   include/hw/i386/topology.h | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


