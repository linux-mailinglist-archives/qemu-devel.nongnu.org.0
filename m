Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70577440023
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:15:16 +0200 (CEST)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUXD-0003Dj-F9
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgUUA-00014O-Rj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgUU9-0005Ij-Bp
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635523924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfO3Uk0uZhN0+/IsUH3RdL3KvWJKSGWEXa3nmt8kxyk=;
 b=VIpJ9JTW0LAaJX/w28dxlucKy2m3u+BGyDrFZZFxh2HJwHA0B1kIIncLpR/htdhnUa6fky
 taJP2X1fs/D6Eu3fgmtHEzlcFDF3nrs7BMjcrs6vUwZl/u1zr0ro1yNGpiHFVVRUl4Q3oC
 qgOiyFiuPfJPVUr94yO1CA/PuOhPqM8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-sluEfMD8P3iZz51CRYOJ_A-1; Fri, 29 Oct 2021 12:12:03 -0400
X-MC-Unique: sluEfMD8P3iZz51CRYOJ_A-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so2378334wrc.22
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NfO3Uk0uZhN0+/IsUH3RdL3KvWJKSGWEXa3nmt8kxyk=;
 b=hZiIPVPtC5TpevjiDa4hcT2re8iGtiLP9QsuSpV9su729cu1nmxOmBfYAUEdMAmt6i
 x3eR6fhU/KtKW8U0bFxM5L/jdqbOCAp12afZA6VAR6NO+IrMCW3v6DPI9+kGpEYZtCy3
 Mv9zLghVmoXhx4fqn4dNqDSDr1ngNVePo1vtM6C5vg6KtnZpBilLQh2MdstVs/voY6R5
 SzVazRgJZieby4SNKlnve1U2V3emKDBtCpfiH64FanF0Kf3I2cXfLKzbrKVIyuStfdtP
 RtSu7hC5dQxzKOyqW1FkkCKX6AGQUgWdvdn5jE9T0YG/nzBoSDjZmNTRsn6EuX4QfsLy
 opLQ==
X-Gm-Message-State: AOAM5303BImVEzUKgexAGlgGKXmApWylFzY+S8ZHtkXW+0LlmDBlEyXv
 iEgoT0iqIHRAghMNo+aUuxwlGWfxupGY8DvXxlFYBzNXL7aA+BLwvELnGGUxqD5Tx2IBEJ2P0H3
 LZ0E1HTOSn8td7EQ=
X-Received: by 2002:a1c:2397:: with SMTP id j145mr3195638wmj.113.1635523922363; 
 Fri, 29 Oct 2021 09:12:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNCDIqC46ZUUI0YsKN1iFv1oiMudznHnYyba0EcF55z6m/S1T2fDkS414Fh4erNlxKMyrhiw==
X-Received: by 2002:a1c:2397:: with SMTP id j145mr3195614wmj.113.1635523922173; 
 Fri, 29 Oct 2021 09:12:02 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f3sm9182333wmb.12.2021.10.29.09.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:12:01 -0700 (PDT)
Message-ID: <e9ff580e-4a79-8814-8173-88fbf5f36d52@redhat.com>
Date: Fri, 29 Oct 2021 18:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
To: Markus Armbruster <armbru@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
 <66af3635-d6ee-d1c1-5511-af12ba816638@redhat.com>
 <87lf2cdj5m.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87lf2cdj5m.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 16:01, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 10/28/21 12:25, Markus Armbruster wrote:
>>> The generated visitor functions call visit_deprecated_accept() and
>>> visit_deprecated() when visiting a struct member with special feature
>>> flag 'deprecated'.  This makes the feature flag visible to the actual
>>> visitors.  I want to make feature flag 'unstable' visible there as
>>> well, so I can add policy for it.
>>>
>>> To let me make it visible, replace these functions by
>>> visit_policy_reject() and visit_policy_skip(), which take the member's
>>> special features as an argument.  Note that the new functions have the
>>> opposite sense, i.e. the return value flips.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  include/qapi/visitor-impl.h   |  6 ++++--
>>>  include/qapi/visitor.h        | 17 +++++++++++++----
>>>  qapi/qapi-forward-visitor.c   | 16 +++++++++-------
>>>  qapi/qapi-visit-core.c        | 22 ++++++++++++----------
>>>  qapi/qobject-input-visitor.c  | 15 ++++++++++-----
>>>  qapi/qobject-output-visitor.c |  9 ++++++---
>>>  qapi/trace-events             |  4 ++--
>>>  scripts/qapi/visit.py         | 14 +++++++-------
>>>  8 files changed, 63 insertions(+), 40 deletions(-)

>>>      case COMPAT_POLICY_INPUT_CRASH:
>>
>> Clearer as:
>>
>>            abort();
>>        default:
>>            g_assert_not_reached();
> 
> Maybe, but making it so has nothing to do with this patch.  It could
> perhaps be done in PATCH 8, or in a followup patch.
> 
>> Otherwise,
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Okay to tack your R-by to the unmodified patch?

Sure.


