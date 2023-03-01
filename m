Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FF6A695F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXILv-0004Ai-FY; Wed, 01 Mar 2023 04:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILl-0004AK-4r
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:13 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILj-0002mL-7y
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:12 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so11588260pla.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H+cOPDKXZGOMkg1jeD5pfwpjClxU1+zuiGil4FeF0R0=;
 b=jGtpcAxBMxffZHavc5eo+ENRwZaVPC4fLYz6hwbHHUVw1tHG+0aH6r+EeeJJ1af/lR
 2vGE5Jzg97ddJf2LPfT92ph+bjJjcmBz5GcS1bh+qjj34AYdBo1qeKTGV9eW51Hjl9GJ
 ziWRmOO5w6LakltMztndTmGefyuEWXS9WXSPTXFSlHrcUMpnUKK/6pnWqVev4ZtuxxiD
 uyQbSK0Z6JG359lTFUPTWKK6uIf/ZWxgxJT5+synftc87u1QCvI2BE8x6QSUmSfBoOJW
 lsu1RHOc/4m1u1Hu/G7EEIEwv2Uxl0xA1/ztW2T2raMTU/q2VBvLKpmEG1EoI896FvAM
 c/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H+cOPDKXZGOMkg1jeD5pfwpjClxU1+zuiGil4FeF0R0=;
 b=lFdsk88qlbFJPUA+T9gpd/ha/Jd7pETlOgwF7CcnT/U7n+m8SQMcLjTgL63BRVejI1
 Nr2x8gX/8oS5NdOKulp5QvdbLqWoPhQk/omy1QJFeLA2HNy0dIN2R2bgzUz2CgkjXMVF
 ZqgoX3DUn37DimxBEqVgh8tiZaRPKvc6KEJr2bDgd7caRLhlGsn8Fs06+Dcq+hefZxgp
 vsVEd7gY0FF73Nx12qpwiDxlpi3WICEL8zBW76tAugeSuggXW8U+SjDJHiKr2wIg8Zk7
 zha1UtHm/yqiL3F2KUX5Tox2OoTXhSQYYiy0e3kea19xAo8Ky1V0FQh+5HRMCs33SeBN
 7E1g==
X-Gm-Message-State: AO0yUKVY2wlKR/IumSZMHufPDZPRCk1HTMVQenVHPey4U70oSbu+QwZ6
 sWhVPZrTltbiWp71bBSrcS4=
X-Google-Smtp-Source: AK7set8Drk05PBjC20qXYVD5fFvAcdX0IlQDC/AclOOGYF76ha+xf9Kpou84nR/kMV1r5/ApgMWbmA==
X-Received: by 2002:a17:902:b283:b0:19c:d550:803e with SMTP id
 u3-20020a170902b28300b0019cd550803emr5188736plr.57.1677661328421; 
 Wed, 01 Mar 2023 01:02:08 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:07 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 0/8] net: Pad short frames for network backends
Date: Wed,  1 Mar 2023 17:01:55 +0800
Message-Id: <20230301090203.1601925-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng@tinylab.org>

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends like SLiRP/TAP, they
don't expose a way to control the short frame behavior. As of today
they just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from QEMU network
backends like SLiRP/TAP, we change to pad short frames before sending
it out to the other end, if the other end does not forbid it via the
nc->do_not_pad flag. This ensures a backend as an Ethernet sender
does not violate the spec. But with this change, the behavior of
dropping short frames from SLiRP/TAP interfaces in the NIC model
cannot be emulated because it always receives a packet that is spec
complaint. The capability of sending short frames from NIC models is
still supported and short frames can still pass through SLiRP/TAP.

This series should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

Note this is a resend of the v5 [1]. Only the first 4 patches were
applied in QEMU 6.0, and the reset was said to be queued for 6.1
but for some reason they never landed in QEMU mainline.

[1] https://lore.kernel.org/qemu-devel/859cd26a-feb2-ed62-98d5-764841a468cf@redhat.com/

Bin Meng (8):
  hw/net: e1000: Remove the logic of padding short frames in the receive
    path
  hw/net: vmxnet3: Remove the logic of padding short frames in the
    receive path
  hw/net: i82596: Remove the logic of padding short frames in the
    receive path
  hw/net: ne2000: Remove the logic of padding short frames in the
    receive path
  hw/net: pcnet: Remove the logic of padding short frames in the receive
    path
  hw/net: rtl8139: Remove the logic of padding short frames in the
    receive path
  hw/net: sungem: Remove the logic of padding short frames in the
    receive path
  hw/net: sunhme: Remove the logic of padding short frames in the
    receive path

 hw/net/e1000.c   | 11 +----------
 hw/net/i82596.c  | 18 ------------------
 hw/net/ne2000.c  | 12 ------------
 hw/net/pcnet.c   |  9 ---------
 hw/net/rtl8139.c | 12 ------------
 hw/net/sungem.c  | 14 --------------
 hw/net/sunhme.c  | 11 -----------
 hw/net/vmxnet3.c | 10 ----------
 8 files changed, 1 insertion(+), 96 deletions(-)

-- 
2.34.1


