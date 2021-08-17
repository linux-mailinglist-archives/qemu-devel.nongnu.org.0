Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58883EF5FC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 01:05:36 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG89H-0002P2-LC
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 19:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mG881-0001FT-1u
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 19:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mG87x-0005MK-DP
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 19:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629241451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2TdNlIo9j2Zb/jjCmE8qS4sYb33N/zFVjr/Il9eOG0=;
 b=IjH9Sdi0hVU3hqV1qegwyq+nfYJjB8HLK+Nv249lNDxOdX2gV5qSrYwbxNBynmtbEORflt
 QXgIjHRtrbS+2lfodLm4vvT6mbbGKPkBEuIJzP84lXVTv/rO3GIHPReLjqWBjYQDSe+fPc
 4z1HbpqO1PT4rjCxU+xeCMXgiAXNRJA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-w2RRK7wCNkG215vXN3NhZg-1; Tue, 17 Aug 2021 19:04:10 -0400
X-MC-Unique: w2RRK7wCNkG215vXN3NhZg-1
Received: by mail-oi1-f197.google.com with SMTP id
 o185-20020acaf0c20000b029025cacdf2ac0so494398oih.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 16:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w2TdNlIo9j2Zb/jjCmE8qS4sYb33N/zFVjr/Il9eOG0=;
 b=NwM6ZRVXBGAz4Bn0PbOe2SGvRttLtDxN1vsu0kLRO6XEqQYOGaifHTg0ELHTp02yhP
 P+wCBn842mlXxtN/fyxmVy9wf42whXMNC13nJ0BPbMLQjTyE6Djixii/5i/5HbiDQ5f+
 ipCPXFz4N1RTLHbvlvW8ku/CjlGlD3o5YlXvjvzXdzHhLrjfzbZRqx6piJphw/egDTey
 AEAJnaiZmeQpL9GjypfMcYHTWlpONL3wMCcmxztGochoTYVb/Ftmn84wUVjkOB25OXxn
 1nCrxKspoTrBJ5jdobiO8P25TxFCZ7UWUHb/ZJ5YG2LIQJykCv3U4vUtQAjCIwCINX3M
 teBw==
X-Gm-Message-State: AOAM530OI2IdVwr/vu6FjU8bnUn39dguGn3wozN5lcmwCyu82e6uJwxU
 vMmhNdkVW4hYR+xX5W2L3YrKmRwwrZfnx41iSNnjNVulwPpa1DwULKyfDEi1OB6XwhMMoFTP1rs
 rstArbnjPZ//kvDU=
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr4470414oic.91.1629241450024; 
 Tue, 17 Aug 2021 16:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7XJrTjlWXUr+uUFdLM3fQNtLnoh5oAkZF/OUCUHiVKxBtYgEKwCTsj092Q2DYDWlo5J77Zw==
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr4470392oic.91.1629241449854; 
 Tue, 17 Aug 2021 16:04:09 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id z21sm681786oto.46.2021.08.17.16.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 16:04:09 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:04:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 01/16] vfio-user: introduce vfio-user protocol
 specification
Message-ID: <20210817170408.78be6ac7.alex.williamson@redhat.com>
In-Reply-To: <a928987fdb794e44784186c4aa5135bc6c88d0fc.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <a928987fdb794e44784186c4aa5135bc6c88d0fc.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 09:42:34 -0700
Elena Ufimtseva <elena.ufimtseva@oracle.com> wrote:
> +Authentication
> +--------------
> +
> +For ``AF_UNIX``, we rely on OS mandatory access controls on the socket files,
> +therefore it is up to the management layer to set up the socket as required.
> +Socket types than span guests or hosts will require a proper authentication

s/than/that/

...
> +``VFIO_USER_DMA_UNMAP``
> +-----------------------
> +
> +This command message is sent by the client to the server to inform it that a
> +DMA region, previously made available via a ``VFIO_USER_DMA_MAP`` command
> +message, is no longer available for DMA. It typically occurs when memory is
> +subtracted from the client or if the client uses a vIOMMU. The DMA region is
> +described by the following structure:
> +
> +Request
> +^^^^^^^
> +
> +The request payload for this message is a structure of the following format:
> +
> ++--------------+--------+------------------------+
> +| Name         | Offset | Size                   |
> ++==============+========+========================+
> +| argsz        | 0      | 4                      |
> ++--------------+--------+------------------------+
> +| flags        | 4      | 4                      |
> ++--------------+--------+------------------------+
> +|              | +-----+-----------------------+ |
> +|              | | Bit | Definition            | |
> +|              | +=====+=======================+ |
> +|              | | 0   | get dirty page bitmap | |
> +|              | +-----+-----------------------+ |
> ++--------------+--------+------------------------+
> +| address      | 8      | 8                      |
> ++--------------+--------+------------------------+
> +| size         | 16     | 8                      |
> ++--------------+--------+------------------------+
> +
> +* *argsz* is the maximum size of the reply payload.
> +* *flags* contains the following DMA region attributes:
> +
> +  * *get dirty page bitmap* indicates that a dirty page bitmap must be
> +    populated before unmapping the DMA region. The client must provide a
> +    `VFIO Bitmap`_ structure, explained below, immediately following this
> +    entry.
> +
> +* *address* is the base DMA address of the DMA region.
> +* *size* is the size of the DMA region.
> +
> +The address and size of the DMA region being unmapped must match exactly a
> +previous mapping. The size of request message depends on whether or not the
> +*get dirty page bitmap* bit is set in Flags:
> +
> +* If not set, the size of the total request message is: 16 + 24.
> +
> +* If set, the size of the total request message is: 16 + 24 + 16.

The address/size paradigm falls into the same issues as the vfio kernel
interface where we can't map or unmap the entire 64-bit address space,
ie. size is limited to 2^64 - 1.  The kernel interface also requires
PAGE_SIZE granularity for the DMA, which means the practical limit is
2^64 - PAGE_SIZE.  If we had a redo on the kernel interface we'd use
start/end so we can express a size of (end - start + 1).

Is following the vfio kernel interface sufficiently worthwhile for
compatibility to incur this same limitation?  I don't recall if we've
already discussed this, but perhaps worth a note in this design doc if
similarity to the kernel interface is being favored here.  See for
example QEMU commit 1b296c3def4b ("vfio: Don't issue full 2^64 unmap").
Thanks,

Alex


