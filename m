Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA066F59E7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:24:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDOB-000706-NZ; Wed, 03 May 2023 10:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1puDO9-0006za-Vt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1puDO8-0003md-IR
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683123803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0uS1Byb5moTLmEKJfnqSxx7PheeoQA+1Ic29Izv/8U=;
 b=Rh1qThKGPmUbAZJfPCChUErrGNaloOpsdR7KMuVAnaDONG45mrxn8gUSHShnZP3JLFw2hc
 MkN7GvdImZhBD12mM3R19b3iucfzSayMoyJN5WoGAIBr7fk98J90bNRhSMURKc7w70Ohg4
 0fuT1+ER/dl4vtXiUHY+AqM9RGJGTgE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-At6dwhYBMReR-YFBM_aNFQ-1; Wed, 03 May 2023 10:23:21 -0400
X-MC-Unique: At6dwhYBMReR-YFBM_aNFQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30635d18e55so887842f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683123800; x=1685715800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0uS1Byb5moTLmEKJfnqSxx7PheeoQA+1Ic29Izv/8U=;
 b=at+7oDaEJnuVN8q/1JVxPobnQEPOAFEI1EZqXZqdeLPN1iuMFDZakcgHEOwIrLTH9u
 xw3otfntQNtCVMfX9fGGEkjcIu0ZYAPdTp5Em5KebGee3pBmpa+EtpXaYk35ZbfKzKZu
 5XYvQso2EMaAKCgPU3OOp/M/8KBCBDQiA23ADUKGCl8n6TNMbf/98QgfvLmGCkPeaQaX
 PK0iUsZnwBS7+8c9I8ArA6SmuOH5UxO5wQamNOBPsUlx1Lqs1bn2S/Gahpti10IPW5yI
 9ZGy0ML2Pg0WU6JuP48Dn5xzmQBco2G2jhDAvJL2ljwBTLNKdMGLj7zNoZ/FEgtr1Xvc
 vJcQ==
X-Gm-Message-State: AC+VfDx9NdG2EaOYbwoa2eO8kvpxT/ZgxUGcK7NoigBGZ40+hPEXP7n3
 WrGA3yMPT63q/g2j+k1JJsQD6+sG/Rjc0q4eDckprGLJQsH3krWosL96Wyajpk5wnkqGWKG3mRk
 ZKo2ak84xAQAkiqU=
X-Received: by 2002:a5d:5588:0:b0:306:2b9e:2a8c with SMTP id
 i8-20020a5d5588000000b003062b9e2a8cmr206853wrv.11.1683123800459; 
 Wed, 03 May 2023 07:23:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Trd4Y9g7IoxyKvQWiHwKPKSAOJVAHW+K28L3ta/JPs1tvReQm0GMZVlfTXgqWsmbpT1goGA==
X-Received: by 2002:a5d:5588:0:b0:306:2b9e:2a8c with SMTP id
 i8-20020a5d5588000000b003062b9e2a8cmr206845wrv.11.1683123800173; 
 Wed, 03 May 2023 07:23:20 -0700 (PDT)
Received: from redhat.com ([31.187.78.112]) by smtp.gmail.com with ESMTPSA id
 y11-20020adfe6cb000000b002f81b4227cesm34195700wrm.19.2023.05.03.07.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 07:23:19 -0700 (PDT)
Date: Wed, 3 May 2023 10:23:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 0/3] vhost: memslot handling improvements
Message-ID: <20230503102155-mutt-send-email-mst@kernel.org>
References: <20230316153658.214487-1-david@redhat.com>
 <20230420162805.6781701b@imammedo.users.ipa.redhat.com>
 <1c4aa62e-c6bb-d564-c272-a96cd1247ed1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c4aa62e-c6bb-d564-c272-a96cd1247ed1@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 03, 2023 at 04:16:10PM +0200, David Hildenbrand wrote:
> On 20.04.23 16:28, Igor Mammedov wrote:
> > On Thu, 16 Mar 2023 16:36:55 +0100
> > David Hildenbrand <david@redhat.com> wrote:
> > 
> > > Following up on my previous work to make virtio-mem consume multiple
> > > memslots dynamically [1] that requires precise accounting between used vs.
> > > reserved memslots, I realized that vhost makes this extra hard by
> > > filtering out some memory region sections (so they don't consume a
> > > memslot) in the vhost-user case, which messes up the whole memslot
> > > accounting.
> > > 
> > > This series fixes what I found to be broken and prepares for more work on
> > > [1]. Further, it cleanes up the merge checks that I consider unnecessary.
> > 
> > Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> Thanks Igor!
> 
> @MST, do you want to these patches (I can resend in case it's easier to
> fixup the typo in patch #3).
> 
> Alternatively, I could send these patches along with another memory-backend
> patch I have queued.

I think I'll queue them to make sure
there are no conflicts. Pls do post with a typo fixed. Thanks!





> -- 
> Thanks,
> 
> David / dhildenb


