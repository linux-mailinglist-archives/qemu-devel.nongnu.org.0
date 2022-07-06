Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F7568008
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:38:37 +0200 (CEST)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zcK-00005L-G4
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8zWp-0004GD-Dh
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8zWk-0007DR-0u
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657092768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdu0CV62Qa4OHo+DZpnPcIrTmgdXtHoNtkFk2ZbU5Js=;
 b=h+VitNKoK6fifXhyZatWFayfCudy3NolEqRgbysYc/0EU3132AW7Es9stUM+TwC3kBmTzx
 YpKTrJw2qYYQRbeZspekQZSjlbbxmBlr1BvzdtOsyI5OyoWWnn6izy7guW+BiWfrN+n7Wd
 0hEcKATIC5SB2NtgmBL5xVrhRAqg/JA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-lHWUfb3gO4yNxG7iXrfFJQ-1; Wed, 06 Jul 2022 03:32:47 -0400
X-MC-Unique: lHWUfb3gO4yNxG7iXrfFJQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 e7-20020adfa447000000b0021d669c6a76so1690808wra.19
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 00:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rdu0CV62Qa4OHo+DZpnPcIrTmgdXtHoNtkFk2ZbU5Js=;
 b=zJ8j8Io7CyHNqkgKDR7L3X6lAS/FgG2/I6evJdME+dWCNSkuWHu934DvF8qSn5wpGc
 92X1LP+l8oednLRwgf22G365a+lDnwj7iw1KPtvtrh+WXRtQX6EuoYRfd8IN1ROMjMd4
 /R9k7P6rLBO6A2frt/QDC8vUN0/TEoWrNQkcSv9FyzhRF6cMI0DLpVD5M+qr9jRB53rs
 22zRLmIHUynDLMSp8ixRT5CW/uOgNc14sdrCavKl/d3E1FtI9FOispeTsKXrPuU+GyxH
 kcw3IrPA5D0ReL+BxfIT4CLU0NFQAga2GhU1AqlPpYlgROh98TXsNMtgAcd60z0M9ySJ
 edlw==
X-Gm-Message-State: AJIora9wEErYJzgFSNyohbAh8B+o5WRLJoQJBtSr6KZSv2tJ9tFrXM44
 cQm5EonsoTs7iDfUSqSyqVKvddXlQNyn2BYwarKQ6f2A0j7Ed5DogLkiPIz00zyysGkGgkSTCi3
 +VjbXYjUlWQmeAkU=
X-Received: by 2002:a5d:6f08:0:b0:21d:7e3c:72af with SMTP id
 ay8-20020a5d6f08000000b0021d7e3c72afmr1352842wrb.556.1657092766041; 
 Wed, 06 Jul 2022 00:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxCiBPSkhAdeWtRGgJbg9kZx/I5BYdQbCXYjezT9ydgopS02paHtfqHii45wAVz8uFJ5fKKQ==
X-Received: by 2002:a5d:6f08:0:b0:21d:7e3c:72af with SMTP id
 ay8-20020a5d6f08000000b0021d7e3c72afmr1352830wrb.556.1657092765900; 
 Wed, 06 Jul 2022 00:32:45 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b0039c54bb28f2sm25860068wmq.36.2022.07.06.00.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 00:32:45 -0700 (PDT)
Message-ID: <a173c647-2b22-f1fc-5cd1-0d2f0f37241d@redhat.com>
Date: Wed, 6 Jul 2022 09:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] Revert "main-loop: Disable block backend global state
 assertion on Cocoa"
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220706021322.22570-1-akihiko.odaki@gmail.com>
 <20220706021322.22570-3-akihiko.odaki@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220706021322.22570-3-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 06/07/2022 um 04:13 schrieb Akihiko Odaki:
> This reverts commit 47281859f66bdab1974fb122cab2cbb4a1c9af7f.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  include/qemu/main-loop.h | 13 -------------
>  1 file changed, 13 deletions(-)

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


