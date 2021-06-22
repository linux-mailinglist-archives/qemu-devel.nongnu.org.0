Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B13B05B9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:20:16 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgK7-0004oE-Tg
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lvgHK-0001PY-GM
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lvgHG-00021k-TC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624367837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CpbPBZLQCfQh3+q9qioLg7Tlc8kOPBjzEKb6enHYe9s=;
 b=POT88DZdX7jrVMZtrDdxxylQ2d3Oo+99ZewI92DO8kc8daauWc+yYPGA82sLb1GzGW0tpK
 TPSu/ASV+wsrAiKa4KCQdNLBGHufhPxhfSTpmIjsVF+8QXw1+gd+09pPnoaenFra4/9AYz
 pi0TwOXl/zzePlapOVF5qY/un7EP3EU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-wFjRdAmlN4yVA-6YolKi1A-1; Tue, 22 Jun 2021 09:17:14 -0400
X-MC-Unique: wFjRdAmlN4yVA-6YolKi1A-1
Received: by mail-ej1-f71.google.com with SMTP id
 j26-20020a170906411ab02904774cb499f8so5210318ejk.6
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 06:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CpbPBZLQCfQh3+q9qioLg7Tlc8kOPBjzEKb6enHYe9s=;
 b=o3kW8Keztk8LW1oLpRNlQlTntgAgdOAnG19PUMw7xFtGuked2VbPRvp0trr+WZvE3S
 c7PuFU6FbUafebO16vYB/qZ7lGjjkPE3F3JzQAsNo5xEtyXAzrdEz/A9boEHiLJKTuKX
 HSG/zURKRierblVeTTfro6Ukp0efkFHlf2YwrK2gQLXS5HXe9c8YwnbhjssW/1m8RdCZ
 hNJv/goDhO/YJo7hdAUXYqK0W1Gjs5IF9TZHGaLAi8BYBAqI7ZJ66a+k4/El+S/qysJC
 0p6rgh8vAQf53mfP5QcKhDagWqZ3pPTJ9ayNJJoGMTO/B7HYCqbWuLw6k2Ya118z8Jxa
 dSrA==
X-Gm-Message-State: AOAM5325N0nTdKSmEFC+ZC+eaI4TKXo4onoTcMRMwQnWCDCjofSsYfMl
 qCjq1sPZkDaEgvH1cLPoXIBO7R+Ou55jK2HxqBapFKOuyfBg36X/O6psRbuLuBxp28kWvM16M06
 Y5vK5wjxp9pmf28k=
X-Received: by 2002:a17:906:478d:: with SMTP id
 cw13mr3942083ejc.543.1624367829871; 
 Tue, 22 Jun 2021 06:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOtfysJ5UEEQchKtozhNShS3YkAVLVD45Wu88S7KOf0InQ/zJCMgLPLZX2CpMGVmk5v4xn5g==
X-Received: by 2002:a17:906:478d:: with SMTP id
 cw13mr3941610ejc.543.1624367823688; 
 Tue, 22 Jun 2021 06:17:03 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id dh23sm1628763edb.53.2021.06.22.06.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 06:17:03 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 50D6018071E; Tue, 22 Jun 2021 15:17:02 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
In-Reply-To: <CABcq3pHAWuNuuiUgVhx7qXRorBSistct8X4pCNEYdJ0SuLJCWw@mail.gmail.com>
References: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
 <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com> <87o8byqpao.fsf@toke.dk>
 <YNGe3iiZ103ps36n@redhat.com> <87im26qn9q.fsf@toke.dk>
 <CABcq3pHAWuNuuiUgVhx7qXRorBSistct8X4pCNEYdJ0SuLJCWw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Jun 2021 15:17:02 +0200
Message-ID: <87y2b2ox81.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=toke@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Melnichenko <andrew@daynix.com> writes:

> Hi,
> Thank you for your comments.
> I'll play with array type mmap. And later will provide some solution.

Cool - you're welcome! :)

-Toke


