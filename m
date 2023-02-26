Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78906A2FB0
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 14:04:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWGh4-0001g3-2c; Sun, 26 Feb 2023 08:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWGh2-0001fh-Jd
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 08:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWGh0-0003Kp-TG
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 08:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677416633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nar+mx9Fo9R1wZ/9bnH/8iRxIJccAB9474qk2C+g2QY=;
 b=dLzcKT/tyVOpFFur4hKfs54QnElI1PW9dskVaufVOr9rxcw10Mduj7h42/Mp39uNTKreol
 O9XhCdrrKF6rtJj299ahyScftUzgEWLAStbvZkvQKcTOrxRhf6tyxt687+JQWDQBDNlcLX
 SxFBgHCLEwJUhCbPhWDy0v5c5SKGg3U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-JXuBHcviMiKuyTt4oIn0pA-1; Sun, 26 Feb 2023 08:03:52 -0500
X-MC-Unique: JXuBHcviMiKuyTt4oIn0pA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso3892972wms.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 05:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nar+mx9Fo9R1wZ/9bnH/8iRxIJccAB9474qk2C+g2QY=;
 b=jRpGFiswG5nDMf3TYMAh7VSFD5XKvDuGBdZcf1bx+hcKv+JxnIbL40y1MMFLMAadmQ
 JbloeP+tkJHihhh/N0VqXgdUuBF7n4UkHVSkqHwVPtPo83w8EYkTOBp4Clg9U0neQ2KO
 Mab4bijcJ776Jw+8l4/2V2KZ8beVM0b2eGijRd9B6PFNnrFEMh8+PuPyVCKbfP8j7fzF
 ned4MbRIrPeuWAojOuZiT1SfI5Yghj/DFp9V8rQ4wNGD+3kY+vn6njemF6lR5NQu4tOC
 IFkmeMf8VJRLOrTdrCSRXQR02yemCcD5BnxAl8hegkXOp4GeFNL4yRkmTLW+KEN6v3P2
 UVww==
X-Gm-Message-State: AO0yUKW3gh04wsOenfk9XY+X+8jlVAoBW+XgbaZbRybGOWs+uPCAbWzO
 8hfXeKJ8GcfP5I16qaFvKo1Q0zymU+pr6xlshhQYx8d26Bo/Yj8YUWRZc0B9kdTyYNlHlWQa3HG
 RPQMSrf3sugv/QYA=
X-Received: by 2002:a5d:50cc:0:b0:2c7:1a96:efcd with SMTP id
 f12-20020a5d50cc000000b002c71a96efcdmr6876540wrt.1.1677416630930; 
 Sun, 26 Feb 2023 05:03:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+gwxqqy8lnWJ7U07DAU0zZCeswc5PeKyCErP1heJQ+tOINpHRyzX29lmWK1/c/JRBVgiBPig==
X-Received: by 2002:a5d:50cc:0:b0:2c7:1a96:efcd with SMTP id
 f12-20020a5d50cc000000b002c71a96efcdmr6876532wrt.1.1677416630669; 
 Sun, 26 Feb 2023 05:03:50 -0800 (PST)
Received: from redhat.com ([2.52.24.119]) by smtp.gmail.com with ESMTPSA id
 p1-20020a056000018100b002c54fb024b2sm4361067wrx.61.2023.02.26.05.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 05:03:50 -0800 (PST)
Date: Sun, 26 Feb 2023 08:03:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Damien Zammit <damien@zamaudio.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH qemu] timer/i8254: Fix one shot PIT mode
Message-ID: <20230226080328-mutt-send-email-mst@kernel.org>
References: <20230226015755.52624-1-damien@zamaudio.com>
 <20230226035018-mutt-send-email-mst@kernel.org>
 <2a62e6fa-3c80-5d07-2b65-0ef27ceabb86@zamaudio.com>
 <CAMo8BfKm1DAfKRo+8rO7rjiQ3N_BwPFPsMmUjwRA=mx1QJqa3w@mail.gmail.com>
 <59513eba-4cd3-2e0f-c81a-fac19407cb3d@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59513eba-4cd3-2e0f-c81a-fac19407cb3d@eik.bme.hu>
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

On Sun, Feb 26, 2023 at 01:11:19PM +0100, BALATON Zoltan wrote:
> On Sun, 26 Feb 2023, Max Filippov wrote:
> > On Sun, Feb 26, 2023 at 1:18 AM Damien Zammit <damien@zamaudio.com> wrote:
> > > 
> > > Hi Michael,
> > > 
> > > Thanks for reviewing this on a weekend!
> > > 
> > > On 26/2/23 19:51, Michael S. Tsirkin wrote:
> > > > On Sun, Feb 26, 2023 at 01:58:10AM +0000, Damien Zammit wrote:
> > > > >       case 0:
> > > > > -        out = (d >= s->count);
> > > > > -        break;
> > > > 
> > > > 
> > > > I think you need something like
> > > >       /* FALLTHRU */
> > > > here otherwise some gcc versions will warn.
> > > > 
> > > > >       case 1:
> > > > > -        out = (d < s->count);
> > > > > +        out = (d >= s->count);
> > > 
> > > It seems that there are quite a number of these consecutive fallthrough cases
> > > without /* FALLTHRU */ in i8254_common.c
> > > 
> > > Can these be fixed in a separate patch?
> > 
> > I believe that the comment is only needed when there's code
> > between the labels and is not needed between the labels that
> > follow each other.
> 
> I think so too, I have some of these consecutive case labels in my code and
> never had a problem with that. Only when you have a statement between labels
> without break is when a comment is needed.
> 
> Regards,
> BALATON Zoltan


I just tried and it looks like you are right. Pls ignore sorry about the
noise.

-- 
MST


