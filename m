Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449B5FE376
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:43:41 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj53L-0001IG-Ro
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj512-0005tz-KA
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj50l-0003bQ-Ib
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665693657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GVcQyG0Pt83cJ8LbhK8Kf5FmwMIlXEGry1i/TtKAUT0LANJIMJj9KvORJXEdfIXouOAV1N
 OQ2R2wmxTAWuHCXsfPhYNVh4/lcU6aNCciK1F0JQnkFNb6s22tXVMSoFomxVebEUMGvCO1
 rDtOnY4E0odHgOaE/1mSxzmODxgCBwM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-lelWBj_LPbCLQq99h2z-_g-1; Thu, 13 Oct 2022 16:40:56 -0400
X-MC-Unique: lelWBj_LPbCLQq99h2z-_g-1
Received: by mail-ed1-f69.google.com with SMTP id
 h13-20020a056402280d00b0045cb282161cso2240691ede.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=hEj6E+PWOza0XkYpYm5MmEz5ysgG/DehefDMPmqzitGrhAFZHlNPKCo1WQ2Zs3K7DU
 s0ebHy/uFOchGEZun3LHkoBv0munVIgCqcsZQeMb2O21d5i5UFkiLGpFSGmbsD6kwKRu
 i609QztxTiZPOkatX+UJVCgFkuuAmJcKjHKvvnQpmqLfC5f4W7HcUISxIyeOEpUF01Df
 2MrsOTeIxcnt1dJE8Rm0p9Wkz1S/7DC+/QJ+ZWVcPVOilrS0bW7Y5UNJ5WtE/pKix7fq
 JSHOBh9E/ntprbIpkKC6nkUuxOqKGC0kR49fGUM9Tt4Z8q0GOI4AR8drw1NN2fDWbFdy
 04VA==
X-Gm-Message-State: ACrzQf1zrZvhxq51d5UAqGelfQnb2btjTy5+tbxFPNoSekEty61jY64B
 zO07iVXAt6Xdzjg0l11vAarcF316UGQbZuQljuVjcG462BmL+O0yIYlezX3r/vjZaLYhCH0DmCr
 2Qq+epIMQYDxPQuM=
X-Received: by 2002:a17:906:8a6a:b0:78d:f18e:5d6f with SMTP id
 hy10-20020a1709068a6a00b0078df18e5d6fmr1128077ejc.489.1665693655460; 
 Thu, 13 Oct 2022 13:40:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CuXGF8D90Ul/CWpmGO1gBHsU8F7mPmSVchIAbfOj9j+JgyYlwIizY1VKaJKQ0rb0noNEZRg==
X-Received: by 2002:a17:906:8a6a:b0:78d:f18e:5d6f with SMTP id
 hy10-20020a1709068a6a00b0078df18e5d6fmr1128063ejc.489.1665693655275; 
 Thu, 13 Oct 2022 13:40:55 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a1709065d1200b0073d7bef38e3sm395970ejt.45.2022.10.13.13.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 13:40:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3] hyperv: fix SynIC SINT assertion failure on guest reset
Date: Thu, 13 Oct 2022 22:40:52 +0200
Message-Id: <20221013204052.653365-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cb57cee2e29b20d06f81dce054cbcea8b5d497e8.1664552976.git.maciej.szmigiero@oracle.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


