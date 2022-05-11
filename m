Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1C2522DE5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 10:10:18 +0200 (CEST)
Received: from localhost ([::1]:55434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nohQG-0005PL-FV
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 04:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noh4O-0008Fm-Je
 for qemu-devel@nongnu.org; Wed, 11 May 2022 03:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noh4M-0001Mq-W8
 for qemu-devel@nongnu.org; Wed, 11 May 2022 03:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652255258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ue9JK2rTRQKDY1CkB/3RfNZCDAIMCidX9OsMT3WSy9I=;
 b=B3kT9Vly0ApSQQpFXN5s/Sty7tt+KC6tcOeYgbhRRGfG+r6jOF64JRIelUUFP8Or2aQ1zL
 W3b/fApYbw3VeRx2ObufMTPDPddPeXrw9egZu+yQrdCT5yd6RCRqLuLwk992SqMNya/7ml
 cZrsFPrp0XyUCP7xV9GbGyTe8t5nKf8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-STiWdmbcPNC1KYkCC7w1hw-1; Wed, 11 May 2022 03:47:36 -0400
X-MC-Unique: STiWdmbcPNC1KYkCC7w1hw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a50f154000000b0042815e3008cso820359edl.15
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 00:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ue9JK2rTRQKDY1CkB/3RfNZCDAIMCidX9OsMT3WSy9I=;
 b=kJEnb+aYhWsTNbDLcATbT7AVbdpJ8YdpQVB0x+XpnjWyuTWVQX5tYHkWY58/Lw2NU9
 JgbcTRHlXTd0Y4m348p7MoK1ha2d8v2hy8XNLT6F8vvwWijM/1SC2e85cG2gv9Grqh4Q
 lkBaJloDs36avoQXq1pQS34IZbBXqlD8zH0Z8AvRI3JTT0oP10B6m7OdXBAxZ2otmZ9k
 t6XwANphNkhFHnPz7bm5hCmnBbWM/rTe83MVy92bdPLGou6wp5oQfwDmabfdJl9fiBRT
 3z08ZTaqe2Rn5k17LWtSktzFWfDRPfkcSdoHWQo3wUx11LDVcn9CVHqZxZGdlwuM51k2
 7rNw==
X-Gm-Message-State: AOAM530o65ur4Xa47qKZxXG3SXjAHY0W65HZMYnFx4NOjv44K1kjQdBy
 TU1fUA09OTEd450towdHcQ4wfpAk0RMq3A0LcSGJii2LcuI/Q6TVo4MVoe0Fh5OoicUopcvUu2K
 DKM0HCFW0wzrprzo=
X-Received: by 2002:a17:907:6e8b:b0:6fa:82f5:14bd with SMTP id
 sh11-20020a1709076e8b00b006fa82f514bdmr11507715ejc.182.1652255255777; 
 Wed, 11 May 2022 00:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCYHFdPiVkR0vzXGv2VL/IMa8uV3VeLka+YCmz1GzEAa5Xgd1Mi/ju1gvkaB+lKxwkTRgZzA==
X-Received: by 2002:a17:907:6e8b:b0:6fa:82f5:14bd with SMTP id
 sh11-20020a1709076e8b00b006fa82f514bdmr11507684ejc.182.1652255255518; 
 Wed, 11 May 2022 00:47:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a1709061f4500b006f3ef214e47sm651674ejk.173.2022.05.11.00.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 00:47:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com, kraxel@redhat.com, thuth@redhat.com,
 prerna.saxena@nutanix.com, soham.ghosh@nutanix.com,
 prachatos.mitra@nutanix.com, berrange@redhat.com,
 philippe.mathieu.daude@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH v1] Make png parameter to ui/meson.build independent of vnc
Date: Wed, 11 May 2022 09:46:27 +0200
Message-Id: <20220511074626.165398-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510161932.228481-1-kshitij.suri@nutanix.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> +if png.found()
> +  softmmu_ss.add(png)
> +endif

Queued, thanks.  However, this can be just "softmmu_ss.add(png) without
the if, so I adjusted that.

Paolo


