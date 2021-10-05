Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1E42307C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:02:56 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpiI-0006w0-O4
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpdq-0003sY-RD
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpdm-0004Vt-Nh
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633460292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RkJ8/oIX6O/HZwZ2hjKTjZFbFJO6lsMumKlQleoOQP8=;
 b=MmGQmK7DBFk8XfJBEXBLI3yn+yArBXBDIn40E3ZH7ZvmaosHKkkWwXgg4uqFy/AYYHNZ3O
 XkJBTD+JnFtrYBnooIDaZI/vRAPdXqWsDDPOeqCtO/yrIvLInVRVseeyiDTsaIpX6Hcz3n
 AmdVCuNsuUc7BoyvV6cXCqFM3CAsuCU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-VscOjAqhOnGlJNRaeVFlyw-1; Tue, 05 Oct 2021 14:58:10 -0400
X-MC-Unique: VscOjAqhOnGlJNRaeVFlyw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k2-20020adff5c2000000b00160b12639a5so78543wrp.3
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0srOFGuX438z0c6gbN8vV135Z5ycFs5/tNpWmRTRH4M=;
 b=bxhLa6JAiIkAvKz00Ikn7T46O/jfV4yROFdekzCeONEyrZvHeKX2LcoxSYEZuPT77D
 p3kLAehmygU2f1edDNOQkbXyOgTkI2wTt2TWgeDJzTMSZXADPzwv//B8ZJ1Xzu2jkQLA
 Ecx8pPWtgZmSgEwQASwiGDgveGPR36ZRMYEo0I6PeETaoAYmlAlB1rgsUL92C3ml7eCY
 EQHJcJk0meJOd9XAS5g15F6RZydovNAurQgYo82ieeO483USDFsKIZI6lljf3X2EVTUL
 jxIJwVc7dnTZ2GbN8imAOwu9UEzSlKxxvum+aSZfoMSMOezj4lMJDgZATjIP9Fcl6omQ
 4zoA==
X-Gm-Message-State: AOAM532P2tPv2HeAIjBIsIIrnQtD0HeBtOEv6PyF0EYhGKeHDMOIJSqu
 qUv8xb8kLYOzyHifGfHecsx1ChHv8T3RAvdCbJevX3BefT5TtnPXB20uf8OGDxv/IYy35Lg7TuY
 rpmkJF1oI7DJUrsERrM2oeqn8HUVfGshGeFOQ1mxaLRrGR0l8n4Eim5fql8dh7RqU
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr23029813wri.205.1633460288884; 
 Tue, 05 Oct 2021 11:58:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8dnzkiY1J7xBIWyxjQe/T7ZBs5gU2FZwWQ+QCo6z+jIe9urtbyV9cGy6Ajlub1UH5zvFZ6A==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr23029789wri.205.1633460288666; 
 Tue, 05 Oct 2021 11:58:08 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q128sm24227wma.3.2021.10.05.11.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:58:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] aio: AIO_CONTEXT_ACQUIRE_GUARD() macro experiment
Date: Tue,  5 Oct 2021 20:58:03 +0200
Message-Id: <20211005185807.4134557-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Experiment to use glib g_autoptr/autofree features with=0D
AIO context.=0D
Since this is a RFC, only few examples are provided.=0D
=0D
TODO: Document the macros in docs/devel/multiple-iothreads.txt=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  block/aio: Add automatically released aio_context variants=0D
  hw/scsi/scsi-disk: Use automatic AIO context lock=0D
  hw/scsi/scsi-generic: Use automatic AIO context lock=0D
  hw/block/virtio-blk: Use automatic AIO context lock=0D
=0D
 include/block/aio.h    | 24 ++++++++++++++++++++++++=0D
 hw/block/virtio-blk.c  | 26 ++++++++++++--------------=0D
 hw/scsi/scsi-disk.c    | 13 ++++---------=0D
 hw/scsi/scsi-generic.c |  6 +++---=0D
 4 files changed, 43 insertions(+), 26 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


