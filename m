Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B027B6A895E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:17:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXoQN-0006SQ-2O; Thu, 02 Mar 2023 14:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXoQK-0006QY-RY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:17:04 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXoQJ-0001oA-8Y
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:17:04 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so3814074pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iLr79mUYpD7n2fWY1isFlllDc1Ts6cyrQhrXxqVh+oI=;
 b=oB9uOqz5baFj7szucU1b45vGBANsyQpSpPXggE/KvhEVIBNvM6cqxMke9kyBuhDbXO
 W8tAsc/BqeqR5C6W5rdJe2EF0dA0aD92tAj4QsYORDrUStJSm6L/N3VcjTfSMaxxDlbc
 8VD/YoUkw/v1ara3csNt67AMjB/ssbdnUwvb5HCVhxumLvyTn7qAczZXJIt/AjTCBamC
 e9eQsq/YLwPqfkXbNow8q7fW75U19DJkw1wrhFb4W4GU5wEF3VwdHKHylWINh+zGN0Z/
 Bc/OnK/vI2j9p6nlN4T8xsLZKndWJR7M5xbnA3clCufIpm8qP8h4TLVwx9Ur077w3oz7
 bHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iLr79mUYpD7n2fWY1isFlllDc1Ts6cyrQhrXxqVh+oI=;
 b=NrpxnE4Vxd4FMHXwaZsh8AWoWiNFu8AACbfU1RtbtlW+tnCYHQPcrbwJ8Zk+jow7Uo
 d3T9r02e9+KSbeeNYo/rBnOhdDxwg8fggY3EKA5Cq69vzAx2aVeescpXjTlfQPxdoDOc
 LL7SeNt829grfOXABvoJ5ZTfPVmGQUkWaFS97JFvDBGkZjRGabE9VP3I1ovAqhhTmcoZ
 uigcLh1916o96Jhna+ZVKVQPr06nrVUCOrG7brpNhzyim0nrB4wvw3zW52XlVz2n45Bl
 Kbs7xM5Y1C1spCN2LBuy0lRrREsDHVgCoPvTPXoBtd4Z8itXXuu/K7lZfYAV36RqOPtC
 e1YA==
X-Gm-Message-State: AO0yUKW0RTRyEYfZ7/BIC5t5cKOPRUzsNotj1HTN1WW8/RQbDe0y9XXK
 jlqHCBPpUr32Psira1lNEBEyKQ==
X-Google-Smtp-Source: AK7set8q5buMh9nbVyokQ4/YqRa3LmxigobrTlUjpPAUdPi+Lkp7lS378BIFJWFilH8FZVyJj4j0hQ==
X-Received: by 2002:a05:6a21:3395:b0:cc:786d:2128 with SMTP id
 yy21-20020a056a21339500b000cc786d2128mr13318821pzb.53.1677784621560; 
 Thu, 02 Mar 2023 11:17:01 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a654cc9000000b004fab4455748sm29834pgt.75.2023.03.02.11.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 11:17:01 -0800 (PST)
Message-ID: <834aba50-7b64-8acf-0d08-1cd086e3ac24@linaro.org>
Date: Thu, 2 Mar 2023 11:16:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org,
 aaron@os.amperecomputing.com, frederic.petrot@univ-grenoble-alpes.fr
References: <20230301024737.1210851-1-richard.henderson@linaro.org>
 <20230301024737.1210851-2-richard.henderson@linaro.org>
 <Y/8/iCIOVdAwcgW0@cota-l14>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y/8/iCIOVdAwcgW0@cota-l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/1/23 02:05, Emilio Cota wrote:
> As I mentioned in the patch that is being superseded here
> I like this approach -- it is simpler and generates less
> code.
> 
> I'd also like to see the plugin_gen_disable_mem_helpers
> function go away, and a mention somewhere that now we are
> intentionally not clearing cpu->plugin_mem_cbs until TB exit
> (before we weren't doing that either, but that was unintentional
> due to a bug).  So, for instance when doing a goto_tb from a
> TB with helpers, we leave plugin_mem_cbs set.

plugin_mem_cbs is used by all out-of-line load/store, therefore we cannot leave it set 
longer than required.


r~

