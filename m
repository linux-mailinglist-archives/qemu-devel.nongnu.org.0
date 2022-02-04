Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA24A994C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:29:25 +0100 (CET)
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxiO-0003uV-P8
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFxXo-00030N-BZ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:18:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFxXj-0001qj-UZ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643977089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJhAcAfLm35mXMdqa/8Jpp2fDywYmK3frznt1FGfz3c=;
 b=KQNiYmp7yNxCD4EC1/u4kOrNfOCnaCYLYitbQuOiJgpD9d/3DSjcRCYG+wMSB9ojdbt8Nn
 qOrssPImMcegIu1BDu+E2Y8YvVBdRjQekYuJ9zmO0eYjhLXJ2XqNHeshfVuG5bk88+8Gb5
 JJM1tSCchfwgfYVSqUY9qDmPnY71HF4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-iicaGROiME6D62-4Lvvyqw-1; Fri, 04 Feb 2022 07:18:08 -0500
X-MC-Unique: iicaGROiME6D62-4Lvvyqw-1
Received: by mail-ed1-f72.google.com with SMTP id
 k10-20020a50cb8a000000b00403c8326f2aso3200774edi.6
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJhAcAfLm35mXMdqa/8Jpp2fDywYmK3frznt1FGfz3c=;
 b=H+gbxNumR7zmodEHXxKfeN6gWvwM3enZm5EtoX50qFxRrXGRELJCRb2F2EQqw3r0V2
 WIyJdqwvywvRtOmS5q9oedrwFPApfwMgcv99dEl56ui5tqqN2TqSHzybkSmrlsdokzM2
 eQVXmnIQYRAWrVaYDYWOT4TWjzxsUy6sZK8eH0FNyFTGrZ1xkBX/LdNBVWkCfDo4qNk3
 JvsK9tb2uE/PQIFapNfX9CfcMUOq39hjDprWfrjfRKuXzYBp8x4ZO0PEwk4w3H59Bye0
 6exVuoMzF2ZpeUR2Mdaqn/I+oo6Q3y6UiK5je/7RbsrfwGvrAioFGjQ5p5MnHnwl6m1l
 u+lQ==
X-Gm-Message-State: AOAM533OhaLHudX8+vkC8sRLuzpP0nUFnZ2DnNi0ohTjv/guLYAz+4XG
 WFLHi52FMyEylP2rq1sgqwIUP2UBcb6ofVXqVNs0wCW/hKHcIMepNrtzvb6cOYYgoK8Rf77ZZy0
 +4/l0hCdQey9ThPc=
X-Received: by 2002:a17:907:a40a:: with SMTP id
 sg10mr2395962ejc.44.1643977086865; 
 Fri, 04 Feb 2022 04:18:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKhzxNHIN0/xSAVMup5eIE6YrCixXsP2UnmlZi0DBYPXu9E87PK5m0kxzFI18iOxZd5KOA0A==
X-Received: by 2002:a17:907:a40a:: with SMTP id
 sg10mr2395947ejc.44.1643977086704; 
 Fri, 04 Feb 2022 04:18:06 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id gz19sm621278ejc.10.2022.02.04.04.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 04:18:06 -0800 (PST)
Date: Fri, 4 Feb 2022 13:18:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests
 due to handle overlap
Message-ID: <20220204131805.3a225566@redhat.com>
In-Reply-To: <20220204110558.h3246jyelrvhto5q@sirius.home.kraxel.org>
References: <20220203130957.2248949-1-ani@anisinha.ca>
 <20220204103423.71ec5c6b@redhat.com>
 <20220204110558.h3246jyelrvhto5q@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, gsomlo@gmail.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 12:05:58 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > Another question is why we split memory on 16Gb chunks, to begin with.
> > Maybe instead of doing so, we should just add 1 type17 entry describing
> > whole system RAM size. In which case we don't need this dance around
> > handle offsets anymore.  
> 
> Maybe to make the entries look like they do on physical hardware?
> i.e. DIMM size is a power of two?  Also physical 1TB DIMMs just
> don't exist?

Does it have to be a DIMM, we can make it Other/Unknown/Row of chips/Chip
to more close to builtin memory that's is our main ram is.


