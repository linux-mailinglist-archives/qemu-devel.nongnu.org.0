Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCA6B0EB8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 17:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZwcN-0004kt-QR; Wed, 08 Mar 2023 11:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1pZwcL-0004kZ-Cu
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:26:17 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1pZwcJ-0002rO-Ec
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:26:17 -0500
Received: by mail-qv1-xf35.google.com with SMTP id ne1so11415972qvb.9
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112; t=1678292772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8sU7Bp3T9uyL+dpSR4UKerONDmk9I2RbVkb97dADux0=;
 b=B7Q/iPOE1pjLV139RmtR7TsU9V1TC2wkYmaCwPkzv9GzuHyu0xpmbPI1ccgAPbgeKf
 Q/8nLixSpegvAuRJxjVUjyvtT1USBLGc49jOU15NKF+vaq6MSSnBujCVPxWYoQ6dRLis
 V8V7iRnSq9OGNhXQzdXosbawXHS/mI1YMaZ8AWxjMcLlecGY7XQ+gOsNqhh43HpihXA9
 /wcp73iy+kdaAztdPFkUIwWVCLr7USanemCVI+Ied9rc/USZvHPeRFiCEr9YrBxUYUnq
 Uz0Xc1SgHiUhvFCbT3+1MhG4ELTk6CyJN2K38yPQuEgfe95WEH8JZVwLALf480SfptPE
 sZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678292772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8sU7Bp3T9uyL+dpSR4UKerONDmk9I2RbVkb97dADux0=;
 b=aRgoJ4PsHd4geZR4MT8+JN5N8qqfc1j6BRQGmEJVYEHqRj27DmnZnYgFdl55bAjJqV
 bRiAJxmTnXdMtQxmlc4QPIEFrCIMwcH8kB8xSS090utIdBFYX2KIz6ikEUXh4v1vKeh6
 acd5olmoxrJ32gQfdX2ge0Mljb604Umq9lqGtrkNwTDrB4S9TLm3WGh1qhTITcyKZUpI
 cr3ypwKe9TCKdM4vLtHnbBBoczVtWryDifIG34DQN1OB3vnLiFab6j+Lz4Zvjc1QMXhS
 glPmkiWwwOsPzKSjMxFIY7ZUTrTfxi1XzOhyV69/8P8O85T6cI8wQ/6Y7xtDF/18JWIV
 egUQ==
X-Gm-Message-State: AO0yUKUuC4KOpwyGYVGMLwLexeIZfwtty6oD9Mv5U38Lzdbcsp0HOYk3
 feco4ecA2VW0/1Ic/oadZWUcoxLqsY3Grx9u2Mo=
X-Google-Smtp-Source: AK7set9KO1t+AQwCtyuRJdLlM49cK04rwAGa4UM0NpqHWgkGgaye2smkJsNI4V8qYCc+fJEkm1ENbw==
X-Received: by 2002:ad4:5966:0:b0:56e:a899:1611 with SMTP id
 eq6-20020ad45966000000b0056ea8991611mr32667025qvb.0.1678292772162; 
 Wed, 08 Mar 2023 08:26:12 -0800 (PST)
Received: from D100-Linux.hq.igel.co.jp (135-23-249-188.cpe.pppoe.ca.
 [135.23.249.188]) by smtp.gmail.com with ESMTPSA id
 z207-20020a3765d8000000b0074236d3a149sm11780577qkb.92.2023.03.08.08.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:26:11 -0800 (PST)
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: [RFC PATCH 0/2] Enable additional display heads on guest launch
Date: Wed,  8 Mar 2023 11:25:46 -0500
Message-Id: <20230308162548.1766359-1-dhobsong@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=dhobsong@igel.co.jp; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hello all,

I would like to propose an option to enable multiple heads (outputs) on
startup when the "max_outputs" option is used on a vga device.
Currently, only 1 head is enabled by default, and all others are
enabled in response to commands from the host side UI interface.
There is also an issue on gitlab that describes this situation
(https://gitlab.com/qemu-project/qemu/-/issues/1107)

The main application that I am thinking of is for running headless
for CI testing of Yocto images.  In this configuration, it can be
sufficient to grab a screenshot of the display from within the guest
for testing purposes.  To do this, however, the DRM connectors must
appear to be connected in the guest.

For now, I've just implemented a simple option that will enable all
of the heads on a virtio-vga/gpu device as an illustration, and was
hoping to get some feedback on the concept.  If there is agreement
I can extend this out to qxl as well. I have tested this with
the following -display settings: none, gtk, sdl, vnc.  

Thank you,
Damian

Damian Hobson-Garcia (2):
  gtk: Make sure widget is realized before updating
  virtio-gpu: Add an option to connect all outputs on startup

 hw/display/virtio-gpu-base.c   | 12 +++++++++---
 include/hw/virtio/virtio-gpu.h |  7 ++++++-
 ui/gtk.c                       |  4 ++++
 3 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.25.1


