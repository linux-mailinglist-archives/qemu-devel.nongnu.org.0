Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1E432E51B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:43:10 +0100 (CET)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6zF-0008Sp-Mx
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6xi-0007Dv-KT
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:41:34 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6xh-0005yu-51
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:41:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k66so856396wmf.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uGtBGodopBi6PBU7sIM9ByLXre4d7jso6turWvrXCTQ=;
 b=hC+KyVOg8FjffCWQ1Y/eiIYUdN45ArONPRIZUnMteE8XH3UKadJ5eBRUwBeKfkI2tP
 LFIoW1gIA5c1Zf/sBTMqnhAqdE9m/q7SA4Fz8UqHQZCNTeI8grjlpsjRn4l8UGqyXixr
 InpkBmtf97JQMHdWIbHubs/5eEy7eJQVJJGTngPSVy8cnpBrCOUxKPPtK0It3mJRercj
 Yp+fSPPl2Z73NSnzfiBXgbMTbVHkze7ibnplAKEev04Y2P0pX6/PzwukdPah/uuSY46w
 USnsPPgJxjBSA5mdt4Dg6jfNlDyENrWzE44bxwOThU7JEBR2A9TEZ6jRWsPCAJLv97v1
 jBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uGtBGodopBi6PBU7sIM9ByLXre4d7jso6turWvrXCTQ=;
 b=M3SV1LJBDWNP5a3EGr92rgpXg36ArU3KXQfDPVYROO0nEnawox3ly68K9mO+M4eeme
 4IOceGDxmi65ozpO0M3cA+3NiXZzhOX7eoNxqqAgLUg8q/jO6M/p5clHtBTXcPXYKDDY
 RS7tIJhxazDauaL6dnBrAItaNcoY1FjCmqkpf0HK2RGb82fzV6WwG5LI41c/uZBkWdrR
 CgBssRmGPwd30+pAjz4/T05yjHmgUPDfaRmiPIieu4iDk+Kt1ZNG7VrO3paKfKY4hW4j
 0aNI9AMieWbkUsgA8Xa48kpbDjj/ofqIlJmxMzjip72dIpxdN+dr3J7uEdPjIIYSKcni
 iw6g==
X-Gm-Message-State: AOAM5309PL+1F6xzkmQIeaSgVgTbagmpuqqnls7cfTUtG2xUvKtaUEw5
 TGrQdzm0hN/108/nhfmDV/s=
X-Google-Smtp-Source: ABdhPJwYNLJJb0hXASQnHGCGapk52TrEbxhgjxF/FqAktpPuUS3eutjCj8KmF+bBkD1j3iae0vx1fg==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr8103044wmi.34.1614937291788;
 Fri, 05 Mar 2021 01:41:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c11sm3767302wrm.67.2021.03.05.01.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:41:31 -0800 (PST)
Subject: Re: [PATCH v1 3/9] tests/docker: add a test-tcg for building then
 running check-tcg
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210305092328.31792-1-alex.bennee@linaro.org>
 <20210305092328.31792-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee696fc8-df6b-f8ea-1796-82617aaa70e0@amsat.org>
Date: Fri, 5 Mar 2021 10:41:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305092328.31792-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 10:23 AM, Alex Bennée wrote:
> This is mostly useful for verifying containers will work on the CI
> setup.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/test-tcg | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100755 tests/docker/test-tcg

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

