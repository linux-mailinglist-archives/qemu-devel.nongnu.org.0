Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733675F7A72
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:23:35 +0200 (CEST)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpCI-0003Am-IU
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognoL-0004qJ-QA
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognoK-0008AU-1y
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665150883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XCOAU4slaZabQH9RPKVNA0MG/51KF1Uo13foCjJOsho=;
 b=PUQ+laIzAaM+cyyl/bKz4k5/dCxVvVlATrX4JNWZwzD/pjV34xmdqzUrRZIYqUA4ixmXLo
 9ojEGnE11MDZ9UMiwC7Q/Rjvz950Hu7Ko+1ydDzmwV4Gyc67KYp8sVbIRGxDtW3PeumzUk
 lqyAU8o9lb0iz7A2BIHfK2GC60o+BMY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-Xx2TKdAFOwqo1nLe8eYzlg-1; Fri, 07 Oct 2022 09:54:42 -0400
X-MC-Unique: Xx2TKdAFOwqo1nLe8eYzlg-1
Received: by mail-wm1-f72.google.com with SMTP id
 d5-20020a05600c34c500b003b4fb42ccdeso4387013wmq.8
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCOAU4slaZabQH9RPKVNA0MG/51KF1Uo13foCjJOsho=;
 b=Z4UMMINegeDCh+ehSTCkm+uAG3HkT3aB/SkGVY1/DHd1HhUgkuW6vI7OvupkxlR5nu
 HJtcPxiQjwS9ZJ7Yf5gLh5DcB9JYUqGi0iPbPPpuaYzR+tfaMAJMAGqJXQQ/LJHPQtVI
 7e2l7cDXd+dazU23oqwqjgsRb+S1xLdg+Y2nu8KBm+NEEh+nOEvGSWmTXUUu8I8ZH3iA
 WjZtxur5XzCUk2qOPHXK/ZRjEUXmQLvIn0wWObG2HIWj/UPHcmqgYnti+yvk281ILQ1K
 mcxZaHT8xN6sb4XX5sPBGzCPvoLBoc7FWcFBQbmOSVYZdMH2bp6lDBoGaisXAskKQSQx
 hrSQ==
X-Gm-Message-State: ACrzQf03uWUzStPeKqsFHnWkkGLPH/DHY2ODoJkqJ9e36wPOUKhr1s1a
 bjiOlJZhMDS2mL7/bq4NVQdN1TWyDkqzVBZXv5I/lRnJBcHz/7GGnBXX0F84RcRVEnM3aqAOEmx
 rRCXBjtfPJmtfdAA=
X-Received: by 2002:a05:6000:180b:b0:22e:4998:fd55 with SMTP id
 m11-20020a056000180b00b0022e4998fd55mr3455174wrh.399.1665150879789; 
 Fri, 07 Oct 2022 06:54:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5HeKkiBhtd/5GqPOGJRUXZ6ouWf73INACIklOsJ07jpzHxNz/I9uW5meWoIgJVJGxZmJv90g==
X-Received: by 2002:a05:6000:180b:b0:22e:4998:fd55 with SMTP id
 m11-20020a056000180b00b0022e4998fd55mr3455156wrh.399.1665150879523; 
 Fri, 07 Oct 2022 06:54:39 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 q5-20020adff945000000b0022ae401e9e0sm2032796wrr.78.2022.10.07.06.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:54:39 -0700 (PDT)
Date: Fri, 7 Oct 2022 09:54:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@mailbox.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 2/2] hw/ide/piix: Ignore writes of hardwired PCI
 command register bits
Message-ID: <20221007095229-mutt-send-email-mst@kernel.org>
References: <20220922060325-mutt-send-email-mst@kernel.org>
 <20220925093759.1598617-1-lkujaw@mailbox.org>
 <20220925093759.1598617-3-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220925093759.1598617-3-lkujaw@mailbox.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 25, 2022 at 09:37:59AM +0000, Lev Kujawski wrote:
> One method to enable PCI bus mastering for IDE controllers, often used
> by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> the command register would be left in an unspecified state without
> this patch.
> 
> * hw/ide/pci.c
>   Call post_load if provided by derived IDE controller.
> * hw/ide/piix.c
>   a) Add references to the PIIX data sheets.
>   b) Mask the MSE bit using the QEMU PCI device wmask field.
>   c) Add a post_load function to mask bits from saved machine states.
>   d) Specify post_load for both the PIIX3/4 IDE controllers.
> * include/hw/ide/pci.h
>   Switch from SIMPLE_TYPE to TYPE, explicitly create a PCIIDEClass
>   that includes the post_load function pointer.
> * tests/qtest/ide-test.c
>   Use the command_disabled field of the QPCIDevice testing model to
>   indicate that PCI_COMMAND_MEMORY is hardwired in the PIIX3/4 IDE
>   controller.
> 
> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>


I guess this cna work but what I had in mind is much
simpler. Add an internal property (name starting with "x-")
enabling the buggy behaviour and set it in hw compat array.
If set - do not touch the wmask register.

post load hooks are harder to reason about.

Sorry about not being clear originally.

> ---
> (v2) Use QEMU's built-in PCI bit-masking support rather than attempting
>      to manually filter writes.  Thanks to Philippe Mathieu-Daude and
>      Michael S. Tsirkin for review and the pointer.
> (v3) Handle migration of older machine states, which may have set bits
>      masked by this patch, via a new post_load method of PCIIDEClass.
>      Thanks to Michael S. Tsirkin for catching this via review.
> 
>  hw/ide/pci.c           |  5 +++++
>  hw/ide/piix.c          | 39 +++++++++++++++++++++++++++++++++++++++
>  include/hw/ide/pci.h   |  7 ++++++-
>  tests/qtest/ide-test.c |  1 +
>  4 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 84ba733548..e42c7b9415 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -447,6 +447,7 @@ static const VMStateDescription vmstate_bmdma = {
>  
>  static int ide_pci_post_load(void *opaque, int version_id)
>  {
> +    PCIIDEClass *dc = PCI_IDE_GET_CLASS(opaque);
>      PCIIDEState *d = opaque;
>      int i;
>  
> @@ -457,6 +458,10 @@ static int ide_pci_post_load(void *opaque, int version_id)
>          ide_bmdma_post_load(&d->bmdma[i], -1);
>      }
>  
> +    if (dc->post_load) {
> +        dc->post_load(d, version_id);
> +    }
> +
>      return 0;
>  }
>  
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 9a9b28078e..fd55ecbd36 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -21,6 +21,12 @@
>   * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>   * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>   * THE SOFTWARE.
> + *
> + * References:
> + *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
> + *      290550-002, Intel Corporation, April 1997.
> + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> + *      Intel Corporation, April 1997.
>   */
>  
>  #include "qemu/osdep.h"
> @@ -159,6 +165,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>      uint8_t *pci_conf = dev->config;
>      int rc;
>  
> +    /*
> +     * Mask all IDE PCI command register bits except for Bus Master
> +     * Function Enable (bit 2) and I/O Space Enable (bit 0), as the
> +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> +     *
> +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> +     * Enable (MSE, bit 1) is hardwired to 1, but this is contradicted
> +     * by actual PIIX3 hardware, the datasheet itself (viz., Default
> +     * Value: 0000h), and the PIIX4 datasheet [2].
> +     */
> +    pci_set_word(dev->wmask + PCI_COMMAND,
> +                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
> +
>      pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>  
>      bmdma_setup_bar(d);
> @@ -184,11 +203,28 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
>      }
>  }
>  
> +static int pci_piix_ide_post_load(PCIIDEState *s, int version_id)
> +{
> +    PCIDevice *dev = PCI_DEVICE(s);
> +    uint8_t *pci_conf = dev->config;
> +
> +    /*
> +     * To preserve backward compatibility, handle saved machine states
> +     * with reserved bits set (see comment in pci_piix_ide_realize()).
> +     */
> +    pci_set_word(pci_conf + PCI_COMMAND,
> +                 pci_get_word(pci_conf + PCI_COMMAND) &
> +                 (PCI_COMMAND_MASTER | PCI_COMMAND_IO));
> +
> +    return 0;
> +}
> +
>  /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>  static void piix3_ide_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    PCIIDEClass *ic = PCI_IDE_CLASS(klass);
>  
>      dc->reset = piix_ide_reset;
>      k->realize = pci_piix_ide_realize;
> @@ -196,6 +232,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>      k->vendor_id = PCI_VENDOR_ID_INTEL;
>      k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
>      k->class_id = PCI_CLASS_STORAGE_IDE;
> +    ic->post_load = pci_piix_ide_post_load;
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>      dc->hotpluggable = false;
>  }
> @@ -211,6 +248,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    PCIIDEClass *ic = PCI_IDE_CLASS(klass);
>  
>      dc->reset = piix_ide_reset;
>      k->realize = pci_piix_ide_realize;
> @@ -218,6 +256,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>      k->vendor_id = PCI_VENDOR_ID_INTEL;
>      k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
>      k->class_id = PCI_CLASS_STORAGE_IDE;
> +    ic->post_load = pci_piix_ide_post_load;
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>      dc->hotpluggable = false;
>  }
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..727c748a0f 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -40,7 +40,12 @@ typedef struct BMDMAState {
>  } BMDMAState;
>  
>  #define TYPE_PCI_IDE "pci-ide"
> -OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
> +OBJECT_DECLARE_TYPE(PCIIDEState, PCIIDEClass, PCI_IDE)
> +
> +struct PCIIDEClass {
> +    IDEDeviceClass parent_class;
> +    int (*post_load)(PCIIDEState *s, int version_id);
> +};
>  
>  struct PCIIDEState {
>      /*< private >*/
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 5bcb75a7e5..85a3967063 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -173,6 +173,7 @@ static QPCIDevice *get_pci_device(QTestState *qts, QPCIBar *bmdma_bar,
>  
>      *ide_bar = qpci_legacy_iomap(dev, IDE_BASE);
>  
> +    dev->command_disabled = PCI_COMMAND_MEMORY;
>      qpci_device_enable(dev);
>  
>      return dev;
> -- 
> 2.34.1


