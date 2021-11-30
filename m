Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80146358D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 14:34:57 +0100 (CET)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms3Hb-0007dH-PW
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 08:34:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ms3Ex-0005jY-BG; Tue, 30 Nov 2021 08:32:11 -0500
Received: from [2607:f8b0:4864:20::92e] (port=37520
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ms3Et-0000OV-M3; Tue, 30 Nov 2021 08:32:09 -0500
Received: by mail-ua1-x92e.google.com with SMTP id o1so41370608uap.4;
 Tue, 30 Nov 2021 05:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KskTTxOlzmscFIqduog5XSBuB2Lg9i3NxqO8x/fNcF4=;
 b=IDP8X4swPinPZrDzqWgBxDYCbFQFpxBT56WBweAjQfaLF3UA6UA/RYGNchcl/1XNOk
 /A03k19w8qTtKiPIZi55ow03njHc1vRFzCnSMu21WMqfSnbv5wGrb1XbW8XxGI8x5YQ+
 IDtCWg3tEESip2pJ47MAghwLv3ZTKGysAyW6TEPywtm2BL8txVnRF52WwcM4iJS7MY7T
 kH1uoh5J17w+wIFZUWbzJcM+glIMwe8xDqu5M+jmYZM4hAhLtlHY+ywHccQUtkPJKbco
 A27SZv5VbnzAqAOe6EtbROqQMYYKHOcR9Jp8BBa/w9QOq30VfMzu93YrZJM60hzji3aG
 CpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KskTTxOlzmscFIqduog5XSBuB2Lg9i3NxqO8x/fNcF4=;
 b=5COiuzycvIz6Tz//2s19JakqbpfxbqJdQYutq9VLcvCbl1OURpiuuEyspR30eSe1+G
 zHnWSRM+F02jdYLf0rIpNjcZF9iKOalLQCnx3PD2KCnCG4UqaAX7iAKebdILQjLk6qdG
 MsX10SqjWnTlQw9DG2u4Nq2eJrab7AI6YYAqfPLakYfNH8Azg+HVcr/frDdfJxMr/2j3
 jWp0pKeKqRueHWRmytAy+/8sBvBB80qb/mNKU6N1y1MrKbDCNimGJHxGELgrGQQMgjRN
 +hpgmrRx2Ikv0Ei8eMvLCpEKsrWzVljswCwpmXqGg0xRUi7bt20P0qhK5v720xb19voC
 hjPg==
X-Gm-Message-State: AOAM530jZ46DmtnqbVJXnnnBCKoi+3cSgLmyk9KlkpiS/YvySCryEXRG
 vU3Pvo6mxc7DqjgiPDh8s7AH8Gty8xY=
X-Google-Smtp-Source: ABdhPJysn++0Or66Qq8x72OTvgKqatZBMRk4xa1hSiYLC00yCvPv84IxSUQalfp3puSduTc3z9kNTg==
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr16974578vsu.48.1638279122733; 
 Tue, 30 Nov 2021 05:32:02 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id h22sm2058071vsu.0.2021.11.30.05.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:32:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Date: Tue, 30 Nov 2021 10:31:51 -0300
Message-Id: <20211130133153.444601-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this version a documentation patch was added to explain
our motivations to officially disable KVM accel in the powernv
machine.

Changes from v1:
- added a doc patch
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg05207.html 

Daniel Henrique Barboza (2):
  ppc/pnv.c: add a friendly warning when accel=kvm is used
  docs/system/ppc/powernv.rst: document KVM support status

 docs/system/ppc/powernv.rst | 13 +++++++++++++
 hw/ppc/pnv.c                |  5 +++++
 2 files changed, 18 insertions(+)

-- 
2.31.1


