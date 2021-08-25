Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F043F7804
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 17:08:51 +0200 (CEST)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIuW8-00067j-CC
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 11:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIuVM-0005S9-LC
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIuVL-0000yb-7w
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629904070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DFATpKhUK++KMVoy8odQzirKysdndu42sp1X0H7WHK4=;
 b=D8lt8oujHICpaV+ZQsvwBKrs9w1eE8fp58KbiUsxkBzDkCHu32zOQK3L1XVieuhrllSZlT
 PtBppZvo0Renjb4ViUzB6mSd3u2I3xH80gbZPPpOnmh1FhC3nhDMU4SkTZtJ0MmnWDtkzS
 gVvD9/tu0tOCdslO8BP5XrsxhvoXdZM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-cNPFm8QCNQ-VSEtdqkBltQ-1; Wed, 25 Aug 2021 11:07:49 -0400
X-MC-Unique: cNPFm8QCNQ-VSEtdqkBltQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 b7-20020a5d4d87000000b001575d1053d2so1897980wru.23
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 08:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=DFATpKhUK++KMVoy8odQzirKysdndu42sp1X0H7WHK4=;
 b=bpbXJYOFPW50HRwsaPqdhqd7IheLKPNcByBOd7cJGqiLq8LrZ36mo2m/tu4lUTUOy9
 lo0dFxfaEJ5J++N5KsktQq/Q8PqaDd753YdowAGgydiHlgv4kPMvePtQB3W4gNhTZasC
 A1ciFliKPxR97XzpWb3UhQZmH9QYMtKvIW1PvF5AKMKkCuuWiEP5+3v54bim5utYLy1g
 0Ya1ADKFxlQm1kuIoDJFQZMocIYb7/yQPY+to0MgjsBv2vsGzcNBa8B09h80efhDk6cX
 oBhH4PoN3IY/CpLDujl0h1pbZGj45q80tFTJxCbT7grC4QpZjUjlBaGbVqvV0JG0N6mo
 wU4Q==
X-Gm-Message-State: AOAM532UM1mWJe0o1SyrAJbNqDSDNAtoN6HKspHayg4m35NyN+qpgZfK
 GEz5liPw6hBULLbuvkICiEJwAxZPj0s3TFZfgA4Ze4sREg9Hn5Gf4cotcxsA3BzeQeeknCvjNjx
 SHXjmXEYjPU6AAeE=
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr15787035wrw.43.1629904068271; 
 Wed, 25 Aug 2021 08:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/8iF+c4yyE43LzTvqVsz+iZqRo9eTgG+11ubs10IRio85Bu60r/gRP2j8IEQV336XQTwbGQ==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr15787014wrw.43.1629904068126; 
 Wed, 25 Aug 2021 08:07:48 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id e2sm179905wrq.56.2021.08.25.08.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 08:07:47 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v2 2/8] qdev/qbus: remove failover specific code
In-Reply-To: <20210820142002.152994-3-lvivier@redhat.com> (Laurent Vivier's
 message of "Fri, 20 Aug 2021 16:19:56 +0200")
References: <20210820142002.152994-1-lvivier@redhat.com>
 <20210820142002.152994-3-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 25 Aug 2021 17:07:46 +0200
Message-ID: <87mtp54l6l.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
> Commit f3a850565693 ("qdev/qbus: add hidden device support") has
> introduced a generic way to hide a device but it has modified
> qdev_device_add() to check a specific option of the failover device,
> "failover_pair_id", before calling the generic mechanism.
>
> It's not needed (and not generic) to do that in qdev_device_add() because
> this is also checked by the failover_hide_primary_device() function that
> uses the generic mechanism to hide the device.
>
> Cc: Jens Freimann <jfreimann@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I see why you want this change.  It was done the other way to make sure
that we only tried to hide the divec is there is a failover_pair_id
property.  You can't have both.


