Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88F314DCF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:07:38 +0100 (CET)
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Qrp-0008Ff-3Y
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Qo4-000552-W0; Tue, 09 Feb 2021 06:03:45 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Qo2-0000qh-Er; Tue, 09 Feb 2021 06:03:44 -0500
Received: by mail-ej1-x631.google.com with SMTP id hs11so30632829ejc.1;
 Tue, 09 Feb 2021 03:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=40XcWvxQ9GdgvYjf8pb4BYvkYtk5bHpgR+Jmi9iBo70=;
 b=TcUwp3NInQal6eB2mNpkVnINbOixT8N6SXBsSVur0LbpNL6208VR8WZsI7KOZaMN/n
 tDk714mNbKPWpOI9TylgaSldqAoXJCrPScPLToN/4TBZVA2MSPYUaOvTJg4X/q/wXGEE
 l+ihAw+h/3zv+wHX2Gv8liibYEMgkF5TsP78nVnlP0j8fuzzkK2hWMzOzv1LFHXJ3neE
 WwSG6ztP02UJl3w3v4DNMIAdaBFofqvHGkJerYoAhYZl66xUiC/QsFntojlDc1Ci+xLp
 juSqA17eTULY84Xe392Pz3zmnKOgxNKBJ6VfE22ABFdYCqUjIlPo/kZNKnygabwL04+V
 +CuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=40XcWvxQ9GdgvYjf8pb4BYvkYtk5bHpgR+Jmi9iBo70=;
 b=F/VW5vRqxVAJw7597C497/TQKwo+fMs1Ii62iUaF7lWsuR+iZCy1aZcijzyGfFcrCu
 czzaOXMO3YPY/EPrRk+welC0CRXjMX2ksx4XwMl94LVWwYI/b8pmBIosE740TdWQmZKJ
 3akYij0EPRTazKIf9ZxQKMW0ZPDyhotHbqOs7qCEu7gSpdum4pZHuoAmv+CMz16AiIC2
 fZNQmVaLWgcBpIvQxdeun3+yLj/MmIY8///dR2QxwAmBR/NO+u+r6QQX7XmDNUfGscuJ
 B+Tp+aQ6q+8uoA0W1VxzJSFUyhWNVbOGaGj6dl5ZdLaVeLPC0fkYWIpQ3Sm1v2psgW3e
 zXQw==
X-Gm-Message-State: AOAM5335JrPDRzRqHCTYvS34BTuNPTUApLRvgAcyjHSD6BSuFp2+8pvs
 B+xAbhU3W5ZZwSluLFbfur+kn3AAH2Q=
X-Google-Smtp-Source: ABdhPJw+9s9gpMdipmgyoYAlALRdXkOIy0NYmRcjpTPoFLeFlcKocHtQzI/nzALDqSaOb5AXYO4+pg==
X-Received: by 2002:a17:906:cc50:: with SMTP id
 mm16mr21639243ejb.366.1612868620006; 
 Tue, 09 Feb 2021 03:03:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c6sm11682639edx.62.2021.02.09.03.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 03:03:39 -0800 (PST)
Subject: Re: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <17554c01-db8f-5676-3b9a-891eb48845cb@amsat.org>
Date: Tue, 9 Feb 2021 12:03:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: qemu-stable@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 11:54 AM, Bin Meng wrote:
> At the end of sdhci_send_command(), it starts a data transfer if
> the command register indicates a data is associated. However the
> data transfer should only be initiated when the command execution
> has succeeded.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: CVE-2020-17380
> Fixes: CVE-2020-25085
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Sergej Schumilo (Ruhr-University Bochum)
> Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
> Reported-by: Simon Wrner (Ruhr-University Bochum)
> Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/sd/sdhci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

