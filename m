Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88675515EF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:34:34 +0200 (CEST)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ejp-0004WX-P8
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3Egs-0001ve-Gh
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:31:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3Egp-0001Ni-ET
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655721086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00B3N7Kbvq3JkwISRMyf1JMkGufy2PKxYlsm1srcHwk=;
 b=dfurOphmJ+9q7CaMMAoi1lEhOGiU8gVjBfV7M4tunJB95cHQZjEYoyW4bD8ifPkwCJZc5j
 EwIN8FCDcc0d1xazxA3g61c/hCRwb5TKPjPtM4EYgli+E50iwh+Bp2qLkH2xdWWCcJjbCc
 BMQ242OSCcYS2ivDYgzMR4lVCtPRUBU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-nH0qwgfWP-yQNnKwCa9gpA-1; Mon, 20 Jun 2022 06:31:25 -0400
X-MC-Unique: nH0qwgfWP-yQNnKwCa9gpA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r20-20020adfb1d4000000b0021b8507563eso1235534wra.16
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 03:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:cc:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=00B3N7Kbvq3JkwISRMyf1JMkGufy2PKxYlsm1srcHwk=;
 b=A6svKVpQ3PFUvdT6gTzNPxdedEq+v1G3uxAmcM6yGngvY0+qvlU61z8r34XlAB1BT2
 EY0imPmZmXJD3o2OnONex+pUCbXnUe37uz5Hdh3ajN2/TI3RU29t46MOF9pqM3zL3Zy1
 TztUPHCQLk7mChWuVLf0eyUq3j9UvEMP8WmbrTV/ceZaAp3tn22dIn7f48NkXa1PO0Mf
 Ntr3f0WZPxaEnfJmWL6GMJRct9ndjbTcykBwmgHuueRRJDTKd9AfFnUEf6wUSFcHq73C
 VIW+XhhPmNhJG5olIOpno3hQVp30cvVnVi/+ZkjqFv4DsfjMb1IiiAT2rEq6D+Fg6dHJ
 pe1Q==
X-Gm-Message-State: AJIora+yWGFM/WDSMFqWONCLBomsoMmS3BChWBi1GBz0+YqNNt4Bx7Hz
 J+n1hbk6r9z1PF5q04CGVGABFpg7XubQs0xqSO89NgccQetanyq9tV3OpRMAZXmT48Uu2arWULv
 y59Y2DhRcSH8CbCw=
X-Received: by 2002:a05:600c:35d2:b0:397:84c9:6fe8 with SMTP id
 r18-20020a05600c35d200b0039784c96fe8mr23962454wmq.206.1655721084150; 
 Mon, 20 Jun 2022 03:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIac+wRoWIzAk5KfIomw2uytrlWWR+05qNQp/qdY5Czb/oIa1USoVe7SRKgS50cjck0obVtQ==
X-Received: by 2002:a05:600c:35d2:b0:397:84c9:6fe8 with SMTP id
 r18-20020a05600c35d200b0039784c96fe8mr23962439wmq.206.1655721083944; 
 Mon, 20 Jun 2022 03:31:23 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-241.web.vodafone.de.
 [109.43.178.241]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05600c129300b0039c8a22554bsm15128547wmd.27.2022.06.20.03.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 03:31:23 -0700 (PDT)
Message-ID: <beb38967-f089-c0f2-eb41-f33277e38d44@redhat.com>
Date: Mon, 20 Jun 2022 12:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
Cc: Paolo Bonzini <pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Building tools on unsupported cpu/arch
In-Reply-To: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 30/04/2022 16.11, Michael Tokarev wrote:
> Hello!
> 
> Previously, it was possible to build qemu tools (such as qemu-img, or qemu-ga)
> on an unsupported cpu/architecture.  In a hackish way, by specifying
> --enable-tcg-interpreter on the ./configure line.
> 
> Today (with 7.0), it does not work anymore, with the following error
> during configure:
> 
>   common-user/meson.build:1:0: ERROR: Include dir host/unknown does not exist.

Did you ever send a patch for this? I something like this should do the job:

diff a/common-user/meson.build b/common-user/meson.build
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1,3 +1,7 @@
+if not have_user
+   subdir_done()
+endif
+
  common_user_inc += include_directories('host/' / host_arch)

  user_ss.add(files(


> This is with --disable-system --disable-linux-user --disable-user.
> 
> And without --enable-tcg-interpreter, it gives:
> 
>   meson.build:390:6: ERROR: Problem encountered: Unsupported CPU m68k, try 
> --enable-tcg-interpreter
> 
> What's the way to build tools on an unsupported architecture these days?

You could try to use --disable-tcg instead of --enable-tcg-interpreter ... 
but I guess we should improve the logic in configure / meson.build a little 
bit to do that automatically...

I guess Philippe's patch from February should do the job:

  https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg00894.html

Philippe, could you maybe respin that series?

  Thomas


