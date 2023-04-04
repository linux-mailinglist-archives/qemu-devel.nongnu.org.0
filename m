Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B956D59C5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 09:37:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjbDq-00069h-5I; Tue, 04 Apr 2023 03:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pjbDo-00069K-7I
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 03:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pjbDm-0004dB-92
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 03:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680593807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Auw9uyAWY4ssRoISxG86VO2GV5or+takoq2LHJvEFjA=;
 b=ewjwwTvErqCdFVIZH/Mv4DjXucQadXn7w6hCvEkgarOHci6bg9yrYkLoM6cui/XW78RHyF
 BXtb7zV9f9qE1f3f+ajMPU1FD11H6QoMuj4fTeDdo//u3pBMuV3Q0a8q3SioeGo29EErEo
 TsEuFR2d6i711G4jT8vtK8TuA9wTPlQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-BwW2PmBnPseG9NeJpsy9NQ-1; Tue, 04 Apr 2023 03:36:46 -0400
X-MC-Unique: BwW2PmBnPseG9NeJpsy9NQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 m7-20020a05622a118700b003e4e203bc30so19177866qtk.7
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 00:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680593806;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Auw9uyAWY4ssRoISxG86VO2GV5or+takoq2LHJvEFjA=;
 b=I/8o4e6zDEGakx8ZOSEfUqYVnR5Ee2MdgfdLQmSOwkXn9uEMhpJfK16MiQR4qbpqQh
 I+ir5e56p7qQ+gX9Y+nBmEgpKhV777eX4MpQ1MaYUbmX5GIe5/jTJ+4yKDnvq3tIkMhD
 FiWdO9xbtWZ8TBlOEy8+LY+LWLnJr56mb7K05z9nTgcSn0LUjC/1qkDXFtRPSmDIj4mb
 U7IlKT56hMGvxxsHLU1iX1sIbkU+xEcJIFQSxNQGc2gR9KYlNbKLtTMgMnMREAHG7rqk
 sOgDjmzdf97KOWyiu6VF8K/tSjZecJCgUAHUbDUc9mxNXTVeqOo89gEPiRLXCdPcB7RM
 NIlA==
X-Gm-Message-State: AAQBX9cCMKayb/+k4djvV/17abt/4GDclkOUdbpoh0Yu0613ynYx4cCH
 3xIN5YiWegqdj2wWwPHD0d0ucz9AFIuEAXAm3/tTd4GSkBU/uQPvtMItZW0TWkA+R46aKCanVav
 WItRXiTOAfZNB+e4=
X-Received: by 2002:ac8:4e47:0:b0:3e4:e2bb:3297 with SMTP id
 e7-20020ac84e47000000b003e4e2bb3297mr2083415qtw.31.1680593806367; 
 Tue, 04 Apr 2023 00:36:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZXI1k6p+XIGHMCOeRgy7524WHj/DAxgule4zJnn3EX9SMgZYNoYkrJ0VKtxcwBwXo8clV+DQ==
X-Received: by 2002:ac8:4e47:0:b0:3e4:e2bb:3297 with SMTP id
 e7-20020ac84e47000000b003e4e2bb3297mr2083395qtw.31.1680593806045; 
 Tue, 04 Apr 2023 00:36:46 -0700 (PDT)
Received: from fc37-ani ([203.163.238.139])
 by smtp.googlemail.com with ESMTPSA id
 w2-20020ac87182000000b003e41dae31f1sm225629qto.67.2023.04.04.00.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 00:36:45 -0700 (PDT)
Date: Tue, 4 Apr 2023 13:06:38 +0530 (IST)
From: Ani Sinha <anisinha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, jusual@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
In-Reply-To: <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
Message-ID: <1de406aa-338f-277a-96a2-dcf6afbc8aec@redhat.com>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On Tue, 4 Apr 2023, Gerd Hoffmann wrote:

>   Hi,
>
> > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > with native PCIe unplug behavior [1] which in its turn refers
> > > back to ACPI PCI hotplug ability to repeat unplug requests.
>
> > A bit concerned about how this interacts with failover,
> > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > Any better ideas of catching such misbehaving guests?
>
> The 5sec are coming from the pcie spec: The hot-unplug request can be
> canceled within 5 seconds by pressing the button again. The problem here
> is that both hotplug and hot-unplug use the same signaling path, so we
> really have to wait the 5 seconds to avoid the OS mis-interpreting the
> button press as 'cancel' event.
>
> ACPI hotplug hasn't this problem.  A unplug request is a unplug request,

For ACPI case, I think all we want is to make sure that the first unplug
event to not stick forever. A non-zero but small delay would make sure
that the first
unplug event would get cleared after that interval and subsequent unplug
events will get registered without that error.

> period.  And it can't be canceled.  So it should be possible to use a
> shorter period.  Possibly even no delay at all.
>
> take care,
>   Gerd
>
>


