Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335F60AE9B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:10:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy4C-0006YH-9Y; Mon, 24 Oct 2022 10:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omy45-0006TM-CH
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omy43-0002J5-MW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666620267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q7UsfNg4hPqytuO+KsjythAZ9/5AuoNcBm6X7rR42Jw=;
 b=FfYgdiPb7HPt0VW/ou/srwCuzKY4VOKegNfIEpx00D9YhPzm/cywspKFl0W0J1bFv19T6x
 DuqSqTtdw0jXFrhlttOAlEGzKBt5XR80HIpmecbK7McFnOAeFStET0hZexrPB1lqqCmIXY
 CHzlQgK+bEKSHWmn3mon8gVLzXHpFCU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-Hlua6l4iPcKTFasnoy8D7g-1; Mon, 24 Oct 2022 10:04:24 -0400
X-MC-Unique: Hlua6l4iPcKTFasnoy8D7g-1
Received: by mail-wr1-f71.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so3334909wrb.20
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7UsfNg4hPqytuO+KsjythAZ9/5AuoNcBm6X7rR42Jw=;
 b=e8NfTW8mIz2TlpplSrKIJbR8gDFYx5XkbAisp01D8CIOi3q9jbtQjiqA25V+gEpoOF
 ieTvsPdyoFZE+/dyS4OE4g3z1y5488iTEOv5Sf7mekCIkeO2NMmsvMC0IGNybyje+uYx
 14qL1TzURAXsiTiuGndMUfStYMd6Q365ISIo3D40BAPEK3iMfnx1LyYVgNrUvtU5EtKp
 A645GS1/209smIoxW0fEjcEfQg/Pxbo6jrhuObeTAyFX27KZBNVVRGCyb+V1xjYFsB7j
 pVPkW7PID4hK3ft4/qtNIfeEj5mo7VhrAxZnGYYZi576X5pbHMzPOvCXr9GA1qDGskmy
 o7Og==
X-Gm-Message-State: ACrzQf04ksa2sM2bVnFFlQw25zA+WwQm7OIHv4Ara4ERYH23TS/2UYAW
 kZodCUqUa+75I1sk1mPHSmp4kjhOmwQj8XiHWtWhM+weV5ey1oeT5s99YSIoMI6p/d4tLf6qMSw
 oSdk9IXNRm87jutA=
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr16445839wmq.56.1666620263114; 
 Mon, 24 Oct 2022 07:04:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7s/oRmCyxWND4AqztLvNGlaq98vzHI/DNi2luuSYJYNXOPhympAbEdg78iKbikt1B5G1c07w==
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr16445796wmq.56.1666620262839; 
 Mon, 24 Oct 2022 07:04:22 -0700 (PDT)
Received: from redhat.com ([2.54.160.13]) by smtp.gmail.com with ESMTPSA id
 c192-20020a1c35c9000000b003c6fb525b4csm11030025wma.38.2022.10.24.07.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 07:04:21 -0700 (PDT)
Date: Mon, 24 Oct 2022 10:04:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>, qemu-devel@nongnu.org,
 Eric DeVolder <eric.devolder@oracle.com>, qemu-stable@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Message-ID: <20221024100323-mutt-send-email-mst@kernel.org>
References: <20221019191522.1004804-1-lk@c--e.de>
 <20221021190524.433s2uh6i5md74gf@mozz.bu.edu>
 <20221022053727.flc3bq3opyjimwgb@mozz.bu.edu>
 <Y1VRj0Eu4iGp0smF@cae.in-ulm.de>
 <20221024132040.5dnn45eatygojipe@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024132040.5dnn45eatygojipe@mozz.bu.edu>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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

On Mon, Oct 24, 2022 at 09:20:40AM -0400, Alexander Bulekov wrote:
> On 221023 1637, Christian A. Ehrhardt wrote:
> > 
> > Hi,
> > 
> > On Sat, Oct 22, 2022 at 01:37:27AM -0400, Alexander Bulekov wrote:
> > > On 221021 1505, Alexander Bulekov wrote:
> > > > On 221019 2115, Christian A. Ehrhardt wrote:
> > > > > Fix memset argument order: The second argument is
> > > > > the value, the length goes last.
> > > > > 
> > > > > Cc: Eric DeVolder <eric.devolder@oracle.com>
> > > > > Cc: qemu-stable@nongnu.org
> > > > > Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> > > > > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> > > > > ---
> > > > >  hw/acpi/erst.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > > > index df856b2669..26391f93ca 100644
> > > > > --- a/hw/acpi/erst.c
> > > > > +++ b/hw/acpi/erst.c
> > > > > @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
> > > > >      if (nvram) {
> > > > >          /* Write the record into the slot */
> > > > >          memcpy(nvram, exchange, record_length);
> > > > > -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> > > > > +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> > > > 
> > > > Hi, 
> > > > I'm running the fuzzer over this code. So far, it hasn't complained
> > > > about this particular memset call, but it has crashed on the memcpy,
> > > > directly preceding it. I think the record_length checks might be
> > > > insufficient. I made an issue/reproducer:
> > > > https://gitlab.com/qemu-project/qemu/-/issues/1268
> > > > 
> > > > In that particular case, record_length is ffffff00 and passes the
> > > > checks. I'll keep an eye on the fuzzer to see if it will be able to
> > > > crash the memset.
> > > 
> > > Here's a testcase for the memset issue:
> > 
> > Looks like this check in {read,write}_erst_record():
> > |   if ((s->record_offset + record_length) > exchange_length) {
> > |       return STATUS_FAILED;
> > |   }
> > 
> > has an integer overrun and should be re-written as:
> > |   if (record_length > exchange_length - s->record_offset) {
> > |       return STATUS_FAILED;
> > |   }
> > 
> >        regards    Christian
> 
> Hi Christian,
> With this change applied (along with the memset fix), the fuzzer doesn't
> find any crashes.
> Thanks
> -Alex

Thanks!
Christian, are you doing to be sending a combined patch for the whole
issue? If you do pls add Tested-by tags as appropriate. Thanks!

-- 
MST


