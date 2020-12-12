Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1D2D8925
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:20:40 +0100 (CET)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9VX-0000zq-5s
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ko9Om-00048T-Mi
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:13:44 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ko9Oi-0000Au-As
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:13:40 -0500
Received: by mail-ot1-x344.google.com with SMTP id 11so11506371oty.9
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+BkdTaefCYoqGnZgCfckwMtpFvYJ9HzG/DLXeZGMVtg=;
 b=L23n9XnOqiWQd8pfWm8YgYMf+m/GG1i9e1r/0CzwfL6X410Iel7DQvOmOpxJ08MU4R
 cM9IfpyBQUQf5xUdW8WFlN7EfKFBWN+e7YwiPsamZrXkVfhVcu2s5KDSoNf5Pkgls93s
 rZYaCo6K7z2DJf6OmOOK2fqoEGwo24oE4pzyYITgJ8YgUAZUo/BTq0Aj6SThP7vzFREt
 3amcdyM8Z5owQlv6Cpk75ihbN7I0T0ky5fIZEgjkTxLRtN9opN8wObMx5X0fEA/N7wap
 YBh8xfzKbpdKS7Up2b28zw5iMxzEaoLBZeCxowf5EcQgI80FZMlI83cQ6Q2l5TTkK7OR
 icJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+BkdTaefCYoqGnZgCfckwMtpFvYJ9HzG/DLXeZGMVtg=;
 b=dWiK9534SF4kG4SRKs8QOkssytaXsg0ymIJqQ2EsgGAqzN0g+ixeRNSWdFhtOWWZp8
 O50lBYdcrV55dH5/5fZj/Vg5QiB8J3BET+PPbhrXm+hnuiL59V2zVNsu7R/vN81ty8nM
 RTPHI/vAyUBIT4EiVMJ6+/oQpj05xZR6VC+V2uJP67c8DNbwZjwypH+O+2Dxf7jQOPpZ
 2tSrrxXkAre/hkHKEaRsNQ1vU41FmLPqSq/QDDwGfo+KWUUHXqi5r8+YGQ4ZEjHhGSRo
 9zi8sJblTeVpMRBvc1QpAZRUPBSgEEcrnXGNw9RnbLx34ARkW8iIy6t66vxO9hBzeU9P
 2/zg==
X-Gm-Message-State: AOAM5302JaQv18xbcLIY6vUb4XfYXddfl49c0riib3YEg1dfw54puEb+
 xcd1T+dHec39asqn5C+DLXzTKcLpEmInH+8Q
X-Google-Smtp-Source: ABdhPJzOMVynESuf8oaYnIeq03bYE1GjHCd+jqBsniszlDNAe7K/o6IJoVTVj9Oi65gYTANX9CmIsA==
X-Received: by 2002:a9d:d8a:: with SMTP id 10mr13384226ots.11.1607783521981;
 Sat, 12 Dec 2020 06:32:01 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d62sm2642307oia.6.2020.12.12.06.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Dec 2020 06:32:01 -0800 (PST)
Subject: Re: [PATCH] icount: improve exec nocache usage
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <160741865825.348476.7169239332367828943.stgit@pasha-ThinkPad-X280>
 <bce56bb4-dd59-d408-ca17-1df944ef6259@linaro.org>
 <766d28d8-9c54-9740-5f10-4c0852c5b8f6@ispras.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c50c27a0-7e94-b120-bef9-60ddfcd28e3c@linaro.org>
Date: Sat, 12 Dec 2020 08:31:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <766d28d8-9c54-9740-5f10-4c0852c5b8f6@ispras.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 12:22 AM, Pavel Dovgalyuk wrote:
> However, we can't cache them directly, because hash table can include only one
> block with the specific pc.

That's not true at all.


r~

