Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C026EF888
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:36:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pri7l-00044D-UE; Wed, 26 Apr 2023 12:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pri7j-00043y-MK
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pri7i-0000HT-8x
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682526965;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tJbo7+yfJl/15rpiHJfGAxN0KIDVwf+5lAOiRaTGX60=;
 b=Bw4uB0e3mcud/Of7krYx0i04GG41/s0IRvGZLbPURxY5dShYlZFDE6luTLwd4mwc5nglAw
 pzgYgIKAetvE3Jg2TGyAE+LkOr3XaYYWxssTG321WcYV4XzE0APHLVoJx9Q/Avh0Zy+smB
 tqeBm4JeghQYbFjmBgxZ92HV7IkolDg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-qSMhsNpFMNK4KHpY01jJjw-1; Wed, 26 Apr 2023 12:36:03 -0400
X-MC-Unique: qSMhsNpFMNK4KHpY01jJjw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f195129aa4so35172405e9.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526962; x=1685118962;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJbo7+yfJl/15rpiHJfGAxN0KIDVwf+5lAOiRaTGX60=;
 b=MDpmwtqw3JJCmioHFTDYI0DVdQ0lpicYYo1hGvchrIKJBXZaOr9Mcng3lHUTBv1xun
 +rB70IBLLJtfsnKMiKEN4FJdIOU9d9M9WXWn6bKB4FSscZKI2hzzvZJ/x6rnBJLt/m6D
 0gT/4r1QGthAt5hZmEpk53O7ivNOP+nVaCKJqvWpjEMHVv8jlu8vM3PfjUbUVoe4NUfo
 EHoOtI5oL9HwBDbt9tkm5KcWvt+3mbPWXiCKGuqmKKt8mXrtyODNXpmM4dMGE1YsZNH7
 sKIrcEPvWfD6PA9S3EJrkRtcs8+1aqDT1J34vfc2K/3e0zMDTEMdO3SSYcSnQbM0UqrT
 /4KA==
X-Gm-Message-State: AAQBX9eavRW0F3YYEyI6VwiNG0UPj6dH0iXn6T7JXRQJx5axPusesLEZ
 2Wols2srhA+lM93opNH69qRhAyr5ZicdpcfPdsJl8MlRnx/KYhyC6PLEDWD3Fki9356ybtaIaSl
 oSA7+0j1bIr6lDfM=
X-Received: by 2002:a05:600c:b5a:b0:3f1:979f:a734 with SMTP id
 k26-20020a05600c0b5a00b003f1979fa734mr11103910wmr.11.1682526962704; 
 Wed, 26 Apr 2023 09:36:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350aioricuN2cGXIGbeOAo+TsTIjCj2C/ptizmX258J9DHjrg+LKPXnwpwaRU5igcUAwm2VNlsw==
X-Received: by 2002:a05:600c:b5a:b0:3f1:979f:a734 with SMTP id
 k26-20020a05600c0b5a00b003f1979fa734mr11103900wmr.11.1682526962400; 
 Wed, 26 Apr 2023 09:36:02 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003f03d483966sm21924680wmi.44.2023.04.26.09.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:36:01 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 0/2] vmstate-static-checker: Fix VMS_ARRAY comparisons
In-Reply-To: <20230425180544.1815888-1-peterx@redhat.com> (Peter Xu's message
 of "Tue, 25 Apr 2023 14:05:42 -0400")
References: <20230425180544.1815888-1-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 18:36:00 +0200
Message-ID: <87354mfvnz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Peter Xu <peterx@redhat.com> wrote:
> I'm doing some machine type checks to make sure nothing breaks for
> 7.2<->8.0.  Along the way I found one false negative report on e1000e using
> the static checker, turns out to be an issue in the checker itself.
>
> The problem is the checker doesn't take VMS_ARRAY into account when
> comparing with UNUSED, hence the total size is wrongly calculated.
>
> Fix that first in qemu by start dumping size of array as "num", then teach
> the checker for that.
>
> NOTE: the patchset will change both behaviors for either -dump-vmstate on
> QEMU or the checker, however both patches will be compatible even with old
> QEMU dumps or even old vmstate-checker script.  That's not extremely
> important, IMHO, but still worth mentioning.
>
> Thanks,
>
> Peter Xu (2):
>   migration/vmstate-dump: Dump array size too as "num"
>   vmstate-static-checker: Recognize "num" field
>
>  migration/savevm.c                |  3 +++
>  scripts/vmstate-static-checker.py | 13 ++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)

Hi

once that you are working with the static checker.

Could we just run two checks in make check:

- qemu-<whatever> -M <previous-version> against the one from previous
  version, and see that they match.
- qemu-<whatever> -M <latests> against the one from previous version
  And we save the diffs each time that we add something incompatible and
  fix it on source.

I will start with x86_64.  And once that we have it running, the other
architectures that care about version compatibility can add to it.

What do you think?

Later, Juan.


