Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C926D6C4D9D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:27:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezR8-00024M-K2; Wed, 22 Mar 2023 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezQw-00023C-NV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezQv-0001Rz-0k
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679495240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxW8olUjLaLQLixHdiYSiEWO+gUHeWgO2ZXNXlFYchE=;
 b=ZZcFLC2E1q5IF+Uu13gjRMM7ZBBa/9GYwUDFxTyyINdsGMIUWjGU03EswMz0Kr1q2AtChK
 toqmbG2UzlRQCoJ+rKcVihUokf/ggrwEOaVZ9yHR+XnLV+h/J00ABNILd/0w6BjDKlSlcW
 IC8FJ+VKaxJwNPzmR0z0EVPeVZCaBbU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-e5Ny4JFsPeaIcUDYdQUnvQ-1; Wed, 22 Mar 2023 10:27:18 -0400
X-MC-Unique: e5Ny4JFsPeaIcUDYdQUnvQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 d187-20020a3768c4000000b00746864b272cso4497930qkc.15
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495238;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pxW8olUjLaLQLixHdiYSiEWO+gUHeWgO2ZXNXlFYchE=;
 b=b42XGW1uvR81Ts1+sda+tJvb0FeNkjK10AOZwkMMs/j6payyuebBAhFb44f/wFQNtE
 IkaACCHCp/9S1rhSSNw2BaMyREPM60gCQt+iJZwgnTM62Q+wkSIc/XRuTb0eNF6HgedN
 lnJnWmNr6z22NCScEcFc+KWBF10ERjjrUTHXTEjIvQCt/pIVhvKERkwmdyc1LYwuw5Wf
 XErUXAJtOk0Y67YolAdpfOeUPda1KMAVTO4EBrlgk1KBuV3G++m18GG6ENsyhQR2obBb
 5zFgRyRPvsgIXshCM/EK3DQ5k02aJICxy8F0L3RpYTgzne0MM/c2lXDhxp8yfJAsBtY0
 icrg==
X-Gm-Message-State: AO0yUKWdXF24sCFW6FtnO3UPk/+l5fe5xncVQd9gdLdw47ZZuzX8pfyc
 stHdtXi/S06zSC7m+vIpVoQ2iad6XPqrnetbgLDy+d5i1Riho4Szi0Zac4LSo3P6PNX04JnQ9s9
 MDIRC8J86815TyCM=
X-Received: by 2002:a05:6214:c8b:b0:5c1:59b9:40b4 with SMTP id
 r11-20020a0562140c8b00b005c159b940b4mr6270339qvr.48.1679495237807; 
 Wed, 22 Mar 2023 07:27:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set+tQyI/vZGUo/o05+OEFOL1jvwVYVREU6JJayVxG2lrwLx/THFSRklpceA97aTKbYp4zpgbig==
X-Received: by 2002:a05:6214:c8b:b0:5c1:59b9:40b4 with SMTP id
 r11-20020a0562140c8b00b005c159b940b4mr6270290qvr.48.1679495237443; 
 Wed, 22 Mar 2023 07:27:17 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it.
 [82.57.51.170]) by smtp.gmail.com with ESMTPSA id
 r9-20020a37a809000000b007463509f94asm7547747qke.55.2023.03.22.07.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:27:16 -0700 (PDT)
Date: Wed, 22 Mar 2023 15:27:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: Re: [RFC PATCH for 8.1 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
Message-ID: <20230322142712.egnc6rlmeclwmchg@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-6-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317145542.347368-6-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Mar 17, 2023 at 03:55:41PM +0100, Eugenio Pérez wrote:
>Evaluating it at start time instead of initialization time may make the
>guest capable of dynamically adding or removing migration blockers.
>
>Also, moving to initialization reduces the number of ioctls in the
>migration, reducing failure possibilities.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> net/vhost-vdpa.c | 200 +++++++++++++++++++++++++++++++++++++----------
> 1 file changed, 157 insertions(+), 43 deletions(-)
>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 4397c0d4b3..818a24fb0e 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
>
>     /* The device always have SVQ enabled */
>     bool always_svq;
>+
>+    /* The device can isolate CVQ in its own ASID if MQ is negotiated */
>+    bool cvq_isolated_mq;
>+
>+    /* The device can isolate CVQ in its own ASID if MQ is not negotiated */
>+    bool cvq_isolated;
>+

I am not familiar with how CVQ works, so my question might be trivial
;-) but why do we need to have 2 variables depending on F_MQ?

Thanks,
Stefano


