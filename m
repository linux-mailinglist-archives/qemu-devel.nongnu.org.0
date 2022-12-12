Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC964A89B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pFr-0005WA-3c; Mon, 12 Dec 2022 15:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p4pFi-0005Vz-LD
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:18:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p4pFg-0003gF-Qr
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670876294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZvbELBbyW8u0MUwmHT/BNUq0ctjFxnLQ408BSTlXmT8=;
 b=WencsoVnKJSJ2Kr/A5t9d+any3wHi1yIThDYemwbXc0Y9/QXAzk4nOkc5580fmgSskoUjA
 U/wjirdEGk6udnLi2D5L+4uMX9a5sB0w3Y7Fj0oaKl0Ki8600tRWcDdsMjMnrb86RD/bSG
 J+AMv4i4fmKWS9QHlYUbG6vYgiRAzXQ=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-JmgDy9iXP-a9CtrKSiSgGg-1; Mon, 12 Dec 2022 15:18:12 -0500
X-MC-Unique: JmgDy9iXP-a9CtrKSiSgGg-1
Received: by mail-ua1-f71.google.com with SMTP id
 h41-20020ab0136c000000b00419beaab4a3so5663015uae.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 12:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZvbELBbyW8u0MUwmHT/BNUq0ctjFxnLQ408BSTlXmT8=;
 b=PTr64a8JzWboWvpk8XqrgOfgu1YLBc0t/vEACM5BCqnKqEIZE3lzT1TkwBUqgA/0MY
 tSXxuxb4IPUm4HWRj+FRoNAiS5rgN3G/mXHLz+3CnI2OVYzvqNCF6LXo/4g1xG9kudtz
 bG6+67bfni307jymUqBhsXcwCOiTLyA19Y6hDvp3/OHF915IpOz1RTqaG4er1zkyZl2n
 fZqQe47grWNDjVfb/oNwI7SqvlyGDuiZPr0OSqLI/jDzSWsiB8Ou+WmLBFQAMvV0OuNX
 f9lOA6COHj9XeSBnLtixnZtNPykBzb2U330wLTamPeTXJsNcIQomZySm/hs04Z9oAhkP
 JLCQ==
X-Gm-Message-State: ANoB5ploZLQBatM1hetB4yatSTGaY7bmj59qINN/sDWmDEsRjPOzgJM5
 9RukWw70wsBlPhKRa1Nqgywr1JGSA07AVEqUY5o8UELPXHYNTGBrI6anSwBohaoTQatoU25T3P+
 CtA+sZpzVMlIEBSI=
X-Received: by 2002:a05:6122:198c:b0:3b5:a9:2907 with SMTP id
 bv12-20020a056122198c00b003b500a92907mr8913093vkb.13.1670876291798; 
 Mon, 12 Dec 2022 12:18:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6LOK7aaKCbLJ52vIDVjc+tIeImkjGC9+kEpx7oelhGWXcjQc+ptfc8vlr9hqvssrSkKvC1rg==
X-Received: by 2002:a05:6122:198c:b0:3b5:a9:2907 with SMTP id
 bv12-20020a056122198c00b003b500a92907mr8913080vkb.13.1670876291553; 
 Mon, 12 Dec 2022 12:18:11 -0800 (PST)
Received: from x1n ([70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05620a245300b006cebda00630sm6547881qkn.60.2022.12.12.12.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 12:18:10 -0800 (PST)
Date: Mon, 12 Dec 2022 15:18:05 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com
Subject: Re: [RFC v2 2/3] virtio: support delay of checks in virtio_load()
Message-ID: <Y5eMfZci3AazVOFl@x1n>
References: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
 <20221212164942.3614611-3-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221212164942.3614611-3-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Dec 13, 2022 at 12:49:41AM +0800, Chuang Xu wrote:
> +bool migration_enable_load_check_delay;

I'm just afraid this is still too hacky.

One thing is because this variable itself to be only set at specific phase
during migration to cover that commit().  The other thing is I'm not sure
we can always rely on the commit() being happen 100% - what if there's no
memory layout changes throughout the whole process of vm load?  That'll be
skipped if memory_region_update_pending==false as I said.

So far the best I can come up with is we allow each virtio device to
register a vm state change handler (during virtio_load) to do the rest,
then in the handler it unregisters itself so it only runs once right before
the VM starts.  But I'm not sure whether the virtio developers will be
happy with it.  Maybe worth a try.

Feel free to have a look at like kvmvapic_vm_state_change() if you think
that idea worth exploring.

-- 
Peter Xu


