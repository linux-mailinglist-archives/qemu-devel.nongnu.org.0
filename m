Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA0293D71
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 15:38:21 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUrqG-00025A-FR
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 09:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUroX-0000dm-72
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 09:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUroQ-0001qG-RX
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 09:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603200984;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WNph9JNPyDlTmoFt7Hkz5LTTjWqoSXX5bPdP6enjm9E=;
 b=ZRx2Df2ReDf+8ZRzgk4NlFLTJDI41yIOfDvuAR61M6lg43uI0B+2BCPnu18Mf9443WBmyb
 aIEMXwILIiW9kCxUIP4qPcL0lyuY9gigYwn5guWG44PLdM/ZYPP7WIXoXzi2ZxezmwMoKC
 hWXVdGg2t6H+8DMCDi6ii0mGnzLYmf4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-Xw8ys7k0Mq-13p3y-7O9gQ-1; Tue, 20 Oct 2020 09:36:23 -0400
X-MC-Unique: Xw8ys7k0Mq-13p3y-7O9gQ-1
Received: by mail-wm1-f71.google.com with SMTP id l22so406656wmi.4
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 06:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=WNph9JNPyDlTmoFt7Hkz5LTTjWqoSXX5bPdP6enjm9E=;
 b=MmapCxmEu+MzxP1Dn4EbxmgdX9niFX9p/NpTPpWA+Mi2lFgTIHFxKM8q/6FS96UppT
 4onB9vc8qbOQEj8tqoLNqLII6XaKchH7urh6jv+8RYtaMR+VVzdCj58gieFTwzzHJzk6
 CU6OkW01J7tZuymFeJtGybrPIXTIFlQpYAecynk1KUBMik2gZ2n0OSXpP1eS/IfYib2N
 1iYYwPl/bHaWM0wwu3uvUDUa3uwfUfLqByUL8U/UGAD0WTY9RRVMu64qoXly5QacOMUj
 pFA8m5ZXbVllRA0bqJOdKSB7v8erYa4l6sccg6s6ck7IF+qmwiBRytXE66KL7S3YSfVT
 eSoA==
X-Gm-Message-State: AOAM533B3vN4D9uYLVNVOsp865YigCh0djcwG7rNPsNcENv356VyyWQf
 KHZP56gJZ+fQ81+rWRucxy537efat3KX1sGQ2IcKFoaLQLYCaaQNIIhj80vcMYgM4rsXVBrpF5E
 ZEmI7v5VJ/Z3Ybxc=
X-Received: by 2002:adf:9793:: with SMTP id s19mr3674016wrb.139.1603200981921; 
 Tue, 20 Oct 2020 06:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0Kdtmoceh1VbFtj4WsVFH4s1/mwIdVEVxPEN03/g3K2rrBVdB3lX4y505PKLUCjyno8N2vw==
X-Received: by 2002:adf:9793:: with SMTP id s19mr3673993wrb.139.1603200981768; 
 Tue, 20 Oct 2020 06:36:21 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id g17sm3282321wrw.37.2020.10.20.06.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:36:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Subject: Re: [PATCH v3 3/8] migration: Add spaces around operator
In-Reply-To: <1603163448-27122-4-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:43 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-4-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 20 Oct 2020 15:36:20 +0200
Message-ID: <87a6whc94b.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: zhengchuan@huawei.com, qemu-trivial@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, alex.chen@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/migration.c    |  4 ++--
>  migration/postcopy-ram.c |  2 +-
>  migration/ram.c          |  2 +-
>  migration/savevm.c       |  2 +-
>  migration/vmstate.c      | 10 +++++-----
>  5 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Juan Quintela <quintela@redhat.com>


