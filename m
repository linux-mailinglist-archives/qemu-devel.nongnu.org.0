Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C5653D04
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:32:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GzD-0001cI-K8; Thu, 22 Dec 2022 03:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8GzA-0001bE-Jv
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:31:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8Gz8-0000UV-74
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671697885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=RDUVemUnzIpOK+uuMUyJ+YTdTVs7dQcip4F7HpIXRK4Sxwcn2dJ+SBudzR8PEREKUixKSO
 J201IxFZKa2h3ZdZnZqpQZY5flUmRiJcaqtJoOo5vMz5DXlX+qqYBoMmGqgRvemgJgLIYZ
 ekyG7CbTb9J94rMtYml2X5e+XojX5Ak=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-HYOSK3WUOPO01Ch5oMClXQ-1; Thu, 22 Dec 2022 03:31:23 -0500
X-MC-Unique: HYOSK3WUOPO01Ch5oMClXQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso976457ejb.14
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=tpBQB3vGQxZKywSzJQhxrjDSi4pQ6Ko39t8DFLB+GPkMslSfKXJBTlx0Jl8Sjv+dHw
 Yy4mXlMwugsfLPJi+0ZkEmJEeLajFiW2K0gbGz7kjN0dhb9zUrOtYzjaWB5Gev5Wondz
 ojAEg/V2N85h96UyroHrFFsPtBLlS/+7xIurLg2MnEKsA38qvHVNp59UP+d6ZG4125jM
 AyurayibUIfpeboXa5qAway07aHcX7HVfwEfVGh2r8xH9j55cPrXYEszb2aJbzT5iPvm
 aoye2no59Di3snu/QZzJ8SRej4cY3tVBv4LIdRMLcc8CN9CHcm+x+ge7+pXgIVSsJDr6
 FvcQ==
X-Gm-Message-State: AFqh2krjlZoHvesMTeOziw/8vrrRz8207DI4KTcASG776m+SWw/cVYqO
 P1MFfMGwHhNYnHxaaOTXXLD/e5SkiDbQnPMqlArzsnjn2knHXpzbPoWRCFcCXapvXJOHqIuNCY1
 htTbe4NSt3ZOHAQM=
X-Received: by 2002:a05:6402:1592:b0:462:7b87:c6d with SMTP id
 c18-20020a056402159200b004627b870c6dmr4000354edv.2.1671697882818; 
 Thu, 22 Dec 2022 00:31:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwZkeFL8OUz6ZUFNTs1DiHZ5yLUmzSas8pfZy4kn1qQLxx2bSmeMBGwO1lgmt+9zSvqFM8Ow==
X-Received: by 2002:a05:6402:1592:b0:462:7b87:c6d with SMTP id
 c18-20020a056402159200b004627b870c6dmr4000340edv.2.1671697882646; 
 Thu, 22 Dec 2022 00:31:22 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906244100b007b2a58e31dasm8256467ejb.145.2022.12.22.00.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 00:31:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/6] enforce use of G_GNUC_PRINTF annotations
Date: Thu, 22 Dec 2022 09:31:19 +0100
Message-Id: <20221222083119.860606-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Queued, thanks.

Paolo


