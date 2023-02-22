Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6CA69F751
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:03:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqe8-0005lw-F5; Wed, 22 Feb 2023 10:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pUqe6-0005l5-F6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:03:02 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pUqe4-0000zx-LU
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KUMqs1Nb4IuOEC+vxw2Z78zKdaOJV074r4Y4SAdXJuA=; b=sXmAkNKxQdfvBNgo1U8I/2boHQ
 MXhdWUSmErqermE+e/uYdekEYnjxSntIPan4DZ0PMJTBiiHOqkQ932SzrMeDwRJPaIA/M+3m0DSDq
 Q5bzMw7I5AiyhkNGEi7PwjBVTJIvoYHE68Wxl2DFdOxpyBV/3QoldSEpvjRSfIfu99+ynrGY5Aqwc
 MaDBueosqOr1JAePSxn2XKMIwdnbDmQzn87H9qReFk35vaG5LteSNIHnksc/jct8hXK4qB8P6EC5H
 FIunuNgMFyKz4jTg2/bpznCuxh8xjSrC9ywzvY03PRZWZytNRmuqkmtO7K3gwvOtF3wwcSXo3x23W
 x+qOkNDyxn/bZVhjFNpb8LnWDpbsQEX67QowUlOLjNc/sEVKTxsC/88QN4jsYq6rGMS8NQ+HjZElI
 rmPieW1z67SVi0/g/v5Hu7PzQUgtq8R0NOsJ/EL6PD6CWXK2AvHepZwQC/zR+CXc39a1Xrwc6Xeaq
 xekmU72yRNiEoeIxq9MRTZMzd0rmLJ06jSich0xaoZW3TN/PGy9OvwR3bK9Z1a0EwSeQN/BvGqqml
 Wt4bmy21NhFmAV4M40h8BCLwIEwVGXugTLtxkt1enGR+RhBrWTnCBVsck60kgOsVyrxnV9LRwEVy4
 UG6sdFG5LlQn+HgvjKMfebv8Hxra/CM+YatYREH0U=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 wtaymans@redhat.com, Dorinda Bassey <dbassey@redhat.com>
Subject: Re: [PATCH v4] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Date: Wed, 22 Feb 2023 16:02:55 +0100
Message-ID: <22664672.G6CBm8nxMu@silver>
In-Reply-To: <20230217170732.298264-1-dbassey@redhat.com>
References: <20230217170732.298264-1-dbassey@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Friday, February 17, 2023 6:07:32 PM CET Dorinda Bassey wrote:
> This commit adds a new audiodev backend to allow QEMU to use Pipewire as
> both an audio sink and source. This backend is available on most systems
> 
> Add Pipewire entry points for QEMU Pipewire audio backend
> Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> qpw_write function returns the current state of the stream to pwaudio
> and Writes some data to the server for playback streams using pipewire
> spa_ringbuffer implementation.
> qpw_read function returns the current state of the stream to pwaudio and
> reads some data from the server for capture streams using pipewire
> spa_ringbuffer implementation. These functions qpw_write and qpw_read
> are called during playback and capture.
> Added some functions that convert pw audio formats to QEMU audio format
> and vice versa which would be needed in the pipewire audio sink and
> source functions qpw_init_in() & qpw_init_out().
> These methods that implement playback and recording will create streams
> for playback and capture that will start processing and will result in
> the on_process callbacks to be called.
> Built a connection to the Pipewire sound system server in the
> qpw_audio_init() method.
> 
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> ---
> fix typo
> raise version dependency
> 
>  audio/audio.c                 |   3 +
>  audio/audio_template.h        |   4 +
>  audio/meson.build             |   1 +
>  audio/pwaudio.c               | 827 ++++++++++++++++++++++++++++++++++
>  meson.build                   |   8 +
>  meson_options.txt             |   4 +-
>  qapi/audio.json               |  45 ++
>  qemu-options.hx               |  17 +
>  scripts/meson-buildoptions.sh |   8 +-
>  9 files changed, 914 insertions(+), 3 deletions(-)
>  create mode 100644 audio/pwaudio.c



