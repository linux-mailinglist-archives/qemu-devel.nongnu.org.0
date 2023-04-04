Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6236D5AF0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 10:31:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjc4H-0004Yi-5p; Tue, 04 Apr 2023 04:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjc4E-0004Uz-VZ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjc4C-0005zI-UI
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680597060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Av76SZbRtYN2cg69iBjcLp5+ac3ECEMPFSXfI986nyc=;
 b=IzN416KJ/S2OpWsMWennbWFcG5/Nz3Fp0tjb2v4AaBeSu/p/lYzw3sQJUHZjzKG69zDUf9
 caaGi72RLLFlDg+eD4O0mmBQ4GI0BpRV6ktCIbcbEzKVrJmVl3Qvhy1djBn4GBuVvgkL3V
 sUunttVKydUIgKkjrvWJoBV+jTNV8Ow=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-aI0baV_tOo-Qr9TXbZg_Lw-1; Tue, 04 Apr 2023 04:30:58 -0400
X-MC-Unique: aI0baV_tOo-Qr9TXbZg_Lw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r19-20020a50aad3000000b005002e950cd3so45517917edc.11
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 01:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680597057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Av76SZbRtYN2cg69iBjcLp5+ac3ECEMPFSXfI986nyc=;
 b=5l0VhUVfQ0G3SK1mC+fOAxWGPMk4VPmMZdch4hmecD58HRxf5ExECFX8xI3pPNVxzY
 Jwj8fpqZkq8QI9BfLg9r4IIgujdldHL8TJi+civspgAFGRrMdwycXJTU7t96kdqZSp6e
 eOpcgO8fjnhs1tpBVASaduwieu/FOqLfrEeJ/7w+9UEHyD07D4QiG2H+bVsM8/vKIkzB
 fw55EGbWm5JECn0CoGZDbHmdBND2AUBl7a4g1R3TMn3WPD3jN+8ZEwE8dARqVcrsKBbY
 3Z2R0v5YUvkc0geLBIGcxA3r2WEz7SSbSYHNlyO14BuJKzhdO6rXeCjMvbTffbPVyflV
 k+rA==
X-Gm-Message-State: AAQBX9dHU5t1vRnE57ejX3HDqjeuouHOLBw8gxOjKOgi8BxPN9F3QoRx
 dRgSmv8samhXrWWYuQMz/ACmcBhm2bHT0XIon3cXDd6YcfSYJGdZXuVs1oZzU6efY7m95S53ohR
 KoRASvjqeK4D/K7g=
X-Received: by 2002:a17:906:9f14:b0:939:c411:f784 with SMTP id
 fy20-20020a1709069f1400b00939c411f784mr1686215ejc.56.1680597057482; 
 Tue, 04 Apr 2023 01:30:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zjf+9FSaa5rQTr5vaqW8Sna0N87NVT4m1uHOF2WzA7RQKNTIhG/gOPfEC2i7b5a6Yq5nRSGg==
X-Received: by 2002:a17:906:9f14:b0:939:c411:f784 with SMTP id
 fy20-20020a1709069f1400b00939c411f784mr1686192ejc.56.1680597057188; 
 Tue, 04 Apr 2023 01:30:57 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 z9-20020a17090665c900b0093fa8c2e877sm5568055ejn.80.2023.04.04.01.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 01:30:56 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:30:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 anisinha@redhat.com, jusual@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230404103055.11f2de56@imammedo.users.ipa.redhat.com>
In-Reply-To: <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Tue, 4 Apr 2023 09:03:59 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > with native PCIe unplug behavior [1] which in its turn refers
> > > back to ACPI PCI hotplug ability to repeat unplug requests.  
> 
> > A bit concerned about how this interacts with failover,
> > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > Any better ideas of catching such misbehaving guests?  
> 
> The 5sec are coming from the pcie spec: The hot-unplug request can be
> canceled within 5 seconds by pressing the button again. The problem here
> is that both hotplug and hot-unplug use the same signaling path, so we
> really have to wait the 5 seconds to avoid the OS mis-interpreting the
> button press as 'cancel' event.

Any pointer to spec?
Does it apply to SHPC too?
(/me thinking about moving pending_delete check to PCIe only code)

> 
> ACPI hotplug hasn't this problem.  A unplug request is a unplug request,
> period.  And it can't be canceled.  So it should be possible to use a
> shorter period.  Possibly even no delay at all.
> 
> take care,
>   Gerd
> 


