Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605806EE1C5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:19:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHd1-0007RD-ES; Tue, 25 Apr 2023 08:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1prHct-0007Mm-PO
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:18:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1prHcs-0003fA-2P
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682425108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ReSaiKqgJHXPzX839kpckZ1rimsuo+pb4ewJqdrzgg=;
 b=MxRz+0SkMZVtWIs7Ov7/ok/BgHwuWJQDTWFETAFyDJ4Aw2HRZYrbMhI6bjDJfb/WrnOpiv
 aeYWRXo5VsH2jNwkM+mO/ILjtdMsxP3s/YxePGdZJvj1xBaoqfhYpNMZQ0RAYsPd+nw2XB
 3rdFudM4bBhq94Nwy6/TBQCpdVcCSOU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-MuERG3reO_6drtKFMGA2UA-1; Tue, 25 Apr 2023 08:18:26 -0400
X-MC-Unique: MuERG3reO_6drtKFMGA2UA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f29909e11so502911266b.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 05:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682425105; x=1685017105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ReSaiKqgJHXPzX839kpckZ1rimsuo+pb4ewJqdrzgg=;
 b=XyWiIu0iVBXgRSjHx/8rTq74oMsuUg78CYPi9KhHQol/1p/xtjfhox0Tj8J7BbNClH
 Dv0YlBxf7cq7fYm1qLM7KWrO2GMmMWDeFrkm5JJe8xAXv7krfkkuIAcbQpBgOCmGHzih
 nSGznL4k+BtY9LRus84wJhT6DuT/97fUPvR+S9WJn1raE+tE4nb3KBYenhCrrArkoMGB
 1bVdXejA1qCDxVfo6Gxo+MfmssjEG1dPVJQyE2kniiqR4PqKjQIJotEhy9slV0PWv40z
 YudskPnyKm+Ap+8ScJuz6zcfx3u/plS+26VoQhdinTJDRCzyXhbsNiGrdL27pR8zq7fE
 LGRg==
X-Gm-Message-State: AAQBX9ckz8S74Y9xdwisXYL1S78xSe7RFtCALrf5/6eUssd3ufxoioeg
 9sDpve1/8Ld6TA2QMORQgvP5pp8zrTIWQL+abv82GPiBxrV5xP570USXi6qUhSHObHbK8+lj+Bo
 VS4PFtn5MbhHl+HQ=
X-Received: by 2002:a17:906:10c9:b0:94e:d688:c36d with SMTP id
 v9-20020a17090610c900b0094ed688c36dmr14337892ejv.38.1682425105513; 
 Tue, 25 Apr 2023 05:18:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350bhPBGX39ali8roAYTBepFkmK/UIwBaUnGU6qrKauW6/kChcZRotG5YYNAxkYu7LRc2bxQY/w==
X-Received: by 2002:a17:906:10c9:b0:94e:d688:c36d with SMTP id
 v9-20020a17090610c900b0094ed688c36dmr14337866ejv.38.1682425105133; 
 Tue, 25 Apr 2023 05:18:25 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170906174d00b0094e477eb441sm6620556eje.110.2023.04.25.05.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 05:18:24 -0700 (PDT)
Date: Tue, 25 Apr 2023 14:18:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
Subject: Re: [PATCH] pci: make ROM memory resizable
Message-ID: <20230425141823.6c7445c9@imammedo.users.ipa.redhat.com>
In-Reply-To: <f1503dee-e297-ae5d-1826-6858236ee029@yandex-team.ru>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <f1503dee-e297-ae5d-1826-6858236ee029@yandex-team.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 25 Apr 2023 13:55:55 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> On 24.04.23 23:36, Vladimir Sementsov-Ogievskiy wrote:
> > On migration, on target we load local ROM file. But actual ROM content
> > migrates through migration channel. Original ROM content from local
> > file doesn't matter. But when size mismatch - we have an error like
> > 
> >   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> > 
> > Let's just allow resizing of ROM memory. This way migration is not
> > relate on local ROM file on target node which is loaded by default but
> > is not actually needed.
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>  
> 
> Seems, automatically reconfigure the memory on incoming migration is not so easy.. ROM size really influence config of the device, and after some digging in the code I still cannot say where it happens.
You can't change PCI device bars on migration as it practically
will mess up memory mapping (if you manage to do so), but
guest will still think that it has the old one. So you'd need
a guest side that will notice migration and deal with remapping.

(one way to work around it could be unplug nic, and once it's gone
migrate/replug on target side)

> 
> So, I'm going to suggest another way, new series "[PATCH 0/3] ROM migration" will substitute this patch.
> 


