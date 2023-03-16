Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B86BCBED
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckSw-0007Td-Tf; Thu, 16 Mar 2023 06:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pckSv-0007SW-1L
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pckSp-00052U-8S
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678961040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5RU0ZvQ3SJIvQASxDxoTCIKrSHS3XARppPg1HhRXMk4=;
 b=OHfYqK4YTbzAI7JnmOGwgRBS3zg5RAkS7NIJapidQXnHNMkdUNVIB4hzlI3UuVw6qvWHfO
 /xUBnd0mq3QrTn1bV74XY/1BM4BHB5eZ1vQwc4E6ogeO2ZiqDWsNcgSArZ9Ce2zwBQ0bOG
 Q0KK/AWugmOOFXd3fFKUAWTjMOgy4B4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-tYN1HNAkPW6EtJvnAUf0Lw-1; Thu, 16 Mar 2023 06:03:58 -0400
X-MC-Unique: tYN1HNAkPW6EtJvnAUf0Lw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k41-20020a05600c1ca900b003ed383b1b62so420478wms.8
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678961037;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5RU0ZvQ3SJIvQASxDxoTCIKrSHS3XARppPg1HhRXMk4=;
 b=Qw2KoGsygR+hdZV2vmSJ3zO6BaO/ihxvIH0YX6YbUbxIC62tcqPlVFxmBHojD1m/jb
 d5JBVHCOA/K2Q4vEeNo9GiOFt1OYDGDkXytMKEzljtD9RMzv3hoOftWgOuud1chzVLSc
 Q7gmlsFM6pLfe0tlLGU5CCxeMq22BPFEU8o0JdFllIZhvugeeQB1oyjMqqL0sIrvBiOA
 dF/1O/Z5a4++puBt0QJJkD7Tvkd8XWKwe2Xbib6GncwUcYQhX6aLtkTgJd46LZaBHZUp
 ktXgAJgY/4ysHRQh67c96ONlUAZ+2jJyRk3wfX8S9dkU9j1cb0OH4/Q2tK62vAolB4zW
 aKzA==
X-Gm-Message-State: AO0yUKUaTArbEizrHaCE1QRQBh4Vhdj8w/Blmr49tjhnMuOIJWsBjvKJ
 io/w6DpheC7ba2q2JIO1go82B03i0Dy/a+CAYTaPLrA/VsEGAFU4Pl3rGSb8t9OpA7PtNv2g1Jk
 zajE3VPuvBgFwZH4=
X-Received: by 2002:a05:600c:1c23:b0:3e2:669:757 with SMTP id
 j35-20020a05600c1c2300b003e206690757mr8069895wms.10.1678961037621; 
 Thu, 16 Mar 2023 03:03:57 -0700 (PDT)
X-Google-Smtp-Source: AK7set/nCRR4BtCnvTHecY5UKzzFTzz/0OXpRc48Yy9kjHZ5FXRvWc5sQslEEwMWK1BZBmfEAE6ZOQ==
X-Received: by 2002:a05:600c:1c23:b0:3e2:669:757 with SMTP id
 j35-20020a05600c1c2300b003e206690757mr8069878wms.10.1678961037379; 
 Thu, 16 Mar 2023 03:03:57 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c059300b003eb68bb61c8sm4612421wmd.3.2023.03.16.03.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 03:03:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  peterx@redhat.com,  lizhijian@cn.fujitsu.com,
 jdenemar@redhat.com
Subject: Re: [PATCH] migration/rdma: Fix return-path case
In-Reply-To: <20230314171558.75941-1-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Tue, 14 Mar 2023 17:15:58 +0000")
References: <20230314171558.75941-1-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 11:03:56 +0100
Message-ID: <87h6ulm2r7.fsf@secure.mitica>
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

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The RDMA code has return-path handling code, but it's only enabled
> if postcopy is enabled; if the 'return-path' migration capability
> is enabled, the return path is NOT setup but the core migration
> code still tries to use it and breaks.
>
> Enable the RDMA return path if either postcopy or the return-path
> capability is enabled.
>
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2063615
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


