Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9CA679CB6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 15:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKKiw-0007LA-DX; Tue, 24 Jan 2023 09:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pKKil-0007I2-Bc
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:56:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pKKij-00084P-FQ
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674572180;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=ChITr7Qhr9nwz/X+4II6I4+FYa5Bsc0VGpOVDoqL48s=;
 b=b/USpkjfaYJDpsizv72WVgMRHxapesFVyIHGslWp+x4vBQ24NcWfj6SG+c1l9CSqqsXLGf
 sLeclDc7oKNkbTy5tjD63MMEA65FNxmAHAOeqhq3vCzTQ3oxEc395tETcfMUerMCsFvAZy
 fdu088MqHLWYm6dn5CmXdF7GH3NO2/8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-qzIhR6cUPbSiZ3c4_VgaxQ-1; Tue, 24 Jan 2023 09:56:19 -0500
X-MC-Unique: qzIhR6cUPbSiZ3c4_VgaxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l19-20020a05600c1d1300b003dc13fc9e42so938426wms.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 06:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ChITr7Qhr9nwz/X+4II6I4+FYa5Bsc0VGpOVDoqL48s=;
 b=gT6OVqP9U9A6Xzrhz7v4uchiqFBc2TTdCeLErKITNDa1O/YkqMpEKINq5ZJjtTvhyl
 dm9BQZVxM+Gpbhiczc1mnElcQwozJ902WFG5VB0awJtpWS8qqd+Uvv0ji3u8LD43DuR5
 Ja/9TAXEFe/FmHfL/e2EJ/zjGMLR5wv/IpOJ2hDwM3iykhNUiHQKCY6IvaRMshda2wpH
 PgEbe71VbgAj8lztdmhFXeK4vlBLvc7YFCh2uwOylBArKH3R3ctOPKZDbJMuKNogtQbU
 FZfilzLbroWpMJodyPvNHlfu8Ohz5RAkZ1pQqVNnQSe6m2alSLlBa1TS/MMBax8QD8Yf
 REfA==
X-Gm-Message-State: AFqh2kojpxxbvRYSVPPg8onoTgTpw6kodoGYf4/C0kIAlEEsfAzyIXXx
 tUJwvKXlSV1jVjzA3smCfhBNSnKpnE876Ji3uph5/ZK2TeItR46A+fhnf9q98dHbMausyhmQjTZ
 CKNqpBDI21yDJ21w=
X-Received: by 2002:a05:6000:1816:b0:2bd:fe5a:b579 with SMTP id
 m22-20020a056000181600b002bdfe5ab579mr22886675wrh.70.1674572177291; 
 Tue, 24 Jan 2023 06:56:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHe1YzvNCX46JuK4XR/df1BCMeEfzavFFDAocn1pipZmxAFxwf6Qb/tkqZ0rBblq2hSVdj5Q==
X-Received: by 2002:a05:6000:1816:b0:2bd:fe5a:b579 with SMTP id
 m22-20020a056000181600b002bdfe5ab579mr22886656wrh.70.1674572176977; 
 Tue, 24 Jan 2023 06:56:16 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d2-20020adfa402000000b002bdfb97e029sm2122358wra.19.2023.01.24.06.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 06:56:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: Fortnightly KVM call minutes for 2023-01-24
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 24 Jan 2023 15:56:15 +0100
Message-ID: <87zga8f0c0.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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





First part stolen from: https://etherpad.opendev.org/p/qemu-emulation-bof%402023-01-24
      thanks Phillippe

Single QEMU-system binary and Dynamic Machine Models

Meeting link: https://meet.jit.si/kvmcallmeeting
Just want to dial in on your phone? Dial-in: +1.512.647.1431 PIN: 1518845548#
Click this link to see the dial in phone numbers for this meeting https://meet.jit.si/static/dialInInfo.html?room=kvmcallmeeting

What needs to be done?

    TCG

    How to use different page sizes

    -> convert to page-vary (already used by ARM/MIPS)

    ref: https://lore.kernel.org/qemu-devel/20221228171617.059750c3@orange/


    HW models / machine


    How to create/realize 2 QOM objects which depend on each other?

    what (properties) need to be wired? IRQ, reset lines, MR?


    Sysbus: Demote it to plain qdev?

    con:

    sysbus helpful to remove qdev boilerplace/verbose code

    sysbus tree does the resets [currently blocking qdev conversion]

    pro:

    sysbus IRQ API

    too abstract, not very helpful, "named gpios" API is clearer

    sysbus MMIO API

    also kinda abstract, MRs indexed. No qdev equivalent

    sysbus IO API:

    not very used. first we need to get rid of ISA bus singleton


    Single 32/64 *targets* binary

    Which 32-bit hosts are still used? OK to deprecate them?

    Some targets need special care i.e. KVM 32-bit ARM vCPU on 64-bit Aarch64 host


Previous notes:
    https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
    https://etherpad.opendev.org/p/qemu-emulation-bof%402022-11-29


Do we care about this?

64 bits guests on 32 bits hosts: OK to deprecate
32 bits hosts: still in (some) use

Creating and realizing two objects than need to be linked together.

We can't do it with realize, perhaps we need an intermediate state to
do the link, and then realize.

Can we get Peter or Markus or Paolo for the next call?
waiting to get some patches into the list for discussing.

Problem for Phillipe is that he has to do changes to the API's and
want to be sure that they are agreed before he changes all
devices/targets, a multi month task.

For removing sysbus, we need to wait for reset rework from Peter?

Expose the memory API to external processes.

Under what circumstances you should be able to create/destroy a memory
region?



Later, Juan.


