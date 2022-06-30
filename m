Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E276C561B56
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:30:01 +0200 (CEST)
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6uF6-0000gD-Gz
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6uDj-0007Jw-3U
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6uDf-00074b-3d
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656595709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XZOtIk13xX3QQswm8tJJ+FhidLP8bmNHjy366lmo1BI=;
 b=B0B8XW5FNUXAb9lTZoJezU9kwpi4/UPV/nTWauppSwLTdpFzNdfy+ZmFzklZh75MZ6nkXM
 plPCdRfK5lWIrDhXnXCl8gT0J+UsEV0fNOuiXIX0fy9uJt7/voPT1JB9CKDX2XioSAuI3z
 U8gKSwNLokilz+djgSvaZ2B3ycPWHEU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-bEdYwogBOa6DshSuowj95Q-1; Thu, 30 Jun 2022 09:28:28 -0400
X-MC-Unique: bEdYwogBOa6DshSuowj95Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 o1-20020adfba01000000b0021b90bd28d2so3106503wrg.14
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 06:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XZOtIk13xX3QQswm8tJJ+FhidLP8bmNHjy366lmo1BI=;
 b=0Mzead9luq+lpZwpGVSb/9Yf1IZVAO81dXMEyJdOhpv+EI+vcwZxu3H1z1Kcd7eGuL
 Fy/0Zhst+EMW42eFcphLoBMKLMbYDX6gSca34kEgQYx5SZLJ2DUyWyKVRlJjubDQ/aAn
 o+i+G2IA31j4dji/hxCvNbmc4Pw9slhg67TC2vRrFXg6VeoQtVLoQ1zJibN/iWERdeEx
 7ch9QclfU62RxKVOeDaVEcf2aquPfKX2c7DAlNqhyACljjSz465WpLTCFVmFjAllNF8I
 wL+cJJD2ur5eWDDCXbyvuyvOfS14bsbK/AvwNE2um6J1hnldBBNLCTxJlXoI4BxNpery
 //uw==
X-Gm-Message-State: AJIora8EHEqUjhlKG9TSaIa425Yy9fDYahwPLgoUOasgPeOqY/bhfbZs
 jUvp5j8X3PnG6oSyo1NU4W8vFy33ClE2qfd+6wlFgm6wyvzRBa6D7VxOkvFFRmDXiu3Mpllsp9r
 BRCbb8/ZBeb8ZfIk=
X-Received: by 2002:a05:600c:3494:b0:3a0:37f0:86ad with SMTP id
 a20-20020a05600c349400b003a037f086admr10151635wmq.65.1656595707156; 
 Thu, 30 Jun 2022 06:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFi8gpoZ5BOPWl8layLLQ8KpFh3qjoa2f7Tv+QC0d1wliFdNWFa+4jooREBHfWBj2NzPQkrg==
X-Received: by 2002:a05:600c:3494:b0:3a0:37f0:86ad with SMTP id
 a20-20020a05600c349400b003a037f086admr10151609wmq.65.1656595706924; 
 Thu, 30 Jun 2022 06:28:26 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 n1-20020a1c2701000000b003a0231af43csm6709322wmn.48.2022.06.30.06.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 06:28:26 -0700 (PDT)
Date: Thu, 30 Jun 2022 09:28:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi <jingqi.liu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 1/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220630092554-mutt-send-email-mst@kernel.org>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <01981dd2-aa15-fbb1-f344-f1065fa06951@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01981dd2-aa15-fbb1-f344-f1065fa06951@inria.fr>
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

On Thu, Jun 30, 2022 at 09:40:19AM +0200, Brice Goglin wrote:


...


> 
> Before this patch, we had to add ",initiator=X" to "-numa node,nodeid=2,memdev=ram2".
> The lstopo output difference between initiator=1 and no initiator is:
> @@ -1,10 +1,10 @@
>  Machine (2966MB total) + Package P#0
> +  NUMANode P#2 (979MB)
>    Group0
>      NUMANode P#0 (980MB)
>      Core P#0 + PU P#0
>      Core P#1 + PU P#1
>    Group0
>      NUMANode P#1 (1007MB)
> -    NUMANode P#2 (979MB)
>      Core P#2 + PU P#2
>      Core P#3 + PU P#3
> 
> Corresponding changes in the HMAT MPDA structure:
> @@ -49,10 +49,10 @@
>  [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
>  [07Ah 0122   2]                     Reserved : 0000
>  [07Ch 0124   4]                       Length : 00000028
> -[080h 0128   2]        Flags (decoded below) : 0001
> -            Processor Proximity Domain Valid : 1
> +[080h 0128   2]        Flags (decoded below) : 0000

Including diff output like this is what is confusing
mail processing tools. Just escape the diff in the output
and this will make git happy. E.g.:

The lstopo output difference between initiator=1 and no initiator is:

| @@ -1,10 +1,10 @@
|  Machine (2966MB total) + Package P#0
| +  NUMANode P#2 (979MB)
|    Group0
|      NUMANode P#0 (980MB)
|      Core P#0 + PU P#0
|      Core P#1 + PU P#1
|    Group0
|      NUMANode P#1 (1007MB)
| -    NUMANode P#2 (979MB)
|      Core P#2 + PU P#2
|      Core P#3 + PU P#3
| 
| Corresponding changes in the HMAT MPDA structure:
| @@ -49,10 +49,10 @@
|  [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
|  [07Ah 0122   2]                     Reserved : 0000
|  [07Ch 0124   4]                       Length : 00000028
| -[080h 0128   2]        Flags (decoded below) : 0001
| -            Processor Proximity Domain Valid : 1
| +[080h 0128   2]        Flags (decoded below) : 0000




-- 
MST


