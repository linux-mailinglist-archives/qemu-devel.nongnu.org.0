Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E439C571D68
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:55:44 +0200 (CEST)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHId-0003HN-Rt
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBHFg-0008LK-Mf
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBHFZ-0007XE-U7
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657637552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lyawkcn0y6w3lQNfRnC3G2IuzcRBhovO5YC0D9oA8aE=;
 b=QNI8VeCOBFUpO8hSWWHEsn8/aatihGfZB9r/kFBSml2keTyDM+Bxlrye28I4RVXR2/kouZ
 ZWkIuUmQVJV81rDcejrtps8kKLeQTKF4QZI6rZndokEtXv8FFjuw85V8zDLCRblGwBOest
 QHHsySyDf0ul4VHbAixJgCt+gh/7pok=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-HsLO2FBmPQOfvkiqls8KQw-1; Tue, 12 Jul 2022 10:52:30 -0400
X-MC-Unique: HsLO2FBmPQOfvkiqls8KQw-1
Received: by mail-ed1-f72.google.com with SMTP id
 s17-20020a056402521100b0043ade613038so3096323edd.17
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 07:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lyawkcn0y6w3lQNfRnC3G2IuzcRBhovO5YC0D9oA8aE=;
 b=Y3zTCyByPPJow05t/89WUGvrMhIz1oWRhEkuBOo3flIFF1Ho2GqRfh24CP7KPaHKPy
 Y/cquKcdod8TrLGFd2oCrFn8GjDcLwTXEAN9n53sMeleFtk4EO5XZo3kHZOmHt9XqUVF
 nS3u4P4pzp+iLBYzEM77joCPVz8HiuRPvw7cF0D5idqtdD7gqSpiGtnD5WIbfUfryPn7
 WoFWVxgqZTaW9P1e+cKAuAvYR1P0zBkoCFrApW+NHEO7MITqX66SRcYLLuXVHwfenqwv
 ngsIBcoc1VtpNQm4H8Nik+R+SP5fvMhSi/HakEwQW8BjHc2ma+2IJbCib0ObYNwTQ7Kh
 T7vw==
X-Gm-Message-State: AJIora/s7zxTMMGRTcuGhpalkIR774FGg8CcBo/cdBQfK27nBFP647ci
 0QOrPpteivBdLx6p2WEqevdI656BXYXvfsTlH1bwfaPeEIbOQ3iH+Wtek6zA/5Rks3oPbRxYPMY
 Ilz6oOvI2XvJ63tQ=
X-Received: by 2002:a05:6402:7da:b0:43a:6fe3:b7a9 with SMTP id
 u26-20020a05640207da00b0043a6fe3b7a9mr32288748edy.410.1657637548892; 
 Tue, 12 Jul 2022 07:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tb8ItpfRSC1zl/WtWVbNNrAFgNrYsO+/u7n9SfTPIF1erO26Z87bNnVGMZ7/WSQq1j9STjHQ==
X-Received: by 2002:a05:6402:7da:b0:43a:6fe3:b7a9 with SMTP id
 u26-20020a05640207da00b0043a6fe3b7a9mr32288707edy.410.1657637548536; 
 Tue, 12 Jul 2022 07:52:28 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 a25-20020aa7cf19000000b0043a56c0ededsm6144512edy.74.2022.07.12.07.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 07:52:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v3 00/14] scsi: add quirks and features to support m68k
 Macs
Date: Tue, 12 Jul 2022 16:48:33 +0200
Message-Id: <20220712144832.162389-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks (I was on vacation last week).

I am a bit scared about the mode_select_truncated quirk.  My reading
of the code is that the MODE SELECT would fail anyway because the
page length does not match in scsi_disk_check_mode_select:

    len = mode_sense_page(s, page, &p, 0);
    if (len < 0 || len != expected_len) {
        return -1;
    }

Is that correct?  If not, I'm not sure where I am wrong.  If so,
I wonder if it is enough for the quirk to do just a "goto invalid_param;" 
in place of invalid_param_len.

Thanks,

Paolo



