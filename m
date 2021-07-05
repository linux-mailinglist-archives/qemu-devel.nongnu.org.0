Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1713BBA93
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:55:57 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LKW-0002wk-LF
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0LJL-0001xc-7G; Mon, 05 Jul 2021 05:54:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0LJI-0002x3-ML; Mon, 05 Jul 2021 05:54:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i94so21354335wri.4;
 Mon, 05 Jul 2021 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oXj/7078CUThRjPtM1NyWlFFr60JJVngU+1ACvIgdeA=;
 b=E2R3ZjIICCvZp7FTqAV8wa4B7WCZOrQ01HBELYuTLW38pcrzKzs+O3PvzRX9JsrJoW
 cMEta0AJlwsmU2vp41uSou92dEy0xFYiFqQ0MMmvd67YDiQx9+zZShja/oUucDWrJh2X
 bMBj2AGOHTQD/MJs0KfyblPvrOPhhbd3qyzBWB3J0rF7uIxcTf9JQVu1LEUjoJ2S/TLv
 OSK0RgJab82TfSRuJuUMU0ph287HDfxtxR0CMVIL9+aJHzsfQp7CpsWQEDbjTpE4C7EZ
 vTbgigm4KSwjB8wiqvTMEzvTxJDNM5i8Cnjz2w4BWe0yiqzOms5Bz9soZHykwDfdKNhq
 0ccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oXj/7078CUThRjPtM1NyWlFFr60JJVngU+1ACvIgdeA=;
 b=SZCT5Ruf25l2tCIIKIWMGnw91R6E8k43f48y5vsQR8NDTM/B/0+iwOYDQ48UhDtQyO
 /LvIhmAg+aAg4D/W4oRdQf/ekNKvrqcpd7vheuvRohS2HqSHKpxH4p2ad4LEVFhMbTQa
 TSbx98NbvY9+ZnWF0NntNX+XF9j+1OhAq6E6mIxO95HFWYN019AE18r70XDecpTFDYNg
 mY/fEA+WbA1afNpnGUKG/HNv7Qvp2A/pkEatYeplRZmTEnRrIzhy7wv/xOB6ijb59RUG
 TcTBVdWa/sw4EzFgnNwDL4tVkKjIh5zDWs/3FSdaWI/ytBIdspqpO/T/+6Eo52tFSDQT
 3PwA==
X-Gm-Message-State: AOAM532QFvyem9djTdPSuRk3u3kjOEbAHpZuo5nzCHtuw2Ms2btIkQTx
 ey1bctg9svS2EWw1P+4I7cg=
X-Google-Smtp-Source: ABdhPJwq7/1W7bAayLsgvWZAMOUh+HI1CAQhEfcA+ogmmKbIXtijhHGIcQCd47we5rYAHoAgDEzE4w==
X-Received: by 2002:adf:df09:: with SMTP id y9mr12607180wrl.304.1625478879063; 
 Mon, 05 Jul 2021 02:54:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o17sm21322932wmh.19.2021.07.05.02.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 02:54:38 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw/sd: Check for valid address range in
 SEND_WRITE_PROT (CMD30)
To: qemu-devel@nongnu.org
References: <20210702155900.148665-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <abd85855-9b59-aab5-27a1-8e83c211261b@amsat.org>
Date: Mon, 5 Jul 2021 11:54:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702155900.148665-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Michael Olbrich <m.olbrich@pengutronix.de>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 5:58 PM, Philippe Mathieu-Daudé wrote:
> Trivial fix for https://gitlab.com/qemu-project/qemu/-/issues/450
> 
> Missing review: patch #3
> 
> Philippe Mathieu-Daudé (3):
>   hw/sd: When card is in wrong state, log which state it is
>   hw/sd: Extract address_in_range() helper, log invalid accesses
>   hw/sd: Check for valid address range in SEND_WRITE_PROT (CMD30)

Thanks, series applied to sdmmc-next tree.

