Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580260F9FC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:02:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3Jh-0000KQ-56; Thu, 27 Oct 2022 09:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oo3Je-0000AC-Im
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oo3Jb-0003YG-Vg
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666878778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pYidy2Ag49cbknaOpVBTmKyoRu4/t3dfEuLBsbFje0=;
 b=IkNNqjR4cf21xNVnTaCNVr5iHjphRgLaJrjQykqayB4bV870WwkMPWuoLo2tN/BvL1sAav
 TPf+gaqdNZ1eHgRSBlHYJ65y3VHa/hIaMtemBNEVtKCfdsEBjLO2ZHTBfgEvOWXSpb7gXr
 sOP33+5vkKa59d4iST3bTTrm+xWP2lo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-bqUVH4EnOiCNIZjfHPx5uA-1; Thu, 27 Oct 2022 09:52:56 -0400
X-MC-Unique: bqUVH4EnOiCNIZjfHPx5uA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso405352wrb.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 06:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7pYidy2Ag49cbknaOpVBTmKyoRu4/t3dfEuLBsbFje0=;
 b=RDwxmhHDWl8uj+2q36E41+N+390A8ha0DubhLvjI5lJEfSKo7M3ct0w2IC1Xtrs13E
 2MCWMXm0Rr6o0HolmKdTabu9/b0UkroU4dyzp7S+cjBBwPpGE1UvAmqwBXDWbRpwD1gy
 NUnaw8bzuzu3mGspVip1khjujJGCuAltuYl8hAw0bU6nXYNs1Idt1H7YyTrwLZKNiNpS
 Fs8zKlw873TgU47D4Ndadt9x30IwgIs+sWdJ1wsVKw2HkI6BzNkjViB2nCWOUtYBHB2Q
 sd8LZDsMxEwWW5BVphsakVOmZqvC7GsHvR1PdzskNJpm4O9w8YK47euzArvN9tSJUTn5
 SMKQ==
X-Gm-Message-State: ACrzQf2quWSCOoWqni8AFw+eIrPnS8j8m/5AyQSUQJrEYTVG2Z/CUE5A
 XLjjiXjVVKyC9rbWvcCeyyWE62iT4ZmP4aMYvrUnGGBgyig/+1jhxGulciw0kwyR1MWG2Ai74wS
 ZpkeCi62k9uMr9u4=
X-Received: by 2002:a05:6000:1786:b0:22e:3955:13a1 with SMTP id
 e6-20020a056000178600b0022e395513a1mr32191035wrg.624.1666878775282; 
 Thu, 27 Oct 2022 06:52:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6c/PtHcVfyiY73ZIkK5QW7YuNAHzbBqEpIX7BH4rMrZWy6LIDUnzrIQiIMFeEs/xRLxJcTNA==
X-Received: by 2002:a05:6000:1786:b0:22e:3955:13a1 with SMTP id
 e6-20020a056000178600b0022e395513a1mr32191024wrg.624.1666878775054; 
 Thu, 27 Oct 2022 06:52:55 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a056000018f00b002258235bda3sm1247412wrx.61.2022.10.27.06.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 06:52:54 -0700 (PDT)
Date: Thu, 27 Oct 2022 15:52:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: type mismatch in SSDT
Message-ID: <20221027155253.0d81989c@fedora>
In-Reply-To: <20221027015833-mutt-send-email-mst@kernel.org>
References: <20221027015833-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Thu, 27 Oct 2022 01:59:22 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> Just noticed this when disassembling:
> 
> Parsing completed
> ACPI Warning: NsLookup: Type mismatch on ODAT (RegionField), searching for (Buffer) (20210604/nsaccess-760)
> Disassembly completed
> ASL Output:    /tmp/old-asl2/tests/data/acpi/virt/SSDT.memhp.dsl - 14945 bytes
> 
> Did not look into this yet but it seems new.
It was there practically 'forever'.

ODAT should be treated as Buffer according to implicit Field/data conversion rules,
that's probably the reason why it works. So warning looks a bit bogus to me.

however:
  DefCreateByteField := CreateByteFieldOp SourceBuff ByteIndex NameString
  SourceBuff := TermArg => Buffer
  TermArg := ExpressionOpcode | DataObject | ArgObj | LocalObj

and none of that explicitly leads to 

  TermObj := Object | StatementOpcode | ExpressionOpcode
  Object := NameSpaceModifierObj | NamedObj

So if we are to be as pedantic as IASL, we need to supply
field to CreateByteField not by name but via one of TermArg.
We could copy/assign whole buffer to a LocalObj
or summarily use ExpressionOpcode => ToBuffer() // this one has a bit controversial definition in 6.4 spec
or to avoid any copying add 'useless' DerefOf(RefOf())
wrapper around name to make argument of ExpressionOpcode kind.

following should silence warning.

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 31e46df0bd..7488007540 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1127,7 +1127,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
     /* If RLEN >= Integer size, just use CreateField() operator */
     aml_append(method, aml_store(aml_shiftleft(dsm_out_buf_size, aml_int(3)),
                                  dsm_out_buf_size));
-    aml_append(method, aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
+    aml_append(method, aml_create_field(aml_derefof(aml_refof(aml_name(NVDIMM_DSM_OUT_BUF))),
                aml_int(0), dsm_out_buf_size, "OBUF"));
     aml_append(method, aml_return(aml_name("OBUF")));
 


