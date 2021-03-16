Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A736833D625
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:50:52 +0100 (CET)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMB23-0000sS-NA
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMAzU-000725-9M; Tue, 16 Mar 2021 10:48:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMAzQ-0007yQ-4X; Tue, 16 Mar 2021 10:48:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 92DCC746353;
 Tue, 16 Mar 2021 15:48:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 698957462BD; Tue, 16 Mar 2021 15:48:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 681087456B4;
 Tue, 16 Mar 2021 15:48:04 +0100 (CET)
Date: Tue, 16 Mar 2021 15:48:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
In-Reply-To: <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
Message-ID: <c1579f1-1ef-9d53-aea8-6d975f70634e@eik.bme.hu>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
 <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
 <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
 <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another arrempt to explain patch 1. This is the via-superio class that's a 
subclass of ISA superio:

https://github.com/patchew-project/qemu/blob/ca5d88d2fee0016f939e91ae8b32c18e682064fa/hw/isa/vt82c686.c#L255

#define TYPE_VIA_SUPERIO "via-superio"
OBJECT_DECLARE_SIMPLE_TYPE(ViaSuperIOState, VIA_SUPERIO)

struct ViaSuperIOState {
     ISASuperIODevice superio;
     uint8_t regs[0x100];
     const MemoryRegionOps *io_ops;
     MemoryRegion io;
     MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
};

[...]

static void via_superio_realize(DeviceState *d, Error **errp)
{
     ViaSuperIOState *s = VIA_SUPERIO(d);
     ISASuperIOClass *ic = ISA_SUPERIO_GET_CLASS(s);
     Error *local_err = NULL;
     int i;

     assert(s->io_ops);
     ic->parent_realize(d, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
     /* Grab io regions of serial devices so we can control them */
     for (i = 0; i < ic->serial.count; i++) {
         ISADevice *sd = s->superio.serial[i];
         MemoryRegion *io = isa_address_space_io(sd);
         MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
         if (!mr) {
             error_setg(errp, "Could not get io region for serial %d", i);
             return;
         }
         s->serial_io[i] = mr;
     }

     memory_region_init_io(&s->io, OBJECT(d), s->io_ops, s, "via-superio", 2);
     memory_region_set_enabled(&s->io, false);
     /* The floppy also uses 0x3f0 and 0x3f1 but this seems to work anyway */
     memory_region_add_subregion(isa_address_space_io(ISA_DEVICE(s)), 0x3f0,
                                 &s->io);
}

In realize we grab pointers to the MemoryRegions of the isa-serial devices 
created by the ISA superio class. This is ISA superio:

https://github.com/patchew-project/qemu/blob/ca5d88d2fee0016f939e91ae8b32c18e682064fa/include/hw/isa/superio.h#L23

#define SUPERIO_MAX_SERIAL_PORTS 4

struct ISASuperIODevice {
     /*< private >*/
     ISADevice parent_obj;
     /*< public >*/

     ISADevice *parallel[MAX_PARALLEL_PORTS];
     ISADevice *serial[SUPERIO_MAX_SERIAL_PORTS];
     ISADevice *floppy;
     ISADevice *kbc;
     ISADevice *ide;
};

The serial members we access are even public so this should be OK (other 
models to that too) but we need to get their MemoryRegion as we need to 
configure that based on VIA superio registers. ISADevice is defined in:

https://github.com/patchew-project/qemu/blob/patchew/cover.1615345138.git.balaton%40eik.bme.hu/include/hw/isa/isa.h

but it does not store a reference to its memory regions:

struct ISADevice {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/

     int8_t isairq[2];      /* -1 = unassigned */
     int nirqs;
     int ioport_id;
};

only an ioport_id which is the address of its first io region so we have 
to get the actual MemoryRegion based on that. This works for isa-serial 
that has a single mem region but would not for parallel or FDC that have 
multiple regions. Those are created with isa_register_portio_list() I 
think but we don't care about parallel and FDC only about serial.

This may be possible to clean up but that would need changes to ISA 
emulation that I don't want to change so the patch tries to achieve what's 
needed without changing how ISA devices are emulated currently. I think 
the solution proposed in patch 1 is relatively clean and by not changing 
anything than vt82c686 it avoids any possible breakage to other machines 
using ISA devices so unless there's a reason not to accept it this should 
solve the problem and allow pegasos2 firmware to boot.

Regards,
BALATON Zoltan

