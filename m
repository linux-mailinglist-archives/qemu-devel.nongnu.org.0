Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E060315B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:09:16 +0200 (CEST)
Received: from localhost ([::1]:46926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okq5b-0005ED-Hw
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1okpmF-0006D5-Hy
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1okpmD-0004Ih-Hx
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666111752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWjgWFW/CCpqYCIU56lpUJkiaWuDRRoWqmLVMrn9BVY=;
 b=jGZ0QlD1lCJkQ9c/omjQm0r3EcNasve1Z6GmAXwxKIEI2W+Y3ccKAbbTpCZ/lTqoMUssNr
 gZhkYGynTDpWiGAeWLy3lTPQG/Csr04DmuWrMs4TH+OqMMSqix/mwr+T7QBsVDjH42qfgp
 /YCebv0NjhCn51lAurh3D67mFpuY5bI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-zC6Ay9EvM1CVtsDfnZRnDA-1; Tue, 18 Oct 2022 12:49:11 -0400
X-MC-Unique: zC6Ay9EvM1CVtsDfnZRnDA-1
Received: by mail-wm1-f70.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so8332525wmb.7
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 09:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mWjgWFW/CCpqYCIU56lpUJkiaWuDRRoWqmLVMrn9BVY=;
 b=1SzHf0jQHjayy2rE8M5D94XN4kAVYzByS6YOe1S92RCd6WvJ2ybbkdyGP2D/R7gjhP
 KYyE6oxqIgk2pO0FRYLC6ZvLdeumkNpxn4gkAkn6hnqT3Bn8qZp+6SL0inET1gxFPhrk
 55QV4UQlnU3juiIpUroS8yFnn4lWKixjsfynJZYT07DkUP0QF2jYC0K4ouE8RF4H61cZ
 KKNS1bmRzoFJPISo8EMpCQL1FwXJUc4NtE52Ci8KzIa9dwMzbtpXYqDzSddEVlN9FiZR
 b+ImquvImvC6IhNZVjRBqdUGJGYB4qxc+LH2l1hnlQAP7+Zx2uGL7icyKwV409S6TonO
 8dXg==
X-Gm-Message-State: ACrzQf34dPo/dC9Oi5CbhugBaCgkT2AZ/9RXVgKID1CBcxGHykEkXnyk
 BD+FNm5GXUbUvQDabAYv+/WmrGIbkqmMfg667HRzgRFNJEvWSZOMLQDetq2BK9avGJg1C8CoeW5
 I2RROLkkQW5KkzyQ=
X-Received: by 2002:a5d:4050:0:b0:22c:dfcc:675b with SMTP id
 w16-20020a5d4050000000b0022cdfcc675bmr2361534wrp.105.1666111749944; 
 Tue, 18 Oct 2022 09:49:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WycjtwUuLzucI70RiwrBIWwf50EYzgWoJGSKipICzfsXwpTETmgPEQ+b5QlKSeGCqcQqNuw==
X-Received: by 2002:a5d:4050:0:b0:22c:dfcc:675b with SMTP id
 w16-20020a5d4050000000b0022cdfcc675bmr2361527wrp.105.1666111749729; 
 Tue, 18 Oct 2022 09:49:09 -0700 (PDT)
Received: from redhat.com ([2.54.172.104]) by smtp.gmail.com with ESMTPSA id
 b22-20020a05600c4e1600b003c6c5a5a651sm13951253wmq.28.2022.10.18.09.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:49:09 -0700 (PDT)
Date: Tue, 18 Oct 2022 12:49:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RESEND PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Message-ID: <20221018124847-mutt-send-email-mst@kernel.org>
References: <20221018152524.137598-1-jusual@redhat.com>
 <4c2ee3bc-18e0-bdd1-79e0-ee9a2c818d10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c2ee3bc-18e0-bdd1-79e0-ee9a2c818d10@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 06:17:55PM +0200, Philippe Mathieu-Daudé wrote:
> On 18/10/22 17:25, Julia Suvorova wrote:
> > In the ACPI specification [1], the 'unarmed' bit is set when a device
> > cannot accept a persistent write. This means that when a memdev is
> > read-only, the 'unarmed' flag must be turned on. The logic is correct,
> > just changing the error message.
> > 
> > [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
> > 
> 
> Fixes: dbd730e859 ("nvdimm: check -object memory-backend-file, readonly=on
> option")
> 
> The documentation in 'docs/nvdimm.txt' is correct :)
> 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   hw/mem/nvdimm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> > index 7c7d777781..bfb76818c1 100644
> > --- a/hw/mem/nvdimm.c
> > +++ b/hw/mem/nvdimm.c
> > @@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
> >       if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
> >           HostMemoryBackend *hostmem = dimm->hostmem;
> > -        error_setg(errp, "'unarmed' property must be off since memdev %s "
> > +        error_setg(errp, "'unarmed' property must be on since memdev %s "
> 
> If you ever respin please quote 'on' for readability.


Yes make sense. Julia could you change this pls?

> >                      "is read-only",
> >                      object_get_canonical_path_component(OBJECT(hostmem)));
> >           return;
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


