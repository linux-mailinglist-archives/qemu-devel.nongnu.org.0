Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19576D6108
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:41:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfy8-0005qS-1o; Tue, 04 Apr 2023 08:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjfy5-0005q4-DB
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjfy3-0006JB-N3
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680612054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUk2yd6FkSSFLe53Db5HdrW/cCe8Yo+Q0NJxgpyUHng=;
 b=NJbtSgQO9XD/KzXyUGE4gTbqrFY4pwrgY5K3APUp54FWyb6QirBeuWaXzSx7QA6JKhbTi4
 b6Dbse5wE28vcvELm/193igUC2ePo8u+IVe9MyhrEkQa9OpBs/CKC4sq1znS93rnI0p+70
 agiXiTuAfsNWF/19vjnCS6gX4mezi8w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-Owrtn102Pcan8lq-WAXMhA-1; Tue, 04 Apr 2023 08:40:53 -0400
X-MC-Unique: Owrtn102Pcan8lq-WAXMhA-1
Received: by mail-ed1-f72.google.com with SMTP id
 b6-20020a509f06000000b005029d95390aso9382080edf.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 05:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680612049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUk2yd6FkSSFLe53Db5HdrW/cCe8Yo+Q0NJxgpyUHng=;
 b=mj7DyceryHHjwvF4N7HfoW950DrXh65g6XNfaAC1On1G1hhuY+OXZTGNrqJ45LHKPE
 p7/quM5hjXMikVq+k1K7CuO3vbIIvsXF+ldGHwT93m7VJ2kwkYi/o6gl6bS5VXdQdq5G
 MeHFdJXDVLL/nmKQ6OmWHt6dhe9sarXCJLc/svAZApW1kBm3ra4CSZGmIAaq0GR2jkbb
 4+urqYjr7fs5i/nXjnQGpNrLh+pBpvvi5C5wJrLm/n9ffjo/ORSdy1MZZWNGygUCthfX
 lEo/717ba77v8JtNEqm2OwbHVPtE+QPWrJOeTPQ2K8xJYhMbGLR6Kiazy76uAiL5Soqm
 ev3A==
X-Gm-Message-State: AAQBX9fT1STipw5w8Cg+4vx3FvsAu+HzTDEqj/AT8NqMNuNO36kmRBzU
 qLT2/D3jMLtMhkJW/kHPKkEVv4YMmUDe7tjUNZiBgyhqWlFV2ULkEhHEqC5rTiv58tUWouds/Sw
 ZCWuA1DoA47AZnEk=
X-Received: by 2002:a17:906:3c16:b0:925:5705:b5b8 with SMTP id
 h22-20020a1709063c1600b009255705b5b8mr1846957ejg.58.1680612049567; 
 Tue, 04 Apr 2023 05:40:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350amujWXz+5Dm/XexgOz+M+hi7pjPLA+UQilAg3OoZlIMqtLCH3pBuJDDGzE2rWMJmsgFkzAkw==
X-Received: by 2002:a17:906:3c16:b0:925:5705:b5b8 with SMTP id
 h22-20020a1709063c1600b009255705b5b8mr1846941ejg.58.1680612049306; 
 Tue, 04 Apr 2023 05:40:49 -0700 (PDT)
Received: from redhat.com ([2.52.129.179]) by smtp.gmail.com with ESMTPSA id
 b17-20020a170906491100b008e57b5e0ce9sm5866425ejq.108.2023.04.04.05.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:40:48 -0700 (PDT)
Date: Tue, 4 Apr 2023 08:40:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, jusual@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230404084019-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
 <1de406aa-338f-277a-96a2-dcf6afbc8aec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1de406aa-338f-277a-96a2-dcf6afbc8aec@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Apr 04, 2023 at 01:06:38PM +0530, Ani Sinha wrote:
> 
> 
> On Tue, 4 Apr 2023, Gerd Hoffmann wrote:
> 
> >   Hi,
> >
> > > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > > with native PCIe unplug behavior [1] which in its turn refers
> > > > back to ACPI PCI hotplug ability to repeat unplug requests.
> >
> > > A bit concerned about how this interacts with failover,
> > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > > Any better ideas of catching such misbehaving guests?
> >
> > The 5sec are coming from the pcie spec: The hot-unplug request can be
> > canceled within 5 seconds by pressing the button again. The problem here
> > is that both hotplug and hot-unplug use the same signaling path, so we
> > really have to wait the 5 seconds to avoid the OS mis-interpreting the
> > button press as 'cancel' event.
> >
> > ACPI hotplug hasn't this problem.  A unplug request is a unplug request,
> 
> For ACPI case, I think all we want is to make sure that the first unplug
> event to not stick forever. A non-zero but small delay would make sure
> that the first
> unplug event would get cleared after that interval and subsequent unplug
> events will get registered without that error.
> 
> > period.  And it can't be canceled.  So it should be possible to use a
> > shorter period.  Possibly even no delay at all.
> >
> > take care,
> >   Gerd
> >
> >


But why do we want a delay at all? for acpi you can resend
the interrupt as many times as you like.

-- 
MST


