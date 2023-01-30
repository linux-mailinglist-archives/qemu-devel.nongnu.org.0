Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5268056C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMQT-0006H5-VR; Mon, 30 Jan 2023 00:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMQS-0006GZ-4L
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMQQ-0000zY-NO
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675055390;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NAYromcqV/RHWkNEZH2lpJErTclnaLBsQ+rUMq8Q0Jg=;
 b=FgTx2EMaRHst4KdtTkVUoRVDZIf3rIANiIUaVw8aEgJDlrEcTyY3IFBZpV3sKk8bVv67rZ
 No4Az6HHH+4gFMCGIzHFLydc5WPM+sJZ7WpKAS8oLrqVvzI5tRODLwU7OW1nQ0s8sVZIzF
 mRxw+kALAF3fHDyaUwc5Wi+BpAnIAwI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-2WfDx2A1N6itQBS5t_p8fA-1; Mon, 30 Jan 2023 00:09:48 -0500
X-MC-Unique: 2WfDx2A1N6itQBS5t_p8fA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t3-20020adff043000000b002bfd38027fcso983340wro.9
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAYromcqV/RHWkNEZH2lpJErTclnaLBsQ+rUMq8Q0Jg=;
 b=WW2LfEDrwxhy0Fo1ysQiSbiSr2p9Wsl8gSKRwR4Nbbpji7Y+lZDuFKWL2aIL7ZeBxY
 CWVIAt2mfdcX2lbGHpwfctdw4GousMzPuEn3J2lf4djn954xq/7gDxnu/WjryW1KnBOf
 gFfUOwXo/hjDzFNjxfYVown44X6h89gI2hU5GuotMnwrVptUy9dpLFEA3yDNacTz7T/B
 Gaa0sXOHd4NVC5YAe1td11mVODxtrwm/Ew1erYKeiaC3mgmbiHtUPplWfn5CjaiIZX0F
 Ah0+/74dV4yTfXla6PVUxShPpaxJOI/oXy0rFW0BZMtWpDY2VsQZUHu6IfrNaA6tDshx
 pogg==
X-Gm-Message-State: AO0yUKWVtksqEZz7mVEvq5ZSW8BeefcN//pAXtrnx4g8OGtcws3Kadxe
 h6+YL/KLEu4aUNIKVdDV6wK8HFvMrcXkYYDr94oRXYCo3KSFLCbCee74w8rYy2kL/Ax/u/zOVJo
 RnwLgrGUC/5/pkl8=
X-Received: by 2002:a05:600c:1e0d:b0:3dc:3f1b:6757 with SMTP id
 ay13-20020a05600c1e0d00b003dc3f1b6757mr9651323wmb.15.1675055387090; 
 Sun, 29 Jan 2023 21:09:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/YtglitL7GWWr3CQxE5j+zlwW16YCKUGJbFMpoxhtApD7peqos0xRpk33q7t8FE/+ZqS/9vQ==
X-Received: by 2002:a05:600c:1e0d:b0:3dc:3f1b:6757 with SMTP id
 ay13-20020a05600c1e0d00b003dc3f1b6757mr9651314wmb.15.1675055386844; 
 Sun, 29 Jan 2023 21:09:46 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c4e8900b003d990372dd5sm17078743wmq.20.2023.01.29.21.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:09:46 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 10/21] ramblock: Add ramblock_file_map()
In-Reply-To: <20230117220914.2062125-11-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:03 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-11-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:09:45 +0100
Message-ID: <87zga0ip5y.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Add a helper to do mmap() for a ramblock based on the cached informations.
>
> A trivial thing to mention is we need to move ramblock->fd setup to be
> earlier, before the ramblock_file_map() call, because it'll need to
> reference the fd being mapped.  However that should not be a problem at
> all, majorly because the fd won't be freed if successful, and if it failed
> the fd will be freeed (or to be explicit, close()ed) by the caller.
>
> Export it - prepare to be used outside this file.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


> +void *ramblock_file_map(RAMBlock *block);

I would have called it:

void *qemu_ram_mmap_file(RAMBlock *block);

To make clear that it is 'like' qemu_ram_mmap(), but for a file.

But that is just a suggestion.  Whoever does the patch, get the right to
name the functions.


