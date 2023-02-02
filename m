Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF36687AE9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:55:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXFJ-0000pG-68; Thu, 02 Feb 2023 05:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXFB-0000oK-Ef
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXF9-0003eo-W6
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335303;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NLSAVDoZylH9Kgdm2kdmt4N6jPXJUGvaGdKnV+wEGHI=;
 b=ENyfs6nP2ddE4bTQfrpfAtW24wxh+PPlEgY2tflvXdZ3VwNNtpXFJ2USIH9zb9rwzgY6w4
 c+rWsr5R2Xd3cG7Lww8nRY1n5BeGvO3HD2MmzvWkpHdZmxmZ6dafQRTX2AkfJ+H78bpMqe
 GwIryiQ6a00hnTdduHvb8mHzDeiXDO4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-oVQks8U8OAewValOWF1FTA-1; Thu, 02 Feb 2023 05:54:57 -0500
X-MC-Unique: oVQks8U8OAewValOWF1FTA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m3-20020a05600c3b0300b003dfdc6021bcso623785wms.3
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLSAVDoZylH9Kgdm2kdmt4N6jPXJUGvaGdKnV+wEGHI=;
 b=V99UkE/DsJlnrg4rn1ZKBdmxZJ9lbqswfeZ9Acyqmu3B9oNvpnieHkYHr/zUSRSNNN
 TatEAKsuAMwFi31jlQcuZMpJOLXa7ZrD140nbYxp4/4VrrthwMxElp4cI/rTsYEkzbYS
 7ZH+xM4PI2XY/IN2Klkk1WB5+QtS5ivMCwZTZffZqP9JMrtrJjpH+PwxiT0BlMEQindB
 aQOAjT0LIjrh0OeoTJFBo2PD4cLgfQczHN0XGhUJnO+G0kZJiIguXVvh1ZAYoUiSZnlw
 MDn7loOkNOYYJ1YSdOx7JnNEqVOIprBZaEOiGBMqmnYn6byueQfBgiikdU4y1XVEhipq
 FOoA==
X-Gm-Message-State: AO0yUKUBPtS/aj+ryuxvrdS9yhfgpX1bdFyXacPFbFQnoHCjOJA63Zhc
 BXszdLdnE5PrfJ6akolCIbPp7uaKRLH63u34PHKO9C3I8t/lxeB+AUpeeF5fTbhcKKRSJ+78fH3
 QX08F3fxoYDfWoco=
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id
 be13-20020a05600c1e8d00b003dfdeb56ff5mr1061616wmb.24.1675335296020; 
 Thu, 02 Feb 2023 02:54:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8DaXM9gSYh/45BWzUlNpkLzkh2cUwMTm10tdgAFg15v78gsYhSUbWuQYjC0ffljA596j4fOQ==
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id
 be13-20020a05600c1e8d00b003dfdeb56ff5mr1061603wmb.24.1675335295873; 
 Thu, 02 Feb 2023 02:54:55 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a18-20020a5d5092000000b002bdd8f12effsm19369533wrt.30.2023.02.02.02.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:54:55 -0800 (PST)
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
In-Reply-To: <87k010phku.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 02 Feb 2023 10:00:49 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
 <87bkmdfrys.fsf@secure.mitica> <87cz6twldq.fsf@pond.sub.org>
 <877cx11lny.fsf@secure.mitica> <87k010phku.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:54:54 +0100
Message-ID: <87zg9ws5fl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

> It's less terse.  Fine with me.  The mix of passive and active voice
> feels a bit awkward, though.  Another try:
>
>   All .c should include qemu/osdep.h first.  This script performs three
>   related cleanups:
>
>   * Ensure .c files include qemu/osdep.h first.
>   * Including it in a .h is redundant, since the .c  already includes
>     it.  Drop such inclusions.
>   * Likewise, including headers qemu/osdep.h includes is redundant.
>     Drop these, too.

Perfect, thanks.

Reviewed-by: Juan Quintela <quintela@redhat.com>

or whatever you want it O:-)


