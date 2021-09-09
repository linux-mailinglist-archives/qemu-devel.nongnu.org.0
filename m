Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E205404635
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:32:49 +0200 (CEST)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEYB-0007YP-Gk
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOEUZ-00065k-EI
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOEUS-0007TX-Ig
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631172534;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=aIV2pXqG4nVZ2Pw5KYkRHkc8JMQhFwaZ3O5/xqevqMo=;
 b=i2DAvBTVVQNlSkCjz1oyAVdcRZkGL2+D7jt4FCtzlGJ5qcSZwmRXCsBDqVSz+z/khb+h0a
 HoFNKaBFIwa78uneL3O4/cRilbfSZmGT8+tpobyrWZXFQcsCxeZ1t4rVZQh0d8mjouty0G
 mAVzZAiKEHbiYcHL08kujLSCmbS3gLo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-w85pgLA0OEy8cZe6iOxRsQ-1; Thu, 09 Sep 2021 03:28:53 -0400
X-MC-Unique: w85pgLA0OEy8cZe6iOxRsQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so215258wrl.0
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 00:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=aIV2pXqG4nVZ2Pw5KYkRHkc8JMQhFwaZ3O5/xqevqMo=;
 b=vwyVXcFHiVKW6fhKYFvi/cQPl58Ikk//I+fNbweiyElqjQCFaWflnMTV+BIPxtvsow
 4evkfPJPPm6Njs7+saD8LbmoUAYVJ5a7ImVkSJC7ez4wCyZaCfgiNDj6NLxb1RTRudd7
 NVb985Sht5gFOVQ11P1I5Bqfjeb1+/bc0v2QM81yFaAvXtvTBBTSojSYHvtmoYHISlex
 4snhQaxCPpyJqgjdvX4Q+IcYS80gt/sArz6a+vILOIc+ez5wEAQVJZ17TdABVHuyO40J
 ve0nTtGJNVmdybZlOee8MbZneiQ0waM6hwYuvekUmgj0ZC75bNloWhrZpgGYNTnOu5Tg
 DFkg==
X-Gm-Message-State: AOAM530ssRHYoDbRyVtjffZB0yUr7/a8kld6xfio2GCmQu7Mp6dtjolL
 1Uw23nuvZz9FdMfqHRyoEs8wSVhKoWJzEUKljvfL7UCHYHHaI2S8nvIj4+nq4dLVRJEzsawduqn
 MxG9WXGvn5o27iPA=
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr1378494wmf.154.1631172531697; 
 Thu, 09 Sep 2021 00:28:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh/3OyrbVWt7mHIcxuciAHj6d1xsG8jjJm3Uo8DRjcnYjhllm1v4iUnqOt5RwvrRifQ2p4MQ==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr1378485wmf.154.1631172531565; 
 Thu, 09 Sep 2021 00:28:51 -0700 (PDT)
Received: from localhost (static-41-120-85-188.ipcom.comunitel.net.
 [188.85.120.41])
 by smtp.gmail.com with ESMTPSA id m184sm814256wmm.3.2021.09.09.00.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 00:28:51 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v2 1/2] migration: allow multifd for socket protocol only
In-Reply-To: <20210731140552.8818-1-lizhijian@cn.fujitsu.com> (Li Zhijian's
 message of "Sat, 31 Jul 2021 22:05:51 +0800")
References: <20210731140552.8818-1-lizhijian@cn.fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Sep 2021 09:28:50 +0200
Message-ID: <87tuiub425.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> multifd with unsupported protocol will cause a segment fault.
> (gdb) bt
>  #0  0x0000563b4a93faf8 in socket_connect (addr=0x0, errp=0x7f7f02675410) at ../util/qemu-sockets.c:1190
>  #1 0x0000563b4a797a03 in qio_channel_socket_connect_sync
> (ioc=0x563b4d16e8c0, addr=0x0, errp=0x7f7f02675410) at
> ../io/channel-socket.c:145
>  #2  0x0000563b4a797abf in qio_channel_socket_connect_worker (task=0x563b4cd86c30, opaque=0x0) at ../io/channel-socket.c:168
>  #3  0x0000563b4a792631 in qio_task_thread_worker (opaque=0x563b4cd86c30) at ../io/task.c:124
>  #4  0x0000563b4a91da69 in qemu_thread_start (args=0x563b4c44bb80) at ../util/qemu-thread-posix.c:541
>  #5  0x00007f7fe9b5b3f9 in ?? ()
>  #6  0x0000000000000000 in ?? ()
>
> It's enough to check migrate_multifd_is_allowed() in multifd cleanup() and
> multifd setup() though there are so many other places using migrate_use_multifd().
>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


