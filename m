Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193574346A8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:18:50 +0200 (CEST)
Received: from localhost ([::1]:48380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6oC-0000eG-P1
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md6ln-0007c6-PE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md6li-0008Iu-Gf
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634717772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S99Jt5uGT6AKXgIC0EW+Qhw8UqaUpXChPjweszXibs=;
 b=X7L3xD7a85wQWgF6evVTUrN35rvf+gU5V3AYYmv4faeDrAK5L4vS3MBtmOiVR1YKD2YXYx
 5fB4D50AdxHUomxxjLFI7MWx9BzlUy/sz1r2sHmr5tlMGPpnvRHX8EM78jG3RXDfhb1fKp
 WuwGfNQGZ4uKrFL7Z9olpLuwt2P1U/8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-40wk1PVxOM6Jio-O2uTryw-1; Wed, 20 Oct 2021 04:16:10 -0400
X-MC-Unique: 40wk1PVxOM6Jio-O2uTryw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c5-20020a05600c0ac500b0030dba7cafc9so3772317wmr.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 01:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0S99Jt5uGT6AKXgIC0EW+Qhw8UqaUpXChPjweszXibs=;
 b=Y1uiH4XljJTsbsJHnMnFj726YEzuJ/kJXIJgpHcPCSkMYw/BrD5chwu6JxwZSMWk0s
 Qmf6psv4e3rUetlqrNmbWkIA7tc6+TWpJ/CjhsuX6QQAgnWphPzu10SA1h/FtORu7uGt
 cur5sFm7fGYTCD6rqXGJiqixQShrWJ3l2g0LFC4nIcwHsQM7C6xgIgwDeKCOkqldtDNY
 l2RPj1HNa266qScpp0Zs9Q3cvRNGzSk6S2FpRsSzuae3EOVe6tmsTj6na7tTpHWB44C7
 TzKVmOj9e/WFGxB0feMuqxqRBl2Xi2z04mAs7457fTJRpOYatFYH3f0BOikTS7eVkuXL
 HYPQ==
X-Gm-Message-State: AOAM53158NXPHlulbgBtRhVhJ9VQX8KeDo0PlXnq4Z3hDGtGIPPGc5S1
 RWhoYXMNyocwiARVl9nIZZMzRzwgaVCqeBeOV37n2mmy6Y05UNbA38eiaKa+Mq8XwVNju9tEn0J
 zcR2EPRU1C7nICu4=
X-Received: by 2002:adf:a292:: with SMTP id s18mr50150298wra.42.1634717769642; 
 Wed, 20 Oct 2021 01:16:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMJtPq34FzwVck8wxVagTZZxvlPr7gSb9TS2Emz8wJC8c3dwbCgyuB1bEVegrrutqkygQMgw==
X-Received: by 2002:adf:a292:: with SMTP id s18mr50150261wra.42.1634717769398; 
 Wed, 20 Oct 2021 01:16:09 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id i17sm1473452wru.18.2021.10.20.01.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 01:16:08 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:16:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211020101607.5181e69d@redhat.com>
In-Reply-To: <20211019074422-mutt-send-email-mst@kernel.org>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-5-imammedo@redhat.com>
 <20211018173052-mutt-send-email-mst@kernel.org>
 <20211019114825.1464da19@redhat.com>
 <20211019061656-mutt-send-email-mst@kernel.org>
 <20211019133624.5cd5ae3d@redhat.com>
 <20211019074422-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Oct 2021 07:44:38 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Oct 19, 2021 at 01:36:24PM +0200, Igor Mammedov wrote:
> > On Tue, 19 Oct 2021 06:23:40 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Tue, Oct 19, 2021 at 11:48:25AM +0200, Igor Mammedov wrote:  
> > > > On Mon, 18 Oct 2021 17:31:33 -0400
> > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > >     
> > > > > On Thu, Sep 02, 2021 at 07:35:40AM -0400, Igor Mammedov wrote:    
> > > > > > Set -smp 1,maxcpus=288 to test for ACPI code that
> > > > > > deal with CPUs with large APIC ID (>255).
> > > > > > 
> > > > > > PS:
> > > > > > Test requires KVM and in-kernel irqchip support,
> > > > > > so skip test if KVM is not available.
> > > > > > 
> > > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > > > ---
> > > > > > v3:
> > > > > >   - add dedicated test instead of abusing 'numamem' one
> > > > > >   - add 'kvm' prefix to the test name
> > > > > >       ("Michael S. Tsirkin" <mst@redhat.com>)
> > > > > > v2:
> > > > > >   - switch to qtest_has_accel() API
> > > > > > 
> > > > > > CC: thuth@redhat.com
> > > > > > CC: lvivier@redhat.com
> > > > > > ---
> > > > > >  tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
> > > > > >  1 file changed, 17 insertions(+)
> > > > > > 
> > > > > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > > > > index 51d3a4e239..1f6779da87 100644
> > > > > > --- a/tests/qtest/bios-tables-test.c
> > > > > > +++ b/tests/qtest/bios-tables-test.c
> > > > > > @@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
> > > > > >      free_test_data(&data);
> > > > > >  }
> > > > > >  
> > > > > > +static void test_acpi_q35_kvm_xapic(void)
> > > > > > +{
> > > > > > +    test_data data;
> > > > > > +
> > > > > > +    memset(&data, 0, sizeof(data));
> > > > > > +    data.machine = MACHINE_Q35;
> > > > > > +    data.variant = ".xapic";
> > > > > > +    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> > > > > > +                  " -numa node -numa node,memdev=ram0"
> > > > > > +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
> > > > > > +    free_test_data(&data);
> > > > > > +}
> > > > > > +
> > > > > >  static void test_acpi_q35_tcg_nosmm(void)
> > > > > >  {
> > > > > >      test_data data;      
> > > > > 
> > > > > 
> > > > > This causes an annoying message each time I run it:
> > > > > 
> > > > > qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (288) exceeds the recommended cpus supported by KVM (240)
> > > > > 
> > > > > what gives?    
> > > > 
> > > > it depends on kernel, see kvm_recommended_vcpus().
> > > > 
> > > > We probably should bump it on upstream kernel side
> > > > (it's much more than that in RHEL8).
> > > > 
> > > > Is there anything that prevents bumping upstream kernel limits?    
> > > 
> > > what should we do with the annoying warning though?  
> > 
> > I'd leave it alone.
> > What do you suggest?
> >    
> 
> reduce the value so a typical system does not trigger it?

it won't work, test needs as minimum 255 vcpus to trigger X2APIC logic
and 288 value additionally tests max limits

> 
> > > > > > @@ -1506,6 +1519,7 @@ static void test_acpi_oem_fields_virt(void)
> > > > > >  int main(int argc, char *argv[])
> > > > > >  {
> > > > > >      const char *arch = qtest_get_arch();
> > > > > > +    const bool has_kvm = qtest_has_accel("kvm");
> > > > > >      int ret;
> > > > > >  
> > > > > >      g_test_init(&argc, &argv, NULL);
> > > > > > @@ -1561,6 +1575,9 @@ int main(int argc, char *argv[])
> > > > > >          if (strcmp(arch, "x86_64") == 0) {
> > > > > >              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> > > > > >          }
> > > > > > +        if (has_kvm) {
> > > > > > +            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> > > > > > +        }
> > > > > >      } else if (strcmp(arch, "aarch64") == 0) {
> > > > > >          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> > > > > >          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> > > > > > -- 
> > > > > > 2.27.0      
> > > > >     
> > >   
> 


