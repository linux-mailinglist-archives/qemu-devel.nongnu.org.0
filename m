Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F453A04D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 11:27:41 +0200 (CEST)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwKdg-0008Qg-E7
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 05:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwKc2-0007W5-8o
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:25:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwKbu-0007PT-LJ
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654075547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wi7LGPuKoSKTMGYEITbqM+7Kb4De29hJjrQRxKloc1o=;
 b=PpW9GIeaHcTNFtF2pUk3Syrmmi/tL2qrcGS4nyStiUDjYO1u9RjxV882mRQifBkiOrnOgD
 AA4qlUjoQLxTE0ouwvDz/Yx1CRS+Z7o0XUNY11ZVEmGJkc8R8VoVgsinceJUf6ILiG+pjg
 UkJwnFdyrpMn3/h0y1g9gT8SfvkDDSA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-dhJ3mpWmMTuMGA9FCd5ukQ-1; Wed, 01 Jun 2022 05:25:46 -0400
X-MC-Unique: dhJ3mpWmMTuMGA9FCd5ukQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 bv12-20020a0560001f0c00b0020e359b3852so163244wrb.14
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 02:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=wi7LGPuKoSKTMGYEITbqM+7Kb4De29hJjrQRxKloc1o=;
 b=CAFaiomfcsJGDdIbm96kdBm8nqNemsONG68f7tn68209JjVzLB0BfuCGngCIqJI8O7
 lcfoYmy7t2LdhrX2W0MJm5HCR2PGhH5OcspAlloJo9mvB4k2kK1z/Un2C9+gYdC62qEE
 rQMGZ8Qc2QKJ6/aTHRh6TNkWZcGdEAlabxVZaUrL5O4skP2ii2LHZsHknlabf9pqR/B4
 0jqGC6fQJ3NGDrueqUm9a1MXHzllAHb6fchADoyTeaGbbeafhfr4sqFg/604r5cToIxb
 9Lvmm9LFEJuQBf/UxQYTNmoiMiwcDB+/UHoD4P4tx8jK4lvL1Yrj9tBKyLogTDCVxDMh
 lnJQ==
X-Gm-Message-State: AOAM531CZIMJWx5ZwZCxGYa9+p5G8eNVyINsn8/JU4CmjoXNnL3H/l4O
 TDC5t9GF4WJqczDVFFJz0MZxQqGhJZDR4/V7bFY33wTNj/X7W67hixzj2wv9tOl1vBf73gyAWJ/
 Ee1VmU2DepXolaIY=
X-Received: by 2002:a05:600c:600d:b0:397:3801:3787 with SMTP id
 az13-20020a05600c600d00b0039738013787mr28129431wmb.113.1654075544785; 
 Wed, 01 Jun 2022 02:25:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrPVsWCDCmbpa8VDE1Wtdjw540OleXheeq+y13Aqm6ZFtZpn452SQ+reEinfbCQleBBM+Yfg==
X-Received: by 2002:a05:600c:600d:b0:397:3801:3787 with SMTP id
 az13-20020a05600c600d00b0039738013787mr28129412wmb.113.1654075544532; 
 Wed, 01 Jun 2022 02:25:44 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adf9d89000000b0020d10a249eesm1220973wre.13.2022.06.01.02.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 02:25:44 -0700 (PDT)
Message-ID: <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
Date: Wed, 1 Jun 2022 11:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, mopsfelder@gmail.com,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
 <20220601103825.498c378f@bahia>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
In-Reply-To: <20220601103825.498c378f@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 01/06/2022 10.38, Greg Kurz wrote:
> On Wed, 1 Jun 2022 09:27:31 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
>>> Update max alias to power10 so users can take advantage of a more
>>> recent CPU model when '-cpu max' is provided.
...
> We already have the concept of default CPU for the spapr
> machine types, that is usually popped up to the newer
> CPU model that is going to be supported in production.
> This goes with a bump of the machine type version as
> well for the sake of migration. This seems a lot more
> reliable than the "max" thingy IMHO.
> 
> Unless there's a very important use case I'm missing,
> I'd rather kill the thing instead of trying to resurrect
> it.

It's about making ppc similar to other architectures, which
have "-cpu max" as well, see:

  https://gitlab.com/qemu-project/qemu/-/issues/1038

It would be nice to get something similar on ppc.

By the way, the warnings that you currently get when running with
TCG are quite ugly, too:

$ ./qemu-system-ppc64
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-cfpc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-sbbc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-ibs=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-ccf-assist=on

Maybe these could get fixed with a proper "max" CPU in TCG
mode, too?

  Thomas


