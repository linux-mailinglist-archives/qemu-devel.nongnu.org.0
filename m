Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C025686699
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCxb-00045e-FH; Wed, 01 Feb 2023 08:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCxV-00042R-Vg
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCxU-0002yf-3i
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675257325;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CBnIdrigAg4xq9Nn0pkiCzy+TzCK0IYmPxCBJAeioM4=;
 b=Xm5bnqZrzAkBJ6Q4WLSrLcCaTkDiujo9XWMI/xn2H0TM95TJbu4k6kprVhGp4xz4SQKnaA
 6HqHewsfB4Rrk0UJWxkpsCGzTHU3L6jjhQD4uYQhKoCDLuu1TSpEh98AvKimPguqNcaXrm
 4PokDP3tzF14hs645D2XwwUQkkbrwcM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-LJw5uV0vMu-yMhKU6WAbKA-1; Wed, 01 Feb 2023 08:14:22 -0500
X-MC-Unique: LJw5uV0vMu-yMhKU6WAbKA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso4062121wms.8
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 05:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBnIdrigAg4xq9Nn0pkiCzy+TzCK0IYmPxCBJAeioM4=;
 b=yCANEfH+bwo8dIfhuXVZ2h7wM68QjKv72J1dKhNfx5ta95V9fonoVAfNKBQr99BgPg
 2vTgdSy/LgseB2NQDg3y7bUBR3KlpLyM3Et+LnTSGWblME6wElmod5eumf8SL1SCpxgw
 WSiU2kHoqL0ynqHP5/UjpIsOwsZKjTMaZoNzu2cgkTYuDsI+KRPQKYgrAuZnw5vOsQZd
 O+rcgXzwfyH2C3RWObWgJD7mFztOP4wFvZzRFPSWvQLbKosCPTgZGQ1WK6Muf+HhOfci
 YkFnaGXJqbBw7OtltwJxaw43t3sxhpkZJ97kd865U8xbrVN26rVomxaXY4wPggkpE/ZD
 PGPw==
X-Gm-Message-State: AO0yUKWjV9vbqbGK1XdV56RwE2wowg6CljS5820NANdW4CjwfyaXB3Tw
 uYhjYk7MSAoLf/QWOdNhpFXJRGTtk4G9Ml+rNgxAyneJAVtOje8CRyh2zTVwOrVqAZ9N6r4b0Bp
 ACjC8Qt+VWzzrgnM=
X-Received: by 2002:a05:600c:4f03:b0:3dd:e86e:8827 with SMTP id
 l3-20020a05600c4f0300b003dde86e8827mr1890228wmq.4.1675257261456; 
 Wed, 01 Feb 2023 05:14:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9CyzHeq/DwG6rKtBoNVxBsEsdk82yvIqWlasVfWNFldjWjAq+H5O9Yo4NB+BTjopQZA3jv2w==
X-Received: by 2002:a05:600c:4f03:b0:3dd:e86e:8827 with SMTP id
 l3-20020a05600c4f0300b003dde86e8827mr1890191wmq.4.1675257261254; 
 Wed, 01 Feb 2023 05:14:21 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 v2-20020a05600c15c200b003dc54eef495sm1643451wmf.24.2023.02.01.05.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 05:14:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 04/20] scripts/clean-includes: Improve --git commit
 message
In-Reply-To: <875ycly2h5.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 01 Feb 2023 13:49:58 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 14:14:19 +0100
Message-ID: <87bkmdfrys.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> Markus Armbruster <armbru@redhat.com> wrote:
>>> The script drops #include "qemu/osdep.h" from headers.  Mention it in
>>> the commit message it uses for --git.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  scripts/clean-includes | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/clean-includes b/scripts/clean-includes
>>> index f0466a6262..f9722c3aec 100755
>>> --- a/scripts/clean-includes
>>> +++ b/scripts/clean-includes
>>> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>>>      git commit --signoff -F - <<EOF
>>>  $GITSUBJ: Clean up includes
>>>  
>>> -Clean up includes so that osdep.h is included first and headers
>>> -which it implies are not included manually.
>>> +Clean up includes so that qemu/osdep.h is included first in .c, and
>>> +not in .h, and headers which it implies are not included manually.
>>
>> I give a tree.
>>
>> Clean up includes so qemu/osdep.h is never used in .h files.  It makes
>> sure that qemu/osdep.h is only used in .c files.  Once there, it assures
>> that .h files already included in qemu/osdep.h are not included a second
>> time on the .c file.
>>
>> What do you think?
>
> Neglects to mention qemu/osdep.h goes first in .c.

/me tries again

What about:

The file qemu/osdep.h should only be included in .c files.  And it has
to be the first included file.

This script does several things:
- Remove qemu/osdep.h from .h files.
- If qemu/osdep.h is included in a .c file it is moved to the first
  included position if it is anywhere else.
- Remove from .c files all include files that are already present in
  qemu/osdep.h.

Later, Juan.


