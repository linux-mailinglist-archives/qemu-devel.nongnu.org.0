Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14A144C64
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 08:18:22 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuAHN-0001jd-E0
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 02:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stevensd@chromium.org>) id 1iuAFY-0000Wz-Dk
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 02:16:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stevensd@chromium.org>) id 1iuAFX-0003dN-7S
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 02:16:28 -0500
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:40429)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stevensd@chromium.org>)
 id 1iuAFX-0003d7-2T
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 02:16:27 -0500
Received: by mail-qk1-x741.google.com with SMTP id c17so5457010qkg.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 23:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=P+/iuiBLq7uPEhqosucYoZMfKA/Q86efqmkOl3g1vxw=;
 b=MOtlcrKZrIa1DTJluQPMB4fRQIwJQKBfMXdLR6nADM8B1B3JFs35mUIzLxizqV0NdT
 /hNRqBtvsY6YS9Quc2eO8QqOatiTWTL4GIwwLBw8r+o7g0yfNNBZ+MrWRQ0e93Thcy7f
 zVFIf+Eki+U30WramiUr7ZktZSGY3ED6shzRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=P+/iuiBLq7uPEhqosucYoZMfKA/Q86efqmkOl3g1vxw=;
 b=ISUhKrzy27hHAyGFfYreyM8sExjWj4jgsimXXQfEbjmA2xIiVoKxzNIvCYqyA4bWx0
 ORi2YbecOmo02/YVI2jmuDfoOZ+GCA3wEyw+QZZFMOyGZO1DS/6odHpbZxpqVQqVSTSX
 rhefLZccCrJPUPoq3R37b+HgfRetnMEJv5sIlMpmsc9g9yWUEi/gP5BueW2N003+yPhe
 YQRLIpt6zZE8RKJQOQMpLXogiuRHAhBlHqF2qGxOgQyV2YYhjCTAcenY8O10+Si6zcQS
 Hbu5nHFLzQ6uwtsPdWcKULUOC23lUWHAD4ilIB050jZWvkAu/tioM/OY9pRozT1C/phH
 4Vcg==
X-Gm-Message-State: APjAAAUzYm1xx9esSzEw1yDzfP8neDa+HWwlDy53ljrq9y+gdYylBaDp
 4iYntGj6EjmDfR8UtFjX4v1HdX/XKwFYSwec3MUPNw==
X-Google-Smtp-Source: APXvYqwskXmK7PXdyj8x38TPmSf0hJIXr6CQd72S8gVTKQSPIFrsczXtzYTy6QpSZoAiHBABoFoO6EVE31PPbOp6ypI=
X-Received: by 2002:a05:620a:910:: with SMTP id
 v16mr8796636qkv.194.1579677386047; 
 Tue, 21 Jan 2020 23:16:26 -0800 (PST)
MIME-Version: 1.0
From: David Stevens <stevensd@chromium.org>
Date: Wed, 22 Jan 2020 16:16:15 +0900
Message-ID: <CAD=HUj71Z_eQUj93LZYOAc+Prj9ohym1oJtiLWzCy5=T-cNxCQ@mail.gmail.com>
Subject: [virtio-dev][RFC PATCH v2 0/2] Cross-device resource sharing
To: virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
 Zach Reizner <zachr@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>, 
 Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, 
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, 
 Pawel Osciak <posciak@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This RFC comes from the recent discussion on buffer sharing [1],
specifically about the need to share resources between different
virtio devices. For a concrete use case, this can be used to share
virtio-gpu allocated buffers with the recently proposed virtio video
device [2], without the need to memcpy decoded frames through the
guest.

[1] https://markmail.org/thread/jeh5xjjxvylyrbur
[2] https://markmail.org/thread/yb25fim2dqfuktgf

Changes v1 -> v2:
Rename exported resource to exported object
Rename the virtio-gpu export command

David Stevens (2):
  content: define what an exported object is
  virtio-gpu: add the ability to export resources

 content.tex    | 18 ++++++++++++++++++
 virtio-gpu.tex | 30 ++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

