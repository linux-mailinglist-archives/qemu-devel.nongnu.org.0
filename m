Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7442F6FE150
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:12:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlUT-0001gU-7s; Wed, 10 May 2023 11:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwlUE-0000lx-SA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwlUD-0002ni-Gr
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683731532;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/TE+7wRzpkXX8Rr9I+lTSo3tiy+bm6aN4LrusLvvQKM=;
 b=iih+lJBu2XUtTphVvFYB+xTxH4m5XReWhHRSzTFxa8GWw7fRUtHl/XCD7hRils1XrBogo5
 mT2ybFM8sIi27enVG/MJ3SDDkbydcaAmCbobUTAKIRGpA00OeitEV9r3Cwvf5A7fZ2JNwe
 cWhOW9ULSbHYUZXWvFmlIJlWLi4d57E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-mRc54PWfMIeSpLlE1xXikQ-1; Wed, 10 May 2023 11:12:10 -0400
X-MC-Unique: mRc54PWfMIeSpLlE1xXikQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f420742d40so17177135e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731529; x=1686323529;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TE+7wRzpkXX8Rr9I+lTSo3tiy+bm6aN4LrusLvvQKM=;
 b=B/Lg6T+pNo3Ziqmvk7ohh3PCrUaC2XnmtB7o0pZ/NPb4wDpn7C6Ioids8WLFtBJm2J
 oYt77TvNeYdr2snoXn25gdX0jsW+UKOx3lakZwj/Gom63V+arrziMTrVlBoG6CZdiC+Z
 u0EvRCeC4vQ+oOJyPaooHbJ6ZTHJYIh/b0Ja+eeqA9Zn3eLQgZM3pnhFHRjbdULUb9Vc
 SlalSg/WYN3tVP4uvHAlisIhUoTnddSdJ7ERA22WM2tIEch47zWmukOCBDT4uUrQxb/6
 5YGubLQSsFrEjVvf0//soHelqAA6I4s2vJu6SBpvG0aMHF4nPlEjx1pwxD4weB5Vbw2Y
 NBlg==
X-Gm-Message-State: AC+VfDyTbH22bj1QHguyyDLEid/BcW2NBmgUDjo8/CvSwrJXC/Un0zEz
 hDausG7jZckMnbXcCq+1mbNMv3BhbVHbKcfgBtYLAmvAMC2Y1tsAb77hzsPyUvV0UikGtF3XkkH
 +3JZLZZ6U9n7bDo1MydKUjRDGQg==
X-Received: by 2002:a05:600c:2213:b0:3f4:1cd8:3e86 with SMTP id
 z19-20020a05600c221300b003f41cd83e86mr9671745wml.25.1683731529079; 
 Wed, 10 May 2023 08:12:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4sMTWv5zOEXFZPZyKKq4tk8Qrku4gucVoSvsJ46it/Z3MnfH/SJIL9ayNC4zf0mPQm7LMHIw==
X-Received: by 2002:a05:600c:2213:b0:3f4:1cd8:3e86 with SMTP id
 z19-20020a05600c221300b003f41cd83e86mr9671726wml.25.1683731528751; 
 Wed, 10 May 2023 08:12:08 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 h8-20020a1ccc08000000b003f17eaae2c9sm23165099wmb.1.2023.05.10.08.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:12:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Kyle Evans <kevans@freebsd.org>,  Warner Losh
 <imp@bsdimp.com>,  Laurent Vivier <laurent@vivier.eu>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  Daniel P . =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Markus
 Armbruster <armbru@redhat.com>,  qemu-s390x@nongnu.org,  Thomas Huth
 <thuth@redhat.com>
Subject: Re: [RFC 2/3] linux-user: Drop uint and ulong
In-Reply-To: <66095dfb-64d1-cb13-c66a-b21d303ae33f@linaro.org> (Richard
 Henderson's message of "Wed, 10 May 2023 16:04:40 +0100")
References: <20230510143925.4094-1-quintela@redhat.com>
 <20230510143925.4094-3-quintela@redhat.com>
 <66095dfb-64d1-cb13-c66a-b21d303ae33f@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 17:12:07 +0200
Message-ID: <871qjo8blk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 5/10/23 15:39, Juan Quintela wrote:
>>   static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
>>   {
>> -    ulong addr;
>> +    unsigned long addr;
>
> This should be abi_ulong, to match the parameters.
> Which should matter for 32-bit host and 64-bit guest.
>
> Otherwise,

Thanks.  Changing it.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


