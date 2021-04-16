Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE6361A8F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:34:43 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXIzy-00050X-JA
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lXIyw-0004EB-5k
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lXIyr-0002KO-DZ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618558412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+rWdp6fkQlBnFz33T/RESaBIgFXdI5dUoEVlFbHIZw=;
 b=Pfs9BT3ACh2O54aFJgKO4qSaBOT+C9CUXvUmmfq7XyvRBG+bAuSVOhTPSp8w4QqSyTfhkB
 BxeBgcCjQcFxU88a7cmaSCSaprRkwhnyGOsv/PsabL2I7HAfTJI61NEi4ZWqhWet5dKuke
 pUaDxfX1GIzHM8XJ7hppSUOc9qscCgo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-EEdgUnVDPbKKcl9InRpatw-1; Fri, 16 Apr 2021 03:33:30 -0400
X-MC-Unique: EEdgUnVDPbKKcl9InRpatw-1
Received: by mail-ed1-f72.google.com with SMTP id
 m18-20020a0564025112b0290378d2a266ebso6513129edd.15
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 00:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=7/J1cqxiDxp/A/BtSCuJ1m4UNRLjQXWXxUIY5MSVQRM=;
 b=YmW/b1Rl7tinAqsKcG/7ZIFhP0fG1XX9z64WG/qmnx0EKj9HipUak3gZBiedLs94oG
 5hd7ELFuqgt4Mx1TIgybnQzGyGwzF9Kevfjy9p4TqlSrlFWHNG/ThCPba/ETiXrYLbWp
 IOEM95Ph+011s2VNj3UbSELQAFOWb4LrSuxhq2Srwept28CG5kHuEzaJ04zc7ZDxg8ky
 h0eGRf2HhInYV+KIBnMiZah40lIoLFlxowOyLD2WTytA8YJm22j7Iu63KbE5Ep9g5ION
 5VxHXP9Ibrd0DUR3yQ8VbxQByxLslrAbvqDokKrD3tf7KsUXqn0qSHJxsNvPXf/x3zDX
 3IEg==
X-Gm-Message-State: AOAM533zReTB5jso57HhqQiYjbv1rmnJpe24fXhux1WEbwNi4yyW7fvH
 eah5goujt2qguPpRXxP/DLBBCjg4d6GOf+POlLEM4EBwrebfT2SQZA2XoQO/ExAsSJCSSBCggJ7
 sUzDm4nk97eldsTI=
X-Received: by 2002:a17:906:5e15:: with SMTP id
 n21mr7021246eju.57.1618558409718; 
 Fri, 16 Apr 2021 00:33:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcjeCjSZ+mSiZxD0quJW4/1MCzTH8fGu0uMzLlGsGMTcwmdkOqa8vrxXCsFOGwoMqZsHsazA==
X-Received: by 2002:a17:906:5e15:: with SMTP id
 n21mr7021232eju.57.1618558409547; 
 Fri, 16 Apr 2021 00:33:29 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id u1sm4545910edv.90.2021.04.16.00.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 00:33:29 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, =?utf-8?Q?Daniel_P=2E?=
 =?utf-8?Q?_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
In-Reply-To: <YHh3trxdMQ85NRTh@work-vm>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com> <YHh3trxdMQ85NRTh@work-vm>
Date: Fri, 16 Apr 2021 09:33:28 +0200
Message-ID: <874kg68z07.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
>> On Thu, Apr 15, 2021 at 05:44:02PM +0200, Vitaly Kuznetsov wrote:
>> > When a migration blocker is added nothing is reported to the user,
>> > inability to migrate such guest may come as a late surprise. As a bare
>> > minimum, we can print a warning. To not pollute the output for those, =
who
>> > have no intention to migrate their guests, introduce '--no-migration'
>> > option which both block the migration and eliminates warning from
>>=20
>> I wonder how this is actually going to work in practice ?
>>=20
>> At the time libvirt starts a guest, it has no idea whether the guest
>> is likely to need migration 3, 6, 12, 24 months in to the future.
>>=20
>> IOW, we can't use a --no-migration flag and will be stuck with these
>> warnings no mtter what.
>>=20
>> Is it possible to query the migration blockers via QMP ?
>
> It's possible to query the currently active ones, as of 6.0; from my
> commit  3af8554bd068576b0399087583df48518a2a98f6 it appears in the
> output of query-migrate in the 'blocked-reasons' list.
>
> The HMP equivalent is a64aec725ea0b26fa4e44f8b8b8c72be9aaa4230 showing:
>
>     (qemu) info migrate
>     globals:
>     store-global-state: on
>     only-migratable: off
>     send-configuration: on
>     send-section-footer: on
>     decompress-error-check: on
>     clear-bitmap-shift: 18
>     Outgoing migration blocked:
>       Migration is disabled when VirtFS export path '/home' is mounted in=
 the guest using mount_tag 'fs'
>       non-migratable device: 0000:00:01.2/1/usb-serial
>    =20

FWIW, this patch makes '--no-migration' an 'ultimate big hammer' so not
matter how many blockers are there, the output will look like:

(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Outgoing migration blocked:
  Guest is not migratable ('--no-migration' used)

--=20
Vitaly


