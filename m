Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374902F62B2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:08:29 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03Ia-0001us-8r
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03FB-0006Wd-M0
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:04:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03F8-0000co-Qf
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610633091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LpH4pNDuj/3SdzB0V0P2SIl4Bszb2UMp8uBpRv4+Ak=;
 b=Iu9o7nXSWHaKgEP9f8O8Uu6cROvUbqoP3D4TxNU/uajqr5J/4PHRcjqjIwoy0MbUmpDrsW
 cS8ZqsdGzBC/LeRsTH8MT+YmoaQ5Ip8N1xumywrMNSMocTi//wp0L2D3ZiyAxS7uqB7ypT
 ely5SNFAAmt/59PNQCAyPCPCtO7tDCk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-ISA26m5ZODqTQSXpiDDtRg-1; Thu, 14 Jan 2021 09:04:48 -0500
X-MC-Unique: ISA26m5ZODqTQSXpiDDtRg-1
Received: by mail-wm1-f69.google.com with SMTP id g82so1936829wmg.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cv8MW6/hQ1QGSIEHRY8tj0CFfobqut3ZSLoMKTn6Mfg=;
 b=dd95bGSQF2h6cRQCNmm8+rXIVrc9x6OEusIWRvOxLAJEmtzlFL/GWMDV7HzJD/2C9Z
 TI3rya3C0Mqn6CTVXJdKKymJC3xR0mJkedGLaPGPsYnQ8VWb5evGWnGFYy/BSDdGLMyV
 ZnnXJPOQg+5/Kgu846EaxVGmPfqD4W9ebviD7ak7QQr4LtI2ndIRzp8OZUKX3imCqqpk
 Z6qbd/pF/iF1ty1R+gi87ThRvqAcJqLqKdjIMKPSp8Z9G5zXU5leuBPh3DLvOuJzus1k
 OhpDjtZP28t7iP9VQriCLrriYpvL1eL71H13Ofk3lPHPpdsi/WLhipYaiP3iteD59+sz
 al0Q==
X-Gm-Message-State: AOAM532+iBG+9pmlYt3t3zkLfnRoMGoiVpns3z7xPsEpyGtkuLytUUcq
 oLh/D97Zmqh7g6p3EHwcu39icA7rtPKFn1ce031Qb4GJ9wxi+TsQLF+ozOzhVK/eoM30NYHm2Yw
 JSHCaWatBG5YZVQibH2usB5zSduSL8O89Jf+rLErcXctDBuZwjam+1GzxZpbR4l/b
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr8076672wrw.137.1610633086411; 
 Thu, 14 Jan 2021 06:04:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVriijGqiFYxrZtwNZ+DwWuo0q4R1arZGHRnl2T9DGOXZbJvtZ6OwtV6SDbwApLRttyw+UTg==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr8076629wrw.137.1610633086030; 
 Thu, 14 Jan 2021 06:04:46 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s1sm10504868wrv.97.2021.01.14.06.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 06:04:45 -0800 (PST)
Subject: Re: [PATCH] Fix build with new yank feature by adding stubs
To: Lukas Straub <lukasstraub2@web.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <87r1mnlr0a.fsf@linaro.org>
 <20210114141918.5201cc9c@gecko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <00c9935c-147d-4cd1-7639-70b36826f568@redhat.com>
Date: Thu, 14 Jan 2021 15:04:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114141918.5201cc9c@gecko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:19 PM, Lukas Straub wrote:

Fixes: 50186051f42 ("Introduce yank feature")

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  stubs/meson.build |  1 +
>  stubs/yank.c      | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 stubs/yank.c


