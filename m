Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307555A0F9F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:54:02 +0200 (CEST)
Received: from localhost ([::1]:45986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBQv-0005aD-6s
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBOE-0001Ex-6F
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBOA-0008Hk-Fu
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661428269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsT72QrM70A+yF8/oTQSeotHszKaronexdlC/M41ON8=;
 b=Vqsi6l8YKNz2pxCBv+mdjEXhTsNTVTRGYHbF+1yoQ65YaeordYrf+DfuR/uYDpCrksG9Y5
 vvGPQ/887zM6Yz1TFjPKkiZZeRXYAoez+TABlRJX1pQyCGfYTyC37aWm9J279lQZYHoYQz
 TckuuR4bS1RDyT40ZOSsttjAUkWJShk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-Cf6ZIbo0MGinoskf209siA-1; Thu, 25 Aug 2022 07:51:08 -0400
X-MC-Unique: Cf6ZIbo0MGinoskf209siA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b4-20020a05600c4e0400b003a5a96f1756so2387494wmq.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TsT72QrM70A+yF8/oTQSeotHszKaronexdlC/M41ON8=;
 b=KYCNJIQk9SAmppE2vp3YSy2MkfqAi+FZDzpXAu3mHER/1l5qYMYftVeRZk43xI71xE
 GewrRT04XDMZBaosDRoQnNH9TfkmTNXk60Z7EjVeuoyg5mHo0gWKjzNLKiI5s+6FechD
 qceNVYUsmb79fl30/Ns3XIVAV+f/0bPKhzpA55FPRQuYeQBWu8UndyN9Q5fgTna2s8GN
 99Z9P1CFxPYY3Kf+vWnw9WpOysBmFlT3HV6H6btVPqSBrTO7AZSvzeXoYFofOTFB5AEo
 xCJKJFLKaBPsEK9leRzgma/ZCJFYfgJM/lKntxSOYsqwtsWC37KScNkMno9OKQPz5uCa
 ECFA==
X-Gm-Message-State: ACgBeo1crofyOSfEOFeT7tEzw033ZX1XrU3z7AI5ceizjurmCBHrzdJ4
 3RAJ043rMRT7IHRPcvj/YHu/iKOaKCvJBWeaUj5Qg1mcF4kyDF6czaGKj/ghZkDHV8PDwtXPoYy
 kxCkM0p9dvDuZ20s=
X-Received: by 2002:a05:6000:184d:b0:220:8235:132 with SMTP id
 c13-20020a056000184d00b0022082350132mr2101098wri.178.1661428267160; 
 Thu, 25 Aug 2022 04:51:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4doHyApwCrXgzPb8eRtAqqM2uiJAXUcGD4fCZHOF0DVU/YsnuHpbtAJw1yabY1OYHLUDoarA==
X-Received: by 2002:a05:6000:184d:b0:220:8235:132 with SMTP id
 c13-20020a056000184d00b0022082350132mr2101071wri.178.1661428266888; 
 Thu, 25 Aug 2022 04:51:06 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b003a603fbad5bsm5410147wmq.45.2022.08.25.04.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:51:06 -0700 (PDT)
Message-ID: <ce0324bd-f414-74af-900a-89ed3e69c4d1@redhat.com>
Date: Thu, 25 Aug 2022 13:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 25/51] tests/qtest: libqos: Rename malloc.h to
 libqos-malloc.h
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-ppc@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-26-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-26-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> The qtest/libqos directory is included via the "-I" option to search
> for header files when building qtest. Unfortunately the malloc.h has
> a name conflict with the standard libc header, leading to a build
> failure on the Windows host, due to the MinGW libc stdlib.h header
> file includes malloc.h and it now gets wrongly pointed to the one
> in the qtest/libqos directory.
> 
> Rename "qtest/libqos/malloc.h" to "qtest/libqos/libqos-malloc.h" to
> avoid the namespace pollution.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>


