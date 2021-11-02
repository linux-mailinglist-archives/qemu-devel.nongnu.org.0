Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0E443263
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:09:57 +0100 (CET)
Received: from localhost ([::1]:33632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwMG-0004qV-O8
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwG4-000584-GG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:03:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwG1-0002pp-JR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869007;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Cf6tntyufmefjRaPDjddOwTzB5TgzD2E95XUoHCXTfo=;
 b=g7fRfaDtTSEbe3rfNZ+T61JZhJJ/4Zv6vL4fv0bscllJpJoHrs8MFzSJjiJaHEGAC6HPbY
 EbEcpdMY+nMp+mHxKbq+ISYBoXriGyxDtk8300NxSBTuG3blBPP8jat/L2eID+qEJLh1BD
 lRojxB8WGzNjmLi7fq6O07TJLgS4dvM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-WOo7zBm4PZeSBj4XE5gkmg-1; Tue, 02 Nov 2021 12:03:25 -0400
X-MC-Unique: WOo7zBm4PZeSBj4XE5gkmg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v13-20020adfe28d000000b00186c47ee9e3so304247wri.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Cf6tntyufmefjRaPDjddOwTzB5TgzD2E95XUoHCXTfo=;
 b=p7jthhJsxEk/o/c7S4PwcHE2112OTHdAF+zeFu0ns1qSu74OZBj4xBheza3tEWftvX
 NrigKZRnwB462OpDfTqYIV+fJ/LrE7FxRLpLfIdYf24nSj8d74y8lSjL0PJVdBLYNsOg
 vzDczAbcYIQzZj5gsVs/hDbSpxIj5TMLwKtEbfvWqtSrwa0jcl8b5vKFC1dquvQC32ru
 ibuhfy/2MQTwmMG0QWxBnXGBKyo2oSRuiqgtCP7X3KpYoYStQpodf3UQHXbNfNFWdygk
 589J45VRKAdgzy5hqmgF8lgxB2CB9dbEXRIBveYr3f6np3m1LlC8BZ2Oo7N3A0xhX6fe
 8zZA==
X-Gm-Message-State: AOAM530UG9/pybouliuLMwcViEu6+UwnO9NykHxyJA/URXOPVA5YPYOw
 IIK/LEaWsFc0ML7v1xIC62tFnttZxUFLL596NLYmYs+xskUQbU8Dt+vK0KoZUFBxUHYEUiRkEJN
 O+FbA/+YzQFjNCHw=
X-Received: by 2002:adf:c604:: with SMTP id n4mr47153075wrg.202.1635869004434; 
 Tue, 02 Nov 2021 09:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7AVBihRrKV4damTwfQwPI6AX5NR3Tymd9rdM+BD8/GpyRYdyInsxVj/WLmXcxJkvoimfnXQ==
X-Received: by 2002:adf:c604:: with SMTP id n4mr47153043wrg.202.1635869004225; 
 Tue, 02 Nov 2021 09:03:24 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id p13sm3400762wmi.0.2021.11.02.09.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:03:23 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 4/7] colo: fixed 'Segmentation fault' when the
 simplex mode PVM poweroff
In-Reply-To: <1635753425-11756-5-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 1 Nov 2021 15:57:02 +0800")
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-5-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 17:03:22 +0100
Message-ID: <87sfweh7ed.fsf@secure.mitica>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lukasstraub2@web.de, zhang.zhanghailiang@huawei.com,
 lizhijian@cn.fujitsu.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> The GDB statck is as follows:
> Program terminated with signal SIGSEGV, Segmentation fault.
> 0  object_class_dynamic_cast (class=0x55c8f5d2bf50, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:832
>          if (type->class->interfaces &&
> [Current thread is 1 (Thread 0x7f756e97eb00 (LWP 1811577))]
> (gdb) bt
> 0  object_class_dynamic_cast (class=0x55c8f5d2bf50, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:832
> 1  0x000055c8f2c3dd14 in object_dynamic_cast (obj=0x55c8f543ac00, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:763
> 2  0x000055c8f2c3ddce in object_dynamic_cast_assert (obj=0x55c8f543ac00, typename=0x55c8f2f7379e "qio-channel",
>     file=0x55c8f2f73780 "migration/qemu-file-channel.c", line=117, func=0x55c8f2f73800 <__func__.18724> "channel_shutdown") at qom/object.c:786
> 3  0x000055c8f2bbc6ac in channel_shutdown (opaque=0x55c8f543ac00, rd=true, wr=true, errp=0x0) at migration/qemu-file-channel.c:117
> 4  0x000055c8f2bba56e in qemu_file_shutdown (f=0x7f7558070f50) at migration/qemu-file.c:67
> 5  0x000055c8f2ba5373 in migrate_fd_cancel (s=0x55c8f4ccf3f0) at migration/migration.c:1699
> 6  0x000055c8f2ba1992 in migration_shutdown () at migration/migration.c:187
> 7  0x000055c8f29a5b77 in main (argc=69, argv=0x7fff3e9e8c08, envp=0x7fff3e9e8e38) at vl.c:4512
>
> The root cause is that we still want to shutdown the from_dst_file in
> migrate_fd_cancel() after qemu_close in colo_process_checkpoint().
> So, we should set the s->rp_state.from_dst_file = NULL after
> qemu_close().
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


