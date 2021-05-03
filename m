Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2471A371562
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:49:20 +0200 (CEST)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldY0l-0005Hs-5G
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldXxf-0003qN-6i
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:46:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldXxa-0000ob-ED
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:46:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id l14so5406313wrx.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qEXL8nVEOqKYxHtPM/09ytpn+morduq5uKoegnt18Lw=;
 b=q4vw0AsAhhS9WFlJrojgnLyp2vFI/OypubcKhFrVIjbeK6viPTk82YfHFB2f1nq9h9
 eOMnf9tu8+sPEApSkxElhhnuOWKfNNUymieyr1z/yYZFCU4NVrd7BbeCduoG/b59YpZT
 ylZil3O7vRM/NRtYHQreUfKPousekEmL8anBhnc4bEdfzhVyi2/cN7jnjqHMkDWsXTtw
 zv2OthPmvLGXQWMB1BT0RI6FjdBuZqM0qQ1Pqz4jPMZymj52LIhIfFK5CLv9S8xEUilG
 5bYkX5sJfvKRD6Agnn2aPrszewzvbc/qHt/RpxFfzGz4fhP93kGdlt/WYJvuxvor2ito
 Ghbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qEXL8nVEOqKYxHtPM/09ytpn+morduq5uKoegnt18Lw=;
 b=dHNIFv5oNoPdjj8jT9mbw+FdP/84E560lZNo2h+ASCl6QlW7Oods/oar+uiYE7ObKC
 bux6bF/M6WziQFXpKiHcwSMlvBwHaxTxNQv2ysYiSxPbCXM82WiGauKAUJF7bmlhcBTX
 HVTSyBu3y1RnHZ2AMKvqqenlpqCWebtoY/0k8+slOuOmcXamSZu4VFq/DKQQRsVw7h1p
 +ENauZhbEwtbQ0IGcl6cj51NyJxjE/1gIyT5nCXoArG1mOzElqMSsJH2uUIlFerlv1Jt
 uAm1mGimo37Xqylc9igoBsxvHPkSbvb8dVApJeetpBGgWn+fE4L4LNdIJ65uEE63mIqq
 AXEw==
X-Gm-Message-State: AOAM5329ByQi0GrHbZ+8Zi4d6WwocU72sEy2b2kJmDShOhxTRAMDv8qd
 LyILWn7I3cneSxv8b5/atpQWJ8nqU/Giql2I
X-Google-Smtp-Source: ABdhPJzc2eVK2y+g+ihNkAYNVyi4iL1PM+8yM5FXhgshMLDmOT2X8VTzRDEMMFe6JsIIcD9lbf6oNw==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr24473063wrr.21.1620045960679; 
 Mon, 03 May 2021 05:46:00 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y14sm11906042wrs.64.2021.05.03.05.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 05:46:00 -0700 (PDT)
Subject: Re: [PATCH 0/2] hw/usb: Do not build USB subsystem if not required
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210424224110.3442424-1-f4bug@amsat.org>
 <b435a81e-36b0-c9cc-5661-8f87f4a33fc5@amsat.org>
 <20210503122556.lxdjhgsat6pa2u7c@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7b6e1521-6fde-0b4a-18c3-7581df65a4ef@amsat.org>
Date: Mon, 3 May 2021 14:45:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503122556.lxdjhgsat6pa2u7c@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 2:25 PM, Gerd Hoffmann wrote:
> On Sun, May 02, 2021 at 10:13:10PM +0200, Philippe Mathieu-Daudé wrote:
>> ping?
> 
> Added to usb queue now.
> 
> (now that the 6.0 freeze is over I'm starting to collect non-bugfix
>  patches again ...)

I was worried this series got lost.

Thank you!

Phil.

