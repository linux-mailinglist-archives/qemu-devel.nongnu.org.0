Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158F6EE232
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:50:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI73-0006kU-Ch; Tue, 25 Apr 2023 08:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prI6m-0006kD-Js
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prI6k-0001DA-9E
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682426961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSGLNfIrYKsImtBRJZVfN6F6VQKGUQq7wDz4I+K/hyM=;
 b=Ht0LDLim80/ud71K5Kxj0qo+rF81Fooh9x6SzxkuQZlE07ZhJ7MbbHEApfAERgyQcg+1Kw
 itmJ1/FsRoIf+Zv5r1U/TsxOeeMX0rW+GgcCPfymlMX1i4XbKBP1+WO1VLqLffsQjBfnvG
 7ZiaoxX+7qxOT1JyA1IMf1IVf/qbTM8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-k1lOWKdfOUGSXHze0hPOnA-1; Tue, 25 Apr 2023 08:49:19 -0400
X-MC-Unique: k1lOWKdfOUGSXHze0hPOnA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e32aso2075454f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 05:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682426958; x=1685018958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSGLNfIrYKsImtBRJZVfN6F6VQKGUQq7wDz4I+K/hyM=;
 b=eHAJO/agu/e0NZZmc7DsK99LJrCm8m/ChOK8gat7qFNOZayIq5EeMJz8BhP0VBmIoO
 oQqIg6ikPgkIrNOI95quRpqIBTSL3qX27O3dknLudo/ni/SnvB2dGsO1rjG0FSmfmy2G
 xv//bZpjIRI0HGcisGDKaKb5RfXRKpuoCzk6vCQgd/NwZoAF5Io+cXNAHPxZ5jd8Qwcl
 3iuK1RgZKdHvK1GOGr+bh2W/Yxb/5JqXIoi1sWdUfQG/SBmX7s/oYfqYgnpnylqLdmMv
 1o+B15/QJKGHlUl/KWvZQWvmVGwTaTZk9I++Meop33SMAqRAv2fh6V7plCdnqDz4R15D
 iHdg==
X-Gm-Message-State: AAQBX9faZt6GZSjTZ5Z03YkjsLZat79oOFrH21F4jXWJ3DgTw2AfNj5N
 wWyV04VBdc25RUzL8vIcK1qYI8RVBMsPlKWpxx7sZJygvvfIEzN5SjnACGZnNNVFGxbPxYzMpzo
 YE3E/53hZr4f9B0Q=
X-Received: by 2002:adf:fd10:0:b0:2f8:497f:6cfd with SMTP id
 e16-20020adffd10000000b002f8497f6cfdmr10566251wrr.7.1682426958507; 
 Tue, 25 Apr 2023 05:49:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZaGV9AvdfyQhRfg1gQjlpJi/ZnJW8kyxFPcPElHTZMJpnKpMrvUFpIXpooNevSREpKi6LJMA==
X-Received: by 2002:adf:fd10:0:b0:2f8:497f:6cfd with SMTP id
 e16-20020adffd10000000b002f8497f6cfdmr10566241wrr.7.1682426958189; 
 Tue, 25 Apr 2023 05:49:18 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d43cb000000b002ff77b033b1sm13079801wrr.33.2023.04.25.05.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 05:49:17 -0700 (PDT)
Date: Tue, 25 Apr 2023 08:49:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] pci: make ROM memory resizable
Message-ID: <20230425084609-mutt-send-email-mst@kernel.org>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230425031348-mutt-send-email-mst@kernel.org>
 <20230425033455-mutt-send-email-mst@kernel.org>
 <f2fcb8b1-877c-59dc-3eb2-33a456fa7372@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2fcb8b1-877c-59dc-3eb2-33a456fa7372@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Apr 25, 2023 at 11:34:09AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 25.04.23 10:43, Michael S. Tsirkin wrote:
> > On Tue, Apr 25, 2023 at 03:26:54AM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > On migration, on target we load local ROM file. But actual ROM content
> > > > migrates through migration channel. Original ROM content from local
> > > > file doesn't matter. But when size mismatch - we have an error like
> > > > 
> > > >   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> > > 
> > > Oh, this is this old bug then:
> > > https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1713490
> > > 
> > > People seem to be "fixing" this by downgrading ROMs.
> > > 
> > > Actually, I think the fix is different: we need to build
> > > versions of ROMs for old machine types that can fit
> > > in the old BAR size.
> > > 
> > > Gerd, Laszlo what's your take on all this?
> > Actually, ignore this - we do keep old ROMs around specifically to avoid
> > ROM size changes and have been for ever. E.g.:
> > 
> > commit c45e5b5b30ac1f5505725a7b36e68cedfce4f01f
> > Author: Gerd Hoffmann<kraxel@redhat.com>
> > Date:   Tue Feb 26 17:46:11 2013 +0100
> > 
> >      Switch to efi-enabled nic roms by default
> >      All PCI nics are switched to EFI-enabled roms by default.  They are
> >      composed from three images (legacy, efi ia32 & efi x86), so classic
> >      pxe booting will continue to work.
> >      Exception: eepro100 is not switched, it uses a single rom for all
> >      emulated eepro100 variants, then goes patch the rom header on the
> >      fly with the correct PCI IDs.  I doubt that will work as-is with
> >      the efi roms.
> >      Keep old roms for 1.4+older machine types via compat properties,
> >      needed because the efi-enabled roms are larger so the pci rom bar
> >      size would change.
> >      Signed-off-by: Gerd Hoffmann<kraxel@redhat.com>
> > 
> > 
> > So it's downstream messing up with things, overriding the
> > rom file then changing its size.
> > 
> > 
> > On fedora I find both pxe virtio and efi virtio so it gets it right.
> > 
> > 
> 
> Yes I understand that distribution may work-around the problem just having all needed roms on target and specifying correct romfile= argument.
> 
> But this is not ideal: having the file only to get its size, to not mismatch with incoming RAM block. There should be way to migrate ROMs automatically without extra files on target.

This not "only to get its size". It is so you can start old machine type
on the new box and get the same memory layout.

Fundamentally, the approach QEMU takes is that it does not matter
how you migrate: live, or by killing and restarting guest.
What we try to do as best we can, is make the box look the same.

-- 
MST


