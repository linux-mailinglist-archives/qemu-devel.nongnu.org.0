Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C85FEAB3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:44:22 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGIn-0002YL-2C
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojFuC-0007uY-Io
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojFu9-0004WR-HB
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665735532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=SlUWIogyUSIVYRRicVPjZ1Y8XFXILyCtH6EmjH18dbhXpswQdYLIV2nXQ+f/Mzxe6q/DYb
 pnTj+JZz4QTrrC4xfMjmdkPUuLWQroTu+qiwFNOd5DJ/RsuCxeEOur1Ws4rRhBSN6mlgL4
 /sI5i8pfoG2EEA2Y4tCCs0ZwfJ9eZaM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-3FcpqAEEO5-2nZ2ZTVuzgA-1; Fri, 14 Oct 2022 04:18:51 -0400
X-MC-Unique: 3FcpqAEEO5-2nZ2ZTVuzgA-1
Received: by mail-ed1-f70.google.com with SMTP id
 b8-20020a056402278800b0045c948cc65fso3243323ede.9
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=6furYTr/gjiO/46AGJqpTflNelJEv8vNbt8NRMJck3N5zcymxQpOFBmLwjWxSWhY/z
 qLKsD9eEwX8bR6HqVcnp0dtcOHjSaeg7AKwjyVo/yB8mFnOxrVaXLE7d1QD3882uazJt
 v/2FShmfsMfoaxlgc7SbhhyJT2GGL+UZDo01F0H0KGz9qFpq/SCNDzqMSwd/4W1rsRfg
 vGlvbyk9ixIPMVR31/N2PsyRCDPVhMn5UQ/yV1N8WqBTtIOOdQ85g00XeEH+1fwBA+YD
 GGnF75Em1938YmGllrZcKJAnW9pwSOqZV20TRkSvXyyCmSXEwEOeCDSvRnggTMHOwrna
 htSg==
X-Gm-Message-State: ACrzQf1Z5Sex0R28AyHI4T3NvscEwo62JYUCwoJLZSehGzTe7twjMJxe
 mPMsD3IbGIfEMYSpqd64YTlgie3cnkvAVg4jxutROysG6GpvAYlwPIEsSbcJw23zZtobP0T1ieX
 V0s4W7HUH6otnC8Q=
X-Received: by 2002:a17:907:3181:b0:787:d81c:a6ad with SMTP id
 xe1-20020a170907318100b00787d81ca6admr2684077ejb.769.1665735530328; 
 Fri, 14 Oct 2022 01:18:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JP16b3NEgEp/iwGMj4fyiI62Sxn9AlvMNL4cOHIznGIB8r5sDTGdqJtKe5w7qe3ezDAjgZQ==
X-Received: by 2002:a17:907:3181:b0:787:d81c:a6ad with SMTP id
 xe1-20020a170907318100b00787d81ca6admr2684059ejb.769.1665735530002; 
 Fri, 14 Oct 2022 01:18:50 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 kv2-20020a17090778c200b0077e6be40e4asm1133202ejc.175.2022.10.14.01.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:18:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3] configure: Avoid using strings binary
Date: Fri, 14 Oct 2022 10:18:46 +0200
Message-Id: <20221014081846.686471-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <d6d9c7043cfe6d976d96694f2b4ecf85cf3206f1.1665732504.git.mprivozn@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo


