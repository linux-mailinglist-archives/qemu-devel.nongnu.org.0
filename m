Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A473D0B74
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:27:40 +0200 (CEST)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68Vu-0007F3-Nt
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m68Ui-0006Uo-Nb
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m68Uf-0000s8-Vg
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626859579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8rPkRZM1cltyr0FtukH+ha4ofVMZ1lPCXXCCT3NwLE=;
 b=R3EHJ8mZlXGG2WUcFi0Ct6q7sx5SZVET86g93OAWYiktiLnPcTuSsaW1dcrRUKomKtN92D
 4ezPr9eutK7pX1qynZoGU2HC1Uiusji5uIHQbhGbS7N0KJwPKcLpiHRlreVlvtIuOSzhvM
 bZYtqMAL828jwdz1fbycc8HudxYNOw0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-BSEv6cX3Mj-A5T4sLf4thA-1; Wed, 21 Jul 2021 05:26:18 -0400
X-MC-Unique: BSEv6cX3Mj-A5T4sLf4thA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l17-20020a05600c4f11b0290225ef65c35dso913119wmq.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 02:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D8rPkRZM1cltyr0FtukH+ha4ofVMZ1lPCXXCCT3NwLE=;
 b=tRI9FUYVK0I0qBYwwBhz5jXsAJdSN93HqNrDast8w2iLVDsxJ7cFQJpRTq5Xw8tQ/H
 6ng7JvWf21eHLOd2fhagbqc7luFdiSzaqvriQVEmHej0Na8TD/EZbq7omvnBeLbchPTd
 J6PhSdDFX9BL9ZrmjSwpZRnIg64gSLfHaZdz3d3/eBvXJoEAX9PmiiqcnpJMa9kloE9W
 LmqkGfsnEtOqf9oMcXFEcFiEW7YmUwh1rJCYuhG3JtMVE3no65ObL6caqt2VPJtHSEj6
 eNyUps+MuMq/hkb4XO0ETvxYqP0MsOCeQ33GZieloTOsypFBvDZaoP+HCr3c30/3coQK
 RGNw==
X-Gm-Message-State: AOAM531m/VX94FwpaX1YAtxx0qC+nvtqbd21t3aQA7VuN1EFUaMaG9Lm
 RI+VuytXcCNRqFCAKbHuS5a1tzCjCpUOhx1DrP5zBho5B5u8/o7uEVmUvjwW93BSQ+Ge0CyphB5
 mXqYHzE1ksZTEtJo=
X-Received: by 2002:adf:facf:: with SMTP id a15mr41209352wrs.39.1626859577206; 
 Wed, 21 Jul 2021 02:26:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ+ouqz936n7Vg3Oxzse3ab6uYK7EW9+vprDYmOuC8jJuNQ+rcO8xK2QAJ43YtmxIlJyxSgg==
X-Received: by 2002:adf:facf:: with SMTP id a15mr41209319wrs.39.1626859576936; 
 Wed, 21 Jul 2021 02:26:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id c2sm26285581wrn.28.2021.07.21.02.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 02:26:16 -0700 (PDT)
Subject: Re: [PATCH 07/16] vfio: Avoid error_propagate() after
 migrate_add_blocker()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-8-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4770fb7e-f1ee-d1cd-cc66-1413ea5e1a12@redhat.com>
Date: Wed, 21 Jul 2021 11:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-8-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/21 14:53, Markus Armbruster wrote:
> When migrate_add_blocker(blocker, &errp) is followed by

Just a nit, &err.

Paolo

> error_propagate(errp, err), we can often just as well do
> migrate_add_blocker(..., errp).  This is the case in
> vfio_migration_probe().


