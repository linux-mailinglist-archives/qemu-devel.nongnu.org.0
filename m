Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9573F7810
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 17:13:33 +0200 (CEST)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIuaq-0000mj-OA
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 11:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIua5-00005A-F9
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIua3-0004Jd-7W
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629904362;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=p4hC1fehoFdA+Vhvcn4EbPIoYkQjRl4x9cQ2ooRpbH8=;
 b=hW3Bv112QACqLwFMTPm812qbTxq7dF5QqXZVqlD9htOHoNioPs6jXGVujc75u3W1Sr3vld
 va15qTFprF5nmxZc1jdTuXkJKaHiQHBXve0lA3I9x+UJiQm0KShUnaUfgy7JgmYSd3O2mG
 YxG52OnPrUhPU010qyIOuUgwakmrWVk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-Qm5ropbFOeeZHBS9KBK_NQ-1; Wed, 25 Aug 2021 11:12:41 -0400
X-MC-Unique: Qm5ropbFOeeZHBS9KBK_NQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q11-20020a5d61cb0000b02901550c3fccb5so6740095wrv.14
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 08:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=p4hC1fehoFdA+Vhvcn4EbPIoYkQjRl4x9cQ2ooRpbH8=;
 b=fcXDE0pcru4jnT6nYPEBeSagKR/kcbQZTf/pQlK3Oig0g+upwQ7sLJi61700o5jnWo
 5yHGv6ts32Exr9/szScg45zIeakFRG42djaZ5B62H3XhooqASpTkRbGTKalnlotpr7D+
 wRG43p5XPQ5wksQArtufJt8NC8Hq37VtD6vuiPSSWO9jaFN8vrw9zjIkJMYNvbJq4FL8
 fIaKSg8dIlV5exEDkADZ62vX6PIa9urwmLl/8EaxRAR40n0b8tI746Bgqr1gC4Tk0Hva
 AIuOmoeaJ4CU11w7H+zRFXZPH+oL3QnZnSuvxyz8ITEHW6XY2EKlFyL4oYZADeijGQ57
 7Xuw==
X-Gm-Message-State: AOAM533PdKTZS+f++ZZcUtfLBLCEfN6HmraPMlDSvjjlwkFkVk70h+q6
 fqoi3q1xxLuEi3RQc0O2iq8Fr65b7dYs8vckUrfpdyL+rnVDm2w/12fADV57q1Rrig+YzoCF7cp
 uzalNNkDQJkrv+jw=
X-Received: by 2002:adf:eb89:: with SMTP id t9mr27115427wrn.66.1629904359915; 
 Wed, 25 Aug 2021 08:12:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwsNgtBotUzF1wqavcy1b4jQaJx4PzRuXIcZHPtfwASB2CKLkDN0HCVeFZ6jm90x1KbXbWQA==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr27115402wrn.66.1629904359734; 
 Wed, 25 Aug 2021 08:12:39 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id t7sm148670wrq.90.2021.08.25.08.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 08:12:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v2 6/8] failover: pci: unregister ROM on unplug
In-Reply-To: <20210820142002.152994-7-lvivier@redhat.com> (Laurent Vivier's
 message of "Fri, 20 Aug 2021 16:20:00 +0200")
References: <20210820142002.152994-1-lvivier@redhat.com>
 <20210820142002.152994-7-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 25 Aug 2021 17:12:38 +0200
Message-ID: <87eeah4kyh.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> The intend of failover is to allow a VM with a VFIO networking card to
> be migrated without disrupting the network operation by switching
> to a virtio-net device during the migration.
>
> This simple change allows a simulated device like e1000e to be tested
> rather than a vfio device, even if it's useless in real life it can help
> to debug failover.
>
> This is interesting to developers that want to test failover on
> a system with no vfio device. Moreover it simplifies host networking
> configuration as we can use the same bridge for virtio-net and
> the other failover networking device.
>
> Without this change the migration of a system configured with failover
> fails with:
>
>   ...
>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>   -device e1000,failover_pair_id=virtionet0,... \
>   ...
>
>   (qemu) migrate ...
>
>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>   error while loading state for instance 0x0 of device 'ram'
>   load of migration failed: Invalid argument
>
> This happens because QEMU correctly unregisters the interface vmstate but
> not the ROM one. This patch fixes that.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

One could even defend that unpluging the device and *NOT* unpluging the
ROM is a bug, independently of failover, no?

Later, Juan.


