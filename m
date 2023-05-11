Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECF6FF0A2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:45:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4iF-0003Vg-M1; Thu, 11 May 2023 07:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4iD-0003VU-38
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4iB-0006AK-2w
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683805433;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3Xh/4zJYjJPBZ1MOBhKOa7STK65fIBtLbHMrhCTF8JY=;
 b=hUs7/Px95/j3m7zCyvbe2+C65eJJeMD4Nm4J452FEuQbSdrBtKr3TnqFWPPHYrk5isQAQa
 eBXDjuFC1n/1iDNjz9tp22CzL+XmiWfNQZlvvZAOgYLNpUjJ7JlBIE5EBKq5DUM/tGkeT3
 sBQJ6sLFY8nOBTdjMYMh3bVH2/QLqQw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-HygMYZZdO0WZojensGt5pw-1; Thu, 11 May 2023 07:43:51 -0400
X-MC-Unique: HygMYZZdO0WZojensGt5pw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-306286b3573so5202467f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683805429; x=1686397429;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Xh/4zJYjJPBZ1MOBhKOa7STK65fIBtLbHMrhCTF8JY=;
 b=iS7/0MQR1c+tYfZ6+ZMgoG86VbIo2qo2cwbCcCZ/KbVzOMJgeR+4UyGSKE2l6yb71n
 d6+az+7nX0YJEZSI6YvYNgGZRzLYVmGAKS73Oojvnih2JvIwj9IZkhxWXLSJeW7HVIFZ
 JuzGBcLVvnyKVOAhEGCSXdLmCkRdDxW6geC5hiXQgdMMaie0NO+udQRZf5gdvNSH+FoI
 AjVK9NEr6xcg3huRuKgXD0xO/MGl9JyvPF6lNcLGJ/j4rinS/lPHp3YqKmGsLbrFWtj2
 nyTLQUhmCfKzRbX8kcKyYiIeRLGN5BY26CJC4kHHE1cM8xML+t2AC/9dAnKw+hYZoafQ
 FWwQ==
X-Gm-Message-State: AC+VfDxvnxGaxfoi35BRo4cwTzoeQnL2YAYDUzjm8XGsOn8f18sAnwxo
 wuXKi7MbiEVudUT6IWRSkP1RWWmQNC6EhpLnxPYimudxJL+4QpQFlprF60Do/fchAT6lJdso41C
 bVu5wrCv3IbQj4DE=
X-Received: by 2002:a5d:4485:0:b0:306:2d32:8ec with SMTP id
 j5-20020a5d4485000000b003062d3208ecmr15322276wrq.6.1683805429180; 
 Thu, 11 May 2023 04:43:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7c72jQvkrp5GE3yXMukgw5+oUyfCS6Y09xYXMX94YetKpOWn6CuqzxY/lN6VMMEbRDX+C7mg==
X-Received: by 2002:a5d:4485:0:b0:306:2d32:8ec with SMTP id
 j5-20020a5d4485000000b003062d3208ecmr15322256wrq.6.1683805428814; 
 Thu, 11 May 2023 04:43:48 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 o1-20020a5d58c1000000b00306c5900c10sm20039249wrf.9.2023.05.11.04.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 04:43:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>,  Leonardo Bras <leobras@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,  Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, Jiri
 Denemark <jdenemar@redhat.com>
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
In-Reply-To: <20230511064306-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Thu, 11 May 2023 06:48:13 -0400")
References: <20230503002701.854329-1-leobras@redhat.com>
 <7f308149-5495-d415-5e51-1fa15fc20f84@proxmox.com>
 <20230511064306-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 13:43:47 +0200
Message-ID: <8735435c0c.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> wrote:

[Added libvirt people to the party, see the end of the message ]

> On Thu, May 11, 2023 at 10:27:35AM +0200, Fiona Ebner wrote:
>> Am 03.05.23 um 02:27 schrieb Leonardo Bras:
>> > Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
>> > set for machine types < 8.0 will cause migration to fail if the target
>> > QEMU version is < 8.0.0 :
>> > 
>> > qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
>> > qemu-system-x86_64: Failed to load PCIDevice:config
>> > qemu-system-x86_64: Failed to load e1000e:parent_obj
>> > qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
>> > qemu-system-x86_64: load of migration failed: Invalid argument
>> > 
>> > The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
>> > with this cmdline:
>> > 
>> > ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
>> > 
>> > In order to fix this, property x-pcie-err-unc-mask was introduced to
>> > control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
>> > default, but is disabled if machine type <= 7.2.
>> > 
>> > Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
>> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>> 
>> Thank you for the patch!
>> 
>> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1576
>> 
>> AFAICT, this breaks (forward) migration from 8.0 to 8.0 + this patch
>> when using machine type <= 7.2. That is because after this patch, when
>> using machine type <= 7.2, the wmask for the register is not set and
>> when 8.0 sends a nonzero value for the register, the error condition in
>> get_pci_config_device() will trigger again.
>> 
>> Is it necessary to also handle that? Maybe by special casing the error
>> condition in get_pci_config_device() to be prepared to accept such a
>> stream from 8.0?
>> 
>> If that is considered not worth it, consider this:
>> 
>> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
>> 
>> Best Regards,
>> Fiona
>
> Yes any fix is like that. We keep encountering bugs like this
> but there does not seem to be will to create infrastructure
> for fixing it, which would involve describing
> version of qemu being migrated to.

You have it.

qemu-8.0 -M pc-7.2 -> is going to migrate to an older qemu, so be extra
careful.

We tried (and faield) that you could always migrate to the next version
without changing the machine type.

That was a myth that never really worked, but sometimes it did.

Now we say that we only support migration with same machine type,
period.  And then you know what you are going to do.

And what we are debating here is something different.

$ qemu-7.2 -M pc-7.2 -> qemu-8.0 -M pc-7.2

We broke it.  We don't have a time machine.  We can fix that for 8.0.

And we have a fix.  But what the fix does is:

$ qemu-7.2 -M pc-7.2 -> qemu-8.0.1 -M pc-7.2

works again.

But what Fiona was asking for is:

$ qemu-8.0 -M pc-7.2 -> qemu-8.0.1 -M pc-7.2

is broken right now.  But we can "fix" it.
But that implies that we change pci to allow both the correct value
(the old one, what qemu-7.2 sends), and the new value that qemu-8.0 -M
pc-7.2 sends.  Yes, it is a kludge.  That is why I said that it depended
on what PCI maintainers think.

diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 103667c368..374d593ead 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -112,10 +112,13 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver,
uint16_t offset,
 
     pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
                  PCI_ERR_UNC_SUPPORTED);
-    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
-                 PCI_ERR_UNC_MASK_DEFAULT);
-    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
-                 PCI_ERR_UNC_SUPPORTED);
+
+    if (dev->cap_present & QEMU_PCIE_ERR_UNC_MASK) {
+        pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
+                     PCI_ERR_UNC_MASK_DEFAULT);
+        pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
+                     PCI_ERR_UNC_SUPPORTED);
+    }
 
     pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
                  PCI_ERR_UNC_SEVERITY_DEFAULT);

We do this at init time.
But we need to a migration incoming time, that for old machine types we
can find that this has been set up.  So they need to accept both ways.
And this is in the middle of the pci configuration space.

I have no clue how to do this and be sure that it is a valid pci
configuration afterwards.

With my migration knowledge, I know that the problem is in this function
(ok, I know th error message gave you a big clue):

static int get_pci_config_device(QEMUFile *f, void *pv, size_t size,
                                 const VMStateField *field)
{
    PCIDevice *s = container_of(pv, PCIDevice, config);
    uint8_t *config;
    int i;

    assert(size == pci_config_size(s));
    config = g_malloc(size);

    qemu_get_buffer(f, config, size);
    for (i = 0; i < size; ++i) {
        if ((config[i] ^ s->config[i]) &
            s->cmask[i] & ~s->wmask[i] & ~s->w1cmask[i]) {

-----> here --->>
            error_report("%s: Bad config data: i=0x%x read: %x device: %x "
                         "cmask: %x wmask: %x w1cmask:%x", __func__,
                         i, config[i], s->config[i],
                         s->cmask[i], s->wmask[i], s->w1cmask[i]);
            g_free(config);
            return -EINVAL;
        }
    }
    memcpy(s->config, config, size);

    pci_update_mappings(s);
    if (IS_PCI_BRIDGE(s)) {
        pci_bridge_update_mappings(PCI_BRIDGE(s));
    }

    memory_region_set_enabled(&s->bus_master_enable_region,
                              pci_get_word(s->config + PCI_COMMAND)
                              & PCI_COMMAND_MASTER);

    g_free(config);
    return 0;
}

But what is the kludge that I have to do to put in "here" a condition
that says:

if the problem is at dev->config + offset + PCI_ERR_UNCOR_MASK that is
not enabled in local (target of migration) device but it was enabled in remote
(source of migration) (the same for wmask)

+    if (dev->cap_present & QEMU_PCIE_ERR_UNC_MASK) {
+        pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
+                     PCI_ERR_UNC_MASK_DEFAULT);
+        pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
+                     PCI_ERR_UNC_SUPPORTED);
+    }

just enable it locally and don't give an error.  And we have to maintain
the kludge forever because every machine with a machine type older than
qemu-8.0 that has started in qemu-8.0 (i.e. pre qemu-8.0.1 that has the
fix) is going to have that enable when the machine definition says that
it should be disabled.

That would fix the:

qemu-8.0 -M pc-7.2 -> qemu-8.0.1 -M pc-7.2

It is worth it?  Dunno.  That is my question.

And knowing from what qemu it has migrated from would not help.  We
would need to add a new tweak and means:

This is a pc-7.2 machine that has been isntantiated in a qemu-8.0 and
has the pciaerr bug.  But wait, we have _that_.

And it is called

+    { TYPE_PCI_DEVICE, "x-pcie-err-unc-mask", "off" },

from the patch.

We can teach libvirt about this glitch, and if he is migrating a pc-7.2
machine in qemu-8.0 machine, And they want to migrate to a new qemu
(call it qemu-8.1), it needs to be started:

qemu-8.1 -M pc-7.2 <whatever pci devices need to do>,x-pci-err-unc-mask="true"

Until the user reboots it and then that property can be reset to default
value.

So at the end, pci maintainers don't need to do anything (so they don't
have to kill me).

And now it is the libvirt people who is going to try to kill me.

Sniff.

It is worth it?  I don't know.

But as seen, migration has the infrastructure to do it. But it is a very
hard problem, and fixing it in general is very complicated.  We are very
bad at testing that we have broken migration for

qemu-X.Y -M pc-X.Y -> qemu-X.(Y+1) -M pc-X.Y

Sorry for the long mail, Juan.


