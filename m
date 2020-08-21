Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7442524D766
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 16:36:05 +0200 (CEST)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k989E-0006PO-CF
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 10:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k988L-0005WU-PN; Fri, 21 Aug 2020 10:35:09 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k988K-00086Q-1y; Fri, 21 Aug 2020 10:35:09 -0400
Received: by mail-wr1-x443.google.com with SMTP id z18so2123221wrm.12;
 Fri, 21 Aug 2020 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ivrD5dccZpFd14GQ0mNAaQz9e0GEvyBOBtCZK5vH9Q=;
 b=UM7ah9cOvqnz6hTfE/tL/bkd235LYgtsVYkM7lgHpOlC4uVTxwhc0BMPx6+/D9kQZY
 D1P6QiJ8q+ywmccjohNFn8BoBWJ6NwRDJ4a0hSF1kQfF0ANlmCuKGoswkEGPwFLDw+T4
 Jd5srRKL06aVvBZ/hVHq2DZczcm5V0oNVBUAoUeg/LxPQYRcjTUryFAI6hfcNeYDp2/w
 yTvVnt/XcIQ4kOJiAYzncQUHflu+/2n3DtT1VH/ZivEPLo4jCl9M50qGyvnWUAdk1BwH
 Woj/HqSuNw/n4OXN1TeAIlMED4ADe5jD4djd1lDfOKWL+2IW1biuDPCtYhVjAQFoOcJy
 E7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ivrD5dccZpFd14GQ0mNAaQz9e0GEvyBOBtCZK5vH9Q=;
 b=QhOsIoUAP95DYVg/iv84YCtuYV+SD5KWsugdbTDFWDOkSrxCUUegky0U1d8/2qb//3
 85hxhoFY0o3o3EzFrVQ7F5AS3QdoSL7PFoDTruszx4P0GPeCe6W+q75PlS9ImAyz7Oa+
 2Sv7yJUYX6Jrk/VNZTMhy6Yki538mwIzlaxg5XyFhUUdSq+KGLsDIlZwNHrFIDb2HVDe
 hYHG2teHxSPXjjC5dJXq5xEtwslQVLDJ0JdVlWdfD6INls/8Bh9+0woKKvkfdaid0UnM
 YypYm/1wWKKATan2fFZSHhJ5mmfdN2wRWYFG7Ahn7VQ3LmZ0QYzc0sBicOT86BaslPQY
 jcBg==
X-Gm-Message-State: AOAM5318K3xwPSJiM7IiqQ/Mi5u6XRCyrqwPtLTnh7HwcQ5D4DFBd8uS
 J0SfGhsQAv93x6UPd2JFDPH55Yz1/JU=
X-Google-Smtp-Source: ABdhPJwiDibvqVwbNuzx+XCKaYySY1yzDUpnzH4lb3EALFMl54TMcrt5XCnWMIeMU9DYVUj5/uDjKQ==
X-Received: by 2002:a5d:54ca:: with SMTP id x10mr2947010wrv.36.1598020502339; 
 Fri, 21 Aug 2020 07:35:02 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id q6sm3936849wmq.19.2020.08.21.07.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 07:35:01 -0700 (PDT)
Subject: Re: [PATCH 0/7] hw/sd: Use sdbus_read_data/sdbus_write_data for
 multiple bytes access
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200814092346.21825-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <45ff8bd8-2e28-6cce-2890-b59872a1f3c2@amsat.org>
Date: Fri, 21 Aug 2020 16:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200814092346.21825-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/14/20 11:23 AM, Philippe Mathieu-Daudé wrote:
> Introduce sdbus_read_data() and sdbus_write_data() methods to
> access multiple bytes on the data line of a SD bus.
> 
> I haven't named then sdbus_access_block() because I expect a
> block to be a power of 2, while there is no such restriction
> on the SD bus (think of SPI).
> 
> We can also simplify the bcm2835_sdhost and pl181 models, but
> it is simpler to first let them use the Fifo32 API.
> 
> Based-on: <20200705204630.4133-1-f4bug@amsat.org>
> "hw/sd: convert legacy SDHCI devices to the SDBus API"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720136.html
> 
> Philippe Mathieu-Daudé (7):
>   hw/sd: Rename read/write_data() as read/write_byte()
>   hw/sd: Rename sdbus_write_data() as sdbus_write_byte()
>   hw/sd: Rename sdbus_read_data() as sdbus_read_byte()
>   hw/sd: Add sdbus_write_data() to write multiples bytes on the data
>     line
>   hw/sd: Use sdbus_write_data() instead of sdbus_write_byte when
>     possible
>   hw/sd: Add sdbus_read_data() to read multiples bytes on the data line
>   hw/sd: Use sdbus_read_data() instead of sdbus_read_byte() when
>     possible

Thanks, series applied to the sd-next tree.

