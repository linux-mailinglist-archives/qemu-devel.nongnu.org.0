Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EC3243BB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:27:12 +0100 (CET)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEysR-00044A-9Q
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqI-0002JB-7z
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:58 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqG-0004l1-0f
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:57 -0500
Received: by mail-ed1-x533.google.com with SMTP id l12so3769542edt.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mAgVP4gp+8RqZ/YG+2KlyeQLZybeexYNbSRa/thmu/4=;
 b=fAmtszXLydpCypLT3sTHPKhFHBSac6GpTUXN+Dl9gChoThNZg8sEaU57dtzK9s4ASF
 vyW9vBoDp9rI63tcns865e3RmkzhFf6FBEARuFsSGccFQ3HPpGWx7BTYuh0GmBXt6umh
 zSKo+RfOUlzpSVySI+BWPV3IJ3t6KhIhKCCU5+k/tc3KyhoWpybdoYalTm/wulH25gYR
 4UVMJQsax6PiWgLNaUw9ycES66bGnJD935o89zRH/NNfh9Zho/6wY44KdSqzcW2Nrk41
 mBc2XndcRQEeh/dnE3r09R09v3zQ89/gikOWVklZsm/lLSM7SgwPPbAdIJmtryuYYgtQ
 D7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mAgVP4gp+8RqZ/YG+2KlyeQLZybeexYNbSRa/thmu/4=;
 b=d77fbXp8E4RWA8/fKykSsW7sFRax0Tb+lSGayx/b+j4sztSCDofCycCrXMpa6mY+mB
 mKxWuILJD9i4nQGmu5HDjtrjNAq0p5gXz6+FMjqJxv/wyqhyY66EUieH3Y3PyOVxfrz/
 zUOY/03ityikkF4UEEKVIQYgiefP0n2E3h4gLwOW1CvMAynrzzPwIirvcI1eyHAbbvrU
 TvVsaREq1dP/eNcQizI28H6AtbVHd5njHXf5CGPtmgMYso4JjReTOyCrPB1wBeYj4n//
 ndRSSfcWXMudhAhHlH/TZzOk5SBqDkQXYV6mz02w5SwwmfLrUDIZt7Ou+x7/ixHisJVo
 HbHg==
X-Gm-Message-State: AOAM533dQzuRPEpm5cGNGh/zt7Kr2Mi6k2lJOsUKDqYMkNGEPZlcnWih
 Pd6c5VMqUdeqbRRFe1Adcx4NJ09jgWk=
X-Google-Smtp-Source: ABdhPJwfFwuPxE+qglXU1EL5SdSluIU+vooWOoTdszXbQyIrQ0NRAtdf3agSuqEitAg1HAbdk/OC2A==
X-Received: by 2002:aa7:c94c:: with SMTP id h12mr35323851edt.40.1614191094502; 
 Wed, 24 Feb 2021 10:24:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:24:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] scsi-generic: error handling overhaul
Date: Wed, 24 Feb 2021 19:24:43 +0100
Message-Id: <20210224182453.587731-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: hare@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is mostly a refresh of Hannes's patches at
https://patchew.org/QEMU/20201116184041.60465-1-hare@suse.de/, which
haven't been applied yet because they broke the testsuite.

In addition to Hannes's introduction of host status in the SCSI
subsystem, which survives mostly in patches 3 and 6-10, I am also changing
scsi_handle_rw_error to always pass down guest-recoverable sense codes,
even if rerror=stop/werror=stop.  Without this change, [rw]error=stop are
mostly unusable because the guest will stop even for unit attention sense.

Paolo

Supersedes: <20201116184041.60465-1-hare@suse.de>

Hannes Reinecke (5):
  scsi: drop 'result' argument from command_complete callback
  scsi: Rename linux-specific SG_ERR codes to generic SCSI_HOST error
    codes
  scsi: Add mapping for generic SCSI_HOST status to sense codes
  scsi: inline sg_io_sense_from_errno() into the callers.
  scsi: move host_status handling into SCSI drivers

Paolo Bonzini (5):
  scsi-disk: move scsi_handle_rw_error earlier
  scsi-disk: do not complete requests early for rerror/werror=ignore
  scsi: introduce scsi_sense_from_errno()
  scsi-disk: pass SCSI status to scsi_handle_rw_error
  scsi-disk: pass guest recoverable errors through even for rerror=stop

 hw/scsi/esp-pci.c        |   5 +-
 hw/scsi/esp.c            |   7 +-
 hw/scsi/lsi53c895a.c     |   6 +-
 hw/scsi/megasas.c        |   6 +-
 hw/scsi/mptsas.c         |   5 +-
 hw/scsi/scsi-bus.c       |  23 ++++-
 hw/scsi/scsi-disk.c      | 203 ++++++++++++++++++++++-----------------
 hw/scsi/scsi-generic.c   |  20 ++--
 hw/scsi/spapr_vscsi.c    |  10 +-
 hw/scsi/virtio-scsi.c    |  51 +++++++++-
 hw/scsi/vmw_pvscsi.c     |  43 ++++++++-
 hw/usb/dev-storage.c     |   6 +-
 hw/usb/dev-uas.c         |   7 +-
 include/hw/scsi/esp.h    |   2 +-
 include/hw/scsi/scsi.h   |   6 +-
 include/scsi/constants.h |   3 +
 include/scsi/utils.h     |  29 ++++--
 scsi/qemu-pr-helper.c    |  24 +++--
 scsi/utils.c             | 119 +++++++++++++++++------
 19 files changed, 395 insertions(+), 180 deletions(-)

-- 
2.29.2


