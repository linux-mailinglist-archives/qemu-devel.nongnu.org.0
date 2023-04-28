Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612886F1D02
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:54:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRMi-0007nQ-SC; Fri, 28 Apr 2023 12:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRMb-0007mP-5Y
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRMZ-00064h-2O
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682700865;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=62e71NLiY1HLL/9vUFC43iBSrfn0NMYP47bbSZb1DKg=;
 b=NYdZiBJzbh8ZSbHQg39xIpwsp40QAWua9eOkcMuX6Vua7vv59Snu3dnNKHC50gLg+SKY5e
 7rn0lj/NAunfzJ/wIhiRXRQDU3N5ASm1Y65tX0wg4tLobbOppbQNn8xzPERstM7AHaBbVP
 58jUfNyT1bPWp4s4jAeOYgB6G92FGW0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-dg6L-zdFOgyL4xqZIqxTLg-1; Fri, 28 Apr 2023 12:54:19 -0400
X-MC-Unique: dg6L-zdFOgyL4xqZIqxTLg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f195129aa4so54245615e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700857; x=1685292857;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62e71NLiY1HLL/9vUFC43iBSrfn0NMYP47bbSZb1DKg=;
 b=EtfdHHcxxfA48iQKo4Nk1UlrIquvIzfN5Gl0CWcJcoaHTImbk2H1wXM7VJLnaZnq5R
 h4zQ1syjXNoyex/UWaRIav0iCPXYtwmr3/1kD/ZyZfaUuNm7uHUxwhJpXKM97m02P+Pz
 IgMFtxQjUecM0H7qleOFbmcy2N4EfNsQ4xDFH/jvWHHSb+vDDj4kXLOt9MMbAwnt9eBg
 HVsjdVHsbMAV3YL74cVqACmMZ07By8ewQGzbuvDB8NsfCfWaJZfp8609eBYS3A8SofxF
 Y0K9CTqv/CH1nBC+LKsBVkbPuntRh0uN8O/BCASFGYQGEUcV+/Vh9O8U6Qro9k7Bw7lT
 VfYQ==
X-Gm-Message-State: AC+VfDzZeVCCoDtjeUxirxPokKs+y1mS6ofdlzhhQUL0TISfvzl4VBcL
 UUQmlAxwvIlRwgoddYV94Qbout31IJ2S0aw68qZMAg/GDpqvCIzMuhWXXO+LxDHiUF9fRxt/Xyn
 DgXuMHnCtjZnNg6I=
X-Received: by 2002:a05:600c:299:b0:3f2:50ab:1bba with SMTP id
 25-20020a05600c029900b003f250ab1bbamr4661844wmk.19.1682700857352; 
 Fri, 28 Apr 2023 09:54:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4OWTGJIgj9t6Pq8Gtf9EzHDOssNOEU0RBThpvYwpTVJ98nwZE38CtpUCs54taKsvDmfTik/A==
X-Received: by 2002:a05:600c:299:b0:3f2:50ab:1bba with SMTP id
 25-20020a05600c029900b003f250ab1bbamr4661825wmk.19.1682700856997; 
 Fri, 28 Apr 2023 09:54:16 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003f17131952fsm25075072wmg.29.2023.04.28.09.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:54:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  QEMU Developers
 <qemu-devel@nongnu.org>,  "open list:Block layer core"
 <qemu-block@nongnu.org>,  Michael Roth <michael.roth@amd.com>,  Fam Zheng
 <fam@euphon.net>,  Stefan Hajnoczi <stefanha@redhat.com>,  Thomas
 Lamprecht <t.lamprecht@proxmox.com>,  Peter Xu <peterx@redhat.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
In-Reply-To: <ZEu6lVDVUh8AC6Af@redhat.com> (Kevin Wolf's message of "Fri, 28
 Apr 2023 14:22:45 +0200")
References: <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica>
 <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com>
 <87bkj8bg8g.fsf@secure.mitica> <ZEuEIhe86udi38kx@redhat.com>
 <87354kbdvc.fsf@secure.mitica> <ZEu6lVDVUh8AC6Af@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 18:54:15 +0200
Message-ID: <87jzxw9cco.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kevin Wolf <kwolf@redhat.com> wrote:
> Am 28.04.2023 um 10:38 hat Juan Quintela geschrieben:
>> Kevin Wolf <kwolf@redhat.com> wrote:
>> >> I am perhaps a bit ingenuous here, but it is there a way to convince
>> >> qemu that snapshot_save_job_bh *HAS* to run on the main thread?
>> >
>> > I believe we're talking about a technicality here. I asked another more
>> > fundamental question that nobody has answered yet:
>> >
>> > Why do you think that it's ok to call bdrv_writev_vmstate() without
>> > holding the BQL?
>> 
>> I will say this function starts by bdrv_ (i.e. block layer people) and
>> endes with _vmstate (i.e. migration people).
>> 
>> To be honest, I don't know.  That is why I _supposed_ you have an idea.
>
> My idea is that bdrv_*() can only be called when you hold the BQL, or
> for BlockDriverStates in an iothread the AioContext lock.
>
> Apparently dropping the BQL in migration code was introduced in Paolo's
> commit 9b095037527.

Damn.  I reviewed it, so I am as guilty as the author.
10 years later without problems I will not blame that patch.

I guess we changed something else that broke doing it without the lock.

But no, I still don't have suggestions/ideas.

> I'm not sure what this was supposed to improve in
> the case of snapshots because the VM is stopped anyway.
>
> Would anything bad happen if we removed the BQL unlock/lock section in
> qemu_savevm_state() again?

Dunno.

For what is worth, I can say that it survives migration-test, but don't
ask me why/how/...

Fiona, can you check if it fixes your troubles?

Later, Juan.

> Kevin


