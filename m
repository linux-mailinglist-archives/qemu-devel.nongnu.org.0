Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F25687DCB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYxt-000081-T7; Thu, 02 Feb 2023 07:45:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYxZ-0008T6-0d
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:45:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYxW-00018N-Mp
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675341897;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nyR4ufNZP/nL7y9fVDdd4yQJb/eBaQdwdAcqxKQi0eU=;
 b=bWhmpc8IB5ntt0JHKOiqbIVsoYG8cCz65xUExRvRPVSlDMG7EGhzCivsE0BoY+9H9VfPjl
 2BDJDi3C4Iv+IP9a1wjS8ZdaIH14vZMHZrqJ9iEZLs+ImUV1scmANBW89Zxh6/8RSFwIwv
 RISO4xwq/anmRXHw/KDTz3t1i+xstOI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-2PcX67_fN5eSnlPJvhBFfw-1; Thu, 02 Feb 2023 07:44:54 -0500
X-MC-Unique: 2PcX67_fN5eSnlPJvhBFfw-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so2768438wmj.7
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 04:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyR4ufNZP/nL7y9fVDdd4yQJb/eBaQdwdAcqxKQi0eU=;
 b=pi8882OgNCmxi/qema6BAxJYYRQ0p7/qrZsgzp06cKrf2jmuujXPP/XKW2bV5ZmKNw
 z5DgozCnX7RqSct1YHwLEtz2u1JaDswd34SVHIgLXx5tkRYceFFx1awErx7AFqli/2yj
 T7JkYIOWFG8h9VmwyIQOjM+w4WXNhMES9bKobrKoI7nSYg/ClLuMsyEUSIRYnALHi/qW
 Q7ep25OA3Zynek1kwSGbD2Z/d0FEZMKppEbEZficp5jgoKmiVM5FOm9uJ2mx/0Ty7T/3
 EoNXpa7bpgx/nQYlzd8SnR7vxbwsdpmhwmpGs5QsRY1d3ZLWpzgfdIL7NnJEYhO3ui+I
 KRRg==
X-Gm-Message-State: AO0yUKUu9ofKI23ZB4vZeyyyfjL7v001KEJ2z3Kq0DgQxxWEki3cWRxe
 2Wqle0knNgSeQs5WIWLHBaQpzBH6lWk/IC3wsCRXEchndUn0NMmdHxKxropjo4ZQAg23ynSQ0gt
 Zo3252Ng0Y1U/VxA=
X-Received: by 2002:a5d:58f4:0:b0:2bd:ed75:808c with SMTP id
 f20-20020a5d58f4000000b002bded75808cmr1245857wrd.38.1675341893288; 
 Thu, 02 Feb 2023 04:44:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9t5m/OaM66K5Hqgq2dMEveuMdyEBNLO9operabwJE37yNAMXNaW8X6oixdyCCNa1IVVfMJfA==
X-Received: by 2002:a5d:58f4:0:b0:2bd:ed75:808c with SMTP id
 f20-20020a5d58f4000000b002bded75808cmr1245845wrd.38.1675341893087; 
 Thu, 02 Feb 2023 04:44:53 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o6-20020adfe806000000b002bdf8dd6a8bsm19428255wrm.80.2023.02.02.04.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 04:44:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  chen.zhang@intel.com
Subject: Re: [PATCH] migration/rdma: fix return value for
 qio_channel_rdma_{readv,writev}
In-Reply-To: <20221209131524.219442-1-f.ebner@proxmox.com> (Fiona Ebner's
 message of "Fri, 9 Dec 2022 14:15:24 +0100")
References: <20221209131524.219442-1-f.ebner@proxmox.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 13:44:51 +0100
Message-ID: <87wn50kzi4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Fiona Ebner <f.ebner@proxmox.com> wrote:
> upon errors. As the documentation in include/io/channel.h states, only
> -1 and QIO_CHANNEL_ERR_BLOCK should be returned upon error. Other
> values have the potential to confuse the call sites.
>
> error_setg is used rather than error_setg_errno, because there are
> certain code paths where -1 (as a non-errno) is propagated up (e.g.
> starting from qemu_rdma_block_for_wrid or qemu_rdma_post_recv_control)
> all the way to qio_channel_rdma_{readv,writev}.
>
> Similar to a216ec85b7 ("migration/channel-block: fix return value for
> qio_channel_block_{readv,writev}").
>
> Suggested-by: Zhang Chen <chen.zhang@intel.com>
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


