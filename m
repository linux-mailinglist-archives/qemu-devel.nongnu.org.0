Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE72BB06B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:28:49 +0100 (CET)
Received: from localhost ([::1]:32958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9HE-0001GM-CZ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg95s-0004B1-AK; Fri, 20 Nov 2020 11:17:04 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg95q-0004tS-QH; Fri, 20 Nov 2020 11:17:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id c9so10859192wml.5;
 Fri, 20 Nov 2020 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P9cnvGOp0ZVC4YI/6L8oSftqyIkjPGVzarsg6x4xYww=;
 b=njNdfGJBJe+0OO6/lxaaTKWiT/4bfwM6ziao2eqM2DXcNi7zU8iQQLsHHgZ5PcA7kz
 eVLCIjx30r/DnUMru//UqekHkdiBq/zfnaqENhBZDEi37x8QpCK/f2EqnsRAX/gzwq4K
 Bb/PDMB11VHe8ZaGnr6kf0PdsH3La/c2MgHfepPCocPG80Zoz3U7rliP7mbm21wcbUyD
 enC+4Eot/qVNxhDua55ik8b/lJLXpUNR6Li/P98Ldz3bp58SKB3vJgvzpiBM1GJxJLfS
 WKt/qxQQYVIRTz8EwH3VqcXePNb79uvJAu43KQPRhQar3xpSsRrgmVEPtCo6J3272OCy
 QCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9cnvGOp0ZVC4YI/6L8oSftqyIkjPGVzarsg6x4xYww=;
 b=gpFwqI90fIvUkQXsanxzSlPVULGPdksXiqy8L1H+3H1ZAYDfNvQrOTreJn4Wiih/Yp
 xpkzGj8dU5VQF603Fu5XtUJuQPVlUwVPOhz+U6gtF1GRRC7QPT5FjIhq09/HJS+uIDuv
 EafCPvP+OrwuSeeek/xSATqAd9+ETpD+U9Fj/UCG5UyxbjfcKkuEBs23sV6m9dWLDB/b
 NZPUlbQJe74QL8oDBoYz7XTfxx0fyd3ehLYoJTj25DXOhUzAbba+xIOC6jAeIVag/69+
 nah7FeCmpSIFpFYHd75+dX/073+DzFUdDRCDsj4dQDocnjlvU53k8L4Kteb+Y1+Y89ZC
 Mi7Q==
X-Gm-Message-State: AOAM532BMNEmARSmTjFM2QcZ11OC7F8YLKMIv0B6rzbYzmBHvhJnNh4c
 RXn4tj1yZkYXnlbFb9UEa74VA7NOQe4=
X-Google-Smtp-Source: ABdhPJywjPlTiOuNoBSRRrp2djqMOw39Jv5XL2BexIrlbJkqpYVKU8JetwX+dkgq9Au/FaegcwnfvA==
X-Received: by 2002:a05:600c:2158:: with SMTP id
 v24mr11061818wml.107.1605889020631; 
 Fri, 20 Nov 2020 08:17:00 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p10sm5644885wre.2.2020.11.20.08.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:16:59 -0800 (PST)
Subject: Re: [PULL 06/10] hw/display/tcx: Allow 64-bit accesses to framebuffer
 stippler and blitter
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20201028082358.23761-1-mark.cave-ayland@ilande.co.uk>
 <20201028082358.23761-7-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <91fcf57e-91e1-ad94-1100-ad451e9da29c@amsat.org>
Date: Fri, 20 Nov 2020 17:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201028082358.23761-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 Andreas Gustafsson <gson@gson.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 9:23 AM, Mark Cave-Ayland wrote:
> From: Philippe Mathieu-Daudé <1892540@bugs.launchpad.net>

Wrong author email =)

> 
> The S24/TCX datasheet is listed as "Unable to locate" on [1].
> 
> However the NetBSD revision 1.32 of the driver introduced
> 64-bit accesses to the stippler and blitter [2]. It is safe
> to assume these memory regions are 64-bit accessible.
> QEMU implementation is 32-bit, so fill the 'impl' fields.
...

