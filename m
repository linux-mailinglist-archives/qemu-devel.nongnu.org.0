Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E832BB34
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:20:10 +0100 (CET)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHYuf-0007oD-FQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHYtl-0007NX-O5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:19:13 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHYtk-0002XD-5G
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:19:13 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u11so14756194plg.13
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 13:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YjMMidKJFR2rUp4M+l7mXuMRydyP0zi4Ul3mTVdsNis=;
 b=iMv0B9GVa/ofAaSk8tvQAicP8VbcbLVzcQW7d4QeUoNK+y9BuAd1dK8X593Gadn4JD
 HxViA2ZPfy3KGE8IvWeXxh8LmYUdWM6WGCDhIHe02nvjfnAjY+ewnzFIU6Us+LzruGlj
 7edI/4xPmCs5gpv+Px+mkR6fU+sVDL31zd21O9fobieHeYN1iad+gW2cDe6Xjn5c7MJL
 ZM63l4g3alg/0POpEDbUubOZHD0CDMqAjy0+9VMdhE3OczYQFz9iq5jDlg8kGl2b8bel
 F07VjnSgQpklzdInJI6g5EBCP9Mq/aN4Gjukrko6gtpqwpeAX5EwdlohSGpBKUFiQn5E
 AZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YjMMidKJFR2rUp4M+l7mXuMRydyP0zi4Ul3mTVdsNis=;
 b=fh+28dhsUd+g7BmzfSoXI42WEPjuKscHWfUXNECLkii8YvZUQEChP0lBtXacqj/Pu0
 /clt6iDJONINO1pBy+FkYOCels03Ra2thkOqjVZ4Xy3CpAjwvZx8Ums7vBoYcK4zVDwx
 etopopj5P5gH5iY2S8clFgLgWZAE22ZlK40ATd2Xvq7Vlkihn6vULKzLDN9oQnYV/Wq7
 D6sfridB+0wun+u/3zdWPR+Xtiwi6shHa5wd4Vcavh5uF76P10a4rp8XBxVccMDm32zJ
 EA4SqH6HVS6cLqn095Hzq7sYqsGhTbe5TmdWSC03Y5MC5RFDCcMZpGDeljW2QRA67QjL
 y9hA==
X-Gm-Message-State: AOAM533J7UgkRRgmoZNMdmFjgE+nxw5kjFXckDBxOecgr80WVwbyzGH8
 sgOtl62FfmMNHXKjGhoqa1pHJA==
X-Google-Smtp-Source: ABdhPJygxnqzN8aRo0MVlHhPwpiveEM8bXcPIwZrVMf95hArMuxNLch8NIuiJbAECH7p1XinbP+JLw==
X-Received: by 2002:a17:903:1cc:b029:de:98bb:d46d with SMTP id
 e12-20020a17090301ccb02900de98bbd46dmr846244plh.54.1614806350671; 
 Wed, 03 Mar 2021 13:19:10 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id f19sm25584920pgl.49.2021.03.03.13.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 13:19:10 -0800 (PST)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: David Hildenbrand <david@redhat.com>
References: <ae902e23-08e4-303f-3eee-9e196987aeea@linaro.org>
 <C79BA7F7-A6AD-4D5B-8683-9EFDF16ECB65@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e13f11b-4c4f-83c6-5c83-8c8accc4f6cc@linaro.org>
Date: Wed, 3 Mar 2021 13:19:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <C79BA7F7-A6AD-4D5B-8683-9EFDF16ECB65@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:11 PM, David Hildenbrand wrote:
> MMIO on s390x? :)

hw/s390x/s390-pci-bus.c, memory_region_init_io*().


r~

