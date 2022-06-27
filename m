Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074F55BB40
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:13:11 +0200 (CEST)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sIQ-0002XT-JG
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o5sGF-0000Db-2J
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 13:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o5sGB-0004Xt-EC
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 13:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656349850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxqvWSINd8vZdg9myoKz1MK+85ea9ipVwHJ0sDj8oow=;
 b=K5MzMA2nKDwYBIMdjT5gRx8Y5rqp4psNMPKfBYrLBvFJa/5jNOLD3D2EOvbziXNbXxLvJT
 K+TAExyg4h9T01cvI6m/Ioit8iAG8SL+y2d7PEWd3Rr5ysib7+DQPl3Xg2hBan80gehez1
 n0xyoCWMOnmvuIFETeWnVf+qfgm5KX0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-c-L0j64iP2qSwVYl_6RTTA-1; Mon, 27 Jun 2022 13:10:48 -0400
X-MC-Unique: c-L0j64iP2qSwVYl_6RTTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg6-20020a05600c3c8600b003a03d5d19e4so4778745wmb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dxqvWSINd8vZdg9myoKz1MK+85ea9ipVwHJ0sDj8oow=;
 b=r9Hh97xUHFT4Pu6sBD/sYvqyWwreB9SEIxCTH9y0apGZ+IE4KlNmDarRK7wvZzjeWT
 DxOvabOV+zJ4eP1LgAOuB5/a3Z9WwIr5lLEElD81HhaGmEiNA2p07DDJxuXNcxl/lv2B
 PEaRBiggT/LAjVrFMECH/iU+cs2tgRGY14lrBOfplIb1dFFPicuf2AfUlj0sX+KSFwrZ
 tKkhvBWSGzpthSKFybd82iWcxX+f6BzQL3e/lmFUvNfQ9HOr2lAUGrOHjAdJHFQYb55P
 +xAXgkcxHdjVHqFwINFugZ10EoO3zp3w6F5quUgPAs0ltauDnNMwo7o8t9yBmK8gTk7E
 eh2Q==
X-Gm-Message-State: AJIora/0pSTh+PYTsxeI+22o09PJsrNjLbGby07ZMhUII3hhV+tIZ3gb
 alwF9eOw9YqA0DihLAC8QRLo4GrxpdW4KXL6Khuoz2tnMM+IKGXS5nHn85sE1Rt3+odW9FaamPf
 1t3kai2ZsoGePSi0=
X-Received: by 2002:a05:6000:1a87:b0:21c:65c8:2d8 with SMTP id
 f7-20020a0560001a8700b0021c65c802d8mr5738193wry.370.1656349847726; 
 Mon, 27 Jun 2022 10:10:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1soX0zwzclnolMyX9GX2qP7e95wF0TiFPlaHXnQi04Ew8o62H9pb4HJk3DOeyiXqM/LsR6HWg==
X-Received: by 2002:a05:6000:1a87:b0:21c:65c8:2d8 with SMTP id
 f7-20020a0560001a8700b0021c65c802d8mr5738175wry.370.1656349847485; 
 Mon, 27 Jun 2022 10:10:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:d100:dd9:b2f7:f126:11c2?
 (p200300cbc708d1000dd9b2f7f12611c2.dip0.t-ipconnect.de.
 [2003:cb:c708:d100:dd9:b2f7:f126:11c2])
 by smtp.gmail.com with ESMTPSA id
 i1-20020adffc01000000b0021b5861eaf7sm11268144wrr.3.2022.06.27.10.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 10:10:46 -0700 (PDT)
Message-ID: <ee9658cf-bb40-aafe-8afb-f345ee2794c0@redhat.com>
Date: Mon, 27 Jun 2022 19:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] target/s390x/tcg: SPX: check validity of new prefix
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20220627131251.2832076-1-scgl@linux.ibm.com>
 <bb5c26f1-5b78-8abe-48ba-72cb78597d05@redhat.com>
 <c75a6e08-00e5-45cb-fa67-ff41a8ec67fe@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c75a6e08-00e5-45cb-fa67-ff41a8ec67fe@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 27.06.22 19:06, Janis Schoetterl-Glausch wrote:
> On 6/27/22 18:27, David Hildenbrand wrote:
>> On 27.06.22 15:12, Janis Schoetterl-Glausch wrote:
>>> According to the architecture, SET PREFIX must try to access the new
>>> prefix area and recognize an addressing exception if the area is not
>>> accessible.
>>> For qemu this check prevents a crash in cpu_map_lowcore after an
>>> inaccessible prefix area has been set.
>>
>> I don't think that's possible. Our memory increments are 1 MiB and one
>> would have to cross a 1~MiB range with the second page to trigger that.
>> IIRC that's impossible with SPX address alignment requirements?
>>
> Are you saying that checking the first page is sufficient?

Yes, unless I'm wrong. :)

/* Due to alignment and QEMU memory sizes, it's sufficient to check the
first page only. */

> I'm not sure that this the case for the architecture in general,
> but I guess it is true for tcg. Do you want me to remove the second check?

Should have been clearer (and I somehow thought we'd be checking the
first page already :))

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


