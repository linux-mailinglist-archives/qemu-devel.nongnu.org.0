Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D96D016E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:40:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phph8-00017Q-5P; Thu, 30 Mar 2023 06:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phph6-00016w-2W
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:39:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phph2-0005We-L4
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:39:47 -0400
Received: by mail-wm1-x32a.google.com with SMTP id s13so10590926wmr.4
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680172782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Zxc/oShUwgURDUwxQwMx7Wg4oASIHoxnBHv+XXDhyk=;
 b=Yu/b4vfTTEzS8TAbHrqXfKmbN1ATYYLd9w/k7GR3Jc7Xbc2RpMEQGg0/aa7UMAv9kr
 6nhvtR0Xr8QLSFk4sRdzqPZCWohoM2GEmgkAVAxg2tPkfwjNs6FaSs5lor6EXdOIDB8O
 aXULxVOb+iQfcFJ6j5YZ6rDIgjSU0ml70F8QBOBxzdfOANOXs4Ztja3ncLjIGIwBg+DB
 dg9CH1Ew70/Xzj5LsW6rrV/w1WTVJ0ll5pW3CcAYZrd8p0c0bgFatPMq4ULqZFwcGol3
 6AcMbpexE5ZukkO/ANs+RwYosLNbMXCdwUpqHxiGCcHk9Dy9ZxT+rgsOqxJa0rMH9Hsv
 h/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Zxc/oShUwgURDUwxQwMx7Wg4oASIHoxnBHv+XXDhyk=;
 b=arzV1c4dRXW8Pxq2BNupHAajuN6JsWo8tZVuZ9O9IgjL35nOZdDRNqPs74TRt/YJXZ
 ZUDWrA1Uqh7ViI5iWt5Bo9cPY1adU16yiF/7Y5Jzg5/i/KNvNR26zTXO3lN7tlSs19o5
 DxUuaGO4hoqb6W05dZilGMRMWCaDM0qZDakp+SzgOpQBqWGi3rUlN3RykQSJI9NE0qQs
 l/Lmvw4Zq1qm9I77BCTbU12a/QUhrIJcRQW5EqrhVs6mqE9tuohAOfpAsn8zzBpCxZyb
 JHK1HCk5VFn7j9/+pc1eOwqtla3+HYmQlhqsVKIG+zKiY2jV2y29Y1CKI92FqHKksZv7
 6E9Q==
X-Gm-Message-State: AO0yUKVnu+LKVVzS5ElQOaeF8cfUKFWBVeGo7P3QRQswqFhvyDOp7g3L
 LEI1TxobJL/YY3AWUpKC7Ep5yw==
X-Google-Smtp-Source: AK7set/YvuobzU9c4LkuP3udxdhn1b3kpk+oN7ie7EHm1dsYZARdqV7TFOERc1Dr1LfM2Jh9UpqClw==
X-Received: by 2002:a05:600c:280e:b0:3ea:bc08:b63e with SMTP id
 m14-20020a05600c280e00b003eabc08b63emr18071393wmb.2.1680172782424; 
 Thu, 30 Mar 2023 03:39:42 -0700 (PDT)
Received: from [192.168.201.175] (2.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.2]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003ef5bb63f13sm5803108wms.10.2023.03.30.03.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 03:39:42 -0700 (PDT)
Message-ID: <f0e8abb4-6844-bd85-b4dd-b4ede924e423@linaro.org>
Date: Thu, 30 Mar 2023 12:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 10/11] gitlab: fix typo
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230330101141.30199-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 30/3/23 12:11, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/base.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


