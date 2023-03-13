Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32096B7841
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhmG-0003Gy-Oi; Mon, 13 Mar 2023 08:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pbhmE-0003Gb-M1
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pbhmD-0001Tv-1p
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678712383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+dWQZOhzyhXjnAnSFNCTzeCIdqbawhUpIqIP8rhTGA=;
 b=TtqIR55ydGvN8QjIVTgsBfdgKoC5kzNHntM6eYAPE1GGHJHzaBfFoNwwUU0qVep6327uSn
 yKwa/fTj5C/De+y2/CiMokpeC2KiGN9L5Ake+SjoBL3yCOJnZkYaqE9sCGLqEQ10NvYtpY
 LyZviW2hnkeEdxqFObBJhp1eNIZ4jRQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-5P1Sjf0oO66dkfxTHdocGw-1; Mon, 13 Mar 2023 08:59:40 -0400
X-MC-Unique: 5P1Sjf0oO66dkfxTHdocGw-1
Received: by mail-wr1-f72.google.com with SMTP id
 7-20020a5d47a7000000b002be0eb97f4fso2077429wrb.8
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 05:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678712379;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J+dWQZOhzyhXjnAnSFNCTzeCIdqbawhUpIqIP8rhTGA=;
 b=IfBm0RQQJdVYizXZ9xRzVjX8ZQFGoAiFeH5VL2U3He+Q4e0euUo9zccFfz5aBGlQlR
 eeei40c7Th8O8YPn2SJGtJ4vdmg13oIFm38PoeeNXVgdpp9gkVB4FZCDBRYaXqQzw5TJ
 0iaJKMhPY8YschxblvWKSrvFdU/8VhgSYN/Xnnow0unR8k5qoKE40+mmyQqWFhuKAfp8
 Qvre5BaFdS9syCXkcCbiqG/WiRNknLw9ih1UmRxENFk/6BspoEhkX0Ygl089LtKQ2SOP
 2hH3q3IZ+gyOIT/tGjRGkjB/YQPAWr8w0SrafcUomyi55bDpcvX1PcEu5DuJoXF1050z
 Ur0w==
X-Gm-Message-State: AO0yUKXDH+ZNBHCW0Do6dYt6JQDyOJn5tJJOtEZZlvOiDLVOPkb9zji5
 Sj9AX85HqWY2Az2IHSYZousf9M83dlFi0i5rcDAmdSPxn03gmZCyLMsj+jcsB8n3EQ3HwWtc29c
 ZIimo/1JOy5fb2jA=
X-Received: by 2002:a5d:5233:0:b0:2ce:ae4c:c420 with SMTP id
 i19-20020a5d5233000000b002ceae4cc420mr3133919wra.3.1678712379202; 
 Mon, 13 Mar 2023 05:59:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+EQkNkpNDoTMx6MDUdEMWmZXqdVSHIZsrT2QuJfwnHHn4y8CdASBRJ7htmzbcg7ycSvou5Hg==
X-Received: by 2002:a5d:5233:0:b0:2ce:ae4c:c420 with SMTP id
 i19-20020a5d5233000000b002ceae4cc420mr3133907wra.3.1678712378880; 
 Mon, 13 Mar 2023 05:59:38 -0700 (PDT)
Received: from redhat.com ([2.52.26.7]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5608000000b002c552c6c8c2sm7882382wrv.87.2023.03.13.05.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 05:59:38 -0700 (PDT)
Date: Mon, 13 Mar 2023 08:59:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PULL 30/73] tests: acpi: update expected blobs
Message-ID: <20230313085855-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
 <6bf2d446d470dfbd8ba45da27d10ade4616586b1.1678237635.git.mst@redhat.com>
 <ff54f396-a75c-325b-6b37-e1959db09c95@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff54f396-a75c-325b-6b37-e1959db09c95@linaro.org>
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

On Mon, Mar 13, 2023 at 11:57:52AM +0100, Philippe Mathieu-Daudé wrote:
> On 8/3/23 02:12, Michael S. Tsirkin wrote:
> > From: Igor Mammedov <imammedo@redhat.com>
> > 
> > expected changes:
> > Basically adds devices present on root bus in form:
> >    Device (SXX)
> >    {
> >       Name (_ADR, 0xYYYYYYYY)  // _ADR: Address
> >    }
> > 
> > On top of that For q35.noacpihp, all ACPI PCI hotplug
> > AML is removed and _OSC get native hotplug enabled:
> > 
> >                         CreateDWordField (Arg3, 0x04, CDW2)
> >                         CreateDWordField (Arg3, 0x08, CDW3)
> >                         Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> >    -                    Local0 &= 0x1E
> >    +                    Local0 &= 0x1F
> >                         If ((Arg1 != One))
> >                         {
> >                             CDW1 |= 0x08
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Message-Id: <20230302161543.286002-5-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Better safe than sorry! :P

Oh. I don't know how that happened :(

> > ---
> >   tests/qtest/bios-tables-test-allowed-diff.h |   2 --
> >   tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3081 -> 3115 bytes
> >   tests/data/acpi/q35/DSDT.noacpihp           | Bin 8252 -> 7932 bytes
> >   3 files changed, 2 deletions(-)


