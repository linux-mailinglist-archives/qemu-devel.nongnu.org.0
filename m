Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2EF58D867
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 13:52:07 +0200 (CEST)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLNmH-0005qw-Ut
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 07:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLNdX-00087g-TA
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 07:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLNdV-0006e8-DP
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 07:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660045380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ww0GuHUvQhgWtzLfH6STGDPnzV4pzyjccVJKIpVr9U=;
 b=eaMkXKKNXUren20/jU3YmD8eURsTOjO08Vhwv/sp1SJnH0kxt0/J7gD1s70Czr52raMhYc
 xTH1gjzrhk2YcOXAyTS8mY/xYzvp7koCS8Tq0W5FSnXhAht6R32XajD9GIPgCLq/moJ1gT
 70zQLQ/kJ5TrvNHDR9vk+7OS3eC2urA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-SqfAs25gN32lhKC2pvOC5A-1; Tue, 09 Aug 2022 07:42:59 -0400
X-MC-Unique: SqfAs25gN32lhKC2pvOC5A-1
Received: by mail-wr1-f70.google.com with SMTP id
 x5-20020adfbb45000000b0021ee56506dfso1831481wrg.11
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 04:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=2Ww0GuHUvQhgWtzLfH6STGDPnzV4pzyjccVJKIpVr9U=;
 b=fGSd6kTOpjtldgBNHHhHu8SBWEVtMiV0cRCZUEG2P+xL46uNdfCWsKsZ8F/aevBPTM
 v08SSXSsSClqu38uDTEVhQbcqjuS9K/Y9TeAeQbBJY5OQ/K1ePGv3hqUdML72aJtu5Yk
 On0Fii5MR92b86Q6OddxaPt/MjzTnVqx2foqfi9PfVkJrUeOud7XfAfmxEqoh6aEn3jW
 Y38BrB3bsvqlpUJj30HXfhJJ5sI0DfLlAJhLht0dkMUda+KoI/AXbzckUaJ62PIyNf8R
 DSt0UADM+MXH5RpMrzuLqdQvfXCVL+o7qKqr4zG5UdXfV0yhE8aQ/XdDz8sUS0kA9y7A
 MNjw==
X-Gm-Message-State: ACgBeo3PYPiUGq4t4S3RUcJOmp386imw3GrmmmM2p7Z/yfeNx28t8xHv
 WCu2Ts5AOWEBUcja0xRuy4h6Y8A8e9ZSG/bOZraVKfrrmoHdrs05mt+yCgb6JLjIOY2RQDZhf5E
 fObHfLg5Rxv6IAEs=
X-Received: by 2002:a05:6000:156e:b0:223:5d98:f4ae with SMTP id
 14-20020a056000156e00b002235d98f4aemr4048403wrz.156.1660045378212; 
 Tue, 09 Aug 2022 04:42:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR75R3plq2epOyaQ5RXCZyj1EmNyTuXoTIJ8CLamu9XydTeV0g60gWPvVXIYAppMMSW0e3/K2w==
X-Received: by 2002:a05:6000:156e:b0:223:5d98:f4ae with SMTP id
 14-20020a056000156e00b002235d98f4aemr4048388wrz.156.1660045377995; 
 Tue, 09 Aug 2022 04:42:57 -0700 (PDT)
Received: from redhat.com ([2.52.152.113]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b0039c454067ddsm6221105wms.15.2022.08.09.04.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 04:42:57 -0700 (PDT)
Date: Tue, 9 Aug 2022 07:42:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, ani@anisinha.ca,
 berrange@redhat.com
Subject: Re: [PATCH for-7.1] tests: acpi: silence applesmc warning about
 invalid key
Message-ID: <20220809074219-mutt-send-email-mst@kernel.org>
References: <20220728133713.1369596-1-imammedo@redhat.com>
 <20220809134024.3c6cc534@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220809134024.3c6cc534@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Aug 09, 2022 at 01:40:24PM +0200, Igor Mammedov wrote:
> On Thu, 28 Jul 2022 09:37:13 -0400
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > OSK value is irrelevant for ACPI test case.
> > Supply fake OSK explicitly to prevent QEMU complaining about
> > invalid key when it fallbacks to default_osk.
> > 
> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> 
> Michael,
>  can you pick it up?

Yes! In the next pull. I was hoping the linux seed thing will
settle but apparently no luck ...

> > ---
> >  tests/qtest/bios-tables-test.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 359916c228..7c5f736b51 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1632,7 +1632,9 @@ static void test_acpi_q35_applesmc(void)
> >          .variant = ".applesmc",
> >      };
> >  
> > -    test_acpi_one("-device isa-applesmc", &data);
> > +    /* supply fake 64-byte OSK to silence missing key warning */
> > +    test_acpi_one("-device isa-applesmc,osk=any64characterfakeoskisenough"
> > +                  "topreventinvalidkeywarningsonstderr", &data);
> >      free_test_data(&data);
> >  }
> >  


