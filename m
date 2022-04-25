Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48850ECAF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:35:03 +0200 (CEST)
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8EQ-0005BL-R9
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8DU-0004W0-BU
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8DR-00077P-GT
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=muizUQVJFhdGJJgcY6xArnErA2TIh/5/hNWWCwYaH3g=;
 b=R/iFfFC55UIPQpwVYcqTesqbAfARTGRF6/vBdjIJ+p5zhl3KmuiuYa+Ze29aFGnAwSeHsl
 z8nZhIRYj2aNwO+TJofuUKHR8Y4y49rcg/ZfLOwF2jNhoha49Cj/jH4sg2j+HTaSwC+4bm
 qBoPgXnOSerkDDQMhMHbe+3Bw+lhXXQ=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-zu9I8tEkNwS_ZPMtrpLGEw-1; Mon, 25 Apr 2022 19:33:59 -0400
X-MC-Unique: zu9I8tEkNwS_ZPMtrpLGEw-1
Received: by mail-io1-f70.google.com with SMTP id
 c25-20020a5d9399000000b00652e2b23358so12513647iol.6
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=muizUQVJFhdGJJgcY6xArnErA2TIh/5/hNWWCwYaH3g=;
 b=Pm43o4/QQpqxd29J8sobL6ErtW9yR3Vob27Qxu7QHnSBjigmXf8VDmOxlJX3x+xY6F
 Z/Xj24ktGyiBJ5R/1y/JaQlhe2wtU9kScA8zRgm0AOvSDjgX5xZ9iLGSGPuCo6dyMXgf
 JCX0zOb10g9/EsufWiu/LCZL5Kpwm8Ffum1RwX6bqrQw4o3lmKdMLZ3VHMva+5j82G09
 4Q5j8f6SfLdnTRgzJv8TZN1r217GM+ELtPvWiySCFvH+aQM5ame7E6B9xtQ+SyCQRRsF
 hmgpYtemlR2ClTeo0SkBOjmDUcc3Xu4wZ59eviyiU8hlpqqvXwsi9XHei119/ELikUMu
 uerQ==
X-Gm-Message-State: AOAM533SJB2WwXV3JY+2eStAtps38yJMpPTR3HJ3uh2XkOPlmQeZ2mh/
 4tnfrRXuthWkLvpETK/5hUp/WREqyfpBr0nv3HgWSTkFTW1naO43V3ACTLN8bS/RvTljb12HFEf
 M79KRRUV4j3Z4uEw=
X-Received: by 2002:a02:bb87:0:b0:32a:f103:60ce with SMTP id
 g7-20020a02bb87000000b0032af10360cemr2931913jan.223.1650929638659; 
 Mon, 25 Apr 2022 16:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc46lyquKa4rQnGfAKv2neBAz7HV3JEz3bWYPN5dUR3AKuBPoUIyljEhqUTYKweS5ZArOMDw==
X-Received: by 2002:a02:bb87:0:b0:32a:f103:60ce with SMTP id
 g7-20020a02bb87000000b0032af10360cemr2931907jan.223.1650929638481; 
 Mon, 25 Apr 2022 16:33:58 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a92d14e000000b002cc43059735sm7042838ilg.38.2022.04.25.16.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 16:33:58 -0700 (PDT)
Date: Mon, 25 Apr 2022 19:33:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Artyom <starardev@gmail.com>
Subject: Re: Live Migration ToDo
Message-ID: <Ymcv5bEhf3xe3iM0@xz-m1.local>
References: <CA+inuZ85ktnAuvmmMcxJFX0EVZC6A_g2fR5BSQRTshDoxdv8=Q@mail.gmail.com>
 <YmbpoyhTXB4jdgx+@xz-m1.local>
 <CA+inuZ_o5eyc+dFyTxKe1v1nw8fmhXP1P4gysY0+L7N6VRtMwQ@mail.gmail.com>
 <Ymcl5OB8xpqP2bTx@xz-m1.local>
 <CA+inuZ9rxHFXtJZFBpwFWgBRHdtfM+NHe-9y=myDDyU8W2hsig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+inuZ9rxHFXtJZFBpwFWgBRHdtfM+NHe-9y=myDDyU8W2hsig@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: leobras@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 02:17:41AM +0300, Artyom wrote:
> Yes, the original postcopy paper (
> https://kartikgopalan.github.io/publications/hines09postcopy_osr.pdf)
> suggests optimizations. For example, prepaging uses hints from the VM's
> page access patterns to reduce both the number of major network faults and
> the duration of the migration phase. After examining the code in
> migration/, I could not find any mention of these optimizations. Perhaps
> the ideas from the paper have already been tried to implement in QEMU, but
> they were abandoned?

They're partly implemented, afaict.

See ram_find_and_save_block(), if we got a postcopy requested page we'll by
default remember it in rs->last_page and we'll do forward-direction-only
bubbling since we'll start to send follow up pages from there.

We also have free page reportings too with virtio-balloon device's
existance.

I don't think we have double-direction bubbling, or multi-pivot bubbling.
I'm not sure whether they were discussed/abandoned or not.  I think Dave
should know the best so I'll leave the rest to him..

-- 
Peter Xu


