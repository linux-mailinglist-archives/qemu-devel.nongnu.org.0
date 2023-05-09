Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148986FCD0E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:55:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRYc-0005NU-FO; Tue, 09 May 2023 13:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwRYZ-0005Mk-VD
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwRYY-0008LV-78
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683654921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CCFGfTJVJYfInN5qD5pohYoCITqMPQCMvTa9NH9nBs=;
 b=OfoeYfxgYdAW7SOuMcXAKW7D/yGwF6JpJVE65u5opDpOBReGpTAEjzjd1KF67/OJ+GDTEC
 SYSfvVP4/0i0uPl+kQ5XzI4NO06evWbPYKXnEUEDhZJ2OUJzZjw0GK/F9eNODu2zz84NQV
 Cw2X1rR7owu3QazNiFeP5ksStOKu9j0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-Xt69NdWJNW2ln7WDkIMmPw-1; Tue, 09 May 2023 13:55:20 -0400
X-MC-Unique: Xt69NdWJNW2ln7WDkIMmPw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-969d75fec7aso161963366b.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 10:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683654918; x=1686246918;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CCFGfTJVJYfInN5qD5pohYoCITqMPQCMvTa9NH9nBs=;
 b=QdRoYfJe6GVVp8P+id6vVX1he3EBs7SGYJ+m2ChzfW+bEl6f8ghbpqt/pK2RDekHnz
 dayyEANiXxRp+oY8HI26weO+0hwnqjxqAq8+C/eX+tW7RfmonRvtoop9VRl3bWgYXzFC
 /V8ppiqlhe3H0ANNLimx/xIh77KcOOD152Iu/NAX+OxFqdwpyTpybTjFwc/dkm6QIs7z
 suCM7x0CChAvdjZoA28Vaj2gzUuHe2n3b6EmFozWsy5M5/5eSRs5I9MM67hVS7vi5wMf
 8lkidv4Pa+UKH5yJLcOPJZIO/62oq+X8/S57cBVtAaH0P+/NRNOY78VSQEPEzO/ozUBH
 lbmQ==
X-Gm-Message-State: AC+VfDzhL6gYULQFj4LqcZ4ieIswAOaV2DrrRu3B5NotgBHi9NEIQB7R
 aBm/g4x9O3uoSbhDuYbxrYqhzuytLOuRNxikASMqY5gJIbORnBcZBp7kqbAyEtLrmqOae9pc8Ud
 XAJleCzGAls/twPmMZGEGAKo=
X-Received: by 2002:a17:907:781:b0:953:5ff7:774a with SMTP id
 xd1-20020a170907078100b009535ff7774amr12633911ejb.17.1683654918616; 
 Tue, 09 May 2023 10:55:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jTQX/wZekw6Yr1+mtqNPYlWT/gbRSfxbN3hs20L5OqIRbului5Al9p2DA6hxyXPQGQ6iuEA==
X-Received: by 2002:a17:907:781:b0:953:5ff7:774a with SMTP id
 xd1-20020a170907078100b009535ff7774amr12633897ejb.17.1683654918400; 
 Tue, 09 May 2023 10:55:18 -0700 (PDT)
Received: from ?IPV6:2003:cf:d706:2e02:6e14:9279:969b:d328?
 (p200300cfd7062e026e149279969bd328.dip0.t-ipconnect.de.
 [2003:cf:d706:2e02:6e14:9279:969b:d328])
 by smtp.gmail.com with ESMTPSA id
 gf25-20020a170906e21900b0094edfbd475csm1558429ejb.127.2023.05.09.10.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:55:17 -0700 (PDT)
Message-ID: <fa77ae0a-6cee-db87-d6d9-35d830cdfbdb@redhat.com>
Date: Tue, 9 May 2023 19:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/11] Fix qemu_strtosz() read-out-of-bounds
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20230508200343.791450-1-eblake@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230508200343.791450-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08.05.23 22:03, Eric Blake wrote:
> This series blew up in my face when Hanna first pointed me to
> https://gitlab.com/qemu-project/qemu/-/issues/1629
>
> Basically, 'qemu-img dd bs=9.9e999' killed a sanitized build because
> of a read-out-of-bounds (".9e999" parses as infinity, but qemu_strtosz
> wasn't expecting ERANGE failure).
>
> The overall diffstate is big, mainly because the unit tests needed a
> LOT of work before I felt comfortable tweaking semantics in something
> that is so essential to command-line and QMP parsing.
>
> Eric Blake (11):
>    test-cutils: Avoid g_assert in unit tests
>    test-cutils: Use g_assert_cmpuint where appropriate
>    test-cutils: Test integral qemu_strto* value on failures
>    test-cutils: Add coverage of qemu_strtod
>    test-cutils: Prepare for upcoming semantic change in qemu_strtosz
>    test-cutils: Add more coverage to qemu_strtosz
>    numa: Check for qemu_strtosz_MiB error
>    cutils: Set value in all qemu_strtosz* error paths
>    cutils: Set value in all integral qemu_strto* error paths
>    cutils: Improve qemu_strtod* error paths
>    cutils: Improve qemu_strtosz handling of fractions
>
>   hw/core/numa.c           |   11 +-
>   tests/unit/test-cutils.c | 1213 ++++++++++++++++++++++++++++++--------
>   util/cutils.c            |  180 ++++--
>   3 files changed, 1090 insertions(+), 314 deletions(-)

Patches 1 – 5, 7 – 10:

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


