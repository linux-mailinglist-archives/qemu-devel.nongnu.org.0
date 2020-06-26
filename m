Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A520B89D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 20:47:57 +0200 (CEST)
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jotOG-0002f3-4J
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 14:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jotNI-0002En-CG
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:46:57 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jotNE-0001WO-Uq
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:46:55 -0400
Received: by mail-pg1-x543.google.com with SMTP id e8so5325355pgc.5
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 11:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0MhwNE2fRC7jXgGAzLbjBFHlZF4WXhV3MHzepNFE5e8=;
 b=txSpvkLq7RcSUsfy/Yza/ysETBCoqyWt7kByhqXg/XGj7uH1vzW6Ng25exh6p+xnF9
 p/DQEO7sShJjs/IXlUveRu5WeT2WqLi0fdtB+gZal0CEjUBqcfPUNj5KOpAzuUQvgA+u
 UTI6hJhW2m2ajkywWJg56k2fqt9a/qS55P8GHTvzVAS7QTGKQFRMhMP4TXpUcEPLnhaG
 fAiNMouULmV6e6CpowF6qSjSlHWKf23e+s9pBem61Dch/DnUpvOfDcOjc0tLbRhMRQ3u
 JN+VW00+fCz3WcSbG0rl5hJWRdv8MHtQZCOC0GEsB/lij3D3nezUwlOwaS4qa7ux2lS1
 OASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0MhwNE2fRC7jXgGAzLbjBFHlZF4WXhV3MHzepNFE5e8=;
 b=Ai3JGwrZLBCJKOZO7igA9zLTl9npXTat2IdZ8Sq0zZPDxd2VLI3MPYICZzOfjjXeVP
 EZhPcUfTXo+VIXlu8aDnMUJtDpafF/3xLuvdSPqTY5RMpyIG3YAbZ71vZAlz7/qFD8Q5
 ikoh6Px3/8WoFSSVWMsJtTA14+2wdUFfASW26T6xyvR2t5B4Tm9rUEkmms/0ugvngUWe
 mM8anZkdDKBdCcIj3AKnEGsczTBt+sVN9l21MaCmcSGRKvvvrJVt72VfKGkb2jfpUTcT
 xx1JlcwiZgQeoE5zKa5M6RqIMgR/TgcLCdzTeynGfnhMKEZr4y2TBhbvC/cWQmI7/CMh
 T4tA==
X-Gm-Message-State: AOAM533ep+MlGUVi1g1YQjBnQimktyUzecVeewW9aQrul3/uM+1CHVpx
 GA4IZsvKXW4OX9igw8Ryiic0eg==
X-Google-Smtp-Source: ABdhPJyJ5UlsS5cDyeKGfja59fWr1nMrPk1+JH9pENj3CK3lK6HNZYk9PudHSF4By5FyQvVhX4JgVg==
X-Received: by 2002:a63:6c1:: with SMTP id 184mr93573pgg.262.1593197210187;
 Fri, 26 Jun 2020 11:46:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b5sm12068939pjz.34.2020.06.26.11.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 11:46:49 -0700 (PDT)
Subject: Re: [PATCH v4 1/7] qdev: add support for device module loading
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200622135601.12433-1-kraxel@redhat.com>
 <20200622135601.12433-2-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d4b0c31-b623-6e42-eca2-312908fda360@linaro.org>
Date: Fri, 26 Jun 2020 11:46:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622135601.12433-2-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/20 6:55 AM, Gerd Hoffmann wrote:
> @@ -147,6 +150,9 @@ DeviceState *qdev_new(const char *name)
>   */
>  DeviceState *qdev_try_new(const char *name)
>  {
> +    if (!object_class_by_name(name)) {
> +        qdev_module_load_type(name);
> +    }
>      if (!object_class_by_name(name)) {
>          return NULL;
>      }

The second if can be nested inside the first.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

