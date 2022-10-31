Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C261365F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:31:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTwH-0000w9-8T; Mon, 31 Oct 2022 08:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opTwD-0000uW-4D
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opTw7-0003AZ-8I
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSKzTbExvPWTQJqQrhpcLlq1yBK857lrmj4f+B/jviA=;
 b=He5TYrgDvzaj6x3reeUPZi85cM9UeFx/u9UaOZopsMLwny7HkjoZU5lrr/tvXIDMG451tc
 CdBl9iWMNcg4FMGCd2jZtQx2YnVmebupzglxUMwDVqJ4Afp/MF7EIdBNeBvZqOxusr1kbN
 BLlkjN7PYSi4l6aOXVHxyGTwJ9jG6Kc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-uzABLuN9OoCwAzpzBbgrqQ-1; Mon, 31 Oct 2022 08:30:31 -0400
X-MC-Unique: uzABLuN9OoCwAzpzBbgrqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3029442wrg.21
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSKzTbExvPWTQJqQrhpcLlq1yBK857lrmj4f+B/jviA=;
 b=yt5gw5G30A8omYgOHmereOGXKqpC06GT3Pk879qTyRNzBeg1+PY3H2Q/DdboD5IXrK
 oRDCDLqpVncd0OfC77R1RLKDIZUkQIdoBqaGxVXWMvpprhEtsol7V7tX+a5yP+9jVfEP
 YzA5u6jT1Tytl4dNcuL0j5tOrNOfckLScvkvZcVePWoTFSpeLLZZAZKQ+gVRhN9r6h8R
 J5M8IYzyUxZUGaPICI5ShtR7Og3yf+a782oCrBBmaPuDGMQnZgH8Kjar2Hl6ph/zL1Kg
 tMdr831DSQd7naioTefwe//4hqJMRLUaKLgq+VyoTR/lLB/gmvIg4WCF1fl8SN+/T1TY
 SisQ==
X-Gm-Message-State: ACrzQf0S9MQKoTZo6/Ty46+RuXO7hE/lfu5dMtW4n7Rbn5YZgm9OOD7p
 0I35JVJIJj1XBO3UMpXATEmEnDPQ46YikuFFiPHCWvEvd0UgWRfxLM35Qy7GmgI67tk5Uihu1mM
 ziNXW8ftC/6CJ2no=
X-Received: by 2002:a5d:46c1:0:b0:236:6a2f:9e53 with SMTP id
 g1-20020a5d46c1000000b002366a2f9e53mr8137272wrs.256.1667219429795; 
 Mon, 31 Oct 2022 05:30:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zRVLo2+lzBpQjYM+E5hNJmpF/O5KHaepia6+mokHoS6zXr/omVASHCZXMikNqH7n6DmwXAg==
X-Received: by 2002:a5d:46c1:0:b0:236:6a2f:9e53 with SMTP id
 g1-20020a5d46c1000000b002366a2f9e53mr8137241wrs.256.1667219429498; 
 Mon, 31 Oct 2022 05:30:29 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c425600b003b4ac05a8a4sm7499332wmm.27.2022.10.31.05.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:30:29 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:30:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: Yicong Yang <yangyicong@huawei.com>, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, yangyicong@hisilicon.com,
 prime.zeng@huawei.com, hesham.almatary@huawei.com,
 ionela.voinescu@arm.com, darren@os.amperecomputing.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 2/5] tests: virt: update expected ACPI tables for virt
 test
Message-ID: <20221031083006-mutt-send-email-mst@kernel.org>
References: <20221031090523.34146-1-yangyicong@huawei.com>
 <20221031090523.34146-3-yangyicong@huawei.com>
 <83fe31fe-0755-7e22-9e10-7eebd938fbbd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83fe31fe-0755-7e22-9e10-7eebd938fbbd@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 07:21:31PM +0800, wangyanan (Y) wrote:
> Hi Yicong,
> 
> On 2022/10/31 17:05, Yicong Yang wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Update the ACPI tables according to the acpi aml_build change.
> We may also need the disassembled context of the table change

and it's not a "maybe need". We do need it.

> in the commit message, for review.
> 
> For your reference: see patch 6 in [1]:
> https://patchew.org/QEMU/20220107083232.16256-1-wangyanan55@huawei.com/
> 
> Thanks,
> Yanan
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >   tests/data/acpi/virt/PPTT                   | Bin 96 -> 76 bytes
> >   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
> >   2 files changed, 1 deletion(-)
> > 
> > diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> > index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
> > GIT binary patch
> > delta 32
> > fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM
> > 
> > delta 53
> > pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index cb143a55a6..dfb8523c8b 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1,2 +1 @@
> >   /* List of comma-separated changed AML files to ignore */
> > -"tests/data/acpi/virt/PPTT",


