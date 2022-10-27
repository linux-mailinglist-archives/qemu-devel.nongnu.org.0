Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6663260F08F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:47:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwee-0008KB-Cf; Thu, 27 Oct 2022 02:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwdo-0007yH-Hi
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwdk-0004q4-Oo
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666853117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyuZewm8j3DxJ1fNrIalYCNlhZN8CvYyPVErdB/G9aI=;
 b=ImQT1LucUSgUu/07WRrUQ9q3DsD9Sv/dvu5UvC3jAB3/kpjG42hhf3vNcxCp+PhoHQp9/P
 ogSdIWRVCc/6Y13UXMvJnau3PdEMyx0dH/GDBlfZhb4np2CLu4gxMSZ565lha7qbmGnLjY
 n77QUf0MGQrmyCzCCY5ifcoCx6jVacI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-bL4eVyjqMpapA-4F_p5ybQ-1; Thu, 27 Oct 2022 02:45:15 -0400
X-MC-Unique: bL4eVyjqMpapA-4F_p5ybQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x12-20020a05600c21cc00b003c8340cb973so187333wmj.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eyuZewm8j3DxJ1fNrIalYCNlhZN8CvYyPVErdB/G9aI=;
 b=HglpVsX4nhhu8A5BvwS2QRDqUNmQmaQZb4sKk1db2hbRu0Df+aLFynKni6rE3Iw1kI
 qk+cyO4JySVbSOvpw6pTQfsEKXIXnXC1gv+JZfjMr/l874j8xCje6h5+mpeDXcnJAWrK
 XXQvfTdZ2ieO09aocsvW+xCQ8G36GMtcppJhCIEmMDRYhWr1Y5EgmA8bW7f3CREXeCt5
 hPdjKhBPka7R1WM3sjIqvP7ePNkm4cmxYSrcIHvK+nQgm1sgUBGSioa7rXrSlNZ9bTMe
 baxFreqZFz/k45EdoBow5G3mEKRERMFZjvjbELsUkR7nMZzs8sKmTWtyaGfpOiHqOs67
 kNLg==
X-Gm-Message-State: ACrzQf2d6aCh161az5KVECgXv4niZyxVR5Q9XfILX88vxTeEYY+CsTqt
 FoYYMKwml3yle0cNyKBHjZdkslacz09TksXwIgvCsEM2b4OEHPGhBn7m5LKzw+qq3t7t/1or5nL
 uULz/ZDcgEUdHylA=
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id
 p7-20020a5d59a7000000b00230365201aamr30794921wrr.308.1666853114465; 
 Wed, 26 Oct 2022 23:45:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4qqVuIK4mps7HIaZRE/r8oW0D3A5gY59EPvRu+3KfGU/wsOLM0MpBIkVriL+8p1Q07e53KqA==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id
 p7-20020a5d59a7000000b00230365201aamr30794905wrr.308.1666853114220; 
 Wed, 26 Oct 2022 23:45:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a342933727sm4161437wms.3.2022.10.26.23.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 23:45:13 -0700 (PDT)
Message-ID: <aa279055-33c9-4129-9796-c307008a1fb9@redhat.com>
Date: Thu, 27 Oct 2022 08:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] target/s390x: Rename insn-data/format.def ->
 insn-data/format.h.inc
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org
References: <20221025235006.7215-1-philmd@linaro.org>
 <20221025235006.7215-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221025235006.7215-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/2022 01.50, Philippe Mathieu-Daudé wrote:
> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
> 
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
>   .../s390x/tcg/{insn-format.def => insn-format.h.inc}   |  0
>   target/s390x/tcg/translate.c                           | 10 +++++-----
>   3 files changed, 6 insertions(+), 6 deletions(-)
>   rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
>   rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


