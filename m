Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3481371D20
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:57:41 +0200 (CEST)
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbt6-0003tU-LU
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldbr4-00029R-Gi
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldbqy-0003vl-VT
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620060927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0Tdb8sR1fcDHfLPMX3wxk8VQkl06VVaHGh/CyYd0mY=;
 b=dI43gVvyELTLy3uPjNM9Extlqricocurovhz3qkaEyRGPs+Lz/qaLthk5Mtn/V7Qf5pBJK
 rqGDJyjykuUMoYuGkqsjSy6b2TJHgiFCsRQKs+M+epbxpeFDOczbucVN37HIAH94ca4xkv
 tv7rzHZS/c9NnLtnb6w8thfpo46gwu8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-KxAAWWF4N16RK1mBAlkFOw-1; Mon, 03 May 2021 12:55:26 -0400
X-MC-Unique: KxAAWWF4N16RK1mBAlkFOw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so4224259wre.22
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q0Tdb8sR1fcDHfLPMX3wxk8VQkl06VVaHGh/CyYd0mY=;
 b=myhGxG8AsvMFY32GzIQ2jFad6oG1uztNwat/pjFpFE3zc15JWISSwHdKrxIRDuXYDy
 +gox56xa5054mAySpy82LU9HjD3o2F6u6wrIFWDv8uruVj02asGBYt1VEt1oHWwD3U99
 HOTgJg558vwFv2zhxeNZsWwYI35hd43bkkhzUb5OiXppHTVTf3BBOIxfBqdirRzCUMxB
 ATmXsCGS+5isflb7qiBFuf6wtEyKWTCPb5dw9q1TZtOkAgUmYS0GuA845MtitHgcibzx
 vHUhJrMEH4bTmznm7LTrkH8bwGmQ4owSoh42ebQW+0CJ6VcQwsy+khL5g0GkrMVD2ynR
 HELQ==
X-Gm-Message-State: AOAM532qYLLHvEo1odx6wAzQIs5b79M/6/Wn1U0Lti3H2QKkcYSp3PVy
 FjI6I7cDukGKiXMOLRN+bYbCFOD5RcYUHI2CjsvGz3SljjQQOBBbExPx7DX0LYbBwlTupvre8Py
 6H8iTKj4ESpmKU/Y=
X-Received: by 2002:a1c:228a:: with SMTP id i132mr22727382wmi.10.1620060925035; 
 Mon, 03 May 2021 09:55:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFo7qEDMges/uzjZw97HO6hFxO5PyY6DBxO4xIjzOBIH5ikYZzKiDHiEz6SFPumnm4SvWc4w==
X-Received: by 2002:a1c:228a:: with SMTP id i132mr22727362wmi.10.1620060924840; 
 Mon, 03 May 2021 09:55:24 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d3sm5107213wri.75.2021.05.03.09.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:55:24 -0700 (PDT)
Subject: Re: [PATCH 0/3] ppc: Convert (mostly) from device_legacy_reset() to
 device_cold_reset()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210503151849.8766-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5fc07469-32c4-3c86-92f1-430bac6f09a3@redhat.com>
Date: Mon, 3 May 2021 18:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503151849.8766-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

+Eduardo/Markus

On 5/3/21 5:18 PM, Peter Maydell wrote:
> The old function device_legacy_reset() (which was originally
> device_reset() and got renamed when 3-phase-reset landed) is
> deprecated, because it has slightly odd semantics -- it resets the
> device itself, but (unlike when a device is reset as part of system
> reset) not any qbus it owns (and devices attached to the qbus).  The
> replacement is device_cold_reset(), which resets the device and its
> bus (if any).
> 
> For a device with child bus, the two functions are identical; this
> patchset changes the PPC code which uses device_legacy_reset() on
> devices which have no qbus to use device_cold_reset() instead; this
> should have no functionally visible difference.

So IIUC we should be able to add this check?

-- >8 --
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a9..4e03f964a42 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1121,6 +1122,7 @@ void device_legacy_reset(DeviceState *dev)
     DeviceClass *klass = DEVICE_GET_CLASS(dev);

     trace_qdev_reset(dev, object_get_typename(OBJECT(dev)));
+    assert(DEVICE_GET_CLASS(dev)->bus_type);
     if (klass->reset) {
         klass->reset(dev);
     }
---

> 
> There is one other use of device_legacy_reset() in PPC code which I
> didn't change: in hw/ppc/spapr_pci.c:spapr_phb_children_reset().  I
> couldn't figure out what the children being reset here are and if
> they might own buses.  I suspect that even if they do own buses the
> right thing would be to change to device_cold_reset(), but I stuck to
> only the changes I felt reasonably sure were definitely
> no-behaviour-change.
> 
> NB: tested with 'make check' and 'make check-acceptance' only.
> 
> thanks
> -- PMM


