Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD3352DBB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:29:11 +0200 (CEST)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMfW-0001PM-3k
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMeA-0000OO-Ew
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:27:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMe8-0000KP-UY
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:27:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so6392039pjb.0
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NgRTUxiz6kbRAAgU0U0RmX9oPL6IffML4V5pC8/+8ek=;
 b=s4BFS8QBIeFXiByZWY5Z+JGXOSpU5jw8/HYKSf7TOWgSu0Qp0B86XeFZ0zpXYvVCZG
 b4X+DefqF7R+KHpfqsWEw3KPIp4WR9841YlngSkOJysD++rfTN1Hf/iojVcwyz9880F6
 NLv0JaZ7bAvWQ/DJZ1y7r6CO4NzzSCdsE+poNrq5xEkJ5wj9ynPrWAmq5B0qM9kflqjT
 cxgeEZETX+799FbMh+D0irgkj9a5bMIXLdOA3E1yvsDW5hv9ex9dDjw+weXZNi+ueut/
 qitguyYvJJcD3xcQW1fXHMvrUjLAiGudT/DkFUnEPJoI6cck2ymlPV1Z+axE/cIt1nFt
 WHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NgRTUxiz6kbRAAgU0U0RmX9oPL6IffML4V5pC8/+8ek=;
 b=XOVl0IZuqIkk1s8WZs/yJMLj+B+TGZy8nZ5+6dzDy+a1H4V1NotYRysej1SctSJivj
 0dQp8MyFvqbkXS2bfLV1Ghet+uUJaeoF+odWWazIgoB8NDGvla4HYnHzHkLt29Dax+PG
 bPo2+fbDn5vs1PJkQMYqaUO5FSgpa0LV2RNWXdSsrWQn7HkTTfytZDTRSkKULbEYbMyF
 BBOG2V+S+hGFGJqinsPUdIi3RBchuACSQZh8HWGSsiM057tbIce+aOiT5aeA7XnquhYb
 yOZy89dvUImCk47PwM/ZVPLX8YzePO8A+iWiz6GUA34JCaEoucaN6wJ7UV10rVqO6a+G
 WZpQ==
X-Gm-Message-State: AOAM531gwqnlp+z08x2kOU0EXqtXGi5jPdYSrKsGIatqi6XOr1s6L0Pm
 Sv0kMVzKbLshJtsTFIMTXi5i6w==
X-Google-Smtp-Source: ABdhPJw5wUY4BgEIa7uQv3jqO6h0yHTOHKrT9jvy6Rih0HqscdW8WyinqQILBlb0JQ1AKkfQ/YhN/A==
X-Received: by 2002:a17:90a:516:: with SMTP id
 h22mr13981804pjh.222.1617380863664; 
 Fri, 02 Apr 2021 09:27:43 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f21sm7898254pfe.6.2021.04.02.09.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:27:43 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] tests/tcg/i386: force -fno-pie for test-i386
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6c69484-4b56-e349-ed34-3211072b33fc@linaro.org>
Date: Fri, 2 Apr 2021 09:27:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401102530.12030-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 3:25 AM, Alex Bennée wrote:
> +                -Werror -fno-pie -no-pie -o $TMPE $TMPC; then

What is -no-pie?  That isn't a compiler option, afaik.

r~

