Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AC6A9256
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:23:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0gW-0007bl-6E; Fri, 03 Mar 2023 03:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pY0gK-0007YZ-A3
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pY0gG-0001jv-NM
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677831739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Q3NbdA9bI4uIGSb06D7wFlZcC+rz73j4f9d+6WKBYc=;
 b=GG9pvvTZJi3qZ3E4m9xo4tqqAy/5Wk3Ogrx4F5nHJPrv3NFc2RYO+Kemw8YTTwrVPwSN1t
 Wiwe1zGhLoGuHEU1Z/wRkjcYZwM2FuRPyPfJ5LRub5rnbAsXSLMcWgxwQpU/45QJnm8sGS
 cK7gl/Jiq/gEyF+GdiyvJXX67J1eLTM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-wUhZZWpqPYWSeuiHgJI48w-1; Fri, 03 Mar 2023 03:22:18 -0500
X-MC-Unique: wUhZZWpqPYWSeuiHgJI48w-1
Received: by mail-wm1-f69.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso632480wmb.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677831737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Q3NbdA9bI4uIGSb06D7wFlZcC+rz73j4f9d+6WKBYc=;
 b=AWAotUiC1Y9Ja2ZZJL/sTZtzTGmX0tt1GI+TSb8JutVF9VictFjLbWz4AQ6HLuBQmg
 KcPgZCWyziKVyw6D2YeTvhmJpfAKP9wYHGrEewSafscIrhTAz4GL2+bClsC/2NOma66j
 CCwj57hgf5E81I6JPXfX+h1hnmK9U7t8WYsH86Kdarp2Fl7y+9/henhnSurVV7u03uwg
 L2QHGdfwYxPvqB7sDsVSd4506irf2AxEEV5S6je6AseW8Fs33TwFOWfRyCGxvtnJ0Ew5
 KEXNTa6dbk0biAWqlMn/5PIIGB9Mhxl5V08+OCx+XBD4u8IvBm4ZH25bYuoye5U/SV0A
 7C2A==
X-Gm-Message-State: AO0yUKUgV99p9QzXRWxKh8k5rlcL+ViFm04AaLooW+ubBUXUpGrONJut
 sGyPHe3rsnF7EHFH8mVQOZ0k2YnQBneYn4/vHjWFhKh9CSTnxI4tUPZU7pND73PK3QeR/VRP/B7
 J/HjuO1h437rTu/A=
X-Received: by 2002:a5d:698c:0:b0:2c3:eeeb:b2f7 with SMTP id
 g12-20020a5d698c000000b002c3eeebb2f7mr707289wru.62.1677831737525; 
 Fri, 03 Mar 2023 00:22:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/V+PR/UZc7t2GrDqiPwSvfkR4xqbEgwXyIl6boL10b1nmHLD9moXQSdRROhoeBmIZjpkUqNw==
X-Received: by 2002:a5d:698c:0:b0:2c3:eeeb:b2f7 with SMTP id
 g12-20020a5d698c000000b002c3eeebb2f7mr707281wru.62.1677831737221; 
 Fri, 03 Mar 2023 00:22:17 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adfdcd1000000b002c5804b6afasm1516382wrm.67.2023.03.03.00.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:22:16 -0800 (PST)
Date: Fri, 3 Mar 2023 03:22:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20230303032209-mutt-send-email-mst@kernel.org>
References: <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <c465a44a-1ff6-5118-516c-56a8f99b9509@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c465a44a-1ff6-5118-516c-56a8f99b9509@redhat.com>
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

On Tue, Feb 21, 2023 at 03:02:41PM +0100, Paolo Bonzini wrote:
> On 2/21/23 13:48, BALATON Zoltan wrote:
> > My patch works and don't see what else could it break.
> 
> I strongly suspect that your patch, while fixing access to one byte of the
> (2-byte) registers, breaks access to the other byte.
> 
> Thanks for the reproduction instructions, I'll take a look.
> 
> Paolo

ping?


