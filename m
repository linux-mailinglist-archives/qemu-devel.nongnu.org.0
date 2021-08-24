Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0923F5A65
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:04:36 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISME-00023E-VS
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shmulik.ladkani@gmail.com>)
 id 1mISIR-0004wF-00
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:00:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shmulik.ladkani@gmail.com>)
 id 1mISIN-0004A9-UV
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:00:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id f10so12287802wml.2
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 02:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=XEO1yhzoLku7tvsHJMTQJTyi+WzZbv24MbIb7jQ6Mr0=;
 b=RUHn/d/SpyC44+/4IIqEbIY40hgcaGppDyxSK+z1+ya63SHAT+lf7Tn7w2uMg2p/6P
 t2ORZnL4GKxRdE1Hym/gqsgwfO//YPzhwJo6SjQbfPhaKoOni28xBazgaTJm870xQsIW
 D2UpZtTCX1EM6cLel6LOqnfBgyr5huV+N7Rxj0d/C7vqI/BZgbeo7ZHd6ykH94GPuSGT
 v6qf6Ma0wzBloY+UlRI5/VMDlfIakDE+KIrhfzDyZT9Pxbg/tZKBdJGAHJxrTGZySNb8
 MhEi6GYGEcIPQue66P/YPLM0zV2vD1nntPVpcBl0bEHo2L3Qy2F4it7eL8tAFH26ILNm
 O5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=XEO1yhzoLku7tvsHJMTQJTyi+WzZbv24MbIb7jQ6Mr0=;
 b=Bp6QZwqrAfNb4+kyRyB6BiLyYzHBf25Y9cZdpctP6HffpNYGkKDQdVoFaq1U7ULTd4
 RGyFTteSu1cgAABbcrHFE5tobzAonavQQQEUSJ4Qc9R03+Qn8cfTW3RrzUo7BBYmw2MM
 6pmG/7Qdhfqo+IgJbifPdbbsdo8DGNH/UyvjWXm9lV+cr5167krWnEJxE8IQETLb7I5Q
 jMP7mtFBpy8P7Dufwdf7+hQi3h65Ti1lpkOrut4oN+YZzR+jPtv30vEX6NhHMOSzwDUx
 2RKlLC6YO5uU8kKUT8rJg35UbLj+tVAULl7ZK3SlFYM0aAJzXHGQ7N4gUGgyuBfpl909
 KosA==
X-Gm-Message-State: AOAM531KbIRX0SZ7/0BVah3SdVOhIM1MQbu47oaklKDiLYzK1kMcI2+1
 nPZ+WRUgcQ8QgoGg6n4OcvM=
X-Google-Smtp-Source: ABdhPJwB8baGOGuKceNgOWOj063vsmN9XwVRGa3Vc8PFEmzNU7/TFr/bFLE33e0ul0Szs86r1Cp6oA==
X-Received: by 2002:a1c:4d04:: with SMTP id o4mr3095259wmh.82.1629795632876;
 Tue, 24 Aug 2021 02:00:32 -0700 (PDT)
Received: from blondie ([141.226.10.120])
 by smtp.gmail.com with ESMTPSA id y21sm1741639wmc.11.2021.08.24.02.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 02:00:32 -0700 (PDT)
Date: Tue, 24 Aug 2021 12:00:28 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Matt Wang <wwentao@vmware.com>, Vishal Bhakta <vbhakta@vmware.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: [BUG] scsi: vmw_pvscsi: Boot hangs during scsi under qemu, post
 commit e662502b3a78
Message-ID: <20210824120028.30d9c071@blondie>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shmulik.ladkani@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, VMware PV-Drivers <pv-drivers@vmware.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Commit e662502b3a78 ("scsi: vmw_pvscsi: Set correct residual data length"),
and its backports to stable trees, makes kernel hang during boot, when
ran as a VM under qemu with following parameters:

  -drive file=$DISKFILE,if=none,id=sda
  -device pvscsi
  -device scsi-hd,bus=scsi.0,drive=sda

Diving deeper, commit e662502b3a78

  @@ -585,7 +585,13 @@ static void pvscsi_complete_request(struct pvscsi_adapter *adapter,
   		case BTSTAT_SUCCESS:
  +			/*
  +			 * Commands like INQUIRY may transfer less data than
  +			 * requested by the initiator via bufflen. Set residual
  +			 * count to make upper layer aware of the actual amount
  +			 * of data returned.
  +			 */
  +			scsi_set_resid(cmd, scsi_bufflen(cmd) - e->dataLen);

assumes 'e->dataLen' is properly armed with actual num of bytes
transferred; alas qemu's hw/scsi/vmw_pvscsi.c never arms the 'dataLen'
field of the completion descriptor (kept zero).

As a result, the residual count is set as the *entire* 'scsi_bufflen' of a
good transfer, which makes upper scsi layers repeatedly ignore this
valid transfer.

Not properly arming 'dataLen' seems as an oversight in qemu, which needs
to be fixed.

However, since kernels with commit e662502b3a78 (and backports) now fail
to boot under qemu's "-device pvscsi", a suggested workaround is to set
the residual count *only* if 'e->dataLen' is armed, e.g:

  @@ -588,7 +588,8 @@ static void pvscsi_complete_request(struct pvscsi_adapter *adapter,
                           * count to make upper layer aware of the actual amount
                           * of data returned.
                           */
  -                       scsi_set_resid(cmd, scsi_bufflen(cmd) - e->dataLen);
  +                       if (e->dataLen)
  +                               scsi_set_resid(cmd, scsi_bufflen(cmd) - e->dataLen);

in order to make kernels boot on old qemu binaries.

Best,
Shmulik

