Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908BD64A8B3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pKs-0007Dr-FF; Mon, 12 Dec 2022 15:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p4pKr-0007Di-7G
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p4pKp-0004v3-Ka
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670876614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nksRuEvqqfM7e1Msj+xrwqaSGnEvJWzgIG0D1WI/W58=;
 b=JJ3mF6SM7ErkmJM64sRMc538OjcjJqv7MR6OnoUXgJ1G6VXokUAKA4ygcP5WdzRKs2xyay
 shg3cB8UGhhCRW8GX6CkY9y7PdTjiLL/Dl93VXlBN4V2kBCP/C1zYqn1VmLhZMS9P/GBF9
 8w0PfKd7gw6yARJMK7uqVCmna6f00Lg=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-p-XJ970hN4SlEeTz_KWCvQ-1; Mon, 12 Dec 2022 15:23:33 -0500
X-MC-Unique: p-XJ970hN4SlEeTz_KWCvQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 i28-20020a05610220dc00b003aeef5a8714so3388968vsr.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 12:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nksRuEvqqfM7e1Msj+xrwqaSGnEvJWzgIG0D1WI/W58=;
 b=u/t0MqLylVC6xCOhhQ/mf+x4uiOfEMRlnSylus0b48lEV/mPFn11jT1kTZ5LgXKOKP
 u13pj+TkJMdNZKH0bIR01xqBjWZKn5NmlFtH5eeMEILU0E2kCMFNE632KuGjQvsO1usv
 ehzBVMIiH9JZmxgP64X++Dx5HcrqEkjduMm5dgNk6zIFp7+USiZNL4PmOQr0Vp8kxrfD
 z7sXts5dZpatO9AVa94wxCCyav4ol2eTeTxliwVFgJF9jwwrTCbJiRmCSaKnPTrXaxZu
 3Y1BgRiacJfYXZ7oPP3i3DyosTJsZ9ZaCIMmFScBre4uF9QpxvkBiS0pNXYU03W3lHwS
 B5/g==
X-Gm-Message-State: ANoB5pn7E4doiJbCRuprq44eh6lxj8cQvv/DOtlRUMOujUa7uJO97Ues
 JBDUCFGG0bVfk4muEL95A7Z2hOZ9IzcENnKShCZeLL0quYvmAg00u6ZMKLfbCqgJ9mYs7vGHbbp
 BElPXXu2Lel/3dBM=
X-Received: by 2002:a05:6102:a24:b0:3b3:294:bbc1 with SMTP id
 4-20020a0561020a2400b003b30294bbc1mr9185745vsb.12.1670876612553; 
 Mon, 12 Dec 2022 12:23:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf47JYmUNMfVxz05YK6pDx17jTK1uzQiU3FspjGI2QkiKCoEQ8tDQiaIpVGe/Sngft6JmIxlDw==
X-Received: by 2002:a05:6102:a24:b0:3b3:294:bbc1 with SMTP id
 4-20020a0561020a2400b003b30294bbc1mr9185726vsb.12.1670876612319; 
 Mon, 12 Dec 2022 12:23:32 -0800 (PST)
Received: from x1n ([70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 n11-20020a05620a294b00b006b5cc25535fsm6556151qkp.99.2022.12.12.12.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 12:23:31 -0800 (PST)
Date: Mon, 12 Dec 2022 15:23:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com
Subject: Re: [RFC v2 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y5eNvj7XFc88edIi@x1n>
References: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Dec 13, 2022 at 12:49:39AM +0800, Chuang Xu wrote:
> 
> Hi!

Chuang,

> 
> In this version:
> 
> - rebase to latest upstream.
> - add sanity check to address_space_to_flatview().
> - postpone the init of the vring cache until migration's loading completes. 

Since there'll be other changes besides migration, please consider also
copy the relevant maintainers too on either memory and virtio in your next
post:

$ ./scripts/get_maintainer.pl -f softmmu/memory.c -f hw/virtio/virtio.c
Paolo Bonzini <pbonzini@redhat.com> (supporter:Memory API)
Peter Xu <peterx@redhat.com> (supporter:Memory API)
David Hildenbrand <david@redhat.com> (supporter:Memory API)
"Philippe Mathieu-Daudé" <philmd@linaro.org> (reviewer:Memory API)
"Michael S. Tsirkin" <mst@redhat.com> (supporter:virtio)
qemu-devel@nongnu.org (open list:All patches CC here)

-- 
Peter Xu


