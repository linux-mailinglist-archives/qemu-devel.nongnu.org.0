Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF436C2CD0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 09:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXbc-0004OZ-5e; Tue, 21 Mar 2023 04:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1peXbY-0004Ml-WB
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1peXbX-0001D7-6d
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679388266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUZy3if/1jKQjPVuQNJz0WNFLBP1CHis2wLBZloyLj4=;
 b=d5u3P1RmE/DsV0Yq/sPT1oXB0Ao55gtBCIw+e5C4fOPUxtbhHt53j9geoac1Zwpl6bZy6H
 ISRKty2TrOp4QVkGpuTSET/8cmS/QHIpjEqCdig7E32bM16zcvzdxUsUlQpBtDDzw5J8aL
 rSDwzqlhhJmbt6s+ttZ+iKgi2KugD8g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-iUPnvrkIOS2E5WZHvlrCGQ-1; Tue, 21 Mar 2023 04:44:24 -0400
X-MC-Unique: iUPnvrkIOS2E5WZHvlrCGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l17-20020a05600c1d1100b003ed29ba093cso5515487wms.6
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 01:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679388263;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUZy3if/1jKQjPVuQNJz0WNFLBP1CHis2wLBZloyLj4=;
 b=xno6YaMY7jWbojDr6VBJnzWP+WA3/jQ9JA7DdMN5+949iSZ4R26MeKj7ah9964AT14
 OnQGMDUJincsFUJ4pKVARoYZtNofzZz9nE01x+BOZJPtqVDRcCIxNYmenQuwCYNCCo9P
 ul613Lw4hF7DWaHHXdMzvczNeDK0oGJhsCaMSYYWKgFu55X2Y30d8JIs0cAoI5mphVjr
 LDT453oPWGo6trOIS1ZTdt7p1zUIyp603xE3tpxMsCUqPXXyg/iTzkjStXyXdNBxNnbz
 CkOK6a8hCCamOkEoWoV8Bzeptl5Ivg+Ie5vbhJuNkEwmfvovhc6ok7qgBNEmZWPdsPhm
 lG2A==
X-Gm-Message-State: AO0yUKVDEQuDqDX5xBLkHbbMqsJYJe1S/93Nl90fMk2fjpkuSFIzowGF
 2tJhLPLixlgvENrtEHozYF62699+ccvfil/KY0Irdd39M4CxBOJ1HBiu43o+2tL00XW08EqWFYx
 BR2+sFSorKm2yDlg=
X-Received: by 2002:a5d:6ac9:0:b0:2c7:f56:285b with SMTP id
 u9-20020a5d6ac9000000b002c70f56285bmr1420231wrw.63.1679388263133; 
 Tue, 21 Mar 2023 01:44:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set8YDZVdr10N1sMRPSTc+PzEWz+scY6ol/mLWA8bStsmj4jgfRsg80XjFCKsaRrD2T+WITQKQw==
X-Received: by 2002:a5d:6ac9:0:b0:2c7:f56:285b with SMTP id
 u9-20020a5d6ac9000000b002c70f56285bmr1420225wrw.63.1679388262854; 
 Tue, 21 Mar 2023 01:44:22 -0700 (PDT)
Received: from redhat.com ([2.52.1.105]) by smtp.gmail.com with ESMTPSA id
 g18-20020adffc92000000b002cdbb26bb48sm10777618wrr.33.2023.03.21.01.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 01:44:22 -0700 (PDT)
Date: Tue, 21 Mar 2023 04:44:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 2/6] bios-tables-test: use 128M numa nodes on aarch64
Message-ID: <20230321044350-mutt-send-email-mst@kernel.org>
References: <20230320093847.539751-1-kraxel@redhat.com>
 <20230320093847.539751-3-kraxel@redhat.com>
 <CAARzgwwjguG-teRcv2jEB+McZgkcmF6ji7WisagEV+LdvfT4OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwwjguG-teRcv2jEB+McZgkcmF6ji7WisagEV+LdvfT4OA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Mar 21, 2023 at 01:52:22PM +0530, Ani Sinha wrote:
> On Mon, Mar 20, 2023 at 3:08 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > Recent edk2 versions don't boot with very small numa nodes.
> > Bump the size from 64M to 128M.
> 
> Can you please add the ASL diff between the binary blobs as a result
> of the change?
> Otherwise.


Peter merged this so too late, but please do it in the future.
Otherwise it is impossible to review the changes.

> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> 
> > ---
> >  tests/qtest/bios-tables-test.c         |   6 +++---
> >  tests/data/acpi/virt/SRAT.acpihmatvirt | Bin 240 -> 240 bytes
> >  tests/data/acpi/virt/SSDT.memhp        | Bin 1817 -> 1817 bytes
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 76d510091177..873358943784 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1679,9 +1679,9 @@ static void test_acpi_virt_tcg_acpi_hmat(void)
> >      test_acpi_one(" -machine hmat=on"
> >                    " -cpu cortex-a57"
> >                    " -smp 4,sockets=2"
> > -                  " -m 256M"
> > -                  " -object memory-backend-ram,size=64M,id=ram0"
> > -                  " -object memory-backend-ram,size=64M,id=ram1"
> > +                  " -m 384M"
> > +                  " -object memory-backend-ram,size=128M,id=ram0"
> > +                  " -object memory-backend-ram,size=128M,id=ram1"
> >                    " -object memory-backend-ram,size=128M,id=ram2"
> >                    " -numa node,nodeid=0,memdev=ram0"
> >                    " -numa node,nodeid=1,memdev=ram1"
> > diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
> > index 691ef56e34bc84509270db316d908f5979c209bb..6fe55dd7d07fef0f8fe16a209e96a89dd48ca240 100644
> > GIT binary patch
> > delta 67
> > zcmeys_<@ltILI;N0|NsC^R$Uvjf@-<d*mlxmepX?U;>JPK>(EIfYJ<%Fb0qY0P4I6
> > AJ^%m!
> >
> > delta 59
> > zcmeys_<@ltILI;N0|NsC^Qwtljf^Z4d*l^dfLst@flv$#j4%d}X4GJsxL6ecZ+{66
> >
> > diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> > index 2fcfc5fda955dc4ba78a5f4116eed99ec7202fbd..ef93c44464f1fe38f7e5babd5d67f345cc6363a6 100644
> > GIT binary patch
> > delta 22
> > dcmbQqH<OPmIM^jblAVEpap^`bUUsI7&Hz1t1wsG-
> >
> > delta 22
> > dcmbQqH<OPmIM^jblAVEpv2i08FFVs$X8=5?1wsG-
> >
> > --
> > 2.39.2
> >


