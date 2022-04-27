Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983051165F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:42:03 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njg3V-0003Vw-NZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuK-0000qH-Mr
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:38 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuI-0001oK-0y
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:31 -0400
Received: by mail-ed1-x52d.google.com with SMTP id a21so1600250edb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=arTl3j4tzoOWDP5668/kPTvtXW0r7VbJfIiNmcVbjOc=;
 b=ZbvTyDoPB8qxw/Ar14AIH7UjcRBpsD9EXs9hzcephx9Nk2y1eJrQbz9dNL4Sm9ne1W
 utGiJEyP5rmeOofOdMUvEx2u3OabzZiENmGSb9y0VMiuQ/LgOM975XyhazzTOTFERKQE
 k0YbrV2jRF76A0sKKPvSIJZnX+0l1iMWK7rT4PJAbFOIO8HWHQebX4TSTa/dHStBBV5O
 dUZVWZkJXDrazniuNMD/1H4SRubUO/yoYM+lt7WTMJ4N0Wt0xwS/p95RvwK657LVWzcN
 m8X2t1COyCbCvzR+7tZFgTdXKSM+dh7flxjtCuLersjrfFYlM646Iqqyp/YO6mHzU8lp
 wy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=arTl3j4tzoOWDP5668/kPTvtXW0r7VbJfIiNmcVbjOc=;
 b=W4TcyJ1MNis2rwt7WNNBfAVLC+gW7DpsYEU+4hnPLf8ruBr+4eVXFRPdCIqLlZb5Aa
 iiXhE7SvsMA2Np/UEHk0kQ1ON7mCgwKJybAA1/fSizgyy+pp6W8No42yaRD7OLtxu5B9
 ds9GOfkskGV3NeAChKmEiLgxYbUbgRIBfb0R7URILIL5GNoc2ZB5hR1gPjNtkUIAFJ3s
 hxbLEIWpoUHcqrIKQE4qKW5z+YQp35wKkeHv74EdZlk+5OEiZf3k3v61CfX6rI696hHv
 aMzK4Nj4n74qnaZ/SwXMZYjDSKoTEcP9m93AASJvKQCB0KZspMoIDVs5lwDNo4Ib0wRY
 /UuA==
X-Gm-Message-State: AOAM530wZFC+1QbQ9/kSyRX8ZwXHlYa8jwdEPrCrXrlG5t1Q5cFITqEq
 kgcBb/zzQpL5L1cDc65P4XEgU18HcqDy+Q==
X-Google-Smtp-Source: ABdhPJxVAxZXVa0+BAhTfEg5xjP6WSFB62jpnb5lqoI9PvA0N0PzoppsxwgeewWH25mj2S6JWLm31Q==
X-Received: by 2002:aa7:dd87:0:b0:425:c104:71bf with SMTP id
 g7-20020aa7dd87000000b00425c10471bfmr27631335edv.110.1651059147606; 
 Wed, 27 Apr 2022 04:32:27 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b006f3a7ffbb0esm3099216ejd.70.2022.04.27.04.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:32:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/6] replace -soundhw with -audio
Date: Wed, 27 Apr 2022 13:32:19 +0200
Message-Id: <20220427113225.112521-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mkletzan@redhat.com, berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the -soundhw option has been deprecated, the way of creating
audio devices is not as easy as with say -usbdevice or -nic.  This is
true especially of HDA devices.

This series introduces a new option called "-audio", which allows
full configuration of the backend and just the model of the frontend.
It is almost as easy to use as "-soundhw", especially because the
user does not have to know about creating a codec device.

Following the previous experience with those options, keep the easy and
useful cases and remove those that complicate the code unnecessarily; in
this case PC speaker support is removed, because it patches the device
instead of creating it, and so is the ability to create >1 device in
one shot.

Paolo

Paolo Bonzini (6):
  pc: remove -soundhw pcspk
  soundhw: remove ability to create multiple soundcards
  soundhw: extract soundhw help to a separate function
  soundhw: unify initialization for ISA and PCI soundhw
  soundhw: move help handling to vl.c
  vl: introduce -audio as a replacement for -soundhw

 audio/audio.c                   |   8 +-
 audio/audio.h                   |   1 +
 docs/about/deprecated.rst       |   9 --
 docs/about/removed-features.rst |   7 ++
 hw/audio/intel-hda.c            |   5 +-
 hw/audio/pcspk.c                |  10 ---
 hw/audio/soundhw.c              | 154 ++++++++++++--------------------
 include/hw/audio/soundhw.h      |   8 +-
 qemu-options.hx                 |  51 +++++------
 softmmu/vl.c                    |  30 ++++++-
 10 files changed, 130 insertions(+), 153 deletions(-)

-- 
2.35.1


