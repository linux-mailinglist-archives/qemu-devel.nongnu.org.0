Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956B65F145
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:35:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTD8-0003Cl-Fc; Thu, 05 Jan 2023 11:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDTD2-0003BW-6h
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:35:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDTD0-0000Ji-IA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672936514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18PgMYQZVf042bPruXc5HQh1pJc8rYWfGzzYFgEZ1zA=;
 b=FcKeDqmeonrQk5PxgK6YB+D9qW4c+dkgcDvCQQHkyfcpI/CutsfxmC1IIJcMVhHQO4GKS0
 6JLHKpthD2HDkRJ36axRqJ9TYXm0ZlaNuQ54LeGniyuiDm38G0hu/1lDYamXGEC/obCB3f
 L6amUNWlQ2UNDvstbPVv0K+WBChDWt8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-JbbVKZyFMCiA-RWNQZZj_Q-1; Thu, 05 Jan 2023 11:35:12 -0500
X-MC-Unique: JbbVKZyFMCiA-RWNQZZj_Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 dr5-20020a170907720500b00808d17c4f27so23266045ejc.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18PgMYQZVf042bPruXc5HQh1pJc8rYWfGzzYFgEZ1zA=;
 b=PRag3y3zaRKdHGHKZYX3/Izzj+yp+04Vj0twDtHnJ9rpF/FXk7H52aRiUY4YSUKPdl
 nVL4rtgMPFp3ahhtoyCdqWjeptBAx4BrQ8JcQNeKnojQ/cZJoe21EBmoCk5aAK1bmIG8
 Vzb7sW0kLXV5YkpC/ZR4WtDFC4YSKDRErwsLKyLnS4SmZw0skzfGvs4T/DsexSZHYfD1
 ZQ48YPylbXZP6Mawv3drPIpYnRMPikMadImGKrjy3ZAdEIjEby6YxHKk8c1bUmroHJlS
 uUvxvqPTrwyF4C1AsH3gKKJKbVdSHBVbDRTEFRU/acMBvW8LOXGa1fSv6ThpGdGcwnQi
 B2+A==
X-Gm-Message-State: AFqh2koVh4Q7p6jVspm7IURK+E7NonqQw8emQh7tPc8B8E35CWsPI3GT
 tYpUe1YJS3mSITEz02zr/n06qOfTQLi32XsHchNHNAK5AQqUhGExW7uzxoPhWaOgRU89VYZN6jE
 dNgHrm/s9Y9c8dgA=
X-Received: by 2002:a05:6402:2b8e:b0:461:22bb:1ae4 with SMTP id
 fj14-20020a0564022b8e00b0046122bb1ae4mr50112702edb.17.1672936511551; 
 Thu, 05 Jan 2023 08:35:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7lwx6VmZYG7NzGSSHHa/p0lYM0e3GYRKjimZleEMqkH8S/VgYqe6M77XlR4mfQ7rU4KXS9w==
X-Received: by 2002:a05:6402:2b8e:b0:461:22bb:1ae4 with SMTP id
 fj14-20020a0564022b8e00b0046122bb1ae4mr50112683edb.17.1672936511351; 
 Thu, 05 Jan 2023 08:35:11 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 b19-20020a056402139300b004642b35f89esm16200107edv.9.2023.01.05.08.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:35:10 -0800 (PST)
Date: Thu, 5 Jan 2023 11:35:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Ard Biesheuvel <ardb@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org
Subject: Re: [PULL 50/51] acpi: cpuhp: fix guest-visible maximum access size
 to the legacy reg block
Message-ID: <20230105113422-mutt-send-email-mst@kernel.org>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105091310.263867-51-mst@redhat.com>
 <20230105045544-mutt-send-email-mst@kernel.org>
 <c773af84-a36f-181c-6e0e-50124230289e@redhat.com>
 <f731609e-b04d-bb29-d37a-21f1dd0b1551@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f731609e-b04d-bb29-d37a-21f1dd0b1551@linaro.org>
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

On Thu, Jan 05, 2023 at 05:29:54PM +0100, Philippe Mathieu-Daudé wrote:
> On 5/1/23 17:01, Laszlo Ersek wrote:
> > On 1/5/23 10:56, Michael S. Tsirkin wrote:
> > > On Thu, Jan 05, 2023 at 04:17:06AM -0500, Michael S. Tsirkin wrote:
> > > > From: Laszlo Ersek <lersek@redhat.com>
> > > 
> > > I noticed v2 is forthcoming. dropped now.
> > > 
> > 
> > Yes, thanks.
> > 
> > I'm picking up the "Reviewed-by: Michael S. Tsirkin <mst@redhat.com>"
> > tag from your commit message. I'm not taking the "Fixes:" tag,
> > originally suggested by Phil, because we've agreed that that was not
> > correct.
> 
> I suppose the tool MST is using automatically included the Fixes: tag.

Yes it tends to pick all tags. Anyway, it's replaced by v2 now.

> > The other tags (from Igor, Phil and Ard) I've picked up
> > already, and I've updated the commit message too. I'll post v2 soon.
> > 
> > Thanks!
> > Laszlo
> > 


