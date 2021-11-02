Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10CF443322
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:38:29 +0100 (CET)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwnt-0000yr-3j
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwK1-0002KT-Jk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwK0-00069k-3H
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869255;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=naeNfJ1TqzZH/8keuwry9MmbjTJ1CNMH7tQ0vK4M2MM=;
 b=G/DKdD6p1+emi0CjN1CNnMmsDE/9vVAPNU4CPkGdpzjsoVx2M6+nUvXgU0Nrfebk1iJdgj
 92k8yy3XZaZyL2+xfHqpa76OwtsRqfg+PO69yubAHSID/QvNjBJmrDZJLpkV+cqFIKr82k
 Zphi9LJpsZBEwR4tZWcCgX9nyjjUTKg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-jQZTPU8qMxSy9YcdPUzJeQ-1; Tue, 02 Nov 2021 12:07:34 -0400
X-MC-Unique: jQZTPU8qMxSy9YcdPUzJeQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so762387wmb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=naeNfJ1TqzZH/8keuwry9MmbjTJ1CNMH7tQ0vK4M2MM=;
 b=lI38ukjVukt2ufDUlP6AAoMmtObeG4EVWeztTEO0L0zP6B3M35cdv6TT4FYB9uBYoa
 ROKObqaW+JvOOrFnee5IVq3mS3JggmWXwaZaKe/jTfi+peEZdhFhB/tDxCZIBUjlqrWE
 sSq70ARTuTArQuanzu49rNYit7QfKTGf9aRIoNQwuhBnl9liM4eW0Sa4ZOrQ9Immx5N2
 eqyE1/Dlo57MUPztLnarSwj5iID4Da77Oomyi3dwcdeUKc/WigMdDLIJQ88+DZ6qqI9v
 DPozx8stlzvwQmrqJnZGSL17w1YwWiNuXhHtdTTvoIaLTlD+vaFvWcyQy1/kQzibVB0+
 XgCA==
X-Gm-Message-State: AOAM531nJgO9sHoUB2wq9KZvyQHzf5L+KvFyIz/DVot3QUGtlgCtGsfA
 Ul2cG/KU2mc1GXKWBZoP3vG4zse/GXcjghNNOXeFcakDGbQMYpnX5IRnrOVB6VB2xCTtlj+m2vz
 P36poXqEW38hShdY=
X-Received: by 2002:adf:959a:: with SMTP id p26mr47505629wrp.342.1635869252962; 
 Tue, 02 Nov 2021 09:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEK0jGuNgE5viVcF4c5rBRsKCuQZVlOjUub94qxM9DatYWf+hY2bABm6VPHZicMkE3r6i7Ow==
X-Received: by 2002:adf:959a:: with SMTP id p26mr47505533wrp.342.1635869252262; 
 Tue, 02 Nov 2021 09:07:32 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id g2sm17055947wrq.62.2021.11.02.09.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:07:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 5/7] Removed the qemu_fclose() in
 colo_process_incoming_thread
In-Reply-To: <1635753425-11756-6-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 1 Nov 2021 15:57:03 +0800")
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-6-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 17:07:31 +0100
Message-ID: <87o872h77g.fsf@secure.mitica>
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
> After the live migration, the related fd will be cleanup in
> migration_incoming_state_destroy(). So, the qemu_close()
> in colo_process_incoming_thread is not necessary.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


