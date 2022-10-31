Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F5613570
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:13:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSud-0004j1-UR; Mon, 31 Oct 2022 07:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opSub-0004iY-7s
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opSuZ-0003UD-F0
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667215498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aHBybFsZVW5Z65rViBTWS/Z3w7OKXNCERtp+eAAsSms=;
 b=NPuXdnz70MdNj+0snYavsEKOJGSbA5oMGfVeRVpdL6Ewbz95V4CcX+LH9VVGuMBcohgTuw
 41KSpNY1h/Lag7K/nYoFrmrgx3r4BImSX2gg+m6XDslZZG1hOr757gcc5HJWs8gxnc2nE8
 +53PB2Q92hn8LnTUjU7l2qRy/I1sR7Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-4jEWSPp4PbK_f_gfybHguA-1; Mon, 31 Oct 2022 07:24:56 -0400
X-MC-Unique: 4jEWSPp4PbK_f_gfybHguA-1
Received: by mail-wr1-f70.google.com with SMTP id
 n16-20020adfc610000000b0023650935090so2939070wrg.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHBybFsZVW5Z65rViBTWS/Z3w7OKXNCERtp+eAAsSms=;
 b=7aT6IGKRr0iP7/LY4xrZReJ9DxmggVP+CseX1YEX/fBDxCneJO2EL1HoxkySHrt5PM
 NXc1n3ZuT9rzzxEbYF19+wqyYgnlAidPMMq/IWDIpYj8RHVelBtgUi/qYm8zp3TRR7cE
 8zsWR5/rDC8y3nmmF4FQ1c6tX/jbZJiFT+nCmO4cmo9XB4YmpQ8Q+4UMF1eC28tq1nZZ
 IAa2U2XoRBQ1tEnI22bI4rN/K4MhE/yqUk1xh2QOtQAl+nsEYy7y2Ao9+IISUWcasgyt
 33uALgwr35kPtbWGy+pZudwCIe/CAoZdzf6MWfJ7IdYRrVyK2U+VXu2bd9nci65fZUOg
 T92Q==
X-Gm-Message-State: ACrzQf2O6GFcSIJ2t7ce0LuxucsWtxgtj64smuJmksc56InriyJ0K0N+
 vtgOKjykLi8+4Eoq+jtcenYpWKmc/3+9GRTB2xWVWmjDa/8lg9j52M5vYaT5LaRIBMtcnY/PDNk
 tnU78+DoLr3cv7V8=
X-Received: by 2002:a5d:6288:0:b0:236:dc84:1f70 with SMTP id
 k8-20020a5d6288000000b00236dc841f70mr382596wru.549.1667215495681; 
 Mon, 31 Oct 2022 04:24:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Mj4m0lfunpJvMtyguBn8BqOAFxL89b3M1Rz3c2h12tMKg4MWu3j64SsWfvVSbN9h/y3CYtA==
X-Received: by 2002:a5d:6288:0:b0:236:dc84:1f70 with SMTP id
 k8-20020a5d6288000000b00236dc841f70mr382582wru.549.1667215495497; 
 Mon, 31 Oct 2022 04:24:55 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 z18-20020a1c4c12000000b003cf75f56105sm1191022wmf.41.2022.10.31.04.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 04:24:55 -0700 (PDT)
Date: Mon, 31 Oct 2022 07:24:50 -0400
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
Message-ID: <20221031072356-mutt-send-email-mst@kernel.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 07:21:31PM +0800, wangyanan (Y) wrote:
> Hi Yicong,
> 
> On 2022/10/31 17:05, Yicong Yang wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Update the ACPI tables according to the acpi aml_build change.
> We may also need the disassembled context of the table change
> in the commit message, for review.

not just for review - in case it has to be rebased.
also pls make sure to
- edit the diff for clarify only retaining relevant parts
- prefix the diff with some prefix e.g. leading space in each line
  to avoid confusing git

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


