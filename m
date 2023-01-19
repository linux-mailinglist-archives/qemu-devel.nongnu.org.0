Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A348767339C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 09:24:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIQ6N-0002rL-W4; Thu, 19 Jan 2023 03:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIQ5x-0002mo-UP
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIQ4e-0002oF-Vi
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674116090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X8rDf82Cu3GNuTr5TBrCLdne8gFAP+Zt76QQeGkSYBs=;
 b=WkIRvu5izYNpF8hyKqgQ5Vlr+mi5FRU00/hYEbJyFLLOa0Lgb+7N9u26sgQeHC+EO0LyU7
 G/MT/zdxF/DQTtOlvXvb9XY7Ux3vYIP8dy9ZGoKzI12OY7jBviI46fJSHk2H/3aRpbJWeB
 6mnlcc/FVsPmf0le1T/3KMZ656U66wg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-TyuLNeTOM1iafybDckwMcA-1; Thu, 19 Jan 2023 03:14:48 -0500
X-MC-Unique: TyuLNeTOM1iafybDckwMcA-1
Received: by mail-qk1-f200.google.com with SMTP id
 u11-20020a05620a430b00b007052a66d201so932676qko.23
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 00:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X8rDf82Cu3GNuTr5TBrCLdne8gFAP+Zt76QQeGkSYBs=;
 b=1yysIjdWfTDYhYppYb4V2M/14lT9AOJBR1ptlPTzSJrPDfgLhl6acSMLCxa/zPDtrF
 VK1sGlCOL0aV8Zm/aIAmUgkSITaHnABa+ORieRh1tdqQox1H6jxMYSnsuXym4M0xkXGm
 Q5GGK5u3QVxFTMN3xW+T1jgxt77AKMCx6tz6CEOh5yoq6U7fN7uc0qUTKutVOwMJkR+c
 Io7aouxPqzH0YcQQbIPT/OKENfqfIDmJ1FulOHE8MeUkRsimM2am7UUu80z4Cq2ApkNl
 aSDaQZ2iPIBnCHj+xxozuAxg2Mks8jgIi9zlHYMxUtgKcMy0sz45N029Jayy/Yx8ALiv
 YOzg==
X-Gm-Message-State: AFqh2kqEnBDomPbpCEjq1ZFm3HkhbVXaeO2vPEAIQUknva3uQBLhZAkG
 XRvjgCEpb5y/oRuhnV2iN6XM/pA/MmFH99TY/S08rY+k+T8RQK6yEsVG7XvN8W/UdSWZsyoGtcq
 yzYDkCj70HSsoLaQ=
X-Received: by 2002:a05:6214:3311:b0:534:ba17:9e71 with SMTP id
 mo17-20020a056214331100b00534ba179e71mr16957611qvb.9.1674116088005; 
 Thu, 19 Jan 2023 00:14:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsCHDhhgMVUQtkZvKX65nmU1r08e9b23v6zeKZIX7AxBBd8RhkNsJjBRF8jjD9w3NvTt6ZIRA==
X-Received: by 2002:a05:6214:3311:b0:534:ba17:9e71 with SMTP id
 mo17-20020a056214331100b00534ba179e71mr16957264qvb.9.1674116082778; 
 Thu, 19 Jan 2023 00:14:42 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-207.web.vodafone.de.
 [109.43.178.207]) by smtp.gmail.com with ESMTPSA id
 az16-20020a05620a171000b00706aeebe71csm3438770qkb.108.2023.01.19.00.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 00:14:42 -0800 (PST)
Message-ID: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
Date: Thu, 19 Jan 2023 09:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: MSYS2 and libfdt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


  Hi all,

in some spare minutes, I started playing with a patch to try to remove the 
dtc submodule from the QEMU git repository - according to 
https://repology.org/project/dtc/versions our supported build platforms 
should now all provide the minimum required version.

However, I'm hitting a problem with Windows / MSYS2 in the CI jobs: The 
libfdt is packaged as part of the dtc package there:

  https://packages.msys2.org/package/dtc

... meaning that it is added with a usr/include and usr/lib path prefix 
instead of mingw64/include and mingw64/lib like other packages are using 
(see e.g. 
https://packages.msys2.org/package/mingw-w64-x86_64-zlib?repo=mingw64). Thus 
the compiler does not find the library there. Also there does not seem to be 
a difference between a i686 (32-bit) and x86_64 (64-bit) variant available 
here? Does anybody know how libfdt is supposed to be used with MSYS2 ?

  Thomas


