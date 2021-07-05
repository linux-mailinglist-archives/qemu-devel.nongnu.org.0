Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F663BBB25
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:20:55 +0200 (CEST)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Lif-0000WU-NL
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0LhE-0006rQ-Cf
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0LhC-00040X-NI
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625480361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLaugi/JCkFkj/SEvb6LVJPAnlTRKuVk/jb9oBFS444=;
 b=RBo9mAy/vVnOLkNbmveTAq8QiqPdD08+1jqvGEf5y+bbtF1rOQRdPG75mkdm7FWTf2jNIr
 QD1w9xUe4iF1CTqxznulY2vZGzNRH83sV4ZcqXeLD3xdE1xVhBCkaDYFhfgPylzkui4G8X
 25+TClewZb/VpDJNeMEMjMaambCGQo0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-wZtZRlccPraWPuxvFrwRGA-1; Mon, 05 Jul 2021 06:19:20 -0400
X-MC-Unique: wZtZRlccPraWPuxvFrwRGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n37-20020a05600c3ba5b02901fe49ba3bd0so3101152wms.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 03:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oLaugi/JCkFkj/SEvb6LVJPAnlTRKuVk/jb9oBFS444=;
 b=EjoKtK9tvL0dI43r+R1O60lq4AQVpJK1vPbrqwZL/0HU19n8pINSudDGzT9AQgDZnI
 qDAhOchiFPv4joH1YWmXEX4onoaxK+d9HrIl1rQhSBlq39X1ObHjqB1UXs8Sb6IBaPP5
 5rDLt2oTJ8rw58ZeHPL38D9ndq/b8oxVR5boVpruHW1c/8L2XwVykEqtRHH40zio+ksM
 Ox3w0CMY/g4pXFVdRyC+Xoxur7hvZA9CRts1ptSFuBmQEXyrr0WTT54mZHgg5+UqQjMt
 PKoD0zGJzLl+58S/ZX/ks+7r1OOsjoRqku63i6fo79rtFthwDwyDtbvEYWpm15yq6Q35
 Nk3Q==
X-Gm-Message-State: AOAM531CVoY32LDehQFITe99wfi4Mj3VN2sE7WMwO8TjozoYzaAXtocu
 fuQaA17WObGWohIkAiCw35yhn1JVFuf9JhaKZzMSOTL4tFkFsSARkee8lDDltPtqBm1IElig8ky
 UDr6V9ChPstfdSSM=
X-Received: by 2002:adf:8061:: with SMTP id 88mr14660754wrk.233.1625480359445; 
 Mon, 05 Jul 2021 03:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6MVxwz7Rs8wDCBmQHO90MNrXm4Q9LuBdt+UST6Kqzd73xjL0FHIHoklQsktZ8ZxBrIpGG+A==
X-Received: by 2002:adf:8061:: with SMTP id 88mr14660740wrk.233.1625480359295; 
 Mon, 05 Jul 2021 03:19:19 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm22436255wmj.47.2021.07.05.03.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 03:19:18 -0700 (PDT)
Subject: Re: [PATCH 7/7] docs: Add QEMU version information to HTML footer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210705095547.15790-1-peter.maydell@linaro.org>
 <20210705095547.15790-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <73ffe4b5-0f8f-cd23-e5be-b629a964128e@redhat.com>
Date: Mon, 5 Jul 2021 12:19:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705095547.15790-8-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 11:55 AM, Peter Maydell wrote:
> Add a line to the HTML document footer mentioning the QEMU version.
> The version information is already provided in very faint text below
> the QEMU logo in the sidebar, but that is rather inconspicious, so
> repeating it in the footer seems useful.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/_templates/footer.html | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


