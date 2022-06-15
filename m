Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E254C44D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:08:29 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1P0m-0004CC-F8
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1OsH-0007ZP-UQ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1OsB-0002xa-QF
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655283574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=MvzMKLr2tBXGGOR0U/sP/JP75XFH+qpqlai8IeSQWnveRd1UFapVIG1hMORRT/v+V7JfXz
 V1aS5sWvdOy9i3YMuUqQOCaWdi6DZPB+W4jQrjqC7eOk3aekultLt3aZqVHrdp1cRt39oj
 O95ADzz4nQIemlFlQ1FXDfdVrPO5euo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-Vd7axTx4PSuli21k905VYQ-1; Wed, 15 Jun 2022 04:59:32 -0400
X-MC-Unique: Vd7axTx4PSuli21k905VYQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so1325811wmb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=l0+tPRw951QqCTdLsdqPelCQ0r53IrlO7zk7vQst6xpmegLoqt8aMUnlleJ6tFbIh0
 VXTAcaNyFFrW7SBHfpwSHAeMR27HDVpBnOp1SvcxioJxouT/yEv3kaW+SFpfbqnB8i2m
 Yx6cYmWd7kAnkMbYPc+vinbhGYXgedftTKgg2UP0fkfHiPX0F9YA6EJDiDX1VDQ1mfta
 BaD6I+dKKhudBKRD1IOBBhzwfzhMq4AwHzXsR2NjL1GEuhhfwRF+9b9iySx3edNJUn4E
 g1Vpdp7ggQLr4GJqXMLQKPVl7I7oQaNkONSzsFgCw7qK2W4RGg7egMm4Y8LpDIsvb0xB
 tzbA==
X-Gm-Message-State: AOAM531u86YdluzC8RaPQdfh92LHwpBcSFskcVMYqxp72AgZXImkuhHc
 A6AK4YU4i99HW8kA3Cb/vysXEm7U6edG9ia88kz+Of+lYL85wcl6RIOMsP1pt4WxKdUHeo6qMtL
 05Qa65uTJUwl+R8I=
X-Received: by 2002:a05:600c:4e91:b0:39c:7f1e:fb00 with SMTP id
 f17-20020a05600c4e9100b0039c7f1efb00mr8876051wmq.81.1655283571751; 
 Wed, 15 Jun 2022 01:59:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHfjZSs8wryBf1HT2fyFjYtYVYEoXMk7ykAsp92cYu3hIK4OzMBm6LnGA82o7x+DN8VOszqA==
X-Received: by 2002:a05:600c:4e91:b0:39c:7f1e:fb00 with SMTP id
 f17-20020a05600c4e9100b0039c7f1efb00mr8876021wmq.81.1655283571547; 
 Wed, 15 Jun 2022 01:59:31 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0039c5328ad92sm1868641wmq.41.2022.06.15.01.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 01:59:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 lersek@redhat.com, imammedo@redhat.com, kraxel@redhat.com
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=5D=20q35=EF=BC=9AEnable=20TSEG=20only=20when=20G=5FSMRAME=20and=20TSEG=5FEN=20both=20enabled?=
Date: Wed, 15 Jun 2022 10:59:18 +0200
Message-Id: <20220615085918.15259-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615034501.2733802-1-zhenzhong.duan@intel.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Queued, thanks.

Paolo



