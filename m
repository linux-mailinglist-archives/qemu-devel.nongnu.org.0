Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4044322B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:59:28 +0100 (CET)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwC7-0000Ms-Vl
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwB0-00086o-4p
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwAy-0006Jt-MF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635868695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=O5VD1vW3CiSF19mA4KWNSGIBXv1gYuGea/2fxg6mVFw=;
 b=ihkYdNXB2b2fpSxh8LbMItXnmdcpqK1XYxNBQG9Q5vPKfgj3slfoU15aQWzV5PbVuwSaTp
 nmOThLtaksUK9oxheajYY8s/kNzyYUaC3QSP6GpFp2jiLK1YCpot7kBi8dZRprXtnXmTnH
 dJkoZ8b4LDk9AOm95JTip7+VXcwpJKM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-yLvu1LquNWe8fwQ1_tglsg-1; Tue, 02 Nov 2021 11:58:12 -0400
X-MC-Unique: yLvu1LquNWe8fwQ1_tglsg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso1354766wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=O5VD1vW3CiSF19mA4KWNSGIBXv1gYuGea/2fxg6mVFw=;
 b=6FMtBRDiTtFui9Imq0Y9toNGjgoybf2u2BHofZFwSAWxlQ+fs4dyZdMCd2OF+4UJBe
 mYik6SnfNX+ytBpKSTihvSn9MAl8wgkP2eAsgA/9L8Hc2nGnBkFkePTlOC33QVCo0L+R
 KXGrNkfGIt1ozHwyJMT1onp5VDz4xYOnCaslav61J7ElmI839VMHupo+JJcJ51L+3eVX
 0wgmb3W8HcvAzWVHrE9oKaSM+MHc852ym4Xsdk0BftLjJ1jOVeViQ1N3tEFRMYAG3ruv
 0fUJzeSiBrXOSdTccOMxLBy4/ra/nszbNCEk2kGZbOSP8gDIUa+PF8QQa9QWS9TURuqG
 RVew==
X-Gm-Message-State: AOAM53308iiBwx+PtWvZ3M03RZ6TqOtM4iU30Fn0o/kp/k4TjVRJarIA
 4yz6nfZc2xFirJBc0QnggtqzWjfnYyQ3znXm6WTHe+cBzVlh0+lF+lhDrecJxD0BFuSZZHfyhCL
 VvpUXtxG64XUPOAY=
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr27297974wrn.294.1635868691750; 
 Tue, 02 Nov 2021 08:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmCIce/JG18kpmEBHiH/Z+WRgLXm610ViHj8dMzChueu77jMu4f64+DFaern/ZTvZhMIIWjA==
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr27297946wrn.294.1635868691567; 
 Tue, 02 Nov 2021 08:58:11 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id l5sm2869332wms.16.2021.11.02.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 08:58:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 2/7] Fixed qemu crash when guest power off in COLO mode
In-Reply-To: <1635753425-11756-3-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 1 Nov 2021 15:57:00 +0800")
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-3-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 16:58:09 +0100
Message-ID: <8735oeim7i.fsf@secure.mitica>
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
> This patch fixes the following:
> qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'running'
> Aborted (core dumped)
> The gdb bt as following:
> 0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> 1  0x00007faa3d613859 in __GI_abort () at abort.c:79
> 2  0x000055c5a21268fd in runstate_set (new_state=RUN_STATE_RUNNING) at vl.c:723
> 3 0x000055c5a1f8cae4 in vm_prepare_start () at
> /home/workspace/colo-qemu/cpus.c:2206
> 4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/cpus.c:2213
> 5 0x000055c5a2332bba in migration_iteration_finish (s=0x55c5a4658810)
> at migration/migration.c:3376
> 6 0x000055c5a2332f3b in migration_thread (opaque=0x55c5a4658810) at
> migration/migration.c:3527
> 7 0x000055c5a251d68a in qemu_thread_start (args=0x55c5a5491a70) at
> util/qemu-thread-posix.c:519
> 8  0x00007faa3d7e9609 in start_thread (arg=<optimized out>) at pthread_create.c:477
> 9  0x00007faa3d710293 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Good catch.

queued.


